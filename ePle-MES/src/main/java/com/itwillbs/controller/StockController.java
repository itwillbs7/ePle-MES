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

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.OrderVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.domain.StockVO;
import com.itwillbs.service.OrderService;


/** StockController : 재고 컨트롤러 **/

@Controller
@RequestMapping(value = "/stock/*")
public class StockController {

	
	private static final Logger logger = LoggerFactory.getLogger(StockController.class);
	
//	@Inject
//	private StockService sService;

	
/*	
	// 재고 메인 (GET)  http://localhost:8088/stock/list 
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String stockListGET(Model model,
								   @ModelAttribute("result") String result,
								   HttpSession session,
								   Criteria cri) throws Exception { 

		logger.debug("stockListGET -> DB에서 목록 가져오기");
		
		// 서비스 - 디비에 저장된 글을 가져오기
		List<StockVO> orderList = sService.stockList(cri);
		logger.debug("♬ ♪ ♬ ♪ ^ㅁ^) "+ stockList);
		
		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(sService.totalStockCount());

		logger.debug(" 확인 :"+pageVO);
		model.addAttribute("pageVO", pageVO);
		// 데이터를 연결된 뷰페이지로 전달(Model)
		model.addAttribute("stockList", stockList);

		return "/stock/list";
	}
	*/
	
	
	
}
