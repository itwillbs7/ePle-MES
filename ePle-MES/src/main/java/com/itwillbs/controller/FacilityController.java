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
import com.itwillbs.domain.PageVO;
import com.itwillbs.service.FacilityService;
import com.itwillbs.domain.FacilitySearchVO;
import com.itwillbs.domain.FacilityVO;

/** FacilityController : 설비 컨트롤러 **/

@Controller
@RequestMapping(value = "/facility/*")
public class FacilityController {

	@Inject
	private FacilityService fService;
	
	// http://localhost:8088/facility/list
	@GetMapping(value = "/list")
	public void facilityListGET
	(FacilitySearchVO searchVO, PageVO pageVO, Criteria cri, Model model) 
	throws Exception{
		// 설비 목록 return
		pageVO.setCri(cri);
		pageVO.setSearch(searchVO);
		pageVO.setTotalCount(fService.facilityListCount(pageVO));
		List<FacilityVO> vo = fService.getFacilityList(pageVO);
		if (vo == null) vo = new ArrayList<FacilityVO>();
		model.addAttribute("list", vo);
		model.addAttribute("pageVO", pageVO);
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