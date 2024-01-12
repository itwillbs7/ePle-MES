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
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.PageVO;
import com.itwillbs.domain.RequestSearchVO;
import com.itwillbs.domain.RequestVO;
import com.itwillbs.domain.ReturnsVO;
import com.itwillbs.domain.ShipmentVO;
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
	
	@Inject
	private RequestService rService;
		
	
	// http://localhost:8088/returns/list
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void returnsListGET(Model model, 
							   HttpSession session, 
							   ReturnsVO vo , Criteria cri,PageVO pageVO
							   ) throws Exception { //5-1
		// 반품 목록 return
		logger.debug("returnsListGET -> DB에서 목록 가져오기(페이징 처리하기)");
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("clientName", vo.getClientName());
		paramMap.put("productName", vo.getProductName()); // 이거 품명임
		paramMap.put("managerName", vo.getManagerName()); // 이거 품명임
		paramMap.put("statusList", vo.getStatusList());
		paramMap.put("startDate", vo.getStartDate());
		paramMap.put("endDate", vo.getEndDate());

		List<ReturnsVO> returnsList = rtService.returnsListpage(vo,cri);
		
		pageVO.setCri(cri);
		pageVO.setTotalCount(rtService.getTotal(vo)); // 디비에서 직접 실행결과 가져오기
		
		
		
		model.addAttribute("List", returnsList);
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("paramMap", paramMap);

	}
	
	// http://localhost:8088/request/search
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	@ResponseBody
	public List<ReturnsVO> searchReturnsGET(RedirectAttributes rttr, @ModelAttribute("result") String result, 
											ReturnsVO vo) throws Exception { // 반품검색 5-3
		logger.debug("searchReturnsGET() -> 정보 받아서 DB에 조회하기");

		logger.debug("Controller - vo "+vo);
		// 전달받을 정보(반품상태 ,담당자코드, 업체코드
		
		List<ReturnsVO> ReturnsList= rtService.findReturnsList(vo);
		logger.debug("검색정보 : "+ReturnsList);
		
		rttr.addFlashAttribute("returnsList",ReturnsList);
		
		return ReturnsList;
	}
	
	
	
	// http://localhost:8088/request/info
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public void returnsInfo(@RequestParam(value = "code") String code,Model model) throws Exception {// 반품개별정보 5-2
		logger.debug("returnsInfo -> DB에서 반품번호가 일치하는 데이터 열 가져오기");
		logger.debug("Controller - code "+code);
		
		ReturnsVO vo = rtService.getinfo(code);
		logger.debug("Controller - vo "+vo);

		model.addAttribute("List",vo);

	}
	

	
	

	// http://localhost:8088/request/add
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public void returnsInsertGET(@RequestParam(value="code",required=false) String code, Model model) throws Exception { 
		logger.debug("returnsInsertGET() -> 입력폼 팝업");
		if(code != null) { //코드정보가 있을 때
			ShipmentVO List = rtService.getShipmentList(code);
			model.addAttribute("List", List);
		}
		// 반품 추가 폼 5-4
		
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String returnsInsertPOST(HttpSession session, ReturnsVO vo, RedirectAttributes rttr) throws Exception {
		// 반품 추가 액션
		logger.debug("(^^)/insert 예정 정보 "+vo);
		
		// 사번 수집
		String id = (String) session.getAttribute("code");
		vo.setReg_emp(id);
		
		String vocode=vo.getCode();
		// ex) 23ODMG1207 여기까지 검색해서 가장 최근 등록된 코드
		String recentCode = rtService.getRecentCode(vocode);
						
				// ex ) 기존 코드 23ODMG1207BB1
				String code = vo.getCode();
				// ex) BB1 지금 상품코드
				String lastThreeCharacters = code.substring(code.length()-3);

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
		
		int result= rtService.dataInsertReturns(vo);
		
		String link = "";
		if (result >= 1) {
			link = "redirect:/confirm";
			rttr.addFlashAttribute("title", "반품 등록 결과");
			rttr.addFlashAttribute("result", "반품 등록이 완료 되었습니다.");
		} else {
			link = "redirect:/error";
			rttr.addFlashAttribute("title", "반품 등록 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다. 관리자에게 문의해주세요");
		}
		return link;
	}
	
	// -------- 반품등록 데이터 찾기 ---------
	
	@RequestMapping(value ="/searchShipment" , method = RequestMethod.GET)
	public void getShipmentList(HttpSession session,
								PageVO pageVO, Criteria cri,
								Model model)throws Exception{
		logger.debug("출하정보 리스트로 가져오기");
			
			String clientName = null;
			String productName = null;
			
			List<ShipmentVO> List = rtService.findShipment(cri);
			
			pageVO.setCri(cri);
			pageVO.setTotalCount(rtService.getShipmentTotal(clientName,productName)); // 디비에서 직접 실행결과 가져오기
			
			logger.debug("가져온 List : "+List);

			model.addAttribute("List", List);
			model.addAttribute("pageVO", pageVO);
			
	}
	
	
	@RequestMapping(value = "/searchShipment", method = RequestMethod.POST)
	public List<ShipmentVO> searchShipment(@RequestParam("clientName")String clientName,PageVO pageVO, Model model,
			Criteria cri, @RequestParam("productName") String productName)throws Exception {
		logger.debug("출하번호 및 출하정보 찾기 (검색내용)");
		logger.debug("productName"+productName+"clientName"+clientName);
		List<ShipmentVO> List = rtService.findShipment(clientName,productName,cri);
		pageVO.setCri(cri);
		pageVO.setTotalCount(rtService.getShipmentTotal(clientName,productName));
		
		logger.debug("가져온 List : "+List);
		model.addAttribute("List", List);
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("clientName", clientName);
		model.addAttribute("productName", productName);

		return List;
	}
	
	@RequestMapping(value = "/searchLOT", method = RequestMethod.GET)
	@ResponseBody
	public List<ReturnsVO> searchLOT(@RequestParam("request_code") String request_code,
						  @RequestParam("ship_code")String ship_code) throws Exception {
		logger.debug("lot 번호 찾기! => 해당하는 LOT 번호 LIST 로 가져와야함");
		
		List<ReturnsVO> List = rtService.getLOTList(request_code,ship_code);
		return List;
	}

	// -------- 반품등록 데이터 찾기 끝---------
	
	
	// http://localhost:8088/request/update
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void returnsUpdateGET(ReturnsVO vo, Model model) throws Exception{
		// 반품 수정 폼5-5
		// code 정보 받아서 해당하는 code 데이터 불러오기
		logger.debug("returnsUpdateGET(RequestVO vo) 폼 정보 받아서 그대로 토해내기");
		logger.debug("vo "+vo);
		model.addAttribute("List",vo);
		
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String returnsUpdatePOST(HttpSession session,ReturnsVO vo, RedirectAttributes rttr) throws Exception{
		// 반품 수정 액션
		logger.debug("returnsUpdatePOST() 전달받은 정보 DB 저장하기");
		logger.debug("vo "+vo);
		
		// 사번 수집
		String id = (String) session.getAttribute("code");

//		String id = "id";
		int result= rtService.updateReturns(vo, id);
		
		String link = "";
		if (result >= 1) {
			link = "redirect:/confirm";
			rttr.addFlashAttribute("title", "반품 내용 수정 결과");
			rttr.addFlashAttribute("result", "반품내용이 수정 되었습니다.");
		} else {
			link = "redirect:/error";
			rttr.addFlashAttribute("title", "반품 내용 수정 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다. 관리자에게 문의해주세요");
		}
		return link;

	}
	
	
	// http://localhost:8088/request/delete
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void returnsDeleteGET(@RequestParam("code") String codes, Model model ) throws Exception{
		// 반품 삭제 폼5-6
		// 전달정보 저장
		String[] code = codes.split(",");
		List<ReturnsVO> vo = rtService.getinfo(code);
		logger.debug("찾아온 삭제 정보 vo"+vo);
		model.addAttribute("List", vo);
		
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String returnsDeletePOST(@RequestParam("code") String codes, RedirectAttributes rttr) throws Exception{
		// 반품 삭제 액션
		logger.debug("삭제가 될랑가 codes "+codes);
		String[] code = codes.split(",");
		int result= rtService.deleteReturns(code);
		
		String link = "";
		if (result >= 1) {
			link = "redirect:/confirm";
			rttr.addFlashAttribute("title", "반품 삭제 결과");
			rttr.addFlashAttribute("result", "반품 내용이 삭제 되었습니다.");
		} else {
			link = "redirect:/error";
			rttr.addFlashAttribute("title", "반품 삭제  결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다. 관리자에게 문의해주세요");
		}
		return link;
	}
	
	@RequestMapping(value = "/dispose", method = RequestMethod.GET)
	public void disposeGET(@RequestParam("code") String codes, Model model)throws Exception {
		logger.debug("반품 폐기처리 하기");
		logger.debug("삭제기능 응용하기");
		
		String[] code = codes.split(",");
		List<ReturnsVO> vo = rtService.getinfo(code);
		logger.debug("@@@@@@@찾아온 폐기 정보 vo"+vo);
		model.addAttribute("List", vo);
	}
	
	@RequestMapping(value = "/dispose", method = RequestMethod.POST)
	public String disposePOST(@RequestParam("code") String codes, RedirectAttributes rttr) throws Exception{
		// 반품 삭제 액션
		logger.debug("폐기처리할것들 "+codes);
		String[] code = codes.split(",");
		int result= rtService.disposeReturns(code);
		
		String link = "";
		if (result >= 1) {
			link = "redirect:/confirm";
			rttr.addFlashAttribute("title", "폐기 처리 결과");
			rttr.addFlashAttribute("result", "폐기 완료 되었습니다.");
		} else {
			link = "redirect:/error";
			rttr.addFlashAttribute("title", "폐기 처리 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다. 관리자에게 문의해주세요");
		}
		
		return link;
	}
	
	

}