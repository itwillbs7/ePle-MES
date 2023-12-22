package com.itwillbs.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/** 메인 컨트롤러 **/

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	// http://localhost:8088
	@GetMapping(value = "/")
	public String mainGET() {
		logger.info("cc : mainGET() 호출");
		return "main";
	}
	
	@PostMapping(value = "/")
	public String mainPOST() {
		logger.info("cc : mainPOST() 호출");
		return "main";
	}
	
	// http://localhost:8088/login
	@GetMapping (value = "/login")
	public void loginGET() {
		logger.info("cc : loginGET() 호출");
	}
	
	@PostMapping (value = "/login")
	public String loginPOST() {
		logger.debug("loginPOST() 호출");
		return "redirect:/";
	}
}
