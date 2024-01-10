package com.itwillbs.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.OrderVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.domain.WarehouseVO;
import com.itwillbs.domain.Warehouse_HistoryVO;
import com.itwillbs.service.MaterialService;

/** MaterialController : 자재 컨트롤러 합치는중
* 
*	발주요청 - http://localhost:8088/material/askOrderList
*	발주관리 - http://localhost:8088/material/orderList
*	    입고 - http://localhost:8088/material/inList
*/

@Controller
@RequestMapping(value = "/material/*")
public class MaterialController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(MaterialController.class);
	
	@Inject
	private MaterialService mService;	
	

	
	  /*----------------------------------------입고 시작-------------------------------------------*/
	
	  // ======================================입고 - 목록
	  @RequestMapping(value = "/inList", method = RequestMethod.GET) 
	  public void inList(Model model, Criteria cri, Warehouse_HistoryVO vo) throws Exception {
	  
		  vo.setCri(cri);
		  
		  PageVO pageVO = new PageVO(); 
		  pageVO.setCri(cri);
		  pageVO.setTotalCount(mService.inListCount(vo));
	  
		  model.addAttribute("pageVO", pageVO);
		  model.addAttribute("inList", mService.inList(vo));

	  }
	
	  // ======================================입고 - 등록
	  @RequestMapping(value = "/inAdd", method = RequestMethod.GET)
	  public void inAdd(Model model) throws Exception {
		  /* model.addAttribute("delInfo", delInfo); */
	  }
	  
      @RequestMapping(value = "/inAdd", method = RequestMethod.POST)
	  public String inAdd(Warehouse_HistoryVO vo, RedirectAttributes rttr) throws Exception {
    	  String recentCode = mService.getRecentCode();

    	  SimpleDateFormat dateformat = new SimpleDateFormat("yyyyMMdd");
    	  String now = dateformat.format(new Date());

    	  String code = "IN";

    	  if(recentCode == null || recentCode.equals("")) {
    		  code += now;
    		  code += "001";
    	  }

    	  else {
    		  String fDate = recentCode.substring(2, recentCode.length()-3);
    		  if(now.equals(fDate)) {		
    			  String fCount = "" + (Integer.parseInt(recentCode.substring(recentCode.length()-3)) + 1);
    			  while(fCount.length() < 3) fCount = "0" + fCount;
    			  code += fDate + fCount;
    		  }
    		  else {
    			  code += now + "001";
    		  }
    	  }
    	  vo.setCode(code);
    	  
    	  // 입고등록시 발주상태 업데이트
    	  OrderVO OrderVO = new OrderVO();
    	  OrderVO.setCode(vo.getOrder_num());
    	  OrderVO.setComplete('1');
    	  mService.updateComplete(OrderVO);
    	
    	  int result = mService.inAdd(vo); 
    	
    	  if (result == 1) {
    		  return "material/resultSuccess"; 
    	  } else {
			  return "material/resultFailed"; 
    	  } 
      }
      
      // ======================================입고 - 상세
      @RequestMapping(value = "/inInfo", method = RequestMethod.GET)
  	  public void requestInfo(@RequestParam(value = "code") String code,Model model) throws Exception {
  		
    	Warehouse_HistoryVO inInfo = mService.inInfo(code);
  		model.addAttribute("inInfo", inInfo);

  	  }
      
      // ======================================입고 - 수정
	  @RequestMapping(value = "/inEdit", method = RequestMethod.GET) 
	  public void inEdit(@RequestParam("code") String code, Model model) throws Exception {
	 
	    Warehouse_HistoryVO inInfo = mService.inInfo(code);
	  	model.addAttribute("inInfo", inInfo);
	  }
	  
	  @RequestMapping(value = "/inEdit", method = RequestMethod.POST) 
	  public String inEdit(Warehouse_HistoryVO vo,HttpSession session, RedirectAttributes rttr) throws Exception{
	  
		  int result = mService.inEdit(vo);
	
		  if (result == 1) {
			  return "material/resultSuccess"; 
		  } else {
			  return "material/resultFailed"; 
		  } 
	  }
	  
	  /*-----------------------------------------입고 끝--------------------------------------------*/
	 
	  
	  
	  /*--------------------------------------발주요청 시작-----------------------------------------*/
      
	  // ======================================발주요청 - 목록
	  @RequestMapping(value = {"/askOrderList","/orderBeforeAdd"}, method = RequestMethod.GET) 
	  public void askOrderList(Model model, Criteria cri, OrderVO vo) throws Exception {
	  
		  vo.setCri(cri);
		  
		  PageVO pageVO = new PageVO(); 
		  pageVO.setCri(cri);
		  pageVO.setTotalCount(mService.askOrderListCount(vo));
	  
		  model.addAttribute("pageVO", pageVO);
		  model.addAttribute("askOrderList", mService.askOrderList(vo));

	  }
	
	  // ======================================발주요청 - 등록
	  @RequestMapping(value = "/askOrderAdd", method = RequestMethod.GET)
	  public void askOrderAdd(Model model) throws Exception {
	  }
	  
      @RequestMapping(value = "/askOrderAdd", method = RequestMethod.POST)
	  public String askOrderAdd(OrderVO vo, RedirectAttributes rttr) throws Exception {
    	  String recentCode = mService.orderRecentCode();

    	  SimpleDateFormat dateformat = new SimpleDateFormat("yyyyMMdd");
    	  String now = dateformat.format(new Date());

    	  String code = "OR";

    	  if(recentCode == null || recentCode.equals("")) {
    		  code += now;
    		  code += "001";
    	  }

    	  else {
    		  String fDate = recentCode.substring(2, recentCode.length()-3);
    		  if(now.equals(fDate)) {		
    			  String fCount = "" + (Integer.parseInt(recentCode.substring(recentCode.length()-3)) + 1);
    			  while(fCount.length() < 3) fCount = "0" + fCount;
    			  code += fDate + fCount;
    		  }
    		  else {
    			  code += now + "001";
    		  }
    	  }
    	  vo.setCode(code);
    	
    	  int result = mService.askOrderAdd(vo); 
    	
    	  if (result == 1) {
    		  return "material/resultSuccess"; 
    	  } else {
			  return "material/resultFailed"; 
    	  } 
      }
      
      // ======================================발주요청 - 상세
      @RequestMapping(value = "/askOrderInfo", method = RequestMethod.GET)
  	  public void askOrderInfo(@RequestParam(value = "code") String code,Model model) throws Exception {
  		
    	OrderVO askOrderInfo = mService.askOrderInfo(code);
  		model.addAttribute("List", askOrderInfo);

  	  }
      
      // ======================================발주요청 - 수정
	  @RequestMapping(value = "/askOrderEdit", method = RequestMethod.GET) 
	  public void askOrderEdit(@RequestParam("code") String code, Model model) throws Exception {
	 
		OrderVO askOrderInfo = mService.askOrderInfo(code);
	  	model.addAttribute("List", askOrderInfo);
	  }
	  
	  @RequestMapping(value = "/askOrderEdit", method = RequestMethod.POST) 
	  public String askOrderEdit(OrderVO vo,HttpSession session, RedirectAttributes rttr) throws Exception{
	  
		  int result = mService.askOrderEdit(vo);
	
		  if (result == 1) {
			  return "material/resultSuccess"; 
		  } else {
			  return "material/resultFailed"; 
		  } 
	  }
	  
	  // ======================================발주요청 - 삭제
	  @RequestMapping(value = "/askOrderDel", method = RequestMethod.GET)
	  public void askOrderDel(@RequestParam("codes") String codes, Model model) throws Exception {
		  String[] code_arr = codes.split(",");
		  List<OrderVO> askOrderDel = mService.delAskInfo(code_arr);
		  model.addAttribute("List", askOrderDel);
	  }

	  @RequestMapping(value = "/askOrderDel", method = RequestMethod.POST)
	  public void deleteWarehouse(@RequestParam("codes") String codes) throws Exception {
		  String[] code_arr = codes.split(",");
		  mService.askOrderDel(code_arr);
	  }
	  
	  /*--------------------------------------발주요청  끝 -----------------------------------------*/
	  
	  
	  
	  /*--------------------------------------발주관리 시작-----------------------------------------*/
	  
	  // ======================================발주 목록
	  // + 입고등록 검색)  /searchOrder
	  // + 발주관리 메인)  /orderList
	  @RequestMapping(value = {"/searchOrder","/orderList"} , method = RequestMethod.GET)
	  public void searchOrder(Model model, Criteria cri, OrderVO vo) throws Exception{
			
		  vo.setCri(cri);
		  PageVO pageVO = new PageVO();
		  pageVO.setCri(cri);
		  pageVO.setTotalCount(mService.orderListCount(vo));
		  model.addAttribute("pageVO", pageVO);
		  model.addAttribute("searchOrder", mService.searchOrder(vo));
			
	  }
	  
      // ======================================발주 등록 (update)
	  @RequestMapping(value = "/orderAdd", method = RequestMethod.GET) 
	  public void orderAdd(@RequestParam("code") String code, Model model) throws Exception {
	 
		OrderVO askOrderInfo = mService.askOrderInfo(code);
	  	model.addAttribute("List", askOrderInfo);
	  }
	  
	  @RequestMapping(value = "/orderAdd", method = RequestMethod.POST) 
	  public String orderAdd(OrderVO vo,HttpSession session, RedirectAttributes rttr) throws Exception{
	  
		  int result = mService.orderAdd(vo);
	
		  if (result == 1) {
			  return "/material/resultSuccess2"; 
		  } else {
			  return "/material/resultFailed"; 
		  } 
	  }
	  
	  
	  
  		
	  //=====================================================================================
	  

	  // 입고등록) 창고 목록 (원
	  @RequestMapping(value = "/searchOrderWarehouse" , method = RequestMethod.GET)
	  public void searchWarehouse(Model model, Criteria cri, WarehouseVO vo) throws Exception{
		  
		  vo.setCri(cri);
		  PageVO pageVO = new PageVO();
		  pageVO.setCri(cri);
		  pageVO.setTotalCount(mService.warehouseListCount(vo));
		  model.addAttribute("pageVO", pageVO);
		  model.addAttribute("orderWarehouse", mService.orderWarehouse(vo)); 
		  
	  }
	  
	  // 발주요청등록) 품목 목록 (원자재) 
	  @RequestMapping(value = "/searchMaterial" , method = RequestMethod.GET)
	  public void searchMaterial(Model model, Criteria cri, OrderVO vo) throws Exception{
		  
		  vo.setCri(cri);
		  PageVO pageVO = new PageVO();
		  pageVO.setCri(cri);
		  pageVO.setTotalCount(mService.searchMaterialCount(vo));
		  model.addAttribute("pageVO", pageVO);
		  model.addAttribute("searchMaterial", mService.searchMaterial(vo)); 
		  
	  }
	  
	  // 발주등록) 사원 목록 (원자재) 
	  @RequestMapping(value = "/searchClient" , method = RequestMethod.GET)
	  public void searchClient(Model model, Criteria cri, OrderVO vo) throws Exception{
		  
		  vo.setCri(cri);
		  PageVO pageVO = new PageVO();
		  pageVO.setCri(cri);
		  pageVO.setTotalCount(mService.searchClientCount(vo));
		  model.addAttribute("pageVO", pageVO);
		  model.addAttribute("searchClient", mService.searchClient(vo)); 
		  
	  }
  	
  	
}
