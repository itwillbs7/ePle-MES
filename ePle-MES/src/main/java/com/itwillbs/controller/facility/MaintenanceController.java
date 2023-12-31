package com.itwillbs.controller.facility;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.MaintenanceSearchVO;
import com.itwillbs.domain.MaintenanceVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.service.facility.FacilityService;
import com.itwillbs.service.facility.MaintenanceService;

/** FacilityController : 설비 보전 컨트롤러 **/

@Controller
@RequestMapping(value = "/facility/maintenance/*")
public class MaintenanceController {

	private static final Logger logger = LoggerFactory.getLogger(MaintenanceController.class);
	
	@Inject
	private FacilityService fService;
	
	@Inject
	private MaintenanceService mService;
	
	@GetMapping("/")
	public String rootGET(Model model) throws Exception {
		String role = "emp";
		model.addAttribute("role", role);
		
		return "/facility/maintenance/main";
	}
	
	// http://localhost:8088/facility/maintenance/list
	@GetMapping(value = "/list")
	public String maintenanceListGET
	(MaintenanceSearchVO searchVO, PageVO pageVO, Criteria cri, Model model)
		throws Exception {
		// 설비 보전 리스트
		String role = "admin";
		if(role.equals("emp")) {
			// 직원 정보 불러와서 넣은 뒤 본인의 보전 미완료 불러오기!
			pageVO.setCri(cri);
			pageVO.setSearch(searchVO);
			pageVO.setTotalCount(mService.getMaintenanceCount(pageVO));
			List<MaintenanceVO> vo = mService.getMaintenanceList(pageVO);
			if (vo == null) vo = new ArrayList<MaintenanceVO>();
			model.addAttribute("list", vo);
			model.addAttribute("pageVO", pageVO);
		}
		else {
			pageVO.setCri(cri);
			pageVO.setSearch(searchVO);
			pageVO.setTotalCount(mService.getMaintenanceCount(pageVO));
			List<MaintenanceVO> vo = mService.getMaintenanceList(pageVO);
			if (vo == null) vo = new ArrayList<MaintenanceVO>();
			model.addAttribute("list", vo);
			model.addAttribute("pageVO", pageVO);
		}
		return "/facility/maintenance/list";
	}

	@GetMapping(value = "/insert")
	public void maintenanceInsertGET(Model model) throws Exception {
		// 설비 보전 등록 폼
		String role = "emp";
		if(role.equals("emp")) {
			// 본인의 설비 목록 들고 가기
		}
		else if(role.equals("manager") || role.equals("admin")) {
			// 담당자나 admin의 경우 전체 설비 목록을 들고가기
		}
		else {
			// 기타 유저의 경우 아무것도 들고가지 않고 다른 링크로 이동됨!
		}
	}

	@PostMapping(value = "/insert")
	public String maintenanceInsertPOST(MaintenanceVO vo, RedirectAttributes rttr) throws Exception {
		// 설비 보전 등록 액션
		
		// 사후보전 / 예방보전 / 긴급보전
		// -> 다른 데이터베이스에서 진행(일상 보전은 결과만)
		String link = "";
		int result = mService.addMaintenance(vo);
		if(result == 1) {
			link = "redirect:/confirm";
			rttr.addFlashAttribute("title", "설비 등록 결과");
			rttr.addFlashAttribute("result", "설비 등록이 완료되었습니다.");
		}
		else {
			link = "redirect:/error";
			rttr.addFlashAttribute("title", "설비 등록 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
		}
		return link;
	}

	@GetMapping(value = "/update")
	public void maintenanceUpdateGET() throws Exception {
		// 설비 보전 수정 폼
	}

	@PostMapping(value = "/update")
	public String maintenanceUpdatePOST(MaintenanceVO vo, RedirectAttributes rttr) throws Exception {
		// 설비 보전 수정 액션
		String link = "";
		int result = mService.updateMaintenance(vo);
		if(result == 1) {
			link = "redirect:/confirm";
			rttr.addFlashAttribute("title", "설비 수정 결과");
			rttr.addFlashAttribute("result", "보전 수정이 완료되었습니다.");
		}
		else {
			link = "redirect:/error";
			rttr.addFlashAttribute("title", "설비 수정 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
		}
		return link;
	}

	@GetMapping(value = "/delete")
	public void maintenanceDeleteGET() throws Exception {
		// 설비 보전 삭제 폼
	}

	@PostMapping(value = "/delete")
	public String maintenanceDeletePOST(MaintenanceVO vo, RedirectAttributes rttr) throws Exception {
		// 설비 보전 삭제 액션
		String link = "";
		int result = mService.deleteMaintenance(vo);
		if(result == 1) {
			link = "redirect:/confirm";
			rttr.addFlashAttribute("title", "설비 삭제 결과");
			rttr.addFlashAttribute("result", "보전 삭제가 완료되었습니다.");
		}
		else {
			link = "redirect:/error";
			rttr.addFlashAttribute("title", "설비 삭제 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
		}
		return link;
	}
	
	@GetMapping("/detail")
	public void maintenanceDetail(MaintenanceVO vo, Model model) throws Exception{
		// 보전 상세 정보
		model.addAttribute("info", mService.getDetail(vo));
	}

	@GetMapping(value = "/result")
	public void maintenanceResultListGET() throws Exception {
		// 설비 보전 결과 리스트
		// 직군에 따라 다르게 표시하도록 함
		// 설비
	}

	@GetMapping(value = "/result/Insert")
	public void maintenanceResultInsertGET() throws Exception {
		// 설비 보전 결과 폼
	}

	@PostMapping(value = "/result/Insert")
	public String maintenanceResultInsertPOST(MaintenanceVO vo, RedirectAttributes rttr) throws Exception {
		// 설비 보전 결과 액션
		String link = "";
		int result = mService.addMaintenance(vo);
		if(result == 1) {
			link = "redirect:/confirm";
			rttr.addFlashAttribute("title", "보전 결과 등록");
			rttr.addFlashAttribute("result", "보전 결과 등록이 완료되었습니다.");
		}
		else {
			link = "redirect:/error";
			rttr.addFlashAttribute("title", "보전 결과 등록");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
		}
		return link;
	}
}
