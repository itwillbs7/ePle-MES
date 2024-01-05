package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.PageVO;
import com.itwillbs.domain.RequestSearchVO;
import com.itwillbs.domain.RequestVO;
import com.itwillbs.domain.ReturnsVO;
import com.itwillbs.service.RequestService;
import com.itwillbs.service.ReturnsService;

/** ReturnsController : 반품 컨트롤러
 * 
 *  : request 를  Returns로 고쳐서 사용 필요
 *  
 **/
@Controller
@RequestMapping(value = "/returns/*")
public class ReturnsController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReturnsController.class);
	
	@Inject
	private ReturnsService rtService;
		
	
	// http://localhost:8088/returns/list
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void returnsListGET(Model model, 
							   HttpSession session, 
							   @ModelAttribute("result") String result, Criteria cri
							   ) throws Exception { //5-1
		// 수주 목록 return
		logger.debug("returnsListGET -> DB에서 목록 가져오기(페이징 처리하기)");

		List<ReturnsVO> returnsList = rtService.returnsListpage(cri);
		
		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(rtService.getTotal()); // 디비에서 직접 실행결과 가져오기
		
		model.addAttribute("List", returnsList);
		model.addAttribute("pageVO", pageVO);
		

	}
	
	// http://localhost:8088/request/info
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public void returnsInfo(@RequestParam(value = "code") String code,Model model) throws Exception {// 수주개별정보 5-2
		logger.debug("returnsInfo -> DB에서 수주번호가 일치하는 데이터 열 가져오기");
		logger.debug("Controller - code "+code);
		
		RequestVO vo = rtService.getinfo(code);
		logger.debug("Controller - vo "+vo);
		

		
		model.addAttribute("vo",vo);

	}
	
	// http://localhost:8088/request/search
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	@ResponseBody
	public List<RequestVO> searchReturnsGET(RedirectAttributes rttr, @ModelAttribute("result") String result, 
											ReturnsVO vo) throws Exception { // 수주검색 5-3
		logger.debug("searchReturnsGET() -> 정보 받아서 DB에 조회하기");
		logger.debug("Controller - vo "+vo);
		// 전달받을 정보(수주상태 ,담당자코드, 업체코드
		
		List<ReturnsVO> ReturnsList= rtService.findReturnsList(vo);
		logger.debug("검색정보 : "+RequestList);
		
		rttr.addFlashAttribute("returnsList",RequestList);
		
		return RequestList;
	}
	
	
	

	// http://localhost:8088/request/add
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public void returnsInsertGET() throws Exception { 
		logger.debug("returnsInsertGET() -> 입력폼 팝업");
		// 수주 추가 폼 5-4
		
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String returnsInsertPOST(RequestVO vo, RedirectAttributes rttr) throws Exception {
		// 수주 추가 액션
		logger.debug("(^^)/insert 예정 정보 "+vo);
		
		rtService.dataInsertReturns(vo);
		
		rttr.addAttribute("result", "AddDone");
		
		return "redirect:/returns/list";
	}
	
	// -------- 수주등록 데이터 찾기 ---------
	
	@RequestMapping(value = "searchClient", method=RequestMethod.GET)
	public void searchClientGET(RequestVO vo, Model model, HttpSession session)throws Exception{
		logger.debug("controller : 거래사 정보 찾기");
		logger.debug("searchClientGET    실행");

		// 거래사 리스트 출력하기
		List<RequestVO> clientList = rtService.ClientList();
		logger.debug("clientList : "+clientList);
		model.addAttribute("List", clientList);

	}
	
	@RequestMapping(value = "searchClient", method=RequestMethod.POST)
	public List<RequestVO> searchClientPOST(@RequestParam("client_code") String client_code,
											@RequestParam("clientName") String clientName,Model model)throws Exception{
		logger.debug("controller : 거래사 정보 DB 검색결과 가져오기");
		logger.debug("searchClientPOST    실행");

		List<RequestVO> clientList = rtService.findClient(client_code,clientName);
//		model.addAttribute("List", clientList);
		logger.debug("가져온 List"+clientList);
		
		return clientList;
	}
	
	@RequestMapping(value = "searchManager" ,method = RequestMethod.GET)
	public void searchManagerGET(Model model, HttpSession session)throws Exception{
		logger.debug("controller : 담당자 정보 찾기");
		logger.debug("searchManagerGET    실행");
		
		List<RequestVO> managerList = rtService.ManagerList();
		model.addAttribute("List", managerList);

	}
	
	@RequestMapping(value = "searchManager" ,method = RequestMethod.POST)
	@ResponseBody
	public List<RequestVO> searchManagerPOST(@RequestParam("manager") String manager,
								  @RequestParam("managerName") String managerName, Model model)throws Exception{
		
		logger.debug("controller : 담당자 정보 DB 검색결과 가져오기");
		logger.debug("searchManagerPOST    실행");
		
		List<RequestVO> managerList = rtService.findManager(manager,managerName);
//		model.addAttribute("List", managerList);
		logger.debug("가져온 List"+managerList);
		
		return managerList;
		
	}
	
	@RequestMapping(value = "searchProduct",method = RequestMethod.GET)
	public void searchProductGET(Model model, HttpSession session)throws Exception{
		logger.debug("controller : 상품 정보 찾기");
		logger.debug("searchProductGET   실행");
		
		List<RequestVO> productList = rtService.ProductList();
		model.addAttribute("List", productList);
	}
	
	@RequestMapping(value = "searchProduct",method = RequestMethod.POST)
	@ResponseBody
	public List<RequestVO> searchProductPOST(@RequestParam("product") String product,
								  @RequestParam("productName") String productName, Model model)throws Exception{
		// 찾아와야하는것 : 품번, 품명, 재고, 단위, 단가
		logger.debug("controller : 상품 정보 DB 검색결과 가져오기 ");
		logger.debug("searchProductPOST   실행");
		
		List<RequestVO> productList = rtService.findProduct(product,productName); 
//		model.addAttribute("List", productList);
		logger.debug("가져온 List"+productList);
		return productList;
	}

	// -------- 수주등록 데이터 찾기 끝---------
	
	
	// http://localhost:8088/request/update
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void returnsUpdateGET(ReturnsVO vo, Model model) throws Exception{
		// 수주 수정 폼5-5
		// code 정보 받아서 해당하는 code 데이터 불러오기
		logger.debug("returnsUpdateGET(RequestVO vo) 폼 정보 받아서 그대로 토해내기");
		logger.debug("vo "+vo);
		model.addAttribute("List",vo);
		
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public void returnsUpdatePOST(RequestVO vo) throws Exception{
		// 수주 수정 액션
		logger.debug("returnsUpdatePOST() 전달받은 정보 DB 저장하기");
		logger.debug("vo "+vo);
		
		// 일단 임시 아이디값(실제로는 세션에서 값을 받아와야함)
		String id = "id";
		rtService.updateReturns(vo, id);

	}
	
	
	// http://localhost:8088/request/delete
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void returnsDeleteGET(@RequestParam("code") String codes, Model model ) throws Exception{
		// 수주 삭제 폼5-6
		// 전달정보 저장
		String[] code = codes.split(",");
		List<RequestVO> vo = rtService.getinfo(code);
		logger.debug("찾아온 삭제 정보 vo"+vo);
		model.addAttribute("List", vo);
		
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public void returnsDeletePOST(@RequestParam("code") String codes) throws Exception{
		// 수주 삭제 액션
		logger.debug("삭제가 될랑가 codes "+codes);
		String[] code = codes.split(",");
		rtService.deleteRequest(code);
	}
	
	

}