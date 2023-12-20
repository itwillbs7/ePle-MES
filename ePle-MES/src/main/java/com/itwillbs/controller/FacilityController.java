package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void facilityInsertGET() {
		// 설비 추가 폼
		
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public void facilityInsertPOST() {
		// 설비 추가 액션
		
	}
	
	// http://localhost:8088/facility/update
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void facilityUpdateGET() {
		// 설비 수정 폼
		
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public void facilityUpdatePOST() {
		// 설비 수정 액션
		
	}
	
	// http://localhost:8088/facility/delete
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void facilityDeleteGET() {
		// 설비 삭제 폼
		
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public void facilityDeletePOST() {
		// 설비 삭제 액션
		
	}
}