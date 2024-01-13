package com.itwillbs.controller.facility;

import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.MAPDVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.service.ProductService;

@Controller
@RequestMapping(value = "/facility/mapd/*")
public class FacilityMapdController {
	@Inject
    private ProductService pService;

    // http://localhost:8088/product/productAll

    // 품목 수정 - GET
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public void updateGET(@RequestParam("code") String code, Model model) throws Exception {
        MAPDVO mvo = pService.getProduct(code);
        model.addAttribute("mvo", mvo);
        model.addAttribute("FACPRO", pService.getCommonList("FACPRO"));
		model.addAttribute("FACNPR", pService.getCommonList("FACNPR"));
		model.addAttribute("FACETC", pService.getCommonList("FACETC"));
    }

    // 품목 수정 - POST
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updatePOST(HttpSession session, MAPDVO mvo, RedirectAttributes rttr) throws Exception {
    	mvo.setOutprice(mvo.getInprice());
		String id = (String)session.getAttribute("code");
		mvo.setUpdate_emp(id); // emp 사용하는 부분에 붙여 넣기
    	int result = pService.productUpdate(mvo);
    	
    	if(result == 1) {
			rttr.addFlashAttribute("title", "정보 수정 결과");
			rttr.addFlashAttribute("result", "정보 수정이 완료되었습니다.");
			return "redirect:/confirm";
		}else {
			rttr.addFlashAttribute("title", "정보 수정 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
			return "redirect:/error";
		}
    }

    // 품목 삭제 - GET, POST
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

        if(result == 1) {
			rttr.addFlashAttribute("title", "정보 삭제 결과");
			rttr.addFlashAttribute("result", "정보 삭제가 완료되었습니다.");
			return "redirect:/confirm";
		}else {
			rttr.addFlashAttribute("title", "정보 삭제 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
			return "redirect:/error";
		}
    }

    // 품목 추가 - GET, POST
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public void productInsertGET(Model model) throws Exception { 
		model.addAttribute("FACPRO", pService.getCommonList("FACPRO"));
		model.addAttribute("FACNPR", pService.getCommonList("FACNPR"));
		model.addAttribute("FACETC", pService.getCommonList("FACETC"));
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String productInsertPOST(HttpSession session,MAPDVO mvo, RedirectAttributes rttr) throws Exception {
		mvo.setOutprice(mvo.getInprice());
		// 서비스 - DB에 글쓰기(insert) 동작 호출
		String id = (String)session.getAttribute("code");
		mvo.setReg_emp(id); // emp 사용하는 부분에 붙여 넣기
		String recentCode = pService.getRecentCode();
		String a = "" + (Integer.parseInt(recentCode.substring(1)) + 1);
		while(a.length() < 3) a = "0" + a;
		mvo.setCode("F" + a);
		int result = pService.InsertProduct(mvo);
		
		if(result == 1) {
			rttr.addFlashAttribute("title", "정보 추가 결과");
			rttr.addFlashAttribute("result", "정보 추가가 완료되었습니다.");
			return "redirect:/confirm";
		}else {
			rttr.addFlashAttribute("title", "정보 추가 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
			return "redirect:/error";
		}
	}
	
	// 품목 상세 - GET, POST
	@RequestMapping(value = "/productInfo", method = RequestMethod.GET)
	public void productInfoGET(@RequestParam("code") String code, Model model) throws Exception {
		MAPDVO infoProduct = pService.infoProduct(code);
		model.addAttribute("infoProduct", infoProduct);
	}
	
	// 품목 리스트, 페이징 처리 및 검색
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listPageGET(Model model, PageVO vo,
	                          String result,
	                          HttpSession session,
	                          Criteria cri,
	                          @RequestParam(value = "searchKeyword", required = false, defaultValue = "") String searchKeyword) throws Exception {

	    // 세션에 페이징 처리 확인 변수 설정
	    session.setAttribute("viewcntCheck", true);
	    vo.setMapd("FAC");
	    // 페이징 처리에 필요한 정보 설정
	    vo.setCri(cri);
	    vo.setTotalCount(pService.totalProductCount(vo));

	    // 검색어가 있는 경우
	    if (!searchKeyword.isEmpty()) {
	        vo.getSearch().setSearchKeyword(searchKeyword);
	    }
	    
	    List<MAPDVO> productList = pService.productListPage(vo);

	    // 모델에 페이징 정보, 품목 리스트, 검색어 전달
	    model.addAttribute("pageVO", vo);
	    model.addAttribute("productList", productList);
	    model.addAttribute("keyword", searchKeyword);
	}
}