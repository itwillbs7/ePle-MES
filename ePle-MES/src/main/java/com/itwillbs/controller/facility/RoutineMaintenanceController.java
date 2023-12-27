package com.itwillbs.controller.facility;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/facility/routine/*")
public class RoutineMaintenanceController {
	
	@GetMapping("/")
	public String root() throws Exception{
		return "redirect:/facility/routine/emp";
	}
	
	@GetMapping("/emp")
	public void routineEMP() throws Exception{
		
	}
	
	@GetMapping("/insert")
	public void insertGET() throws Exception {
		
	}
	
	@PostMapping("/insert")
	public void insertPOST() throws Exception {
		
	}
	
	@GetMapping("/list")
	public void listGET() throws Exception{
		
	}
}
