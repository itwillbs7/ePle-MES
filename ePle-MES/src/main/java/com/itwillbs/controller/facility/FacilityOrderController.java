package com.itwillbs.controller.facility;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/facility/order/*")
public class FacilityOrderController {
	@GetMapping("/list")
	public void list() throws Exception{
		
	}
}
