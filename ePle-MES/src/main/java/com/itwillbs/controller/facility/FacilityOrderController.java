package com.itwillbs.controller.facility;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.OrderVO;

@Controller
@RequestMapping(value = "/facility/order/*")
public class FacilityOrderController {
	
	// 권한 설정으로 담당자만 진행하도록 함
	@GetMapping("/")
	public String list() throws Exception{
		return "/facility/order/list";
	}
	
	@GetMapping("/insert")
	public void insertGET() throws Exception{
		// 설비 발주 등록 폼
	}
	
	@PostMapping("/insert")
	public String insertPOST(OrderVO vo, RedirectAttributes rttr) throws Exception{
		String link = "";
		int result = 0;
		if(result == 1) {
			link = "redirect:/confirm";
			rttr.addFlashAttribute("title", "설비 발주 결과");
			rttr.addFlashAttribute("result", "발주 등록이 완료되었습니다.");
		}
		else {
			link = "redirect:/error";
			rttr.addFlashAttribute("title", "설비 발주 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
		}
		return link;
	}
	
	@GetMapping("/update")
	public void updateGET() throws Exception{
		// 설비 발주 수정 폼
	}
	
	@PostMapping("/update")
	public String updatePOST(OrderVO vo, RedirectAttributes rttr) throws Exception{
		String link = "";
		int result = 0;
		if(result == 1) {
			link = "redirect:/confirm";
			rttr.addFlashAttribute("title", "설비 발주 결과");
			rttr.addFlashAttribute("result", "발주 수정이 완료되었습니다.");
		}
		else {
			link = "redirect:/error";
			rttr.addFlashAttribute("title", "설비 발주 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
		}
		return link;
	}
	
	@GetMapping("/delete")
	public void deleteGET() throws Exception{
		// 설비 발주 삭제 폼
	}
	
	@PostMapping("/insert")
	public String deletePOST(OrderVO vo, RedirectAttributes rttr) throws Exception{
		String link = "";
		int result = 0;
		if(result == 1) {
			link = "redirect:/confirm";
			rttr.addFlashAttribute("title", "설비 발주 결과");
			rttr.addFlashAttribute("result", "발주 취소가 완료되었습니다.");
		}
		else {
			link = "redirect:/error";
			rttr.addFlashAttribute("title", "설비 발주 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
		}
		return link;
	}
}
