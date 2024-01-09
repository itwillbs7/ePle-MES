package com.production.controller;

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
		logger.debug("searchProduction_date : " + searchProduction_date);
		logger.debug("line_code : " + searchLine_code);
		logger.debug("isFinished : " + isFinished);
		return rsService.getResultList(searchProduction_date, searchLine_code, isFinished);
	}
	//실적페이지ajax POST
	@RequestMapping(value = "/ajaxResult", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ajaxResult(@RequestParam(value = "code") String code) throws Exception {
		logger.debug("Controller : ajaxResult(String code) 호출");
		logger.debug("code : " + code);
		
		return getInfo(code);
	}
	
	//시작
	@RequestMapping(value = "/Start", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> Start(String code) throws Exception {
		logger.debug("Controller : Start() 호출");
		//실적 상태 대기중 -> 생산중 으로 전환
		rsService.productionStart(code);
		return getInfo(code);
	}
	
	//완료
	@RequestMapping(value = "/Complete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> Complete(String code) throws Exception {
		logger.debug("Controller : Complete() 호출");
		//실적 상태 생산중 -> 완료 으로 전환
		//지시량과 양품량 비교하여 양품량이 지시랑보다 적을 시 대기중 상태의 실적 생성
		rsService.productionComplete(code);
		return getInfo(code);
	}
	
	//양품+
	@RequestMapping(value = "/addResult", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addResult(String code) throws Exception {
		logger.debug("Controller : addResult() 호출");
		//양품량 +1
		//상태가 생산중일때만 동작
		//지시량과 양품량이 같아지면 완료로 전환
		rsService.addResult(code);
		return getInfo(code);
	}
	
	
	//불량+
	@RequestMapping(value = "/addFailed", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addFailed(String code) throws Exception {
		logger.debug("Controller : addFailed() 호출");
		//부적합량 +1
		//상태가 생산중일때만 동작
		rsService.addFailed(code);
		return getInfo(code);
	}
	
	public Map<String, Object> getInfo(String code) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		//기본정보 저장
		resultMap.put("result", rsService.getResult(code));
		//불량정보 저장
		resultMap.put("failedList", rsService.getFailedList(code));
		//투입정보 저장
		//resultMap.put("BOM", rsService.getBOM(code));
		
		return resultMap;
	}
}
