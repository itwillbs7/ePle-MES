package com.itwillbs.controller.facility;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/facility/order/*")
public class FacilityOrderController {
	
	@GetMapping("/")
	public String list() throws Exception{
		return "/facility/order/list";
	}
}
