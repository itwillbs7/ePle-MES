package com.production.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/production/*")
public class productionController {
	
	private static final Logger logger = LoggerFactory.getLogger(productionController.class);
	
	//http://localhost:8088/production/production
	@RequestMapping(value = "/production", method = RequestMethod.GET)
	public void production() {
		logger.debug("Controller : production() 호출");
	}
	
}
