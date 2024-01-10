package com.itwillbs.controller;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.LineVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.service.LineService;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/** 라인 관리 컨트롤러 **/

@Controller
@RequestMapping(value = "/line")
public class LineController {

    private static final Logger logger = LoggerFactory.getLogger(LineController.class);

    @Inject
    private LineService lService;

    // http://localhost:8088/line/lineAll
      
    // 품목 리스트 - GET
    @RequestMapping(value = "/lineAll", method = RequestMethod.GET)
    public String listAllGET(Model model,
                             @ModelAttribute("result") String result,
                             HttpSession session) throws Exception {
        session.setAttribute("viewcntCheck", true);
        List<LineVO> lineList = lService.lineListAll();
        model.addAttribute("lineList", lineList);
        return "/line/lineAll";
    }

    // 품목 수정 - GET
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String updateGET(@RequestParam(value = "code", defaultValue = "") String code, 
                            @RequestParam(value = "checked", defaultValue = "false") boolean checked,
                            RedirectAttributes rttr) throws Exception {
        if (checked) {
            // 체크박스가 선택된 경우
        	LineVO resultVO = lService.getLine(code);
            return "line/update";
        } else {
            // 체크박스가 선택되지 않은 경우
            rttr.addFlashAttribute("result", "체크박스를 선택해주세요.");
            // 수정할 항목이 선택되지 않았으므로 직접 productAll 페이지로 리다이렉트
            return "redirect:/line/lineAll";
        }
    }

    // 품목 수정 - POST
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updatePOST(@ModelAttribute LineVO lvo) throws Exception {
    	lService.lineModify(lvo);
        return "redirect:/line/lineAll"; // 수정 후 목록 페이지로 이동
    }

    // 품목 삭제 - GET
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String removeGET(@RequestParam("code") String code, RedirectAttributes rttr) throws Exception {
    	lService.lineRemove(code);
        return "redirect:/line/lineAll"; // 삭제 후 목록 페이지로 이동
    }

    // 품목 삭제 - POST
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String removePOST(@ModelAttribute("code") String code, RedirectAttributes rttr) throws Exception {
    	lService.lineRemove(code);
        return "redirect:/line/lineAll"; // 삭제 후 목록 페이지로 이동
    }

    // 페이징 처리 - 게시판 리스트 - GET
    @RequestMapping(value = "/linePage", method = RequestMethod.GET)
    public String listPageGET(Model model,
                              @ModelAttribute("result") String result,
                              HttpSession session,
                              Criteria cri) throws Exception {
        session.setAttribute("viewcntCheck", true);

        List<LineVO> lineList = lService.lineListPage(cri);

        PageVO pageVO = new PageVO();
        pageVO.setCri(cri);
        pageVO.setTotalCount(lService.totalLineCount());
        model.addAttribute("pageVO", pageVO);
        model.addAttribute("lineList", lineList);
        return "/line/lineAll";
    }

    // 추가 - GET
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addGET() {
        return "line/add";
    }

    // 추가 - POST
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addPOST(@ModelAttribute LineVO lvo, RedirectAttributes rttr) throws Exception {
    	lService.lineWrite(lvo);
        return "redirect:/line/productAll"; // 추가 후 목록 페이지로 이동
    }

    // 전체 목록의 수를 가져오는 메서드
    @RequestMapping(value = "/totalLineCount", method = RequestMethod.GET)
    @ResponseBody
    public int getTotalProductCount() throws Exception {
        return lService.totalLineCount();
    }
}
