package com.itwillbs.controller.facility;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.FacilitySearchVO;
import com.itwillbs.domain.FacilityVO;
import com.itwillbs.domain.HistoryVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.service.facility.FacilityService;

/** FacilityController : 설비 컨트롤러 **/
/** 관리자만 조회할 수 있도록 함!(권한 설정) **/
@Controller
@RequestMapping(value = "/facility/info/*")
public class FacilityInfoController {

	private static final Logger logger = LoggerFactory.getLogger(FacilityInfoController.class);
	
	@Inject
	private FacilityService fService;
	
	// http://localhost:8088/facility/info/list
	@GetMapping(value = "/list")
	public void facilityListGET
	(FacilitySearchVO searchVO, PageVO pageVO, Criteria cri, Model model) 
	throws Exception{
		// 설비 목록 return
		pageVO.setCri(cri);
		searchVO.setIsajax(false);
		pageVO.setSearch(searchVO);
		pageVO.getSearch().setBetweenDates();
		pageVO.setTotalCount(fService.getFacilityCount(pageVO));
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
		// 입고된 리스트 불러오기(입고 날짜와 정보는 mapd, orders 불러오기, 재고상황도 함께 불러오기)
		model.addAttribute("line", fService.getLineList());
		model.addAttribute("FACPRO", fService.getStockList("FACPRO"));
		model.addAttribute("FACNPR", fService.getStockList("FACNPR"));
		model.addAttribute("FACETC", fService.getStockList("FACETC"));
	}
	
	private String makeInsertCode(String code, String get) {
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyyMMdd");
		String now = dateformat.format(new Date());
		if(get == null || get.equals("")) {
			// 코드 새로 생성
			code += now;
			code += "001";
		}
		else {
			String fDate = get.substring(code.length(), get.length()-3);
			if(now.equals(fDate)) {				
				String fCount = "" + (Integer.parseInt(get.substring(get.length()-3)) + 1);
				while(fCount.length() < 3) fCount = "0" + fCount;
				code += fDate + fCount;
			}
			else {
				code += now + "001";
			}
		}
		logger.debug("code : " + code);
		return code;
	}
	
	@PostMapping(value = "/insert")
	public String facilityInsertPOST(FacilityVO vo,RedirectAttributes rttr, MultipartFile file) throws Exception {
		// 설비 추가 액션
		// FAC 20231229 001
		String link = "redirect:/error";
		rttr.addFlashAttribute("title", "설비 등록 결과");
		rttr.addFlashAttribute("result", "오류가 발생했습니다!");
		
		vo.setCode(makeInsertCode("FAC", fService.findLastFacility()));
		String order = fService.getOrderCode(vo.getMapd_code());
		
		if(order == null || order.equals("")) {
			// 주문에 없음!
			// 입고에서 차감하고 등록하지 않고 일반 등록 처리
			logger.debug("vo : " + vo);
			if(fService.insertFacility(vo) > 0) {
				rttr.addFlashAttribute("title", "설비 등록 결과");
				rttr.addFlashAttribute("result", "설비 등록이 완료되었습니다.");
				link = "redirect:/confirm";
			}
		}
		else {
			vo.setOrder_code(order);
			logger.debug("vo : " + vo);
			if(fService.insertFacility(vo) > 0) {
				HistoryVO his = new HistoryVO();
				his.setCode(makeInsertCode("OUT", fService.getRecentHistory()));
				his.setOrder_num(vo.getCode());
				his.setWarehouse_code(fService.getWarehouseOne(vo.getMapd_code()));
				his.setMapd_code(vo.getMapd_code());
				his.setEmp_code("test");
				if(fService.insertHistory(his) > 0) {
					rttr.addFlashAttribute("title", "설비 등록 결과");
					rttr.addFlashAttribute("result", "설비 등록이 완료되었습니다.");
					link = "redirect:/confirm";
				}
			}
		}
		return link;
	}
	
	// http://localhost:8088/facility/info/update
	@GetMapping(value = "/update")
	public void facilityUpdateGET(String code, Model model) throws Exception {
		// 설비 수정 폼
		// 설비 정보 가져오기
		model.addAttribute("code", code);
		model.addAttribute("info", fService.getFacility(code));
		model.addAttribute("line", fService.getLineList());
	}
	
	@PostMapping(value = "/update")
	public String facilityUpdatePOST(FacilityVO vo, String active, RedirectAttributes rttr) throws Exception {
		// 설비 수정 액션
		String link = "";
		if(active == null || active.equals("")) vo.setActive(false);
		else vo.setActive(true);
		if(fService.updateFacility(vo) >= 1) {
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
	public void facilityDeleteGET(Model model, String code) throws Exception {
		// 설비 삭제 폼
		if(code == null || code.equals("")) {
			// info == null
		}
		else {
			model.addAttribute("info", fService.getFacility(code));
		}
	}
	
	@PostMapping(value = "/delete")
	public String facilityDeletePOST(String[] codeList, RedirectAttributes rttr) throws Exception {
		// 설비 삭제 액션
		String link = "";
		int result = fService.deleteFacility(codeList);
		if(result >= 1) {
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
	public void facilityDetail(Model model, String code) throws Exception {
		model.addAttribute("info", fService.getFacility(code));
	}
	
	/*
	 * @PostMapping(value="/json")
	 * 
	 * @ResponseBody public List<Map<String, Object>> facilityAjax (FacilitySearchVO
	 * searchVO, PageVO pageVO, Criteria cri) throws Exception { pageVO.setCri(cri);
	 * searchVO.setIsajax(true); pageVO.setSearch(searchVO); List<Map<String,
	 * Object>> ajax = new LinkedList<Map<String,Object>>(); List<FacilityVO> list =
	 * fService.getAjaxResult(pageVO); for(int i = 0; i<list.size(); i++) {
	 * Map<String, Object> col = new HashMap<String, Object>(); col.put("코드",
	 * list.get(i).getCode()); col.put("카테고리", list.get(i).getGroup_name());
	 * col.put("상품 종류", list.get(i).getCode_name()); col.put("이름",
	 * list.get(i).getName()); col.put("모델", list.get(i).getModel()); col.put("제조사",
	 * list.get(i).getClient_name()); col.put("구매 일자",
	 * list.get(i).getPurchase_date()); col.put("구매 가격", list.get(i).getInprice());
	 * col.put("라인명", list.get(i).getLine_name()); col.put("시간당 생산량",
	 * list.get(i).getUph()); ajax.add(col); } logger.debug("ajax : " + ajax);
	 * return ajax; }
	 */
}