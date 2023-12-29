package com.itwillbs.controller.facility;

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

import com.itwillbs.domain.MaintenanceVO;
import com.itwillbs.service.facility.MaintenanceService;

@Controller
@RequestMapping(value="/facility/routine/*")
public class RoutineMaintenanceController {
	
	private static final Logger logger = LoggerFactory.getLogger(RoutineMaintenanceController.class);
	
	@Inject
	private MaintenanceService mService;
	
	// 권한 설정으로 나누어 담당자, 직원으로 구분
	@GetMapping("/")
	public String root(Model model) throws Exception{
		String role = "emp";
		if(role.equals("admin")) {
			// 직원의 보전 count, list 불러오기
			
		}
		model.addAttribute("role", role);
		return "/facility/routine/main";
	}

	@GetMapping("/insert")
	public void insertGET(HttpSession session, Model model) throws Exception {
		model.addAttribute("role", "emp");
	}
	
	@PostMapping("/insert")
	public String insertPOST(MaintenanceVO vo, RedirectAttributes rttr) throws Exception {
		String link = "";
		// 최상단에 등록된 일상보전 가져오기
		
		int result = mService.addRM(vo);
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
	public void listGET(HttpSession session, Model model) throws Exception{
		String role = "emp";
		if(role.equals("emp") || role.equals("manager")) {
			
		}
		else if(role.equals("admin"))
		model.addAttribute("list", mService.getRMList((String)session.getAttribute("userid")));
	}
}
