package com.itwillbs.controller.facility;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
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
		
		if(offList == null && onList == null);
		else {
			if(offList == null || offList.size() == 0);
			else {
				String[] code = offList.toArray(new String[offList.size()]);
				oService.setLineOff(code);
			}
			
			if(onList == null || onList.size() == 0);
			else {
				String[] code = onList.toArray(new String[onList.size()]);
				oService.setLineOn(code);
			}
		}
		oService.setLineOffComplete();
		model.addAttribute("list", oService.getLineList());
	}

	@GetMapping("/detail")
	public void detail(String code, Model model) throws Exception {
		model.addAttribute("info", oService.getDetail(code));
		model.addAttribute("list", oService.getDetailList(code));
	}

	@GetMapping("/on")
	public void onGET(String code, Model model) throws Exception {
		if(code == null || code.equals("")) {
			// info == null
		}
		else {
			model.addAttribute("info", oService.getDetail(code));
		}
	}

	@PostMapping("/on")
	public String onPOST(String[] code, RedirectAttributes rttr) throws Exception {
		if(oService.setLineOn(code) > 0) {
			oService.updateEndTime(code);
			rttr.addFlashAttribute("title", "라인 가동 결과");
			rttr.addFlashAttribute("result", "라인 가동이 완료되었습니다.");
			return "redirect:/confirm";
		}
		else {
			rttr.addFlashAttribute("title", "라인 가동 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
			return "redirect:/error";
		}
	}
	
	@GetMapping("/off")
	public void offGET(String code, Model model) throws Exception {
		model.addAttribute("clist", oService.getCommonGroup());
		for(int i = 0; i<= 4; i++) {
			String name = "LOFF" + i;
			model.addAttribute(name, oService.getCommonCode(name));
		}
		if(code == null || code.equals("")) {
			// info == null
		}
		else {
			model.addAttribute("info", oService.getDetail(code));
		}
	}

	@PostMapping("/off")
	public String offPOST(String[] code, String group_id, String code_id, RedirectAttributes rttr) throws Exception {
		String get = oService.getRecentCode();
		String newCode = "LOFF";
		List<LineOffVO> list = new LinkedList<LineOffVO>();
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyyMMdd");
		String now = dateformat.format(new Date());
		if(get == null || get.equals("")) {
			// 코드 새로 생성
			newCode += now;
			for(int i = 0; i<code.length; i++) {
				LineOffVO vo = new LineOffVO();
				vo.setCode(newCode + (i + 1));
				vo.setGroup_id(group_id);
				vo.setCode_id(code_id);
				vo.setLine_code(code[i]);
				list.add(vo);
			}
		}
		else {
			String fDate = get.substring(newCode.length(), get.length()-3);
			if(now.equals(fDate)) {
				for(int i = 0; i<code.length; i++) {
					LineOffVO vo = new LineOffVO();
					String fCount = "" + (Integer.parseInt(get.substring(get.length()-3)) + (i + 1));
					while(fCount.length() < 3) fCount = "0" + fCount;
					newCode += fDate + fCount;
					vo.setCode(newCode);
					vo.setGroup_id(group_id);
					vo.setCode_id(code_id);
					vo.setLine_code(code[i]);
					list.add(vo);
				}
			}
			else {
				newCode += now;
				for(int i = 0; i<code.length; i++) {
					LineOffVO vo = new LineOffVO();
					vo.setCode(newCode + (i + 1));
					vo.setGroup_id(group_id);
					vo.setCode_id(code_id);
					vo.setLine_code(code[i]);
					list.add(vo);
				}
			}
		}
		if(oService.insert(list) > 0) {
			if(oService.setLineOff(code) > 0) {
				rttr.addFlashAttribute("title", "라인 정지 결과");
				rttr.addFlashAttribute("result", "라인 정지가 완료되었습니다.");
				return "redirect:/confirm";
			}
			else {
				rttr.addFlashAttribute("title", "라인 정지 결과");
				rttr.addFlashAttribute("result", "오류가 발생했습니다!");
				return "redirect:/error";
			}
		}
		else {
			rttr.addFlashAttribute("title", "라인 정지 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
			return "redirect:/error";
		}
	}

	@GetMapping("/reservation")
	public void reservation(String code, Model model) throws Exception {
		model.addAttribute("clist", oService.getCommonGroup());
		for(int i = 0; i<= 4; i++) {
			String name = "LOFF" + i;
			model.addAttribute(name, oService.getCommonCode(name));
		}
		if(code == null || code.equals("")) {
			// info == null
		}
		else {
			model.addAttribute("info", oService.getDetail(code));
		}
	}

	@SuppressWarnings("deprecation")
	@PostMapping("/reservation")
	public String reservation(String[] code, String dateRange, String startTime, String endTime, String group_id, String code_id, RedirectAttributes rttr)
			throws Exception {
		String get = oService.getRecentCode();
		String newCode = "LOFF";
		List<LineOffVO> list = new LinkedList<LineOffVO>();
		
		//date time 설정
		// 2024-01-04 ~ 2024-01-05
		Timestamp start = null;
		Timestamp end = null;
		
		// 오전 오후
		// 오후 3시 05분
		String ampmStart = startTime.substring(0, 2);
		String ampmEnd = endTime.substring(0, 2);
		
		int minuteStart = Integer.parseInt(startTime.substring(startTime.length()-3, startTime.length()-1));
		int minuteEnd = Integer.parseInt(endTime.substring(endTime.length()-3, endTime.length()-1));
		
		int hourStart = Integer.parseInt(startTime.substring(3).split("시")[0]);
		int hourEnd = Integer.parseInt(endTime.substring(3).split("시")[0]);
		
		hourStart += ampmStart.equals("오전")? 0: 12;
		hourEnd += ampmEnd.equals("오전")? 0: 12;
		
		if(dateRange.length() > 11) {
			String[] sp = dateRange.split(" ~ ");
			String[] startTexts = sp[0].split("-");
			String[] endTexts = sp[1].split("-");
			start = new Timestamp(Integer.parseInt(startTexts[0]) - 1900, 
					Integer.parseInt(startTexts[1]) - 1, Integer.parseInt(startTexts[2]), hourStart, minuteStart, 0, 0);
			end = new Timestamp(Integer.parseInt(endTexts[0]) - 1900, 
					Integer.parseInt(endTexts[1]) - 1, Integer.parseInt(endTexts[2]), hourEnd, minuteEnd, 0, 0);
		}
		else {
			String[] sp = dateRange.split("-");
			start = new Timestamp(Integer.parseInt(sp[0]) - 1900, 
					Integer.parseInt(sp[1]) - 1, Integer.parseInt(sp[2]), hourStart, minuteStart, 0, 0);
			end = new Timestamp(Integer.parseInt(sp[0]) - 1900, 
					Integer.parseInt(sp[1]) - 1, Integer.parseInt(sp[2]), hourEnd, minuteEnd, 0, 0);

		}
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyyMMdd");
		String now = dateformat.format(new Date());
		if(get == null || get.equals("")) {
			// 코드 새로 생성
			newCode += now;
			for(int i = 0; i<code.length; i++) {
				LineOffVO vo = new LineOffVO();
				String fCount = "" + (i + 1);
				while(fCount.length() < 3) fCount = "0" + fCount;
				vo.setCode(newCode + fCount);
				vo.setGroup_id(group_id);
				vo.setCode_id(code_id);
				vo.setStart_time(start);
				vo.setEnd_time(end);
				vo.setLine_code(code[i]);
				list.add(vo);
			}
		}
		else {
			String fDate = get.substring(newCode.length(), get.length()-3);
			if(now.equals(fDate)) {
				newCode += now;
				for(int i = 0; i<code.length; i++) {
					LineOffVO vo = new LineOffVO();
					String fCount = "" + (Integer.parseInt(get.substring(get.length()-3)) + (i + 1));
					while(fCount.length() < 3) fCount = "0" + fCount;
					vo.setCode(newCode + fCount);
					vo.setGroup_id(group_id);
					vo.setCode_id(code_id);
					vo.setStart_time(start);
					vo.setEnd_time(end);
					vo.setLine_code(code[i]);
					list.add(vo);
				}
			}
			else {
				newCode += now;
				for(int i = 0; i<code.length; i++) {
					LineOffVO vo = new LineOffVO();
					String fCount = "" + (i + 1);
					while(fCount.length() < 3) fCount = "0" + fCount;
					vo.setCode(newCode + fCount);
					vo.setGroup_id(group_id);
					vo.setCode_id(code_id);
					vo.setStart_time(start);
					vo.setEnd_time(end);
					vo.setLine_code(code[i]);
					list.add(vo);
				}
			}
		}
		if(oService.reservation(list) > 0) {
			rttr.addFlashAttribute("title", "정지 예약 결과");
			rttr.addFlashAttribute("result", "예약 등록이 완료되었습니다.");
			return "redirect:/confirm";
		}
		else {
			rttr.addFlashAttribute("title", "정지 예약 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
			return "redirect:/error";
		}
	}
}