package com.itwillbs.controller;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.MAPDVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.service.ProductService;
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

/** 품목 관리 컨트롤러 **/

@Controller
@RequestMapping("/product")
public class ProductController {

    private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

    @Inject
    private ProductService pService;

    // http://localhost:8088/product/productAll
    
    // 품목 리스트 - GET
    @RequestMapping(value = "/productAll", method = RequestMethod.GET)
    public String listAllGET(Model model,
                             @ModelAttribute("result") String result,
                             HttpSession session) throws Exception {
        session.setAttribute("viewcntCheck", true);
        List<MAPDVO> productList = pService.productListAll();
        System.out.println(productList);
        model.addAttribute("productList", productList);
        return "/product/productAll";
    }

    // 품목 수정 - GET
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public void updateGET(@RequestParam("code") String code, Model model) throws Exception {
        MAPDVO mvo = pService.getProduct(code);
        model.addAttribute("mvo", mvo);
    }

    // 품목 수정 - POST
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updatePOST(MAPDVO mvo, RedirectAttributes rttr) throws Exception {
    	
    	int result = pService.productUpdate(mvo);
    	
		if(result == 1) {
			return "product/resultSuccess";
		}else {
			return "product/resultFailed";
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

	  // 품목 (출력/페이징/검색)
	  @RequestMapping(value = "/searchProduct" , method = RequestMethod.GET)
	  public void SearchMAPD(Model model, Criteria cri,
								  @RequestParam(value = "mapdCode",required = false) String mapdCode,
								  @RequestParam(value = "mapdName",required = false) String mapdName) throws Exception {
			
	  List<MAPDVO> mapdList = pService.SearchProduct(cri,mapdCode,mapdName);
			
	  PageVO pageVO = new PageVO(); 
			  
	  pageVO.setCri(cri);
	  pageVO.setTotalCount(pService.productListCount(mapdCode,mapdName));
	  
			  
	  model.addAttribute("pageVO", pageVO);
	  model.addAttribute("mapdList", mapdList);
			
	  }

    // 품목 추가 - GET, POST
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public void productInsertGET() throws Exception { 
		
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String productInsertPOST(MAPDVO mvo, RedirectAttributes rttr) throws Exception {

		// 서비스 - DB에 글쓰기(insert) 동작 호출
		int result = pService.InsertProduct(mvo);	

		if(result == 1) {
			return "product/resultSuccess";
		}else {
			return "product/resultFailed";
		}
	}
 
}
