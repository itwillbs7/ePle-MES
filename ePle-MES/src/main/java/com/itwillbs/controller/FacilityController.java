package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.PageVO;
import com.itwillbs.domain.FacilitySearchVO;

/** FacilityController : 설비 컨트롤러 **/

@Controller
@RequestMapping(value = "/facility/*")
public class FacilityController {

	// http://localhost:8088/facility/list
	@GetMapping(value = "/list")
	public void facilityListGET(FacilitySearchVO searchVO, PageVO pageVO, Criteria cri, Model model) {
		// 설비 목록 return
		pageVO.setCri(cri);
		pageVO.setTotalCount(11);
	}

	// http://localhost:8088/facility/insert
	@GetMapping(value = "/insert")
	public void facilityInsertGET() {
		// 설비 추가 폼
		
	}
	
	@PostMapping(value = "/insert")
	public void facilityInsertPOST() {
		// 설비 추가 액션
		
	}
	
	// http://localhost:8088/facility/update
	@GetMapping(value = "/update")
	public void facilityUpdateGET() {
		// 설비 수정 폼
		
	}
	
	@PostMapping(value = "/update")
	public void facilityUpdatePOST() {
		// 설비 수정 액션
		
	}
	
	// http://localhost:8088/facility/delete
	@GetMapping(value = "/delete")
	public void facilityDeleteGET() {
		// 설비 삭제 폼
		
	}
	
	@PostMapping(value = "/delete")
	public void facilityDeletePOST() {
		// 설비 삭제 액션
		
	}
	
	@GetMapping(value="/export")
	public void listExportGET() {
		// 설비 리스트 내보내기
	}
}