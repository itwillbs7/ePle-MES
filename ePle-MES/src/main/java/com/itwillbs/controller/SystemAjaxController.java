package com.itwillbs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.CommonVO;
import com.itwillbs.service.SystemServiceImpl;

@RestController
@RequestMapping(value = "/systemAjax/*", produces = "application/json; charset=UTF-8")
public class SystemAjaxController {
	
	private static final Logger logger = LoggerFactory.getLogger(SystemAjaxController.class);
	
	@Inject
	private SystemServiceImpl sService;
	
	@GetMapping(value = "/user")
	public ResponseEntity<Map<String, Object>> systemAjaxUserGET(@RequestParam("id") String id, 
			@RequestParam("email") String email, @RequestParam("phone") String phone) throws Exception {
		logger.debug("systemAjaxUserGET 호출");
		logger.debug("전달받은 정보 :" + id + email + phone);
		
		// 중복확인 service 실행
		int idResult = sService.duplicateIDCheck(id);
		int emailResult = sService.duplicateEmailCheck(email);
		int phoneResult = sService.duplicatePhoneCheck(phone);
		
		// Map에 중복결과 저장
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("idResult", idResult);
		resultMap.put("emailResult", emailResult);
		resultMap.put("phoneResult", phoneResult);
		
		return ResponseEntity.ok(resultMap);
	}
	
	@GetMapping(value = "/getDistinctCommon")
	public ResponseEntity<List<String>> getDistinctCommon(
			@RequestParam("category") String category) throws Exception{
		logger.debug("getDistinctCommon 호출");
		logger.debug("category : " + category);
		
		// 카테고리(공통코드 컬럼명)에 해당하는 데이터 불러오기
		List<String> categoryList = sService.getDistinctCommon(category);
		
		return ResponseEntity.ok(categoryList);
	}
	
	@GetMapping(value = "/checkDuplicateCommon")
	public ResponseEntity<Integer> checkDuplicateCommon(
			CommonVO cvo
			) throws Exception{
		
		logger.debug(cvo.toString());
		
		// 중복확인 결과 : 존재X=0
		int result = sService.duplicateCommonCheck(cvo);
		
		return ResponseEntity.ok(result);
	}

}
