package com.production.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.PageVO;
import com.itwillbs.domain.RequestVO;
import com.itwillbs.service.RequestService;
import com.production.domain.instructionVO;
import com.production.domain.requestVO;
import com.production.service.productionService;

@Controller
@RequestMapping(value = "/production/*")
public class productionController {
	
	private static final Logger logger = LoggerFactory.getLogger(productionController.class);
	
	@Inject
	private productionService pdService;
	
	@Inject
	private RequestService rService;
	
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
	public List<instructionVO> ajaxSearch(@RequestParam(value = "product", required = false) String[] product,@RequestParam(value = "line_code", required = false) String[] line_code,@RequestParam(value = "request", required = false) String[] request,@RequestParam(value = "dateRange", required = false) String dateRange,Model model) throws Exception {
		logger.debug("Controller : ajaxSearch() 호출");
		String[] dateArr = null;
		if (dateRange != "") {
			logger.debug("dateRange : " + dateRange);
			dateArr = dateRange.split(" - ");
			for (String string : dateArr) {
				logger.debug("dateArr11 : " + string);
			}
			logger.debug("dateLength : " + dateArr.length);
			logger.debug("Not null");
		}
		logger.debug("dateArr : " + dateArr);
		List<instructionVO> instructionVOList = pdService.ajaxSearch(product,line_code,request,dateArr);
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
	public void insertInstructionPOST(instructionVO instVO/* ,String date */) throws Exception {
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
	//지시사항 삭제 GET
	@RequestMapping(value = "/disableInstruction", method = RequestMethod.GET)
	public String disableInstructionGET(@RequestParam("codes") String codes) throws Exception {
		logger.debug("Controller : disableInstructionGET(String codes) 호출");
		logger.debug("codes : " + codes);
		String[] code_arr = codes.split(",");
		pdService.disableInstruction(code_arr);
		return "redirect:/production/instruction";
	}
	//수주정보 선택 GET
	@RequestMapping(value = "/chooseRequest", method = RequestMethod.GET)
	public void chooseRequestGET(Model model,Criteria cri) throws Exception {
		logger.debug("Controller : chooseRequestGET() 호출");
		List<RequestVO> requestList = rService.requestListpage(cri);
		
		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(rService.getTotal()); // 디비에서 직접 실행결과 가져오기
		
		model.addAttribute("List",requestList);
		model.addAttribute("pageVO", pageVO);
	}
	
	//수주정보 선택(ajax)
	@RequestMapping(value = "/ajaxRequest", method = RequestMethod.POST)
	@ResponseBody
	public requestVO ajaxRequest(String code) throws Exception {
		logger.debug("Controller : ajaxRequest() 호출");
		logger.debug("code : " + code);
		return pdService.getRequest(code);
	}
}
