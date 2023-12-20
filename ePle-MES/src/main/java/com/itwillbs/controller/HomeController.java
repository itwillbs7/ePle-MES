package com.itwillbs.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/** '/' -> (/main/main)메인 페이지로 이동 **/

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homeGET() {
		// 메인 페이지로 포워딩 이동
		logger.debug("home() -> main 페이지 이동");
		return "forward:/main/main";
	}
}
