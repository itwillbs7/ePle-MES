package com.itwillbs.controller;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.itwillbs.domain.UserVO;
import com.itwillbs.service.MainServiceImpl;
/** 메인 페이지 **/

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	@Inject
	private MainServiceImpl mService;
	
		// http://localhost:8088
		@GetMapping(value = "/")
		public String mainGET(HttpSession session, Model model) throws Exception {
			logger.info("cc : mainGET() 호출");
			
			// 로그인 확인
			if(session.getAttribute("id") == null) {
				return "redirect:/login";
			}
			model.addAttribute("week", mService.getWeeklyProduction());
			return "main";
		}
		
		@PostMapping(value = "/")
		public String mainPOST() throws Exception {
			logger.info("cc : mainPOST() 호출");
			return "main";
		}
		
		// http://localhost:8088/login
		@GetMapping (value = "/login")
		public void loginGET() throws Exception {
			logger.info("cc : loginGET() 호출");
		}
		
		@PostMapping (value = "/login")
		public String loginPOST(UserVO inputVO, HttpSession session) throws Exception {
			logger.debug("loginPOST() 호출");
			
			UserVO dbVO = mService.getUserInfo(inputVO);
			logger.debug(dbVO.toString());
			if(dbVO != null) { // ID 존재
				
				if(dbVO.getPw().equals(inputVO.getPw()) && dbVO.getActive() != 0) { // pw 일치 = 로그인
					logger.debug(dbVO.toString());
					logger.debug("비밀번호 일치, 세션 값 저장");
					
					LocalDateTime time = LocalDateTime.now(ZoneId.of("Asia/Seoul"));
					
					String now
				    = time.format(
				            DateTimeFormatter.ofPattern("yyyy년 MM월 dd일 HH시 mm분")
				        );
					
					session.setAttribute("code", dbVO.getCode());
					session.setAttribute("id", dbVO.getId());
					session.setAttribute("dep_group", dbVO.getDep_group());
					session.setAttribute("dep_id", dbVO.getDep_id());
					session.setAttribute("pos_group", dbVO.getPos_group());
					session.setAttribute("login", now);
					session.setAttribute("pos_id", dbVO.getPos_id());
					session.setAttribute("name", dbVO.getName());
					session.setAttribute("auth", dbVO.getAuth());
					logger.debug(dbVO.getId());
					logger.debug(dbVO.getPw());
					logger.debug(dbVO.getName());
					logger.debug(session.getAttribute("id").toString());
					return "redirect:/";
					
				} else { // 비밀번호 불일치
					return "redirect:/";
				}
			
			}
			return "redirect:/";
		}
		
		@GetMapping (value = "/logout")
		public String logoutGET(HttpSession session) throws Exception {
			logger.info("cc : logoutGET() 호출");
			session.invalidate();
			return "redirect:/";
		}
		
		@GetMapping ("/confirm")
		public void resultConfirm(@ModelAttribute("title") String title, @ModelAttribute("result") String result, Model model) throws Exception{
			model.addAttribute("title", title);
			model.addAttribute("result", result);
		}
		
		@GetMapping ("/error")
		public void errorConfirm(@ModelAttribute("title") String title, @ModelAttribute("result") String result, Model model) throws Exception {
			model.addAttribute("title", title);
			model.addAttribute("result", result);
		}
}
