package com.itwillbs.Exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
@ControllerAdvice
public class CommonExceptionAdvice {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonExceptionAdvice.class);
	
	@ExceptionHandler(Exception.class)
	public String CommonException(Exception e,Model model) {
		logger.debug(" CommonException() 실행 ");

		e.printStackTrace();
		model.addAttribute("e", e);
		 
		return "commons";
	}
	
	//@ExceptionHandler(Exception.class)
	public ModelAndView CommonException2(Exception e,Model model) {
		logger.debug(" CommonException2() 실행 ");

		e.printStackTrace();

		ModelAndView mav = new ModelAndView();
		mav.setViewName("commons");
		mav.addObject("e", e);
		
		return mav;
	}
	
	
}
