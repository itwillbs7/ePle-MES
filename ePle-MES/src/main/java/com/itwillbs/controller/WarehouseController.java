package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.WarehouseVO;
import com.itwillbs.service.WarehouseService;


/** WarehouseController : 창고 컨트롤러 **/

@Controller
@RequestMapping(value = "/warehouse/*")
public class WarehouseController {
	
	private static final Logger logger = LoggerFactory.getLogger(WarehouseController.class);
	
	@Inject
	private WarehouseService wService;

	// 4-39 창고 리스트 (GET)
	// http://localhost:8088/warehouse/list 
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void warehouseListGET(Model model, HttpSession session, 
									@ModelAttribute("result") String result) throws Exception { 
		// 창고 목록 return
		logger.debug("warehouseListGET -> DB에서 목록 가져오기");
		
		// 서비스 - 디비에 저장된 글을 가져오기
		List<WarehouseVO> warehouseList = wService.warehouseList();
		logger.debug("♬ ♪ ^ㅁ^)/ "+ warehouseList);
		
		// 데이터를 연결된 뷰페이지로 전달(Model)
		model.addAttribute("List", warehouseList);
	}
	
	
	
	
	// http://localhost:8088/request/info
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public void requestInfo() throws Exception {// 수주개별정보 5-2
		logger.debug("requestInfo -> DB에서 수주번호가 일치하는 데이터 열 가져오기");
	}
	
	// http://localhost:8088/request/search
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public void searchRequestGET() throws Exception { // 수주검색 5-3
		logger.debug("searchRequestGET() -> 정보 받아서 DB에 조회하기");
	}

	// http://localhost:8088/request/add
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public void requestInsertGET() throws Exception { 
		logger.debug("requestInsertGET() -> 입력폼 팝업");
		// 수주 추가 폼 5-4
		
	}
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String requestInsertPOST(WarehouseVO vo, RedirectAttributes rttr) throws Exception {
		// 수주 추가 액션
		logger.debug("(^^)/insert 예정 정보 "+vo);
		wService.dataInsertWarehouse(vo);
		
		rttr.addAttribute("result", "test");
		
		return "redirect:/request/list";
	}
	
	// http://localhost:8088/request/update
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void requestUpdateGET() throws Exception{
		// 수주 수정 폼5-5
		
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public void requestUpdatePOST() throws Exception{
		// 수주 수정 액션
		
	}
	
	// http://localhost:8088/request/delete
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void requestDeleteGET() throws Exception{
		// 수주 삭제 폼5-6
		
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public void requestDeletePOST() throws Exception{
		// 수주 삭제 액션
		
	}
}