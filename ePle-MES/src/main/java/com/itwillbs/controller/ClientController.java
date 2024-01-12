package com.itwillbs.controller;

import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.MAPDVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.service.ClientService;

/** 거래처 관리 컨트롤러 **/

@Controller
@RequestMapping("/client")
public class ClientController {

    private static final Logger logger = LoggerFactory.getLogger(ClientController.class);

    @Inject
    private ClientService cService;

    // http://localhost:8088/client/clientAll

    // 거래처 수정 - GET
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public void updateGET(@RequestParam("code") String code, Model model) throws Exception {
        System.out.println("code: " + code); // 코드 값 확인용
        ClientVO cvo = cService.getClient(code);
        System.out.println(cvo);
        model.addAttribute("cvo", cvo);
    }

    // 거래처 수정 - POST
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updatePOST(ClientVO cvo, RedirectAttributes rttr) throws Exception {
    	
    	int result = cService.clientUpdate(cvo);
    	
		if(result == 1) {
			return "client/resultSuccess";
		}else {
			return "client/resultFailed";
		}
		
    }

    // 거래처 삭제 - GET, POST
    @GetMapping("/delete")
    public String clientDeleteGET(@RequestParam("code") String codes, Model model) throws Exception {
        // 품목 삭제 폼
        String[] codeArr = codes.split(",");
        List<ClientVO> cvo = cService.getInfo(codeArr);
        model.addAttribute("cvo", cvo);

        // JavaScript 변수 설정
        model.addAttribute("delCheckedCount", codeArr.length);
        model.addAttribute("array", Arrays.asList(codeArr));

        return "client/delete"; // 적절한 뷰 페이지로 이동
    }

    @PostMapping("/delete")
    public String clientDeletePOST(@RequestParam("code") String codes, RedirectAttributes rttr, Model model) throws Exception {
        // 거래처 삭제 액션
        String[] codeArr = codes.split(",");
        int result = cService.deleteClients(codeArr);

        if (result >= 1) {
            rttr.addFlashAttribute("title", "거래처 삭제 결과");
            rttr.addFlashAttribute("result", "거래처 항목이 삭제 되었습니다.");

            // JavaScript 변수 설정
            model.addAttribute("delCheckedCount", codeArr.length);
            model.addAttribute("array", Arrays.asList(codeArr));

            return "client/resultSuccess";
            
        } else {
            rttr.addFlashAttribute("title", "거래처 삭제 결과");
            rttr.addFlashAttribute("result", "오류가 발생했습니다!");

            return "client/resultFailed";
        }
    }

    // 거래처 추가 - GET, POST
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public void clientInsertGET() throws Exception { 
		
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String clientInsertPOST(ClientVO cvo, RedirectAttributes rttr) throws Exception {

		// 서비스 - DB에 글쓰기(insert) 동작 호출
		int result = cService.InsertClient(cvo);	
		
		if(result == 1) {
			return "client/resultSuccess";
		}else {
			return "client/resultFailed";
		}
	}

    // 전체 목록의 수를 가져오는 메서드
    @RequestMapping(value = "/totalClientCount", method = RequestMethod.GET)
    @ResponseBody
    public int getTotalClientCount() throws Exception {
        return cService.totalClientCount();
    }
    
    // 거래처 검색 - GET
    
	// 거래처 상세 - GET, POST
	@RequestMapping(value = "/clientInfo", method = RequestMethod.GET)
	public void clientInfoGET(@RequestParam("code") String code, Model model) throws Exception {
		ClientVO infoClient = cService.infoClient(code);
		model.addAttribute("infoClient", infoClient);
	}
	
	// 거래처 리스트, 페이징 처리
	@RequestMapping(value = "/clientAll", method = RequestMethod.GET)
	public String listPageGET(Model model, PageVO vo,
								String result,
								HttpSession session,
								Criteria cri) throws Exception {

		session.setAttribute("viewcntCheck", true);
		vo.setCri(cri);
		vo.setTotalCount(cService.totalClientCount());
		List<ClientVO> clientList = cService.clientListPage(vo);
		
		logger.debug(" 확인 :"+vo);
		
		logger.debug("PAGE + "+ vo);
		
		model.addAttribute("pageVO", vo);
		model.addAttribute("clientList", clientList);

		return "/client/clientAll";
	}
}