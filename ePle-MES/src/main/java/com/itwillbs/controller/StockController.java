package com.itwillbs.controller;

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
import com.itwillbs.domain.PageVO;
import com.itwillbs.domain.StockVO;
import com.itwillbs.domain.WarehouseVO;
import com.itwillbs.service.StockService;

/** StockController : 창고 + 재고 컨트롤러 합치는중
* 
*	창고 - http://localhost:8088/stock/warehouseList 
*/

@Controller
@RequestMapping(value = "/stock/*")
public class StockController {
	
	private static final Logger logger = LoggerFactory.getLogger(StockController.class);
	
	@Inject
	private StockService sService;

	  /*--------------------------------------창고관리 시작-----------------------------------------*/
    
	  // ======================================창고 - 목록
	  @RequestMapping(value = "/warehouseList", method = RequestMethod.GET) 
	  public void warehouseList(Model model, Criteria cri, WarehouseVO vo) throws Exception {
	  
		  vo.setCri(cri);
		  
		  PageVO pageVO = new PageVO(); 
		  pageVO.setCri(cri);
		  pageVO.setTotalCount(sService.warehouseListCount(vo));
	  
		  model.addAttribute("pageVO", pageVO);
		  model.addAttribute("warehouseList", sService.warehouseList(vo));

	  }
	
	  // ======================================창고 - 등록
	  @RequestMapping(value = "/warehouseAdd", method = RequestMethod.GET)
	  public void warehouseAdd(Model model) throws Exception {
	  	}
	  
      @RequestMapping(value = "/warehouseAdd", method = RequestMethod.POST)
	  public String warehouseAdd(WarehouseVO vo, RedirectAttributes rttr) throws Exception {
    	  String recentCode = sService.whRecentCode();

    	  String code = "W";

    	  if(recentCode == null || recentCode.equals("")) {
    		  code += "01";
    	  }

    	  else {
    			  String fCount = "" + (Integer.parseInt(recentCode.substring(recentCode.length()-2)) + 1);
    			  while(fCount.length() < 2) fCount = "0" + fCount;
    			  code += fCount;
    	  }
    	  
    	  vo.setCode(code);
    	  
    	  int result = sService.warehouseAdd(vo); 
  	
    	  if (result == 1) {
    		  return "material/resultSuccess"; 
    	  } else {
    		  return "material/resultFailed"; 
    	  } 
      }
    
    // ======================================창고 - 상세
    @RequestMapping(value = "/warehouseInfo", method = RequestMethod.GET)
	  public void warehouseInfo(@RequestParam(value = "code") String code,Model model) throws Exception {
		
    	WarehouseVO warehouseInfo = sService.warehouseInfo(code);
		model.addAttribute("List", warehouseInfo);

	  }
    
    // ======================================창고 - 수정
	  @RequestMapping(value = "/warehouseEdit", method = RequestMethod.GET) 
	  public void askOrderEdit(@RequestParam("code") String code, Model model) throws Exception {
	 
		WarehouseVO warehouseInfo = sService.warehouseInfo(code);
	  	model.addAttribute("List", warehouseInfo);
	  }
	  
	  @RequestMapping(value = "/warehouseEdit", method = RequestMethod.POST) 
	  public String warehouseEdit(WarehouseVO vo,HttpSession session, RedirectAttributes rttr) throws Exception{
	  
		  int result = sService.warehouseEdit(vo);
	
		  if (result == 1) {
			  return "material/resultSuccess"; 
		  } else {
			  return "material/resultFailed"; 
		  } 
	  }
	  
	  // ======================================창고 - 삭제
	  @RequestMapping(value = "/warehouseDel", method = RequestMethod.GET)
	  public void warehouseDel(@RequestParam("codes") String codes, Model model) throws Exception {
		  String[] code_arr = codes.split(",");
		  List<WarehouseVO> delInfo = sService.delInfo(code_arr);
		  model.addAttribute("delInfo", delInfo);
	  }

	  @RequestMapping(value = "/warehouseDel", method = RequestMethod.POST)
	  public void warehouseDel(@RequestParam("codes") String codes) throws Exception {
		  String[] code_arr = codes.split(",");
		  sService.warehouseDel(code_arr);
	  }
	  
	  /*--------------------------------------창고관리  끝 -----------------------------------------*/
	  
	  
	  
	  
		
