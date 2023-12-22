package com.itwillbs.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.PageVO;
import com.itwillbs.domain.SearchVO;
import com.itwillbs.service.MaintenanceService;

/** FacilityController : 설비 보전 컨트롤러 **/

@Controller
@RequestMapping(value = "/maintenance/*")
public class MaintenanceController {

	@Inject
	private MaintenanceService mService;
	
	// http://localhost:8088/maintenance/list
	@GetMapping(value = "/list")
	public void maintenanceListGET(SearchVO searchVO, PageVO pageVO, Criteria cri, Model model) {
		// 설비 보전 리스트
		pageVO.setCri(cri);
		pageVO.setSearch(searchVO);
	}

	@GetMapping(value = "/insert")
	public void maintenanceInsertGET() {
		// 설비 보전 등록 폼

	}

	@PostMapping(value = "/insert")
	public void maintenanceInsertPOST() {
		// 설비 보전 등록 액션
		
		// 일상보전 or 사후보전 / 예방보전 / 긴급보전
		// -> 다른 데이터베이스에서 진행(일상 보전은 결과만)
	}
	
	@GetMapping(value = "/update")
	public void maintenanceUpdateGET() {
		// 설비 보전 수정 폼

	}
	
	@PostMapping(value = "/update")
	public void maintenanceUpdatePOST() {
		// 설비 보전 수정 액션

	}
	
	@GetMapping(value = "/delete")
	public void maintenanceDeleteGET() {
		// 설비 보전 삭제 폼

	}
	
	@PostMapping(value = "/delete")
	public void maintenanceDeletePOST() {
		// 설비 보전 삭제 액션

	}

	@GetMapping(value = "/resultList")
	public void maintenanceResultListGET() {
		// 설비 보전 결과 리스트
	}

	@GetMapping(value = "/resultInsert")
	public void maintenanceResultInsertGET() {
		// 설비 보전 결과 폼
	}

	@PostMapping(value = "/resultInsert")
	public void maintenanceResultInsertPOST() {
		// 설비 보전 결과 액션
	}
}
