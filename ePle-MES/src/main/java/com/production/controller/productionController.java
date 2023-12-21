package com.production.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.production.domain.ajaxSearchVO;
import com.production.domain.instructionVO;
import com.production.service.productionService;

@Controller
@RequestMapping(value = "/production/*")
public class productionController {
	
	private static final Logger logger = LoggerFactory.getLogger(productionController.class);
	
	@Inject
	private productionService pdService;
	
	//http://localhost:8088/production/instruction
	@RequestMapping(value = "/instruction", method = RequestMethod.GET)
	public void instruction(Model model) throws Exception {
		logger.debug("Controller : instruction() 호출");
		model.addAttribute("instructionVOList", pdService.getInstruction());
		model.addAttribute("productList", pdService.getProduct());
		model.addAttribute("line_codeList", pdService.getLine_code());
		model.addAttribute("requestList", pdService.getRequest());
	}
	
	@RequestMapping(value = "/ajaxSearch", method = RequestMethod.POST)
	public void ajaxSearch(ajaxSearchVO vo) throws Exception {
		logger.debug("Controller : ajaxSearch() 호출");
		logger.debug("product : " + vo.getProduct());
		logger.debug("line_code : " + vo.getLine_code());
		logger.debug("request : " + vo.getRequest());
		List<instructionVO> list = pdService.ajaxSearch(vo);
		logger.debug("list : " + list.size());
		
	}
	
}
