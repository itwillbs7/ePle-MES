package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.OrderVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.service.OrderService;


/** WarehouseController : 발주 컨트롤러 (타부서 요청 + 관리)
* 
*	http://localhost:8088/order/list 
*/

@Controller
@RequestMapping(value = "/order/*")
public class OrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(WarehouseController.class);
	
	@Inject
	private OrderService oService;

	
	
	  // 발주 요청 (출력/페이징) -------------------------------------------------------------
	  @RequestMapping(value = "/askList", method = RequestMethod.GET) 
	  public void orderAskList(Model model, Criteria cri) throws Exception {

	  List<OrderVO> orderAskList = oService.orderAskList(cri); 
	  PageVO pageVO = new PageVO(); 
	  pageVO.setCri(cri);
	  pageVO.setTotalCount(oService.orderAskListCount());
	  
	  model.addAttribute("pageVO", pageVO);
	  model.addAttribute("orderAskList", orderAskList);
	  }

	  
	
	  // 발주 관리 (출력/페이징/검색) --------------------------------------------------------
	  @RequestMapping(value = "/list", method = RequestMethod.GET) 
	  public void orderList(Model model, Criteria cri,
			  					@RequestParam(value = "searchOrder",required = false) String searchOrder, 
			  					@RequestParam(value = "searchMAPD",required = false) String searchMapd) throws Exception {

	  List<OrderVO> orderList = oService.orderList(cri,searchOrder,searchMapd); 
	  
	  PageVO pageVO = new PageVO(); 
	  
	  pageVO.setCri(cri);
	  pageVO.setTotalCount(oService.orderListCount(searchOrder,searchMapd));
	  
	  model.addAttribute("pageVO", pageVO);
	  model.addAttribute("orderList", orderList);
	 
	  }
	  
	    
	  
	  // 품목 팝업 (출력/페이징/검색) --------------------------------------------------------
	  @RequestMapping(value = "/searchMAPD" , method = RequestMethod.GET)
	  public void SearchMAPD(Model model, Criteria cri,
								  @RequestParam(value = "mapdCode",required = false) String mapdCode,
								  @RequestParam(value = "mapdName",required = false) String mapdName) throws Exception {
			
	  List<OrderVO> mapdList = oService.SearchMAPD(cri,mapdCode,mapdName);
			
	  PageVO pageVO = new PageVO(); 
			  
	  pageVO.setCri(cri);
	  pageVO.setTotalCount(oService.mapdListCount(mapdCode,mapdName));
	  
			  
	  model.addAttribute("pageVO", pageVO);
	  model.addAttribute("mapdList", mapdList);
			
	  }
		
	  
	  
	  // 발주 삭제 (폼/액션)------------------------------------------------------------------
	  @RequestMapping(value = "/delete", method = RequestMethod.GET)
	  public void deleteOrder(@RequestParam("codes") String codes, Model model) throws Exception {
		  String[] code_arr = codes.split(",");
		  List<OrderVO> delInfo = oService.delInfo(code_arr);
		  model.addAttribute("delInfo", delInfo);
	  }

	  @RequestMapping(value = "/delete", method = RequestMethod.POST)
	  public void deleteOrder(@RequestParam("codes") String codes) throws Exception {
		  String[] code_arr = codes.split(",");
		  oService.deleteOrder(code_arr);
	  }	  
	  
	  
	  
	  
}