package com.itwillbs.controller.facility;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.MaintenanceVO;

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
	public void insertGET(HttpSession session) throws Exception {
		
	}
	
	@PostMapping("/insert")
	public void insertPOST(MaintenanceVO vo) throws Exception {
		
	}
	
	@GetMapping("/list")
	public void listGET(HttpSession session) throws Exception{
		session.getAttribute("userid");
	}
}
