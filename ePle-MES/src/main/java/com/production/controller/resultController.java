package com.production.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.CommonVO;
import com.itwillbs.domain.Warehouse_HistoryVO;
import com.itwillbs.service.MaterialService;
import com.production.domain.failedVO;
import com.production.domain.inputVO;
import com.production.domain.resultVO;
import com.production.service.resultService;

@Controller
@RequestMapping(value = "/production/*")
public class resultController {
	
	private static final Logger logger = LoggerFactory.getLogger(productionController.class);
	
	@Inject
	private resultService rsService;
	
	@Inject
	private MaterialService mService;
	
	//http://localhost:8088/production/result
	//실적페이지 GET
	@RequestMapping(value = "/result", method = RequestMethod.GET)
	public void resultGET(String date, String[] line_code, Boolean isFinished,Model model) throws Exception {
		logger.debug("Controller : resultGET() 호출");
		logger.debug("date : " + date);
		logger.debug("list_code : " + line_code);
		logger.debug("isFinished : " + isFinished);
		model.addAttribute("line_code", line_code);
		if (isFinished != null) {
			model.addAttribute("isFinished", "checked");
		}
		//검색 라인코드 목록
		List<String> line_codeList = rsService.getLine_codeList();
		logger.debug("line_codeList : " + line_codeList);
		model.addAttribute("line_codeList", line_codeList);
		//오늘 날짜
		LocalDate today = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String todayStr = today.format(formatter);
		logger.debug("today : " + todayStr);
		model.addAttribute("date", date!=null?date:todayStr);
		//실적 리스트
		List<resultVO> rsList = rsService.getResultList(date!=null?date:todayStr, line_code, isFinished);
		logger.debug("rsList : " + rsList);
		model.addAttribute("rsList", rsList);
		model.addAttribute("selectedLine_code", line_code);
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
		//실적 상태 생산중 -> 완료로 전환
		//양품량,지시량 비교
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
	@RequestMapping(value = "/insertFailed", method = RequestMethod.GET)
	public void insertFailed(String code,String product,Model model) throws Exception {
		logger.debug("Controller : insertFailed() 호출");
		model.addAttribute("code", code);
		model.addAttribute("product", product);
		List<CommonVO> code_idList = rsService.getCode_id();
		model.addAttribute("code_idList", code_idList);
	}
	
	//불량+
	@RequestMapping(value = "/insertFailed", method = RequestMethod.POST)
	public void insertFailed(failedVO vo) throws Exception {
		logger.debug("Controller : insertFailed(failedVO vo) 호출");
		//부적합량 +1
		//상태가 생산중일때만 동작
		failedVO vo1 = vo;
		String code_id = vo1.getCode_id();
		logger.debug("code_id : " + code_id);
		vo1.setGroup_id(code_id.split("_")[0]);
		vo1.setCode_id(code_id.split("_")[1]);
		logger.debug("code_id1 : " + vo1.getCode_id());
		logger.debug("group_id1 : " + vo1.getGroup_id());
		rsService.insertFailed(vo1);
	}
	
	//입고 등록
	@RequestMapping(value = "/inAdd", method = RequestMethod.GET)
	public void inAdd(String code, Model model) throws Exception {
		logger.debug("Controller : inAdd(String code) 호출");
		model.addAttribute("result",rsService.getResult(code));
	}
	//재료 투입
	@RequestMapping(value = "/input", method = RequestMethod.GET)
	public void input(String code, Model model) throws Exception {
		logger.debug("Controller : input(String code) 호출");
		model.addAttribute("result",rsService.getResult(code));
	}
	//재료 투입
	@RequestMapping(value = "/input", method = RequestMethod.POST)
	public void input(@RequestBody inputVO[] arr) throws Exception {
		logger.debug("Controller : input(String code) POST 호출");
		logger.debug("arr : " + arr[0]);
		List<Warehouse_HistoryVO> wList = rsService.insertInput(arr);
		logger.debug("wList : " + wList);
		outAddList(wList);
	}
	
	public void outAddList(List<Warehouse_HistoryVO> list) throws Exception {
		  String recentCode = null;
		  SimpleDateFormat dateformat = new SimpleDateFormat("yyyyMMdd");
		  String now = dateformat.format(new Date());
		  String code = "OUT";
		  
		  for (Warehouse_HistoryVO warehouse_HistoryVO : list) {
			  recentCode = mService.outRecentCode();
			  code = "OUT";
			  logger.debug("recentCode : " + recentCode);
			  if(recentCode == null || recentCode.equals("")) {
				  code += now;
				  code += "001";
			  }else {
				  String fDate = recentCode.substring(3, recentCode.length()-3);
				  if(now.equals(fDate)) {	
					  logger.debug("fDate : " + fDate);
					  String fCount = "" + (Integer.parseInt(recentCode.substring(recentCode.length()-3)) + 1);
					  logger.debug("fCount : " + fCount);
					  while(fCount.length() < 3) fCount = "0" + fCount;
					  code += fDate + fCount;
				  }else {
					  code += now + "001";
				  }
			  }
			  warehouse_HistoryVO.setCode(code);
			  logger.debug("recentCode2 : " + code);
			  mService.outAdd(warehouse_HistoryVO);
		  }
	  }
	
	
	
	
	
	
	
	//Lot 생성
	@RequestMapping(value = "/insertLot", method = RequestMethod.POST)
	@ResponseBody
	public String insertLot(@RequestParam(value = "code") String code) throws Exception {
		logger.debug("Controller : insertLot(String code) POST 호출");
		logger.debug("code : " + code);
		rsService.insertLot(code);
		return "success";
	}
	
	public Map<String, Object> getInfo(String code) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		//기본정보 저장
		resultMap.put("result", rsService.getResult(code));
		//불량정보 저장
		resultMap.put("failedList", rsService.getFailedList(code));
		logger.debug("asdasd" + rsService.getFailedList(code));
		//투입정보 저장
		resultMap.put("inputList", rsService.getInput(code));
		
		return resultMap;
	}
}
