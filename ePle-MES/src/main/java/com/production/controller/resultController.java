package com.production.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.production.domain.failedVO;
import com.production.domain.resultVO;
import com.production.service.resultService;

@Controller
@RequestMapping(value = "/production/*")
public class resultController {
	
	private static final Logger logger = LoggerFactory.getLogger(productionController.class);
	
	@Inject
	private resultService rsService;
	
	//http://localhost:8088/production/result
	//실적페이지 GET
	@RequestMapping(value = "/result", method = RequestMethod.GET)
	public void resultGET(Model model) throws Exception {
		logger.debug("Controller : resultGET() 호출");
		List<String> line_codeList = rsService.getLine_codeList();
		logger.debug("line_codeList : " + line_codeList);
		model.addAttribute("line_codeList", line_codeList);
	}
	
	//실적페이지 POST
	@RequestMapping(value = "/ajaxSearch1", method = RequestMethod.POST)
	@ResponseBody
	public List<resultVO> resultPOST(String searchProduction_date, String[] searchLine_code, Boolean isFinished) throws Exception {
		logger.debug("Controller : ajaxSearch() 호출");
		logger.debug("line_code : " + searchLine_code);
		logger.debug("isFinished : " + isFinished);
		return rsService.getResultList(searchProduction_date, searchLine_code, isFinished);
	}
	//실적페이지ajax POST
	@RequestMapping(value = "/ajaxResult", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ajaxResult(@RequestParam("code") String code,Model model) throws Exception {
		logger.debug("Controller : ajaxResult(String code) 호출");
		logger.debug("code : " + code);
		Map<String, Object> resultMap = new HashMap<>();
		//기본정보 저장
		resultMap.put("result", rsService.getResult(code));
		//불량정보 저장
		List<failedVO> list = rsService.getFailedList(code);
		
		logger.debug("code : " + list.get(0).getCode());
		resultMap.put("failedList", rsService.getFailedList(code));
		//투입정보 저장
		//resultMap.put("BOM", rsService.getBOM(code));
		
		return resultMap;
	}
}
