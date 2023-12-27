package com.itwillbs.controller.facility;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.FacilitySearchVO;
import com.itwillbs.domain.FacilityVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.service.facility.FacilityService;

/** FacilityController : 설비 컨트롤러 **/

@Controller
@RequestMapping(value = "/facility/info/*")
public class FacilityController {

	@Inject
	private FacilityService service;
	
	// http://localhost:8088/facility/list
	@GetMapping(value = "/list")
	public void facilityListGET
	(FacilitySearchVO searchVO, PageVO pageVO, Criteria cri, Model model) 
	throws Exception{
		// 설비 목록 return
		pageVO.setCri(cri);
		pageVO.setSearch(searchVO);
		pageVO.setTotalCount(service.facilityListCount(pageVO));
		List<FacilityVO> vo = service.getFacilityList(pageVO);
		if (vo == null) vo = new ArrayList<FacilityVO>();
		model.addAttribute("list", vo);
		model.addAttribute("pageVO", pageVO);
	}

	// http://localhost:8088/facility/insert
	@GetMapping(value = "/insert")
	public void facilityInsertGET() throws Exception {
		// 설비 추가 폼
		
	}
	
	@PostMapping(value = "/insert")
	public void facilityInsertPOST(FacilityVO vo) throws Exception {
		// 설비 추가 액션
		int result = service.addFacility(vo);
		if(result == 1) {
			
		}
		else {
			
		}
	}
	
	// http://localhost:8088/facility/update
	@GetMapping(value = "/update")
	public void facilityUpdateGET() throws Exception {
		// 설비 수정 폼
		
	}
	
	@PostMapping(value = "/update")
	public void facilityUpdatePOST() throws Exception {
		// 설비 수정 액션
		
	}
	
	// http://localhost:8088/facility/delete
	@GetMapping(value = "/delete")
	public void facilityDeleteGET() throws Exception {
		// 설비 삭제 폼
		
	}
	
	@PostMapping(value = "/delete")
	public void facilityDeletePOST() throws Exception {
		// 설비 삭제 액션
		
	}
	
	@PostMapping(value="/json")
	@ResponseBody
	public List<Map<String, Object>> facilityAjax(FacilitySearchVO searchVO) throws Exception {
		List<Map<String, Object>> ajax = new LinkedList<Map<String,Object>>();
		List<FacilityVO> list = service.getAjaxResult(searchVO);
		for(int i = 0; i<list.size(); i++) {
			Map<String, Object> col = new HashMap<String, Object>();
			col.put("코드", list.get(i).getCode());
			col.put("카테고리", list.get(i).getCategory());
			col.put("모델", list.get(i).getModel());
			col.put("이름", list.get(i).getName());
			col.put("구매 일자", list.get(i).getPurchase_date());
			col.put("구매 가격", list.get(i).getInprice());
			col.put("위치", list.get(i).getLocation());
			col.put("라인 코드", list.get(i).getLine_code());
			col.put("시간당 생산량", list.get(i).getUph());
			ajax.add(col);
		}
		return ajax;
	}
}