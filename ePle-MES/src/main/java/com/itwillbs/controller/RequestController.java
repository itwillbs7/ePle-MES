package com.itwillbs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.PageVO;
import com.itwillbs.domain.RequestVO;
import com.itwillbs.service.RequestService;

/** FacilityController : 설비 컨트롤러 **/

@Controller
@RequestMapping(value = "/request/*")
public class RequestController {
	
	private static final Logger logger = LoggerFactory.getLogger(RequestController.class);
	
	@Inject
	private RequestService rService;
		
	
	// http://localhost:8088/request/list
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void requestListGET(Model model, RequestVO vo,
							   HttpSession session, 
							   PageVO pageVO, Criteria cri
							   ) throws Exception { //5-1
		// 수주 목록 return
		logger.debug("requestListGET -> DB에서 목록 가져오기(페이징 처리하기)");
		
		pageVO.setCri(cri);
		pageVO.setTotalCount(rService.getTotal(vo)); // 디비에서 직접 실행결과 가져오기
		List<RequestVO> requestList = rService.requestListpage(vo,cri);
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		logger.debug("test"+vo.getClientName());
		paramMap.put("clientName", vo.getClientName());
		paramMap.put("productName", vo.getProductName());
		paramMap.put("managerName", vo.getManagerName());
		paramMap.put("statusList", vo.getStatusList());
		paramMap.put("startDate", vo.getStartDate());
		paramMap.put("endDate", vo.getEndDate());
		paramMap.put("startDead", vo.getStartDead());
		paramMap.put("endDead", vo.getEndDead());
		
		model.addAttribute("requestList",requestList);
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("paramMap", paramMap);
		

	}
	
	// http://localhost:8088/request/info
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public void requestInfo(@RequestParam(value = "code") String code,Model model) throws Exception {// 수주개별정보 5-2
		logger.debug("requestInfo -> DB에서 수주번호가 일치하는 데이터 열 가져오기");
		logger.debug("Controller - code "+code);
		
		RequestVO vo = rService.getinfo(code);
		logger.debug("Controller - vo "+vo);
		

		
		model.addAttribute("vo",vo);

	}
	

