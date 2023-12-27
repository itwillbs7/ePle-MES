package com.itwillbs.controller.facility;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/facility/order/*")
public class FacilityOrderController {
	
	@GetMapping("/")
	public String list() throws Exception{
		return "/facility/order/list";
	}
	
	@GetMapping("/insert")
	public void insertGET() throws Exception{
		
	}
	
	@PostMapping("/insert")
	public String insertPOST() throws Exception{
		return null;
	}
	
	@GetMapping("/update")
	public void updateGET() throws Exception{
		
	}
	
	@PostMapping("/update")
	public String updatePOST() throws Exception{
		return null;
	}
	
	@GetMapping("/delete")
	public void deleteGET() throws Exception{
		
	}
	
	@PostMapping("/insert")
	public String deletePOST() throws Exception{
		return null;
	}
}