	  /*--------------------------------------재고관리 시작-----------------------------------------*/
    
	  // ======================================재고 - 목록
	  @RequestMapping(value = "/stockList", method = RequestMethod.GET) 
	  public void stockList(Model model, Criteria cri, WarehouseVO vo) throws Exception {
	  
		  vo.setCri(cri);
		  
		  PageVO pageVO = new PageVO(); 
		  pageVO.setCri(cri);
		  pageVO.setTotalCount(sService.stockListCount(vo));
	  
		  model.addAttribute("pageVO", pageVO);
		  model.addAttribute("stockList", sService.stockList(vo));

	  }
	  
	    // ======================================재고 - 상세
	    @RequestMapping(value = "/stockInfo", method = RequestMethod.GET)
		  public void stockInfo(@RequestParam(value = "code") String code,Model model) throws Exception {
			
	    	WarehouseVO stockInfo = sService.stockInfo(code);
			model.addAttribute("List", stockInfo);

		  }
	    
	    // ======================================재고 - 수정
		  @RequestMapping(value = "/stockEdit", method = RequestMethod.GET) 
		  public void stockEdit(@RequestParam("code") String code, Model model) throws Exception {
		 
			WarehouseVO stockInfo = sService.stockInfo(code);
		  	model.addAttribute("List", stockInfo);
		  }
		  
		  @RequestMapping(value = "/stockEdit", method = RequestMethod.POST) 
		  public String stockEdit(WarehouseVO vo,HttpSession session, RedirectAttributes rttr) throws Exception{
		  
			  int result = sService.stockEdit(vo);
		
			  if (result == 1) {
				  return "material/resultSuccess"; 
			  } else {
				  return "material/resultFailed"; 
			  } 
		  }
	  /*--------------------------------------재고관리  끝 -----------------------------------------*/
	  
	  
	  
	  
	  
	  
	  
	  
	  // 품목 팝업 (출력/페이징/검색) --------------------------------------------------------
	  @RequestMapping(value = "/searchMAPD" , method = RequestMethod.GET)
	  public void SearchMAPD(Model model, Criteria cri,
								  @RequestParam(value = "mapdCode",required = false) String mapdCode,
								  @RequestParam(value = "mapdName",required = false) String mapdName) throws Exception {
			
	  List<StockVO> mapdList = sService.SearchMAPD(cri,mapdCode,mapdName);
			
	  PageVO pageVO = new PageVO(); 
			  
	  pageVO.setCri(cri);
	  pageVO.setTotalCount(sService.mapdListCount(mapdCode,mapdName));
	  
			  
	  model.addAttribute("pageVO", pageVO);
	  model.addAttribute("mapdList", mapdList);
			
	  }
	  
	  // 창고 팝업 (출력/페이징/검색) --------------------------------------------------------
	  @RequestMapping(value = "/searchWarehouse" , method = RequestMethod.GET)
	  public void searchWarehouse(Model model, Criteria cri,
								  @RequestParam(value = "whCode",required = false) String whCode,
								  @RequestParam(value = "WhName",required = false) String WhName) throws Exception {
			
	  List<StockVO> warehouseList = sService.searchWarehouse(cri,whCode,WhName);
			
	  PageVO pageVO = new PageVO(); 
			  
	  pageVO.setCri(cri);
	  pageVO.setTotalCount(sService.warehouseListCount(whCode,WhName));
	  
			  
	  model.addAttribute("pageVO", pageVO);
	  model.addAttribute("warehouseList", warehouseList);
			
	  }
	  
	  
	  
	  
	  
	  /*--------------------------------------팝업 리스트-----------------------------------------*/
	  
	  // 창고등록) 사원 목록  
	  @RequestMapping(value = "/searchEmployees" , method = RequestMethod.GET)
	  public void searchEmployees(Model model, Criteria cri, WarehouseVO vo) throws Exception{
		  
		  vo.setCri(cri);
		  PageVO pageVO = new PageVO();
		  pageVO.setCri(cri);
		  pageVO.setTotalCount(sService.searchEmployeesCount(vo));
		  model.addAttribute("pageVO", pageVO);
		  model.addAttribute("searchEmployees", sService.searchEmployees(vo));
		  
	  }
	  
			
			
	
	
	
}