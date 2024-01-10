package com.itwillbs.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
/** 메인 페이지 **/

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	
	// http://localhost:8088
		@GetMapping(value = "/")
		public String mainGET() throws Exception {
			logger.info("cc : mainGET() 호출");
			return "main";
		}
		
		@PostMapping(value = "/")
		public String mainPOST() throws Exception {
			logger.info("cc : mainPOST() 호출");
			return "main";
		}
		
		// http://localhost:8088/login
		@GetMapping (value = "/login")
		public void loginGET() throws Exception {
			logger.info("cc : loginGET() 호출");
		}
		
		@PostMapping (value = "/login")
		public String loginPOST() throws Exception {
			logger.debug("loginPOST() 호출");
			return "redirect:/";
		}
		
		@GetMapping ("/confirm")
		public void resultConfirm(@ModelAttribute("title") String title, @ModelAttribute("result") String result, Model model) throws Exception{
			model.addAttribute("title", title);
			model.addAttribute("result", result);
		}
		
		@GetMapping ("/error")
		public void errorConfirm(@ModelAttribute("title") String title, @ModelAttribute("result") String result, Model model) throws Exception {
			model.addAttribute("title", title);
			model.addAttribute("result", result);
		}
}
