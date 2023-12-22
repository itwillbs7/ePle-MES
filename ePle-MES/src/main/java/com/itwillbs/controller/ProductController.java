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

import com.itwillbs.domain.MAPDVO;
import com.itwillbs.service.ProductService;

@Controller
@RequestMapping(value = "/product/*")
public class ProductController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Inject
	private ProductService pService;
	
	// http://localhost:8088/product/listAll
	// 리스트 - GET
	@RequestMapping(value = "/listAll",method = RequestMethod.GET)
	public String listALLGET(Model model,
			                 @ModelAttribute("result") String result,
			                 HttpSession session
			                 ) throws Exception{
		logger.debug(" /product/listAll -> listALLGET() ");
		
		session.setAttribute("viewcntCheck", true);		
		
		List<MAPDVO> productList = pService.ProductListAll();
		
		model.addAttribute("productList", productList);
		
		return "/product/listAll";
	}
	
	
}
