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

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.PageVO;
import com.itwillbs.domain.WarehouseVO;
import com.itwillbs.service.WarehouseService;


/** WarehouseController : 창고 컨트롤러 **/

@Controller
@RequestMapping(value = "/warehouse/*")
public class WarehouseController {
	
	private static final Logger logger = LoggerFactory.getLogger(WarehouseController.class);
	
	@Inject
	private WarehouseService wService;

	
	
	// 4-39 창고 메인 (GET)  http://localhost:8088/warehouse/list 
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String warehouseListGET(Model model,
								   @ModelAttribute("result") String result,
								   HttpSession session,
								   Criteria cri) throws Exception { 

		logger.debug("warehouseListGET -> DB에서 목록 가져오기");
		
		// 서비스 - 디비에 저장된 글을 가져오기
		List<WarehouseVO> warehouseList = wService.warehouseList(cri);
		logger.debug("♬ ♪ ♬ ♪ ^ㅁ^) "+ warehouseList);
		
		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(wService.totalWarehouseCount());

		logger.debug(" 확인 :"+pageVO);
		model.addAttribute("pageVO", pageVO);
		// 데이터를 연결된 뷰페이지로 전달(Model)
		model.addAttribute("warehouseList", warehouseList);

		return "/warehouse/list";
	}
	
	

	// 4-41 창고 등록 (GET)  http://localhost:8088/warehouse/add
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public void warehouseInsertGET() throws Exception { 
		logger.debug("/warehouse/add -> warehouseInsertGET() 호출 ");
		logger.debug("/warehouse/add.jsp 뷰페이지로 이동");
		
	}
	// 		창고 등록 (POST)
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String warehouseInsertPOST(WarehouseVO vo, RedirectAttributes rttr) throws Exception {

		logger.debug("폼submit -> warehouseInsertPOST() 호출 ");
		logger.debug(" vo : " + vo);
		// 서비스 - DB에 글쓰기(insert) 동작 호출
		wService.InsertWarehouse(vo);	
		logger.debug(" 창고 등록 완료! ");
		
		rttr.addFlashAttribute("result", "CREATEOK");
		
		logger.debug("/warehouse/list 이동");
		return "redirect:/warehouse/list";
	}
	


	
	
	
	
}