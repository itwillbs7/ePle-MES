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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.PageVO;
import com.itwillbs.domain.WarehouseVO;
import com.itwillbs.service.WarehouseService;


/** WarehouseController : 창고 컨트롤러 
* 
*	http://localhost:8088/warehouse/list 
*/

@Controller
@RequestMapping(value = "/warehouse/*")
public class WarehouseController {
	
	private static final Logger logger = LoggerFactory.getLogger(WarehouseController.class);
	
	@Inject
	private WarehouseService wService;

	
	
	  // 4-39 , 4-40
	  // 창고 메인 (출력/페이징/검색) --------------------------------------------------------
	  @RequestMapping(value = "/list", method = RequestMethod.GET) 
	  public void warehouseList(Model model, Criteria cri,
			  					@RequestParam(value = "searchCode",required = false) String searchCode, 
			  					@RequestParam(value = "searchName",required = false) String searchName) throws Exception {

	  List<WarehouseVO> warehouseList = wService.warehouseList(cri,searchCode,searchName); 
	  
	  PageVO pageVO = new PageVO(); 
	  
	  pageVO.setCri(cri);
	  pageVO.setTotalCount(wService.warehouseListCount(searchCode,searchName));
	  
//	  setSearchKeyword(searchCode, searchName);

	  model.addAttribute("pageVO", pageVO);
	  model.addAttribute("warehouseList", warehouseList);
	 
	  }
	  
	    
	  
	  // 사원 팝업 (출력/페이징/검색) --------------------------------------------------------
	  @RequestMapping(value = "/searchEmployees" , method = RequestMethod.GET)
	  public void SearchEmployees(Model model, Criteria cri,
								  @RequestParam(value = "empCode",required = false) String empCode,
								  @RequestParam(value = "empName",required = false) String empName) throws Exception{
			
	  List<WarehouseVO> employeesList = wService.SearchEmployees(cri,empCode,empName);
			
	  PageVO pageVO = new PageVO(); 
			  
	  pageVO.setCri(cri);
	  pageVO.setTotalCount(wService.employeesListCount(empCode,empName));
	  
			  
	  model.addAttribute("pageVO", pageVO);
	  model.addAttribute("employeesList", employeesList);
			
	  }
		
	  
	  
	  // 창고 삭제 (폼/액션)------------------------------------------------------------------
	  @RequestMapping(value = "/delete", method = RequestMethod.GET)
	  public void deleteWarehouse(@RequestParam("codes") String codes, Model model) throws Exception {
		  String[] code_arr = codes.split(",");
		  List<WarehouseVO> delInfo = wService.delInfo(code_arr);
		  model.addAttribute("delInfo", delInfo);
	  }

	  @RequestMapping(value = "/delete", method = RequestMethod.POST)
	  public void deleteWarehouse(@RequestParam("codes") String codes) throws Exception {
		  String[] code_arr = codes.split(",");
		  wService.deleteWarehouse(code_arr);
	  }
	  
	  
	  
	  
	  
	
	

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public void warehouseInsertGET() throws Exception { 
		logger.debug("/warehouse/add -> warehouseInsertGET() 호출 ");
		logger.debug("/warehouse/add.jsp 뷰페이지로 이동");
		
	}
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String warehouseInsertPOST(WarehouseVO vo, RedirectAttributes rttr) throws Exception {

		logger.debug("폼submit -> warehouseInsertPOST() 호출 ");
		logger.debug(" vo : " + vo);
		// 서비스 - DB에 글쓰기(insert) 동작 호출
		wService.InsertWarehouse(vo);	
		
		rttr.addFlashAttribute("result", "CREATEOK");
		
		logger.debug("/warehouse/list 이동");
		return "redirect:/warehouse/list";
	}
	
		
		
	
	private String searchKeyword; 

//	public void setSearchKeyword(String searchCode, String searchName) {
//	 
//	 if(searchCode.equals("") || searchName.equals("")) {
//	  searchKeyword = ""; 
//	 } else {
//	  searchKeyword = "&amp;searchCode=" + searchCode + "&amp;searchName=" + searchName; 
//	 }  
//	}

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