	// http://localhost:8088/request/add
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public void requestInsertGET() throws Exception { 
		logger.debug("requestInsertGET() -> 입력폼 팝업");
		// 수주 추가 폼 5-4
		
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String requestInsertPOST(HttpSession session,RequestVO vo, RedirectAttributes rttr) throws Exception {
		// 수주 추가 액션
		logger.debug("(^^)/insert 예정 정보 "+vo);
		String vocode=vo.getCode();
		// ex) 23ODMG1207 여기까지 검색해서 가장 최근 등록된 코드
		String recentCode = rService.getRecentCode(vocode);
						
				// ex ) 기존 코드 23ODMG1207BB1
				String code = vo.getCode();

				if(recentCode == null || recentCode.equals("")) {
					// 등록된 코드가 없는 경우
					// 코드 새로 생성
					code += "001";
				}else {
					// 마지막 3자리 숫자 추출
				    String lastFourNums = recentCode.substring(recentCode.length()-3);
				    // 숫자로 변환 후 1 증가
				    int increasedNum = Integer.parseInt(lastFourNums) + 1;
				    // 다시 문자열로 변환
				    String newLastFourNums = String.format("%03d", increasedNum);
				    // 마지막 3자리 숫자를 증가시킨 숫자로 대체
				    code = recentCode.substring(0, recentCode.length()-3) + newLastFourNums;
					}
					
				vo.setCode(code);
		
		// vo에 세션 아이디 추가하기
//		String id = (String) session.getAttribute("id");
//		vo.setReg_emp(id);
		String id = "test";
		vo.setReg_emp(id);
		
		int result = rService.dataInsertRequest(vo);
		
		String link = "";
		if (result >= 1) {
			link = "redirect:/confirm";
			rttr.addFlashAttribute("title", "수주 등록 결과");
			rttr.addFlashAttribute("result", "수주 등록 완료되었습니다.");
		} else {
			link = "redirect:/error";
			rttr.addFlashAttribute("title", "수주 등록 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
		}
		
		
		return link;
	}
	
	// -------- 수주등록 데이터 찾기 ---------
	
	@RequestMapping(value = "searchClient", method=RequestMethod.GET)
	public void searchClientGET(Model model, PageVO pageVO, Criteria cri, HttpSession session)throws Exception{
		logger.debug("controller : 거래사 정보 찾기");
		logger.debug("searchClientGET    실행");

		// 거래사 리스트 출력하기
		List<RequestVO> clientList = rService.ClientList(cri);
		pageVO.setCri(cri);
		pageVO.setTotalCount(rService.getClientTotal()); // 디비에서 직접 실행결과 가져오기
		logger.debug("clientList : "+clientList);
		model.addAttribute("List", clientList);
		model.addAttribute("pageVO", pageVO);


	}
	
	@RequestMapping(value = "searchClient", method=RequestMethod.POST)
	public void searchClientPOST(@RequestParam("client_code") String client_code,
											@RequestParam("clientName") String clientName,
											PageVO pageVO, Criteria cri,Model model)throws Exception{
		logger.debug("controller : 거래사 정보 DB 검색결과 가져오기");
		logger.debug("searchClientPOST    실행");

		List<RequestVO> clientList = rService.findClient(client_code,clientName,cri);
		pageVO.setCri(cri);
		pageVO.setTotalCount(rService.getClientTotal(client_code,clientName));
//		model.addAttribute("List", clientList);
		logger.debug("가져온 List"+clientList);
		model.addAttribute("List", clientList);
		model.addAttribute("pageVO", pageVO);

		
	}
	
	@RequestMapping(value = "searchManager" ,method = RequestMethod.GET)
	public void searchManagerGET(Model model,PageVO pageVO, Criteria cri, HttpSession session)throws Exception{
		logger.debug("controller : 담당자 정보 찾기");
		logger.debug("searchManagerGET    실행");
		
		List<RequestVO> managerList = rService.ManagerList(cri);
		pageVO.setCri(cri);
		pageVO.setTotalCount(rService.getManagerTotal());
		model.addAttribute("List", managerList);
		model.addAttribute("pageVO", pageVO);


	}
	
	@RequestMapping(value = "searchManager" ,method = RequestMethod.POST)
	public void searchManagerPOST(@RequestParam("manager") String manager,
								  @RequestParam("managerName") String managerName,PageVO pageVO, Criteria cri, Model model)throws Exception{
		
		logger.debug("controller : 담당자 정보 DB 검색결과 가져오기");
		logger.debug("searchManagerPOST    실행");
		
		List<RequestVO> managerList = rService.findManager(manager,managerName,cri);
		pageVO.setCri(cri);
		pageVO.setTotalCount(rService.getManagerTotal(manager,managerName));
//		model.addAttribute("List", managerList);
		logger.debug("가져온 List"+managerList);
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("List", managerList);


		
		
	}
	
	@RequestMapping(value = "searchProduct",method = RequestMethod.GET)
	public void searchProductGET(Model model,PageVO pageVO, Criteria cri, HttpSession session)throws Exception{
		logger.debug("controller : 상품 정보 찾기");
		logger.debug("searchProductGET   실행");
		
		List<RequestVO> productList = rService.ProductList(cri);
		pageVO.setCri(cri);
		pageVO.setTotalCount(rService.getProductTotal());
		model.addAttribute("List", productList);
		model.addAttribute("pageVO", pageVO);

	}
	
	@RequestMapping(value = "searchProduct",method = RequestMethod.POST)
	public void searchProductPOST(@RequestParam("product") String product,
								  @RequestParam("productName") String productName,PageVO pageVO, Criteria cri, Model model)throws Exception{
		// 찾아와야하는것 : 품번, 품명, 재고, 단위, 단가
		logger.debug("controller : 상품 정보 DB 검색결과 가져오기 ");
		logger.debug("searchProductPOST   실행");
		
		List<RequestVO> productList = rService.findProduct(product,productName,cri); 
		pageVO.setCri(cri);
		pageVO.setTotalCount(rService.getProductTotal(product,productName));
//		model.addAttribute("List", productList);
		logger.debug("가져온 List"+productList);
		model.addAttribute("List", productList);
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("product", product);
		model.addAttribute("productName", productName);
		

	}

	// -------- 수주등록 데이터 찾기 끝---------
	
	
	// http://localhost:8088/request/update
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void requestUpdateGET(@RequestParam("code") String code, Model model) throws Exception{
		// 수주 수정 폼5-5
		// code 정보 받아서 해당하는 code 데이터 불러오기
		logger.debug("requestUpdateGET(RequestVO vo) 폼 정보 받아서 그대로 토해내기");
		logger.debug("code "+code);
		
		RequestVO vo = rService.getinfo(code);
		model.addAttribute("List", vo);
		
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String requestUpdatePOST(RequestVO vo,HttpSession session, RedirectAttributes rttr) throws Exception{
		// 수주 수정 액션
		logger.debug("requestUpdatePOST() 전달받은 정보 DB 저장하기");
		logger.debug("vo "+vo);
		
		// 일단 임시 아이디값(실제로는 세션에서 값을 받아와야함)
//		String id = (String) session.getAttribute("id");
//		vo.setUpdate_emp(id);
		String id = "id";
		int result = rService.updateRequest(vo, id);
		String link = "";
		if (result >= 1) {
			link = "redirect:/confirm";
			rttr.addFlashAttribute("title", "수주 수정 결과");
			rttr.addFlashAttribute("result", "수주 수정 완료되었습니다.");
		} else {
			link = "redirect:/error";
			rttr.addFlashAttribute("title", "수주 수정 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
		}
		
		return link;

	}
	
	
	// http://localhost:8088/request/delete
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void requestDeleteGET(@RequestParam("code") String codes, Model model ) throws Exception{
		// 수주 삭제 폼5-6
		// 전달정보 저장
		String[] code = codes.split(",");
		List<RequestVO> vo = rService.getinfo(code);
		logger.debug("찾아온 삭제 정보 vo"+vo);
		model.addAttribute("List", vo);
		
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String requestDeletePOST(@RequestParam("code") String codes,
			 RedirectAttributes rttr) throws Exception{
		// 수주 삭제 액션
		logger.debug("삭제가 될랑가 codes "+codes);
		String[] code = codes.split(",");
		int result = rService.deleteRequest(code);
		String link = "";
		if (result >= 1) {
			link = "redirect:/confirm";
			rttr.addFlashAttribute("title", "수주 삭제 결과");
			rttr.addFlashAttribute("result", "수주 삭제가 완료되었습니다.");
		} else {
			link = "redirect:/error";
			rttr.addFlashAttribute("title", "수주 삭제 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
		}
		return link;
	}
	
	
}