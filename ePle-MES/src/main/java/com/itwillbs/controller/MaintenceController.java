package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/** FacilityController : 설비 보전 컨트롤러 **/

@Controller
@RequestMapping(value = "/maintenance/*")
public class MaintenceController {

	// http://localhost:8088/maintenance/list
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void maintenanceListGET() {
		// 설비 보전 리스트
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public void maintenanceInsertGET() {
		// 설비 보전 등록 폼

	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public void maintenanceInsertPOST() {
		// 설비 보전 등록 액션
		
		// 일상보전 or 사후보전 / 예방보전 / 긴급보전
		// -> 다른 데이터베이스에서 진행(일상 보전은 결과만)
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void maintenanceUpdateGET() {
		// 설비 보전 수정 폼

	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public void maintenanceUpdatePOST() {
		// 설비 보전 수정 액션

	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void maintenanceDeleteGET() {
		// 설비 보전 삭제 폼

	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public void maintenanceDeletePOST() {
		// 설비 보전 삭제 액션

	}

	@RequestMapping(value = "/resultList", method = RequestMethod.GET)
	public void maintenanceResultListGET() {
		// 설비 보전 결과 리스트
	}

	@RequestMapping(value = "/resultInsert", method = RequestMethod.GET)
	public void maintenanceResultInsertGET() {
		// 설비 보전 결과 폼
	}

	@RequestMapping(value = "/resultInsert", method = RequestMethod.POST)
	public void maintenanceResultInsertPOST() {
		// 설비 보전 결과 액션
	}
}
