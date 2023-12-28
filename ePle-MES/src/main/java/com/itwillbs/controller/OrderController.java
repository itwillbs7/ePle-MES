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
import com.itwillbs.domain.OrderVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.domain.StockVO;
import com.itwillbs.service.OrderService;

/** OrderController : 발주 컨트롤러 **/

@Controller
@RequestMapping(value = "/order/*")
public class OrderController {

	
	private static final Logger logger = LoggerFactory.getLogger(WarehouseController.class);
	
	@Inject
	private OrderService oService;

	
	
	// 발주 메인 (GET)  http://localhost:8088/order/list 
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String orderListGET(Model model,
								   @ModelAttribute("result") String result,
								   HttpSession session,
								   Criteria cri) throws Exception { 

		logger.debug("orderListGET -> DB에서 목록 가져오기");
		
		// 서비스 - 디비에 저장된 글을 가져오기
		List<OrderVO> orderList = oService.orderList(cri);
		logger.debug("♬ ♪ ♬ ♪ ^ㅁ^) "+ orderList);
		
		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(oService.totalOrderCount());

		logger.debug(" 확인 :"+pageVO);
		model.addAttribute("pageVO", pageVO);
		// 데이터를 연결된 뷰페이지로 전달(Model)
		model.addAttribute("orderList", orderList);

		return "/order/list";
	}
	
	

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public void orderInsertGET() throws Exception { 
		logger.debug("/order/add -> orderInsertGET() 호출 ");
		logger.debug("/order/add.jsp 뷰페이지로 이동");
		
	}
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String orderInsertPOST(OrderVO vo, RedirectAttributes rttr) throws Exception {

		logger.debug("폼submit -> orderInsertPOST() 호출 ");
		logger.debug(" vo : " + vo);
		// 서비스 - DB에 글쓰기(insert) 동작 호출
		oService.InsertOrder(vo);	
		logger.debug(" 등록 완료! ");
		
		rttr.addFlashAttribute("result", "CREATEOK");
		
		logger.debug("/order/list 이동");
		return "redirect:/order/list";
	}
	
	
	
}
