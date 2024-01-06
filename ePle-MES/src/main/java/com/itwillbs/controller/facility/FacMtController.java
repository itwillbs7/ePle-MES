package com.itwillbs.controller.facility;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.FacMtVO;
import com.itwillbs.service.facility.FacilityService;
import com.itwillbs.service.facility.MtService;

/** FacilityController : 설비 보전 컨트롤러 **/

@Controller
@RequestMapping(value = "/facility/mt/*")
public class FacMtController {

	private static final Logger logger = LoggerFactory.getLogger(FacMtController.class);

	@Inject
	private MtService mService;
	@Inject
	private FacilityService fService;
	
	@GetMapping("/main")
	public void main(Model model) throws Exception{
		// 보전 메인 페이지
		// 직원의 경우 자신이 등록한 보전 조회
		// 보전 전문가의 경우 메인페이지가 아닌 status로 이동 시키기
		model.addAttribute("role", "emp");
	}

	// 설비 보전 전문가
	@GetMapping("/status")
	public void status(Model model) throws Exception{
		// 설비 정보 코드, 이름, 모델, 최근 보전 정보, 평균 보전 간격(사후 보전 제외!)
		model.addAttribute("status", mService.getStatusList());
		model.addAttribute("order", mService.getOrderList());
		model.addAttribute("orderCount", mService.getOrderCount());
	}
	
	@GetMapping("/detail")
	public void detail(Model model, String code) throws Exception{
		// 설비 정보 및 보전 정보 보여주기
		model.addAttribute("info", fService.getFacility(code));
		model.addAttribute("order", mService.getMtList(code));
		model.addAttribute("orderCount", mService.getMtListCount(code));
		model.addAttribute("result", mService.getResultList(code));
		model.addAttribute("resultCount", mService.getResultCount(code));
		model.addAttribute("routine", mService.getRoutineList(code));
		model.addAttribute("routineCount", mService.getRoutineCount(code));
	}
	
	@GetMapping("/routine")
	public void routine(Model model, String code) throws Exception{
		// 일상 보전, 예방 보전 등록 폼
		model.addAttribute("code", code);
	}
	
	@PostMapping("/routine")
	public String routine(FacMtVO vo, RedirectAttributes rttr, HttpSession session) throws Exception{
		// 일상 보전, 예방 보전 등록
		vo.setEmp_code("123121231233");
		String recentCode = mService.getRecentCode(vo.getCode());
		String code = vo.getCode();
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyyMMdd");
		String now = dateformat.format(new Date());
		if(recentCode == null || recentCode.equals("")) {
			// 코드 새로 생성
			code += now;
			code += "001";
		}
		else {
			// 날짜가 오늘일 경우엔 + 1 해주기
			String fDate = recentCode.substring(3, recentCode.length()-3);
			if(now.equals(fDate)) {				
				String fCount = "" + (Integer.parseInt(recentCode.substring(recentCode.length()-3)) + 1);
				while(fCount.length() < 3) fCount = "0" + fCount;
				code += fDate + fCount;
			}
			else {
				code += now + "001";
			}
		}
		vo.setCode(code);
		if(mService.insertRoutine(vo) == 1) {
			rttr.addFlashAttribute("title", "보전 등록 결과");
			rttr.addFlashAttribute("result", "보전 등록이 완료되었습니다.");
			return "redirect:/confirm";
		}
		else {
			rttr.addFlashAttribute("title", "보전 등록 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
			return "redirect:/error";
		}
	}
	
	@GetMapping("/result")
	public void result(Model model, String code) throws Exception{
		// 보전 결과 등록(사후 보전이 있을 때)
		model.addAttribute("info", mService.getOrder(code));
	}
	
	@PostMapping("/result")
	public String result(FacMtVO vo, HttpSession session,RedirectAttributes rttr) throws Exception{
		// 보전 결과 등록 처리
		vo.setManager("123123123");
		if(mService.setResult(vo) == 1) {
			rttr.addFlashAttribute("title", "보전 등록 결과");
			rttr.addFlashAttribute("result", "보전 등록이 완료되었습니다.");
			return "redirect:/confirm";
		}
		else {
			rttr.addFlashAttribute("title", "보전 등록 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
			return "redirect:/error";
		}
	}
	// 설비 보전 전문가
	
	// 직원
	@GetMapping("/list")
	public void list(HttpSession session, Model model) throws Exception{
		// 자신이 등록한 보전 리스트 출력, 매니저 정보 표시
		// 보전 완료 및 미완료 표시!
		String emp_code = "123123123123";
		model.addAttribute("list", mService.getInsertedList(emp_code));
	}
	
	@GetMapping("/insert")
	public void insert(Model model) throws Exception{
		// 보전 추가(사후보전) 폼
		model.addAttribute("list", fService.getFacManager());
	}
	
	@PostMapping("/insert")
	public String insert(FacMtVO vo, RedirectAttributes rttr) throws Exception{
		// 보전 추가 진행
		String recentCode = mService.getRecentCode(vo.getCode());
		String code = vo.getCode();
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyyMMdd");
		String now = dateformat.format(new Date());
		if(recentCode == null || recentCode.equals("")) {
			// 코드 새로 생성
			code += now;
			code += "001";
		}
		else {
			// 날짜가 오늘일 경우엔 + 1 해주기
			String fDate = recentCode.substring(2, recentCode.length()-3);
			if(now.equals(fDate)) {				
				String fCount = "" + (Integer.parseInt(recentCode.substring(recentCode.length()-3)) + 1);
				while(fCount.length() < 3) fCount = "0" + fCount;
				code += fDate + fCount;
			}
			else {
				code += now + "001";
			}
		}
		logger.debug("code : " + code);
		vo.setCode(code);
		if(mService.insertProblem(vo) == 1) {
			rttr.addFlashAttribute("title", "보전 등록 결과");
			rttr.addFlashAttribute("result", "보전 등록이 완료되었습니다.");
			return "redirect:/confirm";
		}
		else {
			rttr.addFlashAttribute("title", "보전 등록 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
			return "redirect:/error";
		}
	}
	
	@GetMapping("/update")
	public void update(Model model, String code) throws Exception{
		// 자신이 등록한 보전 수정
		model.addAttribute("info", mService.getInfo(code));
	}
	
	@PostMapping("/update")
	public String update(FacMtVO vo, RedirectAttributes rttr) throws Exception{
		// 자신이 등록한 보전 수정 진행
		if(mService.updateProblem(vo) == 1) {
			rttr.addFlashAttribute("title", "보전 수정 결과");
			rttr.addFlashAttribute("result", "보전 수정이 완료되었습니다.");
			return "redirect:/confirm";
		}
		else {
			rttr.addFlashAttribute("title", "보전 수정 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
			return "redirect:/error";
		}
	}
	
	@GetMapping("/delete")
	public void delete(String code, Model model) throws Exception{
		// 자신이 등록한 보전 삭제 폼
		model.addAttribute("code", code);
	}
	
	@PostMapping("/delete")
	public String delete(String code, RedirectAttributes rttr) throws Exception{
		// 자신이 등록한 보전 삭제 진행
		if(mService.deleteProblem(code) == 1) {
			rttr.addFlashAttribute("title", "보전 삭제 결과");
			rttr.addFlashAttribute("result", "보전 삭제가 완료되었습니다.");
			return "redirect:/confirm";
		}
		else {
			rttr.addFlashAttribute("title", "보전 삭제 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
			return "redirect:/error";
		}
	}
	// 직원
}
