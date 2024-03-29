package com.itwillbs.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.itwillbs.service.facility.FacilityOrderService;

/** MaterialController : 자재 컨트롤러 
* 
*	발주요청 - http://localhost:8088/material/askOrderList
*	발주관리 - http://localhost:8088/material/orderList
*	    입고 - http://localhost:8088/material/inList
*	    출고 - http://localhost:8088/material/outList
*
*/

@Controller
@RequestMapping(value = "/material/*")
public class MaterialController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(MaterialController.class);
	
	@Inject
	private MaterialService mService;	
	
	@Inject
	private FacilityOrderService oService;
	
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
	
	  // ======================================재고 - 발주요청
	  @RequestMapping(value = "/stockOrderMAPD", method = RequestMethod.GET)
	  public void askOrderAdd(@RequestParam(value = "code") String code, Model model) throws Exception {
	      OrderVO stockOrderMAPD = mService.stockOrderMAPD(code);
	      model.addAttribute("List", stockOrderMAPD);
	  }
	  @RequestMapping(value = "/stockOrderMAPD" , method = RequestMethod.POST)
	  public String askOrderAdd(OrderVO vo, @RequestParam(value = "code") String codeParam, RedirectAttributes rttr) throws Exception {
	     
		  String recentCode;

	      if (codeParam.startsWith("F")) {
	    	  recentCode = oService.getRecentCode(); 
	      } else {
	          recentCode = mService.orderRecentCode(); 
	      }

	      SimpleDateFormat dateformat = new SimpleDateFormat("yyyyMMdd");
	      String now = dateformat.format(new Date());

	      String code;

	      if (codeParam.startsWith("F")) {
	          code = "FO";
	      } else {
	          code = "OR";
	      }

	      if (recentCode == null || recentCode.equals("")) {
	          code += now;
	          code += "001";
	      } else {
	          String fDate = recentCode.substring(2, recentCode.length() - 3);
	          if (now.equals(fDate)) {
	              String fCount = "" + (Integer.parseInt(recentCode.substring(recentCode.length() - 3)) + 1);
	              while (fCount.length() < 3)
	                  fCount = "0" + fCount;
	              code += fDate + fCount;
	          } else {
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
	  @RequestMapping(value = "/orderList" , method = RequestMethod.GET)
	  public void orderList(Model model, Criteria cri, OrderVO vo) throws Exception{
			
		  vo.setCri(cri);
		  PageVO pageVO = new PageVO();
		  pageVO.setCri(cri);
		  pageVO.setTotalCount(mService.orderListCount2(vo));
		  model.addAttribute("pageVO", pageVO);
		  model.addAttribute("orderList", mService.orderList(vo));
			
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
	  
      // ======================================발주 상세
      @RequestMapping(value = "/orderInfo", method = RequestMethod.GET)
  	  public void orderInfo(@RequestParam(value = "code") String code,Model model) throws Exception {
  		
    	OrderVO orderInfo = mService.orderInfo(code);
  		model.addAttribute("List", orderInfo);

  	  }
      
      // ======================================발주 수정
	  @RequestMapping(value = "/orderEdit", method = RequestMethod.GET) 
	  public void orderEdit(@RequestParam("code") String code, Model model) throws Exception {
	 
		OrderVO orderInfo = mService.orderInfo(code);
	  	model.addAttribute("List", orderInfo);
	  }
	  
	  @RequestMapping(value = "/orderEdit", method = RequestMethod.POST) 
	  public String orderEdit(OrderVO vo,HttpSession session) throws Exception{
	  
		  int result = mService.orderEdit(vo);
	
		  if (result == 1) {
			  return "material/resultSuccess"; 
		  } else {
			  return "material/resultFailed"; 
		  } 
	  }
	  
	  // ======================================발주 삭제
	  @RequestMapping(value = "/orderDel", method = RequestMethod.GET)
	  public void orderDel(@RequestParam("codes") String codes, Model model) throws Exception {
		  String[] code_arr = codes.split(",");
		  List<OrderVO> delOrderInfo = mService.delOrderInfo(code_arr);
		  model.addAttribute("List", delOrderInfo);
	  }

	  @RequestMapping(value = "/orderDel", method = RequestMethod.POST)
	  public void orderDel(@RequestParam("codes") String codes) throws Exception {
		  String[] code_arr = codes.split(",");
		  mService.orderDel(code_arr);
	  }
	  
	  /*--------------------------------------발주관리  끝 -----------------------------------------*/
	  
	  
	  
	  
	  /*----------------------------------------출고 시작-------------------------------------------*/
		
	  // ======================================출고 - 목록
	  @RequestMapping(value = "/outList", method = RequestMethod.GET) 
	  public void outList(Model model, Criteria cri, Warehouse_HistoryVO vo) throws Exception {
	  
		  vo.setCri(cri);
		  
		  PageVO pageVO = new PageVO(); 
		  pageVO.setCri(cri);
		  pageVO.setTotalCount(mService.outListCount(vo));
	  
		  model.addAttribute("pageVO", pageVO);
		  model.addAttribute("outList", mService.outList(vo));

	  }
	
      // ======================================출고 - 상세
      @RequestMapping(value = "/outInfo", method = RequestMethod.GET)
  	  public void outInfo(@RequestParam(value = "code") String code,Model model) throws Exception {
  		
      	Warehouse_HistoryVO outInfo = mService.outInfo(code);
    	model.addAttribute("outInfo", outInfo);

  	  }
      
      
      
      
      
      
      
      // ======================================출고 등록 !!!!!
	  @RequestMapping(value = "/outAdd", method = RequestMethod.GET) 
	  public void outAdd(@RequestParam("code") String code, Model model) throws Exception {
	 
		Warehouse_HistoryVO inInfo = mService.inInfo(code);
	  	model.addAttribute("inInfo", inInfo);
	  }
	  
	  @RequestMapping(value = "/outAdd", method = RequestMethod.POST) 
	  public String outAdd(Warehouse_HistoryVO vo, @RequestParam(value = "voList",required = false) List<Warehouse_HistoryVO> wList) throws Exception{
		  
		  if (wList != null) {
			  LOGGER.debug("voList : not null");
			  outAddList(wList);
		  }
		  
		  String recentCode = mService.outRecentCode();
		  
		  SimpleDateFormat dateformat = new SimpleDateFormat("yyyyMMdd");
		  String now = dateformat.format(new Date());
		  String code = "OUT";
		  
		  if(recentCode == null || recentCode.equals("")) {
			  code += now;
			  code += "001";
		  }else {
			  String fDate = recentCode.substring(2, recentCode.length()-3);
			  if(now.equals(fDate)) {		
				  String fCount = "" + (Integer.parseInt(recentCode.substring(recentCode.length()-3)) + 1);
				  while(fCount.length() < 3) fCount = "0" + fCount;
				  code += fDate + fCount;
			  }else {
				  code += now + "001";
			  }
		  }
		  
		  vo.setCode(code);
    	  
		  int result = mService.outAdd(vo);
	
		  if (result == 1) {
			  return "/material/resultSuccess"; 
		  } else {
			  return "/material/resultFailed"; 
		  } 
	  }
	  
	  public void outAddList(List<Warehouse_HistoryVO> list) throws Exception {
		  String recentCode = null;
		  SimpleDateFormat dateformat = new SimpleDateFormat("yyyyMMdd");
		  String now = dateformat.format(new Date());
		  String code = "OUT";
		  
		  for (Warehouse_HistoryVO warehouse_HistoryVO : list) {
			  recentCode = mService.outRecentCode();
			  if(recentCode == null || recentCode.equals("")) {
				  code += now;
				  code += "001";
			  }else {
				  String fDate = recentCode.substring(2, recentCode.length()-3);
				  if(now.equals(fDate)) {		
					  String fCount = "" + (Integer.parseInt(recentCode.substring(recentCode.length()-3)) + 1);
					  while(fCount.length() < 3) fCount = "0" + fCount;
					  code += fDate + fCount;
				  }else {
					  code += now + "001";
				  }
			  }
			  warehouse_HistoryVO.setCode(code);
			  mService.outAdd(warehouse_HistoryVO);
		  }
	  }
	  
	  /*-----------------------------------------출고 끝--------------------------------------------*/
	 
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
  		
	  //=====================================================================================
	  
	  // + 입고등록 검색)  /searchOrder
	  @RequestMapping(value = "/searchOrder", method = RequestMethod.GET)
	  public void searchOrder(Model model, Criteria cri, OrderVO vo) throws Exception{
			
		  vo.setCri(cri);
		  PageVO pageVO = new PageVO();
		  pageVO.setCri(cri);
		  pageVO.setTotalCount(mService.orderListCount(vo));
		  model.addAttribute("pageVO", pageVO);
		  model.addAttribute("searchOrder", mService.searchOrder(vo));
			
	  }

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
	  
	  // 발주등록) 거래처 목록 (원자재) 
	  @RequestMapping(value = "/searchClient" , method = RequestMethod.GET)
	  public void searchClient(Model model, Criteria cri, OrderVO vo) throws Exception{
		  
		  vo.setCri(cri);
		  PageVO pageVO = new PageVO();
		  pageVO.setCri(cri);
		  pageVO.setTotalCount(mService.searchClientCount(vo));
		  model.addAttribute("pageVO", pageVO);
		  model.addAttribute("searchClient", mService.searchClient(vo)); 
		  
	  }
	  
	  // 입고검색) 품목 목록 (전체) 
	  @RequestMapping(value = "/searchMAPD" , method = RequestMethod.GET)
	  public void searchMAPD(Model model, Criteria cri, OrderVO vo) throws Exception{
		  
		  vo.setCri(cri);
		  PageVO pageVO = new PageVO();
		  pageVO.setCri(cri);
		  pageVO.setTotalCount(mService.searchMAPDCount(vo));
		  model.addAttribute("pageVO", pageVO);
		  model.addAttribute("searchMAPD", mService.searchMAPD(vo)); 
		  
		  
		  
		  
	  }
  	
  	
}
