package com.itwillbs.controller.facility;

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
import com.itwillbs.service.facility.MaintenanceService;

@Controller
@RequestMapping(value="/facility/routine/*")
public class RoutineMaintenanceController {
	
	private static final Logger logger = LoggerFactory.getLogger(RoutineMaintenanceController.class);
	
	@Inject
	private FacilityService fService;
	
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
		model.addAttribute("list", fService.getFacManager("test5"));
		model.addAttribute("emp_code", "test5");
	}
	
	@PostMapping("/insert")
	public String insertPOST(FacMtVO vo, RedirectAttributes rttr) throws Exception {
		String link = "";
		// 최상단에 등록된 일상보전 가져오기
		String recentCode = mService.getRecentCode(vo.getCode());
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyyMMdd");
		String now = dateformat.format(new Date());
		String code = vo.getCode();
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
		vo.setCode(code);
		int result = mService.insert(vo);
		if(result >= 1) {
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
		String emp_code = "test5";
		model.addAttribute("list", mService.getDailyRM(emp_code));
		model.addAttribute("count", mService.getDailyRMCount(emp_code));
	}
}
