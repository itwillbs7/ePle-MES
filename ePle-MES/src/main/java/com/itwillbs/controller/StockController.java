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
import com.itwillbs.domain.PageVO;
import com.itwillbs.domain.StockVO;
import com.itwillbs.service.StockService;

/** StockController : 재고 컨트롤러 
* 
*	http://localhost:8088/Stock/list 
*/

@Controller
@RequestMapping(value = "/Stock/*")
public class StockController {
	
	private static final Logger logger = LoggerFactory.getLogger(WarehouseController.class);
	
	@Inject
	private StockService sService;

	
	
	  // 
	  // 재고 메인 (출력/페이징/검색) --------------------------------------------------------
	  @RequestMapping(value = "/list", method = RequestMethod.GET) 
	  public void StockList(Model model, Criteria cri,
			  					@RequestParam(value = "searchWarehouse",required = false) String searchWarehouse, 
			  					@RequestParam(value = "searchMAPD",required = false) String searchMapd) throws Exception {

	  List<StockVO> stockList = sService.stockList(cri,searchWarehouse,searchMapd); 
	  
	  PageVO pageVO = new PageVO(); 
	  
	  pageVO.setCri(cri);
	  pageVO.setTotalCount(sService.stockListCount(searchWarehouse,searchMapd));
	  
	  model.addAttribute("pageVO", pageVO);
	  model.addAttribute("stockList", stockList);
	 
	  }
	  
	    
	  
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
	  
	  
	  
	  
	  
	
	
	
}
