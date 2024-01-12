package com.itwillbs.controller;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.MAPDVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.service.RequirementService;
import com.production.domain.BOMVO;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/** 소요량 관리 컨트롤러 **/

@Controller
@RequestMapping("/requirement/*")
public class RequirementController {
    
	private static final Logger logger = LoggerFactory.getLogger(RequirementController.class);

    @Inject
    private RequirementService rService;

    // http://localhost:8088/requirement/requirementAll
    
    // 소요량 리스트 - GET
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
        BOMVO mvo = rService.getRequirement(code);
        model.addAttribute("mvo", mvo);
    }

    // 소요량 수정 - POST
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updatePOST(MAPDVO mvo, RedirectAttributes rttr) throws Exception {
    	rService.requirementUpdate(mvo);
        return "redirect:/requirement/requirementAll"; // 수정 후 목록 페이지로 이동
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

        String link = "";
        if (result >= 1) {
          link = "redirect:/confirm";
          rttr.addFlashAttribute("title", "품목 삭제 결과");
          rttr.addFlashAttribute("result", "품목이 삭제 되었습니다.");
        } else {
          link = "redirect:/error";
          rttr.addFlashAttribute("title", "품목 삭제 결과");
          rttr.addFlashAttribute("result", "오류가 발생했습니다!");
        }

        // JavaScript 변수 설정
        model.addAttribute("delCheckedCount", codeArr.length);
        model.addAttribute("array", Arrays.asList(codeArr));

        // 자동 새로고침을 위해 부모 페이지 URL에 파라미터 추가
        link += "?refresh=true";

        return link;
    }


    // 페이징 처리 - 게시판 리스트 - GET 
    // http://localhost:8088/requirement/requirementAll
    @RequestMapping(value = "/requirementAll", method = RequestMethod.GET)
    public void listPageGET(Model model,
                              @ModelAttribute("result") String result,
                              HttpSession session,
                              Criteria cri) throws Exception {
        session.setAttribute("viewcntCheck", true);

        List<BOMVO> requirementList = rService.requirementListPage(cri);

        PageVO pageVO = new PageVO();
        pageVO.setCri(cri);
        pageVO.setTotalCount(rService.totalRequirementCount());
        model.addAttribute("pageVO", pageVO);
        model.addAttribute("requirementList", requirementList);
    }

    // 소요량 추가 - GET, POST
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public void requirementInsertGET() throws Exception { 
		
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String requirementInsertPOST(BOMVO mvo, RedirectAttributes rttr) throws Exception {
		
		// 서비스 - DB에 글쓰기(insert) 동작 호출
		int result = rService.InsertRequirement(mvo);	
		 String link = "";
	        if (result >= 1) {
	          link = "redirect:/confirm";
	          rttr.addFlashAttribute("title", "소요량 등록 결과");
	          rttr.addFlashAttribute("result", "소요량 등록 되었습니다.");
	        } else {
	          link = "redirect:/error";
	          rttr.addFlashAttribute("title", "소요량 등록 결과");
	          rttr.addFlashAttribute("result", "오류가 발생했습니다!");
	        }
		return link;
	}

    // 전체 목록의 수를 가져오는 메서드
    @RequestMapping(value = "/totalRequirementCount", method = RequestMethod.GET)
    @ResponseBody
    public int getTotalRequirementCount() throws Exception {
        return rService.totalRequirementCount();
    }
    
    // MAPD 완제품 찾기
    @RequestMapping(value = "/searchMAPD", method = RequestMethod.GET)
    public void getMAPDListGET(Model model)throws Exception{
    	logger.debug("팝업창 열면 리스트 가져오기");
    	List<MAPDVO> list = new ArrayList<MAPDVO>();
    	list = rService.getMAPDListGET();
    	model.addAttribute("list", list);
    }
    
    // MAPD 완제품 찾기(검색)
    @RequestMapping(value = "/searchMAPD", method = RequestMethod.POST)
    public void getMAPDListPOST(@RequestParam("mapdName") String mapdName,
    							Model model)throws Exception{
    	logger.debug("팝업창 열면 리스트 가져오기");
    	// 이름으로 검색
    	List<MAPDVO> list = new ArrayList<MAPDVO>();
    	list = rService.getMAPDListGET(mapdName);
    	model.addAttribute("list", list);
    }
    
    // material 찾기
    @RequestMapping(value = "/searchMaterial", method = RequestMethod.GET)
    public void getMaterialListGET(Model model)throws Exception{
    	logger.debug("팝업창 열면 리스트 가져오기");
    	List<MAPDVO> list = new ArrayList<MAPDVO>();
    	list = rService.getMaterailListGET();
    	model.addAttribute("list", list);
    }
    
    // material 찾기(검색)
    @RequestMapping(value = "/searchMaterial", method = RequestMethod.POST)
    public void getMaterialPOST(@RequestParam("materialName") String materialName,
    		Model model)throws Exception{
    	logger.debug("팝업창 열면 리스트 가져오기");
    	// 이름으로 검색
    	List<MAPDVO> list = new ArrayList<MAPDVO>();
    	list = rService.getMaterailListGET(materialName);
    	model.addAttribute("list", list);
    }
    
    // 소요량 검색 - GET
 
}
