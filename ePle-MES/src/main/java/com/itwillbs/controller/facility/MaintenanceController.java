package com.itwillbs.controller.facility;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.MaintenanceSearchVO;
import com.itwillbs.domain.MaintenanceVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.service.facility.MaintenanceService;

/** FacilityController : 설비 보전 컨트롤러 **/

@Controller
@RequestMapping(value = "/facility/maintenance/*")
public class MaintenanceController {

	private static final Logger logger = LoggerFactory.getLogger(MaintenanceController.class);

	@Inject
	private MaintenanceService mService;

	// http://localhost:8088/facility/maintenance/list
	@GetMapping(value = "/list")
	public void maintenanceListGET(MaintenanceSearchVO searchVO, PageVO pageVO, Criteria cri, Model model)
			throws Exception {
		// 설비 보전 리스트
		pageVO.setCri(cri);
		searchVO.setComplete(false);
		pageVO.setSearch(searchVO);
		pageVO.getSearch().setIsajax(false);
		pageVO.setTotalCount(mService.getListCount(pageVO));	
		List<MaintenanceVO> vo = mService.getList(pageVO);
		if (vo == null)
			vo = new ArrayList<MaintenanceVO>();
		model.addAttribute("list", vo);
		model.addAttribute("pageVO", pageVO);
	}

	@GetMapping(value = "/insert")
	public void maintenanceInsertGET(Model model) throws Exception {
		
	}

	@PostMapping(value = "/insert")
	public String maintenanceInsertPOST(MaintenanceVO vo, RedirectAttributes rttr) throws Exception {
		// 설비 보전 등록 액션
		// 사후보전 / 예방보전 / 긴급보전
		// -> 다른 데이터베이스에서 진행(일상 보전은 결과만)
		String link = "";
		String recentCode = mService.getRecentCode(vo.getCode());
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyyMMdd");
		String now = dateformat.format(new Date());
		String code = vo.getCode();
		if(recentCode == null || recentCode.equals("")) {
			// 코드 새로 생성
			code += now;
			code += "001";
		}
		else {
			// 날짜가 오늘일 경우엔 + 1 해주기
			String fDate = recentCode.substring(2, recentCode.length()-3);
			if(now.equals(fDate)) {				
				String fCount = "" + (Integer.parseInt(recentCode.substring(recentCode.length()-3)) + 1);
				while(fCount.length() < 3) fCount = "0" + fCount;
				code += fDate + fCount;
			}
			else {
				code += now + "001";
			}
		}
		vo.setCode(code);
		int result = mService.insert(vo);
		if (result == 1) {
			link = "redirect:/confirm";
			rttr.addFlashAttribute("title", "보전 등록 결과");
			rttr.addFlashAttribute("result", "보전 등록이 완료되었습니다.");
		} else {
			link = "redirect:/error";
			rttr.addFlashAttribute("title", "보전 등록 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
		}
		return link;
	}

	@GetMapping(value = "/update")
	public void maintenanceUpdateGET(String code, Model model) throws Exception {
		// 설비 보전 수정 폼
		model.addAttribute("info", mService.getDetail(code));
	}

	@PostMapping(value = "/update")
	public String maintenanceUpdatePOST(MaintenanceVO vo, RedirectAttributes rttr) throws Exception {
		// 설비 보전 수정 액션
		String link = "";
		int result = mService.updateMT(vo);
		if (result >= 1) {
			link = "redirect:/confirm";
			rttr.addFlashAttribute("title", "설비 수정 결과");
			rttr.addFlashAttribute("result", "보전 수정이 완료되었습니다.");
		} else {
			link = "redirect:/error";
			rttr.addFlashAttribute("title", "설비 수정 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
		}
		return link;
	}

	@GetMapping(value = "/delete")
	public void maintenanceDeleteGET() throws Exception {
		// 설비 보전 삭제 폼
	}

	@PostMapping(value = "/delete")
	public String maintenanceDeletePOST(String[] codeList, RedirectAttributes rttr) throws Exception {
		// 설비 보전 삭제 액션
		String link = "";
		int result = mService.delete(codeList);
		if (result >= 1) {
			link = "redirect:/confirm";
			rttr.addFlashAttribute("title", "설비 삭제 결과");
			rttr.addFlashAttribute("result", "보전 삭제가 완료되었습니다.");
		} else {
			link = "redirect:/error";
			rttr.addFlashAttribute("title", "설비 삭제 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
		}
		return link;
	}

	@GetMapping("/detail")
	public void maintenanceDetail(String code, Model model) throws Exception {
		// 보전 상세 정보
		model.addAttribute("info", mService.getDetail(code));
	}

	@GetMapping(value = "/result/list")
	public void maintenanceResultListGET(MaintenanceSearchVO searchVO, PageVO pageVO, Criteria cri, Model model) throws Exception {
		pageVO.setCri(cri);
		searchVO.setComplete(true);
		pageVO.setSearch(searchVO);
		pageVO.getSearch().setIsajax(false);
		pageVO.setTotalCount(mService.getListCount(pageVO));	
		List<MaintenanceVO> vo = mService.getList(pageVO);
		if (vo == null)
			vo = new ArrayList<MaintenanceVO>();
		model.addAttribute("list", vo);
		model.addAttribute("pageVO", pageVO);
	}

	@GetMapping(value = "/result/Insert")
	public void maintenanceResultInsertGET(String code, Model model) throws Exception {
		// 설비 보전 결과 폼
		model.addAttribute("info", mService.getDetail(code));
	}

	@PostMapping(value = "/result/Insert")
	public String maintenanceResultInsertPOST(MaintenanceVO vo, RedirectAttributes rttr) throws Exception {
		// 설비 보전 결과 액션
		String link = "";
		int result = mService.updateResult(vo);
		if (result == 1) {
			link = "redirect:/confirm";
			rttr.addFlashAttribute("title", "보전 결과 등록");
			rttr.addFlashAttribute("result", "보전 결과 등록이 완료되었습니다.");
		} else {
			link = "redirect:/error";
			rttr.addFlashAttribute("title", "보전 결과 등록");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
		}
		return link;
	}
}
