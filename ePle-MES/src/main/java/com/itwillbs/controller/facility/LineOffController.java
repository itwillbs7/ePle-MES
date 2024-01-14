package com.itwillbs.controller.facility;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.LineOffVO;
import com.itwillbs.service.facility.OffService;

@Controller
@RequestMapping(value = "/line/manage/*")
public class LineOffController {

	@Inject
	private OffService oService;

	@GetMapping("/status")
	public void status(Model model) throws Exception {
		List<String> offList = oService.getRenewList("start_time");
		List<String> onList = oService.getRenewList("end_time");

		if (offList == null && onList == null)
			;
		else {
			if (offList == null || offList.size() == 0)
				;
			else {
				String[] code = offList.toArray(new String[offList.size()]);
				oService.setLineOff(code);
			}

			if (onList == null || onList.size() == 0)
				;
			else {
				String[] code = onList.toArray(new String[onList.size()]);
				oService.setLineOn(code);
			}
		}
		oService.setLineOffComplete();
		model.addAttribute("list", oService.getLineList());

		model.addAttribute("reservation", oService.getReservateList());
	}

	@GetMapping("/detail")
	public void detail(String code, Model model) throws Exception {
		model.addAttribute("info", oService.getDetail(code));
		model.addAttribute("list", oService.getDetailList(code));
	}

	@GetMapping("/on")
	public void onGET(String code, Model model) throws Exception {
		if (code == null || code.equals("")) {
			// info == null
		} else {
			model.addAttribute("info", oService.getDetail(code));
		}
	}

	@PostMapping("/on")
	public String onPOST(String[] code, RedirectAttributes rttr) throws Exception {
		if (oService.setLineOn(code) > 0) {
			oService.updateEndTime(code);
			rttr.addFlashAttribute("title", "라인 가동 결과");
			rttr.addFlashAttribute("result", "라인 가동이 완료되었습니다.");
			return "redirect:/confirm";
		} else {
			rttr.addFlashAttribute("title", "라인 가동 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
			return "redirect:/error";
		}
	}

	private int getRecentCode(String name, String get) {
		if(get == null) return 1;
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyyMMdd");
		String now = dateformat.format(new Date());
		String fDate = get.substring(name.length(), get.length() - 3);
		if (now.equals(fDate)) {
			return Integer.parseInt((get.substring(get.length() - 3))) + 1;
		} else {
			return 1;
		}
	}

	@GetMapping("/off")
	public void offGET(String code, Model model) throws Exception {
		model.addAttribute("clist", oService.getCommonGroup());
		for (int i = 0; i <= 4; i++) {
			String name = "LOFF" + i;
			model.addAttribute(name, oService.getCommonCode(name));
		}
		if (code == null || code.equals("")) {
			// info == null
		} else {
			model.addAttribute("info", oService.getDetail(code));
		}
	}

	@PostMapping("/off")
	public String offPOST(String[] code, String group_id, String code_id, RedirectAttributes rttr) throws Exception {
		String get = oService.getRecentCode();
		String newCode = "LOFF";

		int recent = getRecentCode(newCode, get);
		List<LineOffVO> list = new LinkedList<LineOffVO>();
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyyMMdd");
		String now = dateformat.format(new Date());
		
		for (int i = 0; i < code.length; i++) {
			LineOffVO vo = new LineOffVO();
			String c = i + recent + "";
			while (c.length() < 3)
				c = "0" + c;
			vo.setCode(newCode + now + c);
			vo.setGroup_id(group_id);
			vo.setCode_id(code_id);
			vo.setLine_code(code[i]);
			list.add(vo);
		}
		if (oService.insert(list) > 0) {
			if (oService.setLineOff(code) > 0) {
				rttr.addFlashAttribute("title", "라인 정지 결과");
				rttr.addFlashAttribute("result", "라인 정지가 완료되었습니다.");
				return "redirect:/confirm";
			} else {
				rttr.addFlashAttribute("title", "라인 정지 결과");
				rttr.addFlashAttribute("result", "오류가 발생했습니다!");
				return "redirect:/error";
			}
		} else {
			rttr.addFlashAttribute("title", "라인 정지 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
			return "redirect:/error";
		}
	}

	@GetMapping("/reservation")
	public void reservation(String code, Model model) throws Exception {
		model.addAttribute("clist", oService.getCommonGroup());
		for (int i = 0; i <= 4; i++) {
			String name = "LOFF" + i;
			model.addAttribute(name, oService.getCommonCode(name));
		}
		if (code == null || code.equals("")) {
			// info == null
		} else {
			model.addAttribute("info", oService.getDetail(code));
		}
	}
	
	public Timestamp getStart(String date, String startTime) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String ampm = startTime.substring(0, 2);
		String minuteStart = "" + (Integer.parseInt(startTime.substring(startTime.length() - 3, startTime.length() - 1)));
		if(minuteStart.length() == 1) minuteStart = "0" + minuteStart;
		int hourStart = Integer.parseInt(startTime.substring(3).split("시")[0]);
		hourStart += ampm.equals("오전") ? 0 : 12;
		String hS = hourStart + "";
		if(hS.length() == 1) hS = "0" + hS;
		if(hS.equals("24")) hS = "00";
		
		if (date.length() > 11) {
			// 2023-12-12 - 2023-12-13
			String a = date.substring(0, 10);
			LocalDateTime startDate = LocalDateTime.parse(a + " " + hS + ":" + minuteStart + ":00", formatter);
			long s = Timestamp.valueOf(startDate).getTime();
			return new Timestamp(s);
			
		} else {
			LocalDateTime startDate = LocalDateTime.parse(date + " " + hS + ":" + minuteStart + ":00", formatter);
			long s = Timestamp.valueOf(startDate).getTime();
			return new Timestamp(s);
			
		}
	}
	
	public Timestamp getEnd(String date, String endTime) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String ampm = endTime.substring(0, 2);
		String minuteEnd = "" + (Integer.parseInt(endTime.substring(endTime.length() - 3, endTime.length() - 1)));
		if(minuteEnd.length() == 1) minuteEnd = "0" + minuteEnd;
		int hourEnd = Integer.parseInt(endTime.substring(3).split("시")[0]);
		hourEnd += ampm.equals("오전") ? 0 : 12;
		String hE = hourEnd + "";
		if(hE.length() == 1) hE = "0" + hE;
		if(hE.equals("24")) hE = "00";
		if (date.length() > 11) {
			// 2023-12-12 - 2023-12-13
			String b = date.substring(13);
			LocalDateTime endDate = LocalDateTime.parse(b + " " + hE + ":" + minuteEnd + ":00", formatter);
			long e = Timestamp.valueOf(endDate).getTime();
			return new Timestamp(e);
		} else {
			LocalDateTime endDate = LocalDateTime.parse(date + " " + hE + ":" + minuteEnd + ":00", formatter);
			long e = Timestamp.valueOf(endDate).getTime();
			return new Timestamp(e);
		}
	}

