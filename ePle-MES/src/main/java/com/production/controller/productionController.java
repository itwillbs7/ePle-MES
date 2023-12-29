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
import org.springframework.web.bind.annotation.ResponseBody;

import com.production.domain.instructionVO;
import com.production.service.productionService;

@Controller
@RequestMapping(value = "/production/*")
public class productionController {
	
	private static final Logger logger = LoggerFactory.getLogger(productionController.class);
	
	@Inject
	private productionService pdService;
	
	//http://localhost:8088/production/instruction
	//지시사항 조회
	@RequestMapping(value = "/instruction", method = RequestMethod.GET)
	public void instruction(Model model) throws Exception {
		logger.debug("Controller : instruction() 호출");
		//지시사항 테이블 요소
		model.addAttribute("instructionVOList", pdService.getInstruction());
		//검색용 중복제거 목록
		model.addAttribute("productList", pdService.getProduct());
		model.addAttribute("line_codeList", pdService.getLine_code());
		model.addAttribute("requestList", pdService.getRequest());
	}
	
	//지시사항 검색(ajax)
	@RequestMapping(value = "/ajaxSearch", method = RequestMethod.POST)
	@ResponseBody
	public List<instructionVO> ajaxSearch(@RequestParam(value = "product", required = false) String[] product,@RequestParam(value = "line_code", required = false) String[] line_code,@RequestParam(value = "request", required = false) String[] request,Model model) throws Exception {
		logger.debug("Controller : ajaxSearch() 호출");
		List<instructionVO> instructionVOList = pdService.ajaxSearch(product,line_code,request);
		logger.debug("instructionVOList : " + instructionVOList);
		return instructionVOList;
	}
	
	//지시사항 추가 GET
	@RequestMapping(value = "/insertInstruction", method = RequestMethod.GET)
	public void insertInstructionGET(Model model) throws Exception {
		logger.debug("Controller : insertInstructionGET(Model model) 호출");
		//라인목록 불러오기
		model.addAttribute("line_codeList", pdService.getLine_codeList());
		//등록자 불러오기
		
		
	}
	
	//지시사항 추가 POST
	@RequestMapping(value = "/insertInstruction", method = RequestMethod.POST)
	public void insertInstructionPOST(instructionVO instVO) throws Exception {
		logger.debug("Controller : insertInstructionPOST(instructionVO instVO) 호출");
		logger.debug("instVO : " + instVO);
		pdService.insertInstruction(instVO);
	}
	
	//지시사항 수정 GET
	@RequestMapping(value = "/updateInstruction", method = RequestMethod.GET)
	public void updateInstructionGET(@RequestParam("code") int code, Model model) throws Exception {
		logger.debug("Controller : updateInstructionGET(int code, Model model) 호출");
		//지시사항 불러오기
		instructionVO vo = pdService.getInstruction(code);
		logger.debug("getInstruction(code) : " + vo);
		model.addAttribute("instruction", vo);
		//라인코드 불러오기
		model.addAttribute("line_codeList", pdService.getLine_codeList());
		//등록자 불러오기
		
		
	}
	//지시사항 수정 POST
	@RequestMapping(value = "/updateInstruction", method = RequestMethod.POST)
	public void updateInstructionPOST(instructionVO instVO) throws Exception {
		logger.debug("Controller : updateInstructionPOST(instructionVO instVO) 호출");
		logger.debug("instVO : " + instVO);
		pdService.updateInstruction(instVO);
	}
}
