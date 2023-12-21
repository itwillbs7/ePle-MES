package com.itwillbs.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping (value = "/system/*")
public class SystemController {

	
	private static final Logger logger = LoggerFactory.getLogger(SystemController.class);
	
	@GetMapping(value = "/common")
	public void common() {
		
	}
	
	@RequestMapping (value = "user", method = RequestMethod.GET)
	public void user() {
		
	}
	
	@GetMapping(value = "/authority")
	public void authority() {
		
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public void addGET() {
		
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addPOST() {
		logger.debug("cc : addPOST 실행");
		
		return "redirect:/common";
	}
	
	@GetMapping(value = "/delete")
	public void delete() {
		
	}
	
	@GetMapping(value = "/update")
	public void update() {
		
	}
	
	
}
