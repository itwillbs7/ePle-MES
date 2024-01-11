package com.itwillbs.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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

}
