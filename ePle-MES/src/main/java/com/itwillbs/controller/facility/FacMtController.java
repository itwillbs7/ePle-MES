package com.itwillbs.controller.facility;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.FacMtVO;
import com.itwillbs.service.facility.FacilityService;
import com.itwillbs.service.facility.MaintenanceService;

/** FacilityController : 설비 보전 컨트롤러 **/

@Controller
@RequestMapping(value = "/facility/mt/*")
public class FacMtController {

	private static final Logger logger = LoggerFactory.getLogger(FacMtController.class);

	@Inject
	private MaintenanceService mService;
	@Inject
	private FacilityService fService;
	
	@GetMapping("/main")
	public void main(Model model) throws Exception{
		// 보전 메인 페이지
		// 직원의 경우 자신이 등록한 보전 조회
		// 보전 전문가의 경우 메인페이지가 아닌 status로 이동 시키기
		model.addAttribute("role", "emp");
	}

	// 설비 보전 전문가
	@GetMapping("/status")
	public void status() throws Exception{
		// 설비 정보 코드, 이름, 모델, 최근 보전 정보, 평균 보전 간격(사후 보전 제외!)
		
	}
	
	@GetMapping("/detail")
	public void detail(String code) throws Exception{
		// 설비 정보 및 보전 정보 보여주기
	
	}
	
	@GetMapping("/routine")
	public void routine(String code) throws Exception{
		// 일상 보전, 예방 보전 등록 폼
	
	}
	
	@PostMapping("/routine")
	public void routine(FacMtVO vo) throws Exception{
		// 일상 보전, 예방 보전 등록
	
	}
	
	@GetMapping("/result")
	public void result(String code) throws Exception{
		// 보전 결과 등록(사후 보전이 있을 때)
	
	}
	
	@PostMapping("/result")
	public void result(FacMtVO vo) throws Exception{
		// 보전 결과 등록 처리
	
	}
	// 설비 보전 전문가
	
	// 직원
	@GetMapping("/list")
	public void list() throws Exception{
		// 자신이 등록한 보전 리스트 출력, 매니저 정보 표시
		// 보전 완료 및 미완료 표시!
	
	}
	
	@GetMapping("/insert")
	public void insert() throws Exception{
		// 보전 추가(사후보전) 폼
	
	}
	
	@PostMapping("/insert")
	public String insert(FacMtVO vo) throws Exception{
		// 보전 추가 진행
		String link = "";
		
		return link;
	}
	
	@GetMapping("/update")
	public void update(String code) throws Exception{
		// 자신이 등록한 보전 수정
	}
	
	@PostMapping("/update")
	public String update(FacMtVO vo) throws Exception{
		// 자신이 등록한 보전 수정 진행
		String link = "";
		
		return link;
	}
	
	@GetMapping("/delete")
	public void delete(String code, Model model) throws Exception{
		// 자신이 등록한 보전 삭제 폼
	}
	
	@PostMapping("/delete")
	public String delete(String code) throws Exception{
		// 자신이 등록한 보전 삭제 진행
		String link = "";
		
		return link;
	}
	// 직원
}
