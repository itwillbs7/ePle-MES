package com.itwillbs.controller;

import java.awt.PageAttributes.MediaType;
import java.io.ByteArrayOutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.PageVO;
import com.itwillbs.domain.RequestVO;
import com.itwillbs.domain.ShipmentVO;
import com.itwillbs.service.RequestService;
import com.itwillbs.service.ShipmentService;

/** ShipmentController : 출하 컨트롤러
 * 
 *  : request 를 shipment로 고쳐서 사용 필요
 *  
 **/

@Controller
@RequestMapping(value = "/shipment/*")
public class ShipmentController {
	
	private static final Logger logger = LoggerFactory.getLogger(ShipmentController.class);
	
	@Inject
	private ShipmentService sService;
	@Inject
	private RequestService rService;
		
	// http://localhost:8088/shipment/list
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void shipmentListGET(Model model, 
							   HttpSession session, 
							   @ModelAttribute("result") String result, Criteria cri
							   ) throws Exception { //5-1
		// 수주 목록 return
		logger.debug("shipmentListGET -> DB에서 목록 가져오기(페이징 처리하기)");

		List<ShipmentVO> shipmentList = sService.shipmentListpage(cri);
		
		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(sService.getTotal()); // 디비에서 직접 실행결과 가져오기
		
		model.addAttribute("List",shipmentList);
		model.addAttribute("pageVO", pageVO);
		

	}
	
	// http://localhost:8088/request/info
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public void shipmentInfo(@RequestParam(value = "code") String code,Model model) throws Exception {// 수주개별정보 5-2
		logger.debug("shipmentInfo -> DB에서 수주번호가 일치하는 데이터 열 가져오기");
		logger.debug("Controller - code "+code);
		
		ShipmentVO vo = sService.getinfo(code);
		logger.debug("Controller - vo "+vo);
		String reqscode = vo.getReqs_code();
		
		RequestVO rvo = rService.getinfo(reqscode);
		logger.debug("Controller - rvo "+rvo);
		

		
		model.addAttribute("vo",vo);
		model.addAttribute("rvo",rvo);

	}
	
	// http://localhost:8088/request/search
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	@ResponseBody
	public List<ShipmentVO> searchShipmentGET(RedirectAttributes rttr,
											@ModelAttribute("result") String result, 
											ShipmentVO vo) throws Exception { // 수주검색 5-3
		logger.debug("searchShipmentGET() -> 정보 받아서 DB에 조회하기");
		logger.debug("Controller - vo "+vo);
		// 전달받을 정보(업체명, 품명, 출하일자, 출하상태)
		String startDate = vo.getStartDate() != null ? vo.getStartDate() : "";
		String endDate = vo.getEndDate() != null ? vo.getEndDate() : "";
		vo.setDate(startDate+endDate);
		
		
		List<ShipmentVO> shipmentList= sService.findShipmentList(vo);
		logger.debug("검색정보 : "+shipmentList);
		
		rttr.addFlashAttribute("searchList",shipmentList);
		
		return shipmentList;
	}
	
	
	

