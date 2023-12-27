package com.itwillbs.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.MaintenanceSearchVO;
import com.itwillbs.domain.MaintenanceVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.service.MaintenanceService;

/** FacilityController : 설비 보전 컨트롤러 **/

@Controller
@RequestMapping(value = "/facility/maintenance/*")
public class MaintenanceController {

	@Inject
	private MaintenanceService mService;

	// http://localhost:8088/maintenance/list
	@GetMapping(value = "/list")
	public void maintenanceListGET
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
	}

	@GetMapping(value = "/insert")
	public void maintenanceInsertGET() throws Exception {
		// 설비 보전 등록 폼
		
	}

	@PostMapping(value = "/insert")
	public void maintenanceInsertPOST(MaintenanceVO vo, Model model) throws Exception {
		// 설비 보전 등록 액션

		// 일상보전 or 사후보전 / 예방보전 / 긴급보전
		// -> 다른 데이터베이스에서 진행(일상 보전은 결과만)
		int result = mService.addMaintenance(vo);
		if(result == 1) {
			
		}
		else {
			
		}
	}

	@GetMapping(value = "/update")
	public void maintenanceUpdateGET() throws Exception {
		// 설비 보전 수정 폼

	}

	@PostMapping(value = "/update")
	public void maintenanceUpdatePOST() throws Exception {
		// 설비 보전 수정 액션

	}

	@GetMapping(value = "/delete")
	public void maintenanceDeleteGET() throws Exception {
		// 설비 보전 삭제 폼

	}

	@PostMapping(value = "/delete")
	public void maintenanceDeletePOST() throws Exception {
		// 설비 보전 삭제 액션

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
	public void maintenanceResultInsertPOST() throws Exception {
		// 설비 보전 결과 액션
	}
}
