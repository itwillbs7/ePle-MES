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
    
    // 거래처 리스트 - GET
    @RequestMapping(value = "/clientAll", method = RequestMethod.GET)
    public String listAllGET(Model model,
                             @ModelAttribute("result") String result,
                             HttpSession session) throws Exception {
        session.setAttribute("viewcntCheck", true);
        List<ClientVO> clientList = cService.clientListAll();
        System.out.println(clientList);
        model.addAttribute("clientList", clientList);
        return "/client/clientAll";
    }

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
    public String updatePOST(MAPDVO mvo, RedirectAttributes rttr) throws Exception {
    	pService.productUpdate(mvo);
        return "redirect:/product/productAll"; // 수정 후 목록 페이지로 이동
    }

    // 거래처 삭제 - GET, POST
    @GetMapping("/delete")
    public String productDeleteGET(@RequestParam("code") String codes, Model model) throws Exception {
        // 품목 삭제 폼
        String[] codeArr = codes.split(",");
        List<MAPDVO> mvo = pService.getInfo(codeArr);
        model.addAttribute("mvo", mvo);

        // JavaScript 변수 설정
        model.addAttribute("delCheckedCount", codeArr.length);
        model.addAttribute("array", Arrays.asList(codeArr));

        return "product/delete"; // 적절한 뷰 페이지로 이동
    }

    @PostMapping("/delete")
    public String productDeletePOST(@RequestParam("code") String codes, RedirectAttributes rttr, Model model) throws Exception {
        // 품목 삭제 액션
        String[] codeArr = codes.split(",");
        int result = pService.deleteProducts(codeArr);

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


    // 페이징 처리 - 거래처 리스트 - GET
    @RequestMapping(value = "/productPage", method = RequestMethod.GET)
    public String listPageGET(Model model,
                              @ModelAttribute("result") String result,
                              HttpSession session,
                              Criteria cri) throws Exception {
        session.setAttribute("viewcntCheck", true);

        List<MAPDVO> productList = pService.productListPage(cri);

        PageVO pageVO = new PageVO();
        pageVO.setCri(cri);
        pageVO.setTotalCount(pService.totalProductCount());
        model.addAttribute("pageVO", pageVO);
        model.addAttribute("productList", productList);
        return "/product/productAll";
    }

    // 거래처 추가 - GET, POST
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public void productInsertGET() throws Exception { 
		
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String productInsertPOST(MAPDVO mvo, RedirectAttributes rttr) throws Exception {

		// 서비스 - DB에 글쓰기(insert) 동작 호출
		pService.InsertProduct(mvo);	
		return "redirect:/product/productAll";
	}

    // 전체 목록의 수를 가져오는 메서드
    @RequestMapping(value = "/totalProductCount", method = RequestMethod.GET)
    @ResponseBody
    public int getTotalProductCount() throws Exception {
        return pService.totalProductCount();
    }
    
    // 거래처 검색 - GET
}