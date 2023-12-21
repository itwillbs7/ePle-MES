package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.RequestSearchVO;
import com.itwillbs.domain.RequestVO;
import com.itwillbs.service.RequestService;

/** FacilityController : 설비 컨트롤러 **/

@Controller
@RequestMapping(value = "/request/*")
public class RequestController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(RequestController.class);
	
	@Inject
	private RequestService rService;

	// http://localhost:8088/request/list
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void requestListGET(Model model, 
							   HttpSession session, 
							   @ModelAttribute("result") String result,
							   Criteria cri) throws Exception { //5-1
		// 수주 목록 return
		logger.debug("requestListGET -> DB에서 목록 가져오기");
		
		List<RequestVO> requestList = rService.requestList();
		logger.debug("(^^)/(^^)/ "+requestList);
		
		model.addAttribute("List",requestList);
	}
	
	// http://localhost:8088/request/info
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public void requestInfo(@RequestParam(value = "") String info) throws Exception {// 수주개별정보 5-2
		logger.debug("requestInfo -> DB에서 수주번호가 일치하는 데이터 열 가져오기");
	}
	
	// http://localhost:8088/request/search
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public void searchRequestGET(Model model, 
								 @ModelAttribute("result") String result, 
								 RequestSearchVO vo) throws Exception { // 수주검색 5-3
		logger.debug("searchRequestGET() -> 정보 받아서 DB에 조회하기");
		logger.debug("Controller - vo "+vo);
		// 전달받을 정보(수주상태 ,담당자코드, 업체코드
		
	}

	// http://localhost:8088/request/add
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public void requestInsertGET() throws Exception { 
		logger.debug("requestInsertGET() -> 입력폼 팝업");
		// 수주 추가 폼 5-4
		
	}
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String requestInsertPOST(RequestVO vo, RedirectAttributes rttr) throws Exception {
		// 수주 추가 액션
		logger.debug("(^^)/insert 예정 정보 "+vo);
		rService.dataInsertRequest(vo);
		
		rttr.addAttribute("result", "AddDone");
		
		return "redirect:/request/list";
	}
	
	// http://localhost:8088/request/update
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void requestUpdateGET(@RequestParam("code") String code) throws Exception{
		// 수주 수정 폼5-5
		// code 정보 받아서 해당하는 code 데이터 불러오기
		logger.debug("requestUpdateGET() code 정보 받아서 출력하기");
		
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public void requestUpdatePOST() throws Exception{
		// 수주 수정 액션
		logger.debug("requestUpdatePOST() 전달받은 정보 DB 저장하기");
	}
	
	// http://localhost:8088/request/delete
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void requestDeleteGET(@RequestParam("code") String code) throws Exception{
		// 수주 삭제 폼5-6
		// 전달정보 저장
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public void requestDeletePOST() throws Exception{
		// 수주 삭제 액션
		
	}
}