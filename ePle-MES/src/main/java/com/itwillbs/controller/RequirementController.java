package com.itwillbs.controller;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.MAPDVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.service.RequirementService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import java.util.Arrays;
import java.util.List;

/** 소요량 관리 컨트롤러 **/

@Controller
@RequestMapping("/requirement")
public class RequirementController {
    
	private static final Logger logger = LoggerFactory.getLogger(RequirementController.class);

    @Inject
    private RequirementService rService;

    // http://localhost:8088/requirement/requirementAll
    
    // 소요량 리스트 - GET
    @RequestMapping(value = "/requirementAll", method = RequestMethod.GET)
    public String listAllGET(Model model,
                             @ModelAttribute("result") String result,
                             HttpSession session) throws Exception {
        session.setAttribute("viewcntCheck", true);
        List<MAPDVO> requirementList = rService.requirementListAll();
        System.out.println(requirementList);
        model.addAttribute("requirementList", requirementList);
        return "/requirement/requirementAll";
    }

    // 소요량 수정 - GET
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public void updateGET(@RequestParam("code") String code, Model model) throws Exception {
        MAPDVO mvo = rService.getRequirement(code);
        model.addAttribute("mvo", mvo);
    }

    // 소요량 수정 - POST
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updatePOST(MAPDVO mvo, RedirectAttributes rttr) throws Exception {
    	
    	int result = rService.requirementUpdate(mvo);
    	
		if(result == 1) {
			return "requirement/resultSuccess";
		}else {
			return "requirement/resultFailed";
		}
    }

    // 소요량 삭제 - GET, POST
    @GetMapping("/delete")
    public String requirementDeleteGET(@RequestParam("code") String codes, Model model) throws Exception {
        // 품목 삭제 폼
        String[] codeArr = codes.split(",");
        List<MAPDVO> mvo = rService.getInfo(codeArr);
        model.addAttribute("mvo", mvo);

        // JavaScript 변수 설정
        model.addAttribute("delCheckedCount", codeArr.length);
        model.addAttribute("array", Arrays.asList(codeArr));

        return "requirement/delete"; // 적절한 뷰 페이지로 이동
    }

    @PostMapping("/delete")
    public String requirementDeletePOST(@RequestParam("code") String codes, RedirectAttributes rttr, Model model) throws Exception {
        // 소요량 삭제 액션
        String[] codeArr = codes.split(",");
        int result = rService.deleteRequirements(codeArr);

        if (result >= 1) {
          rttr.addFlashAttribute("title", "품목 삭제 결과");
          rttr.addFlashAttribute("result", "품목이 삭제 되었습니다.");
        
          // JavaScript 변수 설정
          model.addAttribute("delCheckedCount", codeArr.length);
          model.addAttribute("array", Arrays.asList(codeArr));
          
          return "product/resultSuccess";
          
        } else {

          rttr.addFlashAttribute("title", "품목 삭제 결과");
          rttr.addFlashAttribute("result", "오류가 발생했습니다!");
          
          return "product/resultFailed";
        }
    }

    // 페이징 처리 - 게시판 리스트 - GET
    @RequestMapping(value = "/requirementPage", method = RequestMethod.GET)
    public String listPageGET(Model model,
                              @ModelAttribute("result") String result,
                              HttpSession session,
                              Criteria cri) throws Exception {
        session.setAttribute("viewcntCheck", true);

        List<MAPDVO> requirementList = rService.requirementListPage(cri);

        PageVO pageVO = new PageVO();
        pageVO.setCri(cri);
        pageVO.setTotalCount(rService.totalRequirementCount());
        model.addAttribute("pageVO", pageVO);
        model.addAttribute("requirementList", requirementList);
        return "/requirement/requirementAll";
    }

    // 소요량 추가 - GET, POST
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public void requirementInsertGET() throws Exception { 
		
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String requirementInsertPOST(MAPDVO mvo, RedirectAttributes rttr) throws Exception {

		// 서비스 - DB에 글쓰기(insert) 동작 호출
		int result = rService.InsertRequirement(mvo);	
		
		if(result == 1) {
			return "product/resultSuccess";
		}else {
			return "product/resultFailed";
		}
	}

    // 전체 목록의 수를 가져오는 메서드
    @RequestMapping(value = "/totalRequirementCount", method = RequestMethod.GET)
    @ResponseBody
    public int getTotalRequirementCount() throws Exception {
        return rService.totalRequirementCount();
    }
    
    // 소요량 검색 - GET
    
	// 소요량 상세 - GET, POST
	@RequestMapping(value = "/requirementInfo", method = RequestMethod.GET)
	public void requirementInfoGET(@RequestParam("code") String code, Model model) throws Exception {
		MAPDVO infoRequirement = rService.infoRequirement(code);
		model.addAttribute("infoRequirement", infoRequirement);
	}
 
}
