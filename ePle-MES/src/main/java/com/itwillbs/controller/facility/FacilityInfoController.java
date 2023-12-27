package com.itwillbs.controller.facility;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.FacilitySearchVO;
import com.itwillbs.domain.FacilityVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.service.facility.FacilityService;
import com.itwillbs.service.facility.MaintenanceService;

/** FacilityController : 설비 컨트롤러 **/

@Controller
@RequestMapping(value = "/facility/info/*")
public class FacilityInfoController {

	@Inject
	private FacilityService fService;
	
	@Inject
	private MaintenanceService mService;
	
	// http://localhost:8088/facility/info/
	@GetMapping(value = "/")
	public String facilityListGET
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
		return "/facility/info/list";
	}
	
	@GetMapping("/detail")
	public void facilityInfo(FacilityVO vo, Model model) throws Exception{
		model.addAttribute("info", fService.getFacility(vo));
		model.addAttribute("list", mService.getFacilityInfo(vo));
	}

	// http://localhost:8088/facility/info/insert
	@GetMapping(value = "/insert")
	public void facilityInsertGET() throws Exception {
		// 설비 추가 폼
		
	}
	
	@PostMapping(value = "/insert")
	public String facilityInsertPOST(FacilityVO vo, RedirectAttributes rttr) throws Exception {
		// 설비 추가 액션
		String link = "";
		int result = fService.addFacility(vo);
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
	
	// http://localhost:8088/facility/info/update
	@GetMapping(value = "/update")
	public void facilityUpdateGET() throws Exception {
		// 설비 수정 폼
		
	}
	
	@PostMapping(value = "/update")
	public String facilityUpdatePOST(FacilityVO vo, RedirectAttributes rttr) throws Exception {
		// 설비 수정 액션
		String link = "";
		int result = fService.updateFacility(vo);
		if(result == 1) {
			link = "redirect:/confirm";
			rttr.addFlashAttribute("title", "설비 수정 결과");
			rttr.addFlashAttribute("result", "설비 수정이 완료되었습니다.");
		}
		else {
			link = "redirect:/error";
			rttr.addFlashAttribute("title", "설비 수정 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
		}
		return link;
	}
	
	// http://localhost:8088/facility/info/delete
	@GetMapping(value = "/delete")
	public void facilityDeleteGET() throws Exception {
		// 설비 삭제 폼
		
	}
	
	@PostMapping(value = "/delete")
	public String facilityDeletePOST(RedirectAttributes rttr) throws Exception {
		// 설비 삭제 액션
		String link = "";
		int result = 0;
		if(result == 1) {
			link = "redirect:/confirm";
			rttr.addFlashAttribute("title", "설비 삭제 결과");
			rttr.addFlashAttribute("result", "설비 삭제가 완료되었습니다.");
		}
		else {
			link = "redirect:/error";
			rttr.addFlashAttribute("title", "설비 삭제 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
		}
		return link;
	}
	
	@PostMapping(value="/json")
	@ResponseBody
	public List<Map<String, Object>> facilityAjax(FacilitySearchVO searchVO) throws Exception {
		List<Map<String, Object>> ajax = new LinkedList<Map<String,Object>>();
		List<FacilityVO> list = fService.getAjaxResult(searchVO);
		for(int i = 0; i<list.size(); i++) {
			Map<String, Object> col = new HashMap<String, Object>();
			col.put("코드", list.get(i).getCode());
			col.put("카테고리", list.get(i).getCategory());
			col.put("이름", list.get(i).getName());
			col.put("모델", list.get(i).getModel());
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