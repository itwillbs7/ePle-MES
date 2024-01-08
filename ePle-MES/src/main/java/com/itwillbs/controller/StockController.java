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
*	창고 - http://localhost:8088/Stock/list 
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
	  
	  
	  
	  // 사원 팝업 (출력/페이징/검색) --------------------------------------------------------
	  @RequestMapping(value = "/searchEmployees" , method = RequestMethod.GET)
	  public void SearchEmployees(Model model, Criteria cri,
								  @RequestParam(value = "empCode",required = false) String empCode,
								  @RequestParam(value = "empName",required = false) String empName) throws Exception{
			
//	  List<WarehouseVO> employeesList = sService.SearchEmployees(cri,empCode,empName);
			
	  PageVO pageVO = new PageVO(); 
			  
	  pageVO.setCri(cri);
//	  pageVO.setTotalCount(sService.employeesListCount(empCode,empName));
	  
			  
	  model.addAttribute("pageVO", pageVO);
//	  model.addAttribute("employeesList", employeesList);
			
	  }
	  
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
	  
	  
	  
	  
	  
		private String searchKeyword; 

//		public void setSearchKeyword(String searchCode, String searchName) {
//		 
//		 if(searchCode.equals("") || searchName.equals("")) {
//		  searchKeyword = ""; 
//		 } else {
//		  searchKeyword = "&amp;searchCode=" + searchCode + "&amp;searchName=" + searchName; 
//		 }  
//		}

		public String getSearchKeyword() {
		 return searchKeyword;
		}
		
		public void setSearchKeyword(String searchCode, String searchName) {
			
		    if (searchCode == null || searchName == null || searchCode.isEmpty() || searchName.isEmpty()) {
		        searchKeyword = "";
		    } else {
		        searchKeyword = "&amp;searchCode=" + searchCode + "&amp;searchName=" + searchName;
		    }
		}
	
	
}
