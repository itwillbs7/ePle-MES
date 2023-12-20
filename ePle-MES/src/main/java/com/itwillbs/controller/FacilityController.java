package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/** FacilityController : 설비 컨트롤러 **/

@Controller
@RequestMapping(value = "/facility/*")
public class FacilityController {

	// http://localhost:8088/facility/list
	@RequestMapping(value = "/list")
	public void facilityListGET() {
		// 설비 목록 return
		
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
}