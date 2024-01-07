package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
@RequestMapping("/client/*")
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
        model.addAttribute("clientList", clientList);
        return "/client/clientAll";
    }

    // 거래처 수정 - GET
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String updateGET(@RequestParam(value = "code", defaultValue = "") String code, 
                            @RequestParam(value = "checked", defaultValue = "false") boolean checked,
                            RedirectAttributes rttr) throws Exception {
        if (checked) {
            // 체크박스가 선택된 경우
            ClientVO resultVO = cService.getClient(code);
            return "client/update";
        } else {
            // 체크박스가 선택되지 않은 경우
            rttr.addFlashAttribute("result", "체크박스를 선택해주세요.");
            // 수정할 항목이 선택되지 않았으므로 직접 productAll 페이지로 리다이렉트
            return "redirect:/client/clientAll";
        }
    }

    // 거래처 수정 - POST
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updatePOST(@ModelAttribute ClientVO cvo) throws Exception {
        cService.clientModify(cvo);
        return "redirect:/client/clientAll"; // 수정 후 목록 페이지로 이동
    }

    // 거래처 삭제 - GET
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String removeGET(@RequestParam("code") String code, RedirectAttributes rttr) throws Exception {
        cService.clientRemove(code);
        return "redirect:/client/clientAll"; // 삭제 후 목록 페이지로 이동
    }

    // 거래처 삭제 - POST
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String removePOST(@ModelAttribute("code") String code, RedirectAttributes rttr) throws Exception {
        cService.clientRemove(code);
        return "redirect:/client/clientAll"; // 삭제 후 목록 페이지로 이동
    }

    // 페이징 처리 - 거래처 리스트 - GET
    @RequestMapping(value = "/clientPage", method = RequestMethod.GET)
    public String listPageGET(Model model,
                              @ModelAttribute("result") String result,
                              HttpSession session,
                              Criteria cri) throws Exception {
        session.setAttribute("viewcntCheck", true);

        List<ClientVO> clientList = cService.clientListPage(cri);

        PageVO pageVO = new PageVO();
        pageVO.setCri(cri);
        pageVO.setTotalCount(cService.totalClientCount());
        model.addAttribute("pageVO", pageVO);
        model.addAttribute("clientList", clientList);
        return "/client/clientAll";
    }

    // 추가 - GET
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addGET() {
        return "client/add";
    }

    // 추가 - POST
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addPOST(@ModelAttribute ClientVO cvo, RedirectAttributes rttr) throws Exception {
        cService.clientWrite(cvo);
        return "redirect:/client/clientAll"; // 추가 후 목록 페이지로 이동
    }

    // 전체 목록의 수를 가져오는 메서드
    @RequestMapping(value = "/totalClientCount", method = RequestMethod.GET)
    @ResponseBody
    public int getTotalClientCount() throws Exception {
        return cService.totalClientCount();
    }
}