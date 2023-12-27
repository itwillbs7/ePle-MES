package com.itwillbs.controller.facility;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.MaintenanceVO;

@Controller
@RequestMapping(value="/facility/routine/*")
public class RoutineMaintenanceController {
	
	// 권한 설정으로 나누어 담당자, 직원으로 구분
	@GetMapping("/")
	public String root() throws Exception{
		return "redirect:/facility/routine/emp";
	}
	
	@GetMapping("/emp")
	public void routineEMP() throws Exception{
		
	}
	
	@GetMapping("/admin")
	public void routineADMIN() throws Exception{
		
	}
	
	@GetMapping("/insert")
	public void insertGET(HttpSession session) throws Exception {
		
	}
	
	@PostMapping("/insert")
	public String insertPOST(MaintenanceVO vo, RedirectAttributes rttr) throws Exception {
		String link = "";
		int result = 0;
		if(result == 1) {
			link = "redirect:/confirm";
			rttr.addFlashAttribute("title", "일상 보전 결과");
			rttr.addFlashAttribute("result", "보전 등록이 완료되었습니다.");
		}
		else {
			link = "redirect:/error";
			rttr.addFlashAttribute("title", "일상 보전 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
		}
		return link;
	}
	
	@GetMapping("/list")
	public void listGET(HttpSession session) throws Exception{
		session.getAttribute("userid");
	}
}
