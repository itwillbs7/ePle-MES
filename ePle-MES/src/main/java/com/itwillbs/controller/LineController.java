package com.itwillbs.controller;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.LineVO;
import com.itwillbs.domain.MAPDVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.service.LineService;

import java.util.Arrays;
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
@RequestMapping("/line")
public class LineController {

    private static final Logger logger = LoggerFactory.getLogger(LineController.class);

    @Inject
    private LineService lService;

    // http://localhost:8088/line/lineAll

    // 라인 수정 - GET
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public void updateGET(@RequestParam("code") String code, Model model) throws Exception {
    	System.out.println("code: " + code); // 코드 값 확인용
    	LineVO lvo = lService.getLine(code);
    	System.out.println(lvo);
        model.addAttribute("lvo", lvo);
    }

    // 라인 수정 - POST
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updatePOST(LineVO lvo, RedirectAttributes rttr) throws Exception {
        
    	int result = lService.lineUpdate(lvo);
    	
		if(result == 1) {
			return "line/resultSuccess";
		}else {
			return "line/resultFailed";
		}
    }

    // 라인 삭제 - GET, POST
    @GetMapping("/delete")
    public String lineDeleteGET(@RequestParam("code") String codes, Model model) throws Exception {
        // 품목 삭제 폼
        String[] codeArr = codes.split(",");
        List<LineVO> lvo = lService.getInfo(codeArr);
        model.addAttribute("lvo", lvo);

        // JavaScript 변수 설정
        model.addAttribute("delCheckedCount", codeArr.length);
        model.addAttribute("array", Arrays.asList(codeArr));

        return "line/delete"; // 적절한 뷰 페이지로 이동
    }

    @PostMapping("/delete")
    public String lineDeletePOST(@RequestParam("code") String codes, RedirectAttributes rttr, Model model) throws Exception {
        // 라인 삭제 액션
        String[] codeArr = codes.split(",");
        int result = lService.deleteLines(codeArr);

        if (result >= 1) {
          rttr.addFlashAttribute("title", "라인 삭제 결과");
          rttr.addFlashAttribute("result", "라인이 삭제 되었습니다.");
        
          // JavaScript 변수 설정
          model.addAttribute("delCheckedCount", codeArr.length);
          model.addAttribute("array", Arrays.asList(codeArr));
          
          return "line/resultSuccess";
          
        } else {
          rttr.addFlashAttribute("title", "라인 삭제 결과");
          rttr.addFlashAttribute("result", "오류가 발생했습니다!");
          
          return "line/resultFailed";
        }
    }

    // 라인 추가 - GET, POST
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public void lineInsertGET() throws Exception { 
		
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String lineInsertPOST(LineVO lvo, RedirectAttributes rttr) throws Exception {

		// 서비스 - DB에 글쓰기(insert) 동작 호출
		int result = lService.InsertLine(lvo);
		
		if(result == 1) {
			return "line/resultSuccess";
		}else {
			return "line/resultFailed";
		}
	}

    // 전체 목록의 수를 가져오는 메서드
    @RequestMapping(value = "/totalLineCount", method = RequestMethod.GET)
    @ResponseBody
    public int getTotalLineCount() throws Exception {
        return lService.totalLineCount();
    }
    
	// 라인 상세 - GET, POST
	@RequestMapping(value = "/lineInfo", method = RequestMethod.GET)
	public void lineInfoGET(@RequestParam("code") String code, Model model) throws Exception {
		LineVO infoLine = lService.infoLine(code);
		model.addAttribute("infoLine", infoLine);
	}
	
	// 라인 리스트, 페이징 처리
	@RequestMapping(value = "/lineAll", method = RequestMethod.GET)
	public String listPageGET(Model model, PageVO vo,
								String result,
								HttpSession session,
								Criteria cri) throws Exception {

		session.setAttribute("viewcntCheck", true);
		vo.setCri(cri);
		vo.setTotalCount(lService.totalLineCount());
		List<LineVO> lineList = lService.lineListPage(vo);
		
		logger.debug(" 확인 :"+vo);
		
		logger.debug("PAGE + "+ vo);
		
		model.addAttribute("pageVO", vo);
		model.addAttribute("lineList", lineList);

		return "/line/lineAll";
	}
}
