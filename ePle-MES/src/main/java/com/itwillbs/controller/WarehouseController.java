package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/warehouse/*")
public class WarehouseController {
	
	// http://localhost:8088/warehouse/list
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void warehouseListGET() {
	}
	
}
