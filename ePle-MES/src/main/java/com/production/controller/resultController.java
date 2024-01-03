package com.production.controller;

import java.sql.Timestamp;
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
	public void resultGET(@RequestParam(value = "date",required = false) Timestamp date,@RequestParam(value = "line_code",required = false) String line_code,@RequestParam(value = "isFinish",required = false) Boolean isFinish,Model model) throws Exception {
		logger.debug("Controller : resultGET() 호출");
		//검색 조건 입력
		//검색조건 초기값 : 오늘 라인전체 완료미포함
		if (date == null) {
			date = new Timestamp(System.currentTimeMillis());
		}
		if (line_code == null) {
			line_code = "*";
		}
		if (isFinish == null) {
			isFinish = false;
		}
		logger.debug("date : " + date);
		logger.debug("line_code : " + line_code);
		logger.debug("isFinish : " + isFinish);
		//실적 목록 가져오기
		List<resultVO> rsList = rsService.getResultList(date,line_code,isFinish);
		logger.debug("rsList : " + rsList);
		logger.debug("rsListin : " + rsList.get(0).getAmount());
		logger.debug("rsListin : " + rsList.get(0).getVo().getAmount());
		model.addAttribute("rsList", rsList);
		
	}
	
	//실적페이지 POST
	@RequestMapping(value = "/result", method = RequestMethod.POST)
	public void resultPOST() throws Exception {
		logger.debug("Controller : resultPOST() 호출");
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
