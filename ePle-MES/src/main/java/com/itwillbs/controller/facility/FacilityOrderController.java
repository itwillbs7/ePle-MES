package com.itwillbs.controller.facility;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.FacilityOrderSearchVO;
import com.itwillbs.domain.FacilityOrderVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.service.facility.FacilityOrderService;

@Controller
@RequestMapping(value = "/facility/order/*")
public class FacilityOrderController {
	
	@Inject
	private FacilityOrderService oService;
	
	private static final Logger logger = LoggerFactory.getLogger(FacilityOrderController.class);
	
	// 권한 설정으로 담당자만 진행하도록 함
	@GetMapping("/list")
	public void list(FacilityOrderSearchVO search, Criteria cri,PageVO pageVO, Model model) throws Exception{
		pageVO.setCri(cri);
		pageVO.setSearch(search);
		model.addAttribute("list", oService.getList(pageVO));
	}
	
	@GetMapping("/insert")
	public void insertGET(Model model) throws Exception{
		// 설비 발주 등록 폼
		model.addAttribute("proList",oService.getCommonList("FACPRO"));
		model.addAttribute("nprList",oService.getCommonList("FACNPR"));
		model.addAttribute("etcList",oService.getCommonList("FACETC"));
	}
	
	@PostMapping("/insert")
	public String insertPOST(FacilityOrderVO vo, RedirectAttributes rttr) throws Exception{
		String link = "";
		String recentCode = oService.getRecentCode();
		
		// 코드 생성(넣는 방식은 화요일에 정하기)
		if(recentCode == null || recentCode.equals("")) {
			
		}
		else {
			
		}
		int result = oService.insertOrder(vo);
		if(result == 1) {
			link = "redirect:/confirm";
			rttr.addFlashAttribute("title", "발주 신청 결과");
			rttr.addFlashAttribute("result", "발주 신청이 완료되었습니다.");
		}
		else {
			link = "redirect:/error";
			rttr.addFlashAttribute("title", "발주 신청 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
		}
		return link;
	}
	
	@GetMapping("/update")
	public void updateGET(FacilityOrderVO vo, Model model) throws Exception{
		// 설비 발주 수정 폼
		model.addAttribute("info",oService.getOrder(vo));
	}
	
	@PostMapping("/update")
	public String updatePOST(FacilityOrderVO vo, RedirectAttributes rttr) throws Exception{
		String link = "";
		int result = oService.updateOrder(vo);
		if(result == 1) {
			link = "redirect:/confirm";
			rttr.addFlashAttribute("title", "발주 수정 결과");
			rttr.addFlashAttribute("result", "발주 수정이 완료되었습니다.");
		}
		else {
			link = "redirect:/error";
			rttr.addFlashAttribute("title", "발주 수정 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
		}
		return link;
	}
	
	@GetMapping("/delete")
	public void deleteGET() throws Exception{
		// 설비 발주 삭제 폼
	}
	
	@PostMapping("/delete")
	public String deletePOST(String[] codeList, RedirectAttributes rttr) throws Exception{
		String link = "";
		int result = oService.deleteOrder(codeList);
		if(result == 1) {
			link = "redirect:/confirm";
			rttr.addFlashAttribute("title", "발주 취소 결과");
			rttr.addFlashAttribute("result", "발주 취소가 완료되었습니다.");
		}
		else {
			link = "redirect:/error";
			rttr.addFlashAttribute("title", "발주 취소 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
		}
		return link;
	}
}
