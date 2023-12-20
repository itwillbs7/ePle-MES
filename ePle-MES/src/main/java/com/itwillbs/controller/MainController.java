package com.itwillbs.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/** 메인 페이지 **/

@Controller
@RequestMapping(value = "/main/*")
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
		logger.info("메인 페이지, 현재 시간 : {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		return "/main/main";
	}
	
	// http://localhost:8088/main/login
	@GetMapping (value = "/login")
	public void loginGET() {
		logger.info("cc : loginGET() 실행");
	}
	
	@PostMapping (value = "/login")
	public String loginPOST() {
		logger.debug("loginPOST() 실행");
		return "redirect:/";
	}
}
