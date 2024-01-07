package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.LineOffVO;
import com.itwillbs.domain.LineVO;

@Controller
@RequestMapping(value = "/line/*")
public class LineController {
	@GetMapping("/list")
	public void list() {
		// 라인 리스트 표시(이건 나중에 있는지 보기)
		
	}
	
	@GetMapping("/detail")
	public void detail(String code, Model model) {
		// 라인 정보와 이력 표시
	}
	
	@GetMapping("/set")
	public void lineSet(LineVO vo, Model model) {
		// 라인 켜기/끄기 폼
	}
	
	@PostMapping("/set")
	public String lineSet(String code, LineOffVO vo, RedirectAttributes rttr) {
		
		int i = 1;
		if(i == 1) {
			return "";
		}
		else {
			
			return "";
		}
	}
}