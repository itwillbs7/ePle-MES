package com.itwillbs.controller.facility;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

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
import com.itwillbs.service.facility.MaintenanceService;

/** FacilityController : 설비 보전 컨트롤러 **/

@Controller
@RequestMapping(value = "/facility/maintenance/*")
public class MaintenanceController {

	@Inject
	private MaintenanceService mService;
	
	// http://localhost:8088/facility/maintenance/list
	@GetMapping(value = "/")
	public String maintenanceListGET
	(MaintenanceSearchVO searchVO, PageVO pageVO, Criteria cri, Model model)
			throws Exception {
		// 설비 보전 리스트
		pageVO.setCri(cri);
		pageVO.setSearch(searchVO);
		pageVO.setTotalCount(mService.getMaintenanceCount(pageVO));
		List<MaintenanceVO> vo = mService.getMaintenanceList(pageVO);
		if (vo == null) vo = new ArrayList<MaintenanceVO>();
		model.addAttribute("list", vo);
		model.addAttribute("pageVO", pageVO);
		return "/facility/maintenance/list";
	}

	@GetMapping(value = "/insert")
	public void maintenanceInsertGET() throws Exception {
		// 설비 보전 등록 폼
		
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
			rttr.addFlashAttribute("title", "보전 등록 결과");
			rttr.addFlashAttribute("result", "보전 등록이 완료되었습니다.");
		}
		else {
			link = "redirect:/error";
			rttr.addFlashAttribute("title", "보전 등록 결과");
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
			rttr.addFlashAttribute("title", "보전 수정 결과");
			rttr.addFlashAttribute("result", "보전 수정이 완료되었습니다.");
		}
		else {
			link = "redirect:/error";
			rttr.addFlashAttribute("title", "보전 수정 결과");
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
			rttr.addFlashAttribute("title", "보전 삭제 결과");
			rttr.addFlashAttribute("result", "보전 삭제가 완료되었습니다.");
		}
		else {
			link = "redirect:/error";
			rttr.addFlashAttribute("title", "보전 삭제 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
		}
		return link;
	}

	@GetMapping(value = "/resultList")
	public void maintenanceResultListGET() throws Exception {
		// 설비 보전 결과 리스트
	}

	@GetMapping(value = "/resultInsert")
	public void maintenanceResultInsertGET() throws Exception {
		// 설비 보전 결과 폼
	}

	@PostMapping(value = "/resultInsert")
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