	@PostMapping("/reservation")
	public String reservation(String[] code, String dateRange, String startTime, String endTime, String group_id,
			String code_id, RedirectAttributes rttr) throws Exception {
		Timestamp start = getStart(dateRange, startTime);
		Timestamp end = getStart(dateRange, endTime);
		
		String get = oService.getRecentCode();
		String newCode = "LOFF";
		List<LineOffVO> list = new LinkedList<LineOffVO>();
		
		int recent = getRecentCode(newCode, get);
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyyMMdd");
		String now = dateformat.format(new Date());
		System.out.println("오류점1");
		for (int i = 0; i < code.length; i++) {
			LineOffVO vo = new LineOffVO();
			String c = i + recent + "";
			while (c.length() < 3)
				c = "0" + c;
			vo.setCode(newCode + now + c);
			vo.setGroup_id(group_id);
			vo.setCode_id(code_id);
			vo.setStart_time(start);
			vo.setEnd_time(end);
			vo.setLine_code(code[i]);
			list.add(vo);
		}
		
		if (oService.reservation(list) > 0) {
			rttr.addFlashAttribute("title", "정지 예약 결과");
			rttr.addFlashAttribute("result", "예약 등록이 완료되었습니다.");
			return "redirect:/confirm";
		} else {
			rttr.addFlashAttribute("title", "정지 예약 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
			return "redirect:/error";
		}
	}

	@GetMapping("/reservation-detail")
	public void reservationDetail(String code, Model model) throws Exception {
		LineOffVO vo = oService.getResDetail(code);
		model.addAttribute("info", vo);
		model.addAttribute("list", oService.getSameInfo(vo));
	}

	@GetMapping("/update")
	public void update(String code, Model model) throws Exception {
		LineOffVO vo = oService.getResDetail(code);
		model.addAttribute("info", vo);
		model.addAttribute("list", oService.getSameInfo(vo));
		model.addAttribute("clist", oService.getCommonGroup());
		for (int i = 0; i <= 4; i++) {
			String name = "LOFF" + i;
			model.addAttribute(name, oService.getCommonCode(name));
		}
	}

	@SuppressWarnings("deprecation")
	@PostMapping("/update")
	public String update(String[] codeList, String group_id, String code_id, String dateRange, String startTime,
			String endTime, RedirectAttributes rttr) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		Timestamp start = getStart(dateRange, startTime);
		Timestamp end = getStart(dateRange, endTime);
		
		map.put("code", codeList);
		map.put("group_id", group_id);
		map.put("code_id", code_id);
		map.put("start_time", start);
		map.put("end_time", end);

		if (oService.updateRes(map) > 0) {
			rttr.addFlashAttribute("title", "예약 수정 결과");
			rttr.addFlashAttribute("result", "예약 수정이 완료되었습니다.");
			return "redirect:/confirm";
		} else {
			rttr.addFlashAttribute("title", "예약 수정 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
			return "redirect:/error";
		}
	}

	@GetMapping("/delete")
	public void delete(String code, Model model) throws Exception {
		LineOffVO vo = oService.getResDetail(code);
		model.addAttribute("info", vo);
		model.addAttribute("list", oService.getSameInfo(vo));
	}

	@PostMapping("/delete")
	public String delete(String[] code, RedirectAttributes rttr) throws Exception {
		if (oService.deleteRes(code) > 0) {
			rttr.addFlashAttribute("title", "예약 삭제 결과");
			rttr.addFlashAttribute("result", "예약 삭제가 완료되었습니다.");
			return "redirect:/confirm";
		} else {
			rttr.addFlashAttribute("title", "예약 삭제 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
			return "redirect:/error";
		}
	}
}