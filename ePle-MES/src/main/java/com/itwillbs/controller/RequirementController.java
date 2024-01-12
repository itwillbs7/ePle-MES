package com.itwillbs.controller;

import com.itwillbs.service.RequirementService;
import com.production.domain.BOMVO;
import com.production.domain.ProductVO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.LinkedList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

/** 소요량 관리 컨트롤러 **/

@Controller
@RequestMapping("/requirement/*")
public class RequirementController {

	private static final Logger logger = LoggerFactory.getLogger(RequirementController.class);

	@Inject
	private RequirementService rService;

	@GetMapping("/list")
	public void list(Model model) throws Exception {
		// 품목 리스트 불러오기
		List<ProductVO> list = rService.getProductList();
		for(int i = 0; i<list.size(); i++) {
			list.get(i).setList(rService.getBomList(list.get(i).getCode()));
		}
		model.addAttribute("list", list);
		// 품목별 재료 저장
	}
	
	@GetMapping("/detail")
	public void detail(String code, Model model) throws Exception{
		model.addAttribute("info", rService.getProduct(code));
		model.addAttribute("list", rService.getBomList(code));
	}

	@GetMapping("/add")
	public void add(String code, Model model) throws Exception {
		if(code == null || code.equals("")) {
			model.addAttribute("mapd", rService.getMapdList());
		}
		else {
			model.addAttribute("info", rService.getProduct(code));
			model.addAttribute("list", rService.getBomList(code));
		}
		model.addAttribute("mat", rService.getMaterialList());
	}

	@PostMapping("/add")
	public String add(String mapd_code, String material, int amount, String content, RedirectAttributes rttr) throws Exception {
		int bno = rService.getRecentBno();
		BOMVO vo = new BOMVO();
		vo.setBno(++bno + "");
		vo.setMaterial(material);
		vo.setAmount(amount);
		vo.setContent(content);
		vo.setMapd_code(mapd_code);
		if(rService.addMaterial(vo) > 0) {
			rttr.addFlashAttribute("title", "소모품 등록 결과");
			rttr.addFlashAttribute("result", "소모품 등록이 완료되었습니다.");
			return "redirect:/confirm";
		}
		else {
			rttr.addFlashAttribute("title", "소모품 등록 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
			return "redirect:/error";
		}
	}

	@GetMapping("/update")
	public void update(String code, Model model) throws Exception {
		model.addAttribute("info", rService.getProduct(code));
		model.addAttribute("list", rService.getBomList(code));
	}

	@PostMapping("/update")
	public String update(String[] code, int[] amount, String[] content, RedirectAttributes rttr)
			throws Exception {
		int count = code.length;
		int result = 0;
		for(int i = 0; i<count; i++) {
			BOMVO vo = new BOMVO();
			vo.setBno(code[i]);
			vo.setAmount(amount[i]);
			vo.setContent(content[i]);
			result += rService.updateMaterial(vo);
		}
		if(result == count) {
			rttr.addFlashAttribute("title", "소모품 수정 결과");
			rttr.addFlashAttribute("result", "소모품 수정이 완료되었습니다.");
			return "redirect:/confirm";
		}
		else{
			rttr.addFlashAttribute("title", "소모품 수정 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
			return "redirect:/error";
		}
	}

	@GetMapping("/delete")
	public void delete(String code, Model model) throws Exception {
		model.addAttribute("info", rService.getProduct(code));
		model.addAttribute("list", rService.getBomList(code));
	}

	@PostMapping("/delete")
	public String delete(String[] code, RedirectAttributes rttr) throws Exception {
		if(rService.deleteMaterial(code) > 0) {
			rttr.addFlashAttribute("title", "소모품 삭제 결과");
			rttr.addFlashAttribute("result", "소모품 삭제가 완료되었습니다.");
			return "redirect:/confirm";
		}
		else {
			rttr.addFlashAttribute("title", "소모품 삭제 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
			return "redirect:/error";
		}
	}
}