	// http://localhost:8088/request/add
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public void shipmentInsertGET() throws Exception { 
		logger.debug("shipmentInsertGET() -> 입력폼 팝업");
		
		
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String shipmentInsertPOST(ShipmentVO vo,RedirectAttributes rttr) throws Exception {
		// 출하 추가 할 때
		// 1. 출하명령을 추가한다
		// 2. 수주상태를 출하대기로 변경한다
		//   :  재고 >= 수주량 일 때!
		// 3. LOT 테이블에 출하번호 넣기
		
		// 수주 추가 액션
		logger.debug("(^^)/insert 예정 정보 "+vo);
		
		//출하코드
		String vocode=vo.getCode();
		// ex) 23ODMG1207 여기까지 검색해서 가장 최근 등록된 코드
		String recentCode = sService.getRecentCode(vocode);
						
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
		
		// vo에 세션 아이디 추가하기
//		String id = (String) session.getAttribute("id");
//		vo.setReg_emp(id);
				
		String id = "test";
		vo.setReg_emp(id);
		
		// 창고 입출고내역 코드 만드는거 하기...?(효린씨꺼 참고해야함)
		
		//출하코드
		
				String voHistory = vo.getWareHistory_code();
				// ex) 23ODMG1207 여기까지 검색해서 가장 최근 등록된 코드
				String recentHistory = sService.getRecentHistory(voHistory);
						
						// ex) BB1 지금 상품코드
						String lastThree = voHistory.substring(voHistory.length()-3);

						if(recentHistory == null || recentHistory.equals("")) {
							// 등록된 코드가 없는 경우
							// 코드 새로 생성
							voHistory += "001";
						}else {
							// 마지막 3자리 숫자 추출
						    String lastFourNums = recentHistory.substring(recentHistory.length()-3);
						    // 숫자로 변환 후 1 증가
						    int increasedNum = Integer.parseInt(lastFourNums) + 1;
						    // 다시 문자열로 변환
						    String newLastFourNums = String.format("%03d", increasedNum);
						    // 마지막 3자리 숫자를 증가시킨 숫자로 대체
						    voHistory = recentHistory.substring(0, recentHistory.length()-3) + newLastFourNums;
							}
							
						vo.setWareHistory_code(voHistory);
						logger.debug("입출고코드~~~~~~~~~~~~!!!!"+vo.getWareHistory_code());
		
//		String history = "test2";
//		vo.setWareHistory_code(history);
		
		int result = sService.dataInsertShipment(vo);
					
		String link = "";
		if (result >= 1) {
			link = "redirect:/confirm";
			rttr.addFlashAttribute("title", "출하명령 등록 결과");
			rttr.addFlashAttribute("result", "출하명령 등록 완료되었습니다.");
		} else {
			link = "redirect:/error";
			rttr.addFlashAttribute("title", "출하 등록 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
		}
		
		
		return link;
	}
	
	// -------- 수주등록 데이터 찾기 ---------
	
	@RequestMapping(value = "searchClient", method=RequestMethod.GET)
	public void searchClientGET(RequestVO vo, Model model, HttpSession session)throws Exception{
		logger.debug("controller : 거래사 정보 찾기");
		logger.debug("searchClientGET    실행");

		// 거래사 리스트 출력하기
		List<RequestVO> clientList = rService.ClientList();
		logger.debug("clientList : "+clientList);
		model.addAttribute("List", clientList);

	}
	
	@RequestMapping(value = "searchClient", method=RequestMethod.POST)
	public List<RequestVO> searchClientPOST(@RequestParam("client_code") String client_code,
											@RequestParam("clientName") String clientName,Model model)throws Exception{
		logger.debug("controller : 거래사 정보 DB 검색결과 가져오기");
		logger.debug("searchClientPOST    실행");

		List<RequestVO> clientList = rService.findClient(client_code,clientName);
//		model.addAttribute("List", clientList);
		logger.debug("가져온 List"+clientList);
		
		return clientList;
	}
	
	
	@RequestMapping(value = "searchProduct",method = RequestMethod.GET)
	public void searchProductGET(Model model, HttpSession session)throws Exception{
		logger.debug("controller : 상품 정보 찾기");
		logger.debug("searchProductGET   실행");
		
		List<RequestVO> productList = rService.ProductList();
		model.addAttribute("List", productList);
	}
	
	@RequestMapping(value = "searchProduct",method = RequestMethod.POST)
	@ResponseBody
	public List<RequestVO> searchProductPOST(@RequestParam("product") String product,
								             @RequestParam("productName") String productName, Model model)throws Exception{
		// 찾아와야하는것 : 품번, 품명, 재고, 단위, 단가
		logger.debug("controller : 상품 정보 DB 검색결과 가져오기 ");
		logger.debug("searchProductPOST   실행");
		
		List<RequestVO> productList = rService.findProduct(product,productName); 
//		model.addAttribute("List", productList);
		logger.debug("가져온 List"+productList);
		return productList;
	}
	
	@RequestMapping(value = "searchRequest", method = RequestMethod.GET)
	public void searchRequestGET(Model model, HttpSession sessio)throws Exception{
		logger.debug("cotroller : 수주정보 찾기");
		
		List<RequestVO> requestList = sService.RequestList();
		logger.debug("가져온 List : "+requestList);
		model.addAttribute("List", requestList);

	}
	
	@RequestMapping(value = "searchRequest", method = RequestMethod.POST)
	@ResponseBody
	public List<RequestVO> searchRequest(@RequestParam("clientName") String clientName,
										@RequestParam("productName") String productName)throws Exception{
		logger.debug("controller : 회사명, 품명으로 수주정보 찾기");
		List<RequestVO> requestList = sService.findRequest(clientName, productName);
		logger.debug("가져온 List : "+requestList);
		return requestList;
	}

	// -------- 수주등록 데이터 찾기 끝---------
	
	
	// http://localhost:8088/request/update
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void shipmentUpdateGET(ShipmentVO vo,Model model) throws Exception{
		// 수주 수정 폼5-5
		// code 정보 받아서 해당하는 code 데이터 불러오기
		logger.debug("shipmentUpdateGET(shipmenttVO vo) 폼 정보 받아서 그대로 토해내기");
		logger.debug("vo "+vo);
		model.addAttribute("List",vo);
		
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String shipmentUpdatePOST(ShipmentVO vo,RedirectAttributes rttr) throws Exception{
		// 수주 수정 액션
		logger.debug("shipmentUpdatePOST() 전달받은 정보 DB 저장하기");
		logger.debug("vo "+vo);
		
		// 일단 임시 아이디값(실제로는 세션에서 값을 받아와야함)
		String id = "id";
		int result = sService.updateShipment(vo, id);
		
		String link = "";
		if (result >= 1) {
			link = "redirect:/confirm";
			rttr.addFlashAttribute("title", "출하명령 수정 결과");
			rttr.addFlashAttribute("result", "출하명령 수정이 완료되었습니다.");
		} else {
			link = "redirect:/error";
			rttr.addFlashAttribute("title", "출하명령 수정 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
		}
		
		
		return link;

	}
	
	
	// http://localhost:8088/request/delete
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void shipmentDeleteGET(@RequestParam("code") String codes, Model model ) throws Exception{
		// 수주 삭제 폼5-6
		// 전달정보 저장
		String[] code = codes.split(",");
		List<ShipmentVO> vo = sService.getinfo(code);
		logger.debug("찾아온 삭제 정보 vo"+vo);
		model.addAttribute("List", vo);
		
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String shipmentDeletePOST(@RequestParam("code") String codes, RedirectAttributes rttr) throws Exception{
		// 수주 삭제 액션
		logger.debug("삭제가 될랑가 codes "+codes);
		String[] code = codes.split(",");
		int result = sService.deleteShipment(code);
		
		String link = "";
		if (result >= 1) {
			link = "redirect:/confirm";
			rttr.addFlashAttribute("title", "출하명령 삭제 결과");
			rttr.addFlashAttribute("result", "출하명령이 삭제 되었습니다.");
		} else {
			link = "redirect:/error";
			rttr.addFlashAttribute("title", "출하명령 삭제 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다!");
		}
		return link;
	}
	
	@RequestMapping(value = "/statusChange", method = RequestMethod.GET)
	public String changeStatus(@RequestParam("code") String codes, RedirectAttributes rttr)throws Exception{
		// 출하완료 변경하기
		// 1. 출하상태 출하완료로 변경하기
		// 2. 수주상태 출하완료로 변경하기
		// 3. 재고 테이블에서 재고 빼기
		String[] code = codes.split(",");
		int result = sService.changeStatus(code);
		
		String link = "";
		if (result >= 1) {
			link = "redirect:/confirm";
			rttr.addFlashAttribute("title", "출하상태 변경 결과");
			rttr.addFlashAttribute("result", "출하완료 되었습니다.");
		} else {
			link = "redirect:/error";
			rttr.addFlashAttribute("title", "출하상태 변경 결과");
			rttr.addFlashAttribute("result", "오류가 발생했습니다");
		}
		return link;
		
	}
	
	//================================ PDF ======================================= 
	// 필요기능 1. 프린트
	
	@RequestMapping(value = "/print")
	public String printShipment(@RequestParam("code") String codes, Model model)throws Exception{
		logger.debug("일단 큐알 이미지를 생성해서 jsp로 전달해야함");
		logger.debug("get방식으로 code 전달해야함");
		
		String[] codeArr = codes.split(",");
		// 선택한 출하정보 가져오기
		List<ShipmentVO> List = sService.getinfoList(codeArr); // 가져온 출하정보 전부 저장!
		model.addAttribute("ship", List);
		
		List<String> reqsArr = new ArrayList<>();
		for (ShipmentVO shipment : List) {
			String reqsCode = shipment.getReqs_code();
			reqsArr.add(reqsCode);
		}
		
		// request 정보 가져오기
		List<RequestVO> requestList = sService.getinfoRequest(reqsArr); // 가져온 출하번호의 수주정보 전부 저장!
		model.addAttribute("request",requestList );
		
		
		String code = String.join(",", codeArr);
		String encodedCode = URLEncoder.encode(code, "UTF-8");
		
		// 일단 출하코드들 qr 먼저 
		int width = 200;
        int height = 200;
        String url = "http://localhost:8088/shipment/qr?code="+encodedCode;
        
        QRCodeWriter barcodeWriter = new QRCodeWriter();
        BitMatrix bitMatrix = 
        	barcodeWriter.encode(url, BarcodeFormat.QR_CODE, width, height);
        
        ByteArrayOutputStream pngOutputStream = new ByteArrayOutputStream();
        MatrixToImageWriter.writeToStream(bitMatrix, "PNG", pngOutputStream);
        byte[] pngData = pngOutputStream.toByteArray();
        String base64String = Base64.getEncoder().encodeToString(pngData);
      
        model.addAttribute("qrCodeImage", base64String);
        
        return "/shipment/print";
	}
	
	
	// 필요기능 2. 큐알 스캔 시 업뎃
	@RequestMapping(value = "/qr", method = RequestMethod.GET)
	public void scanningQR(@RequestParam("code") String codes)throws Exception{
		logger.debug("QR을 스캔하면 /shipment/qr로 이동.");
		logger.debug("이곳에서 수주상태를 수령 으로 변경하면 된다!");
		String[] code = codes.split(",");
	}
	
	//=========================================================================

}