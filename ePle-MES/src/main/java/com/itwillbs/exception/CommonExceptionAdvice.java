package com.itwillbs.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class CommonExceptionAdvice {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonExceptionAdvice.class);
	
	@ExceptionHandler(Exception.class)
	public String commonException(Exception e, Model model) {
		logger.debug(" commonException() 실행 ");
		logger.debug("reduce reuse ecycy");
		e.printStackTrace();
		model.addAttribute("e",e);
		return "commons";
		
		
	}
}
