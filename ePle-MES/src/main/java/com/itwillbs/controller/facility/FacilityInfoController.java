package com.itwillbs.controller.facility;

import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.FacilitySearchVO;
import com.itwillbs.domain.FacilityVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.service.facility.FacilityService;
import com.itwillbs.service.facility.MaintenanceService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/** FacilityController : 설비 컨트롤러 **/
/** 관리자만 조회할 수 있도록 함!(권한 설정) **/
@Controller
@RequestMapping(value = "/facility/info/*")
public class FacilityInfoController {

	private static final Logger logger = LoggerFactory.getLogger(FacilityInfoController.class);
	
	@Inject
	private FacilityService fService;
	
	@Inject
	private MaintenanceService mService;
	
	// http://localhost:8088/facility/info/list
	@GetMapping(value = "/list")
	public void facilityListGET
	(FacilitySearchVO searchVO, PageVO pageVO, Criteria cri, Model model) 
	throws Exception{
		// 설비 목록 return
		pageVO.setCri(cri);
		searchVO.setIsajax(false);
		pageVO.setSearch(searchVO);
		pageVO.setTotalCount(fService.facilityListCount(pageVO));
		logger.debug("pageVO : " + pageVO);
		List<FacilityVO> vo = fService.getFacilityList(pageVO);
		if (vo == null) vo = new ArrayList<FacilityVO>();
		model.addAttribute("list", vo);
		model.addAttribute("pageVO", pageVO);
	}

	// http://localhost:8088/facility/info/insert
	@GetMapping(value = "/insert")
	public void facilityInsertGET(Model model) throws Exception {
		// 설비 추가 폼
		model.addAttribute("line", fService.getLineList());
	}
	
	@PostMapping(value = "/insert")
	public String facilityInsertPOST(FacilityVO vo, RedirectAttributes rttr, MultipartFile file) throws Exception {
		// 설비 추가 액션
		// FAC 20231229 001
		String recentCode = fService.getRecentFacility();
		logger.debug("recent : " + recentCode);
		String code = "FAC";
		Date date = new Date();
		String d = (date.getYear() + 1900) + "" + (date.getMonth()+1) + "" + date.getDate();
		if(recentCode == null || recentCode.equals("")) {
			// 코드 새로 생성
			code += d;
			code += "001";
		}
		else {
			// 날짜가 오늘일 경우엔 + 1 해주기
			String fDate = recentCode.substring(3, recentCode.length()-3);
			if(d.equals(fDate)) {				
				String fCount = "" + (Integer.parseInt(recentCode.substring(recentCode.length()-3)) + 1);
				while(fCount.length() < 3) fCount = "0" + fCount;
				code += fDate + fCount;
			}
			else {
				code += d + "001";
			}
		}
		vo.setCode(code);		
		logger.debug("code : " + code);
		String link = "";
		logger.debug("vo : " + vo);
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
	public void facilityUpdateGET(FacilityVO vo, Model model) throws Exception {
		// 설비 수정 폼
		// 설비 정보 가져오기
		FacilityVO info = fService.getFacility(vo);
		model.addAttribute("info", info);
		model.addAttribute("line", fService.getLineList());
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
	
	@GetMapping("/detail")
	public void facilityDetail(Model model, FacilityVO vo) throws Exception {
		FacilityVO info = fService.getFacility(vo);
		info.setMainList(mService.getFacilityInfo(vo));
		model.addAttribute("info", info);
	}
	
	@PostMapping(value="/json")
	@ResponseBody
	public List<Map<String, Object>> facilityAjax
	(FacilitySearchVO searchVO, PageVO pageVO, Criteria cri) throws Exception {
		pageVO.setCri(cri);
		searchVO.setIsajax(true);
		pageVO.setSearch(searchVO);
		List<Map<String, Object>> ajax = new LinkedList<Map<String,Object>>();
		List<FacilityVO> list = fService.getAjaxResult(pageVO);
		for(int i = 0; i<list.size(); i++) {
			Map<String, Object> col = new HashMap<String, Object>();
			col.put("코드", list.get(i).getCode());
			col.put("카테고리", list.get(i).getCategory());
			col.put("이름", list.get(i).getName());
			col.put("모델", list.get(i).getModel());
			col.put("구매 일자", list.get(i).getPurchase_date());
			col.put("구매 가격", list.get(i).getInprice());
			col.put("라인 코드", list.get(i).getLine_code());
			col.put("시간당 생산량", list.get(i).getUph());
			ajax.add(col);
		}
		logger.debug("ajax : " + ajax);
		return ajax;
	}
}