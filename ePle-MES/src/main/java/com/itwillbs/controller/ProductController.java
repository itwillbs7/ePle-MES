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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.MAPDVO;
import com.itwillbs.service.ProductService;

@Controller
@RequestMapping(value = "/board/*")
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

	@Inject
	private ProductService sService;

	// 글쓰기 - GET
	// http://localhost:8088/board/regist
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public void registGET() throws Exception {
		logger.debug("/product/regist -> registGET() 호출 ");
		logger.debug("/product/regist.jsp 뷰페이지로 이동");
	}

	// 글쓰기 - POST
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String registPOST(MAPDVO mvo, RedirectAttributes rttr) throws Exception {
		logger.debug("폼submit -> registPOST() 호출 ");
		// 한글 인코딩(필터)
		// 전달정보 저장
		logger.debug(" mvo : " + mvo);

		// 서비스 - DB에 글쓰기(insert) 동작 호출
		sService.productWrite(mvo);
		logger.debug(" 글작성 완료! ");

		rttr.addFlashAttribute("result", "CREATEOK");

		logger.debug("/product/listAll 이동");
//		return "/board/listAll"; (x-데이터 중복 작성)
		return "redirect:/product/listAll";
	}

	// http://localhost:8088/board/listAll
	// 게시판 리스트 - GET
	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public String listALLGET(Model model, @ModelAttribute("result") String result, HttpSession session)
			throws Exception {
		logger.debug(" /board/listAll -> listALLGET() ");

		session.setAttribute("viewcntCheck", true);

		// 서비스 - 디비에 저장된 글을 가져오기
		List<MAPDVO> boardList = sService.productListAll();
		logger.debug(" @@@ " + productList);

		// 데이터를 연결된 뷰페이지로 전달(Model)
		model.addAttribute("boardList", productList);

		// model.addAttribute("boardList", bService.boardListAll());

		return "/board/listAll";
	}

	// http://localhost:8088/board/read?bno=1
	// 글 본문보기 - GET
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void readGET(@RequestParam("bno") int bno, Model model, HttpSession session) throws Exception {
		logger.debug("/board/read -> readGET() ");
		// 전달정보 저장
		logger.debug(" bno : " + bno);

		if ((boolean) session.getAttribute("viewcntCheck")) {
			// 서비스 - bno에 해당하는 글 조회수 1증가
			// (페이지 호출당 1번씩 증가/read페이지 새로고침시 증가X)
			sService.incrementViewCnt(bno);

			session.setAttribute("viewcntCheck", false);
		}

		// 서비스 - bno에 해당하는 특정 글정보만 조회
		MAPDVO resultVO = sService.productBoard(bno);
		// 연결된 뷰페이지로 이동시 정보를 전달
		model.addAttribute("resultVO", resultVO);

		// model.addAttribute(resultVO); => "boardVO" 이름
		// /board/read.jsp 뷰페이지로 이동
	}

	// 게시판 글 수정 - GET
	// http://localhost:8088/board/modify?bno=1
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(@RequestParam("bno") int bno, Model model) throws Exception {
		logger.debug("/board/modify -> modifyGET()호출");
		logger.debug(" 수정할 글번호 : " + bno);

		// 기존의 글정보를 가져와서 화면에 출력
		MAPDVO resultVO = sService.getProduct(bno);
		// 글정보를 Model 객체 저장
		model.addAttribute("resultVO", resultVO);
		// 뷰페이지로 이동
	}

	// 게시판 글 수정 - POST
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(MAPDVO mvo, RedirectAttributes rttr) throws Exception {
		logger.debug(" /modify form -> modifyPOST()");
		// 전달된 정보 저장(수정할 정보)
		logger.debug(" 수정할 정보 " + mvo);

		// 서비스 - 정보수정 동작
		int result = sService.boardModify(mvo);
		// 처리 완료후 페이지 이동(리스트)
		// + 수정 완료! 리스트에서 출력
		rttr.addFlashAttribute("result", "modifyOK");

		return "redirect:/product/listAll";
	}

	// 글 삭제
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String removePOST(@ModelAttribute("bno") int bno, RedirectAttributes rttr) throws Exception {
		logger.debug("/read form -> removePOST()");

		// 서비스 - 글 삭제 동작
		sService.productRemove(bno);
		// " 글 삭제 완료! " 메세지 출력
		rttr.addFlashAttribute("result", "removeOK");

		return "redirect:/product/listAll";
	}

	/**
	 * 페이징처리 
	 *  0) 반드시 GET방식으로만 처리!
	 *  1) 원하는 만큼의 데이터를 가져와서 출력 
	 *  2) 페이지 블럭(하단블럭) 생성
	 *  3) 본문/수정/삭제등..처리후 리스트 이동시 기존의 정보를 유지
	 * 
	 * a태그 : 네이버 쇼핑 / 유사한 코드의 반복적인 동작 수행 => 검색엔진 노출이 쉬움
	 * 
	 * form태그 : 쿠팡 / input태그를 사용해서 처리 => 데이터처리 (빠른 처리)
	 * 
	 *  - 하단 페이징블럭 
	 *    1) 시작페이지 번호
	 *    2) 끝 페이지 번호
	 *    3) 전체 데이터(글)의 개수
	 *    4) 이전페이지 링크(boolean) 
	 *    5) 다음페이지 링크(boolean)
	 *    
	 *    ex) 총 122개 / 페이지당 10개씩 출력
	 *     - 1페이지 : 시작페이지번호 : 1 끝페이지 번호 : 10 / 이전 :N  다음 :Y
	 *     - 7페이지 : 시작 : 1 끝 : 10 / 이전 : N, 다음 : Y
	 *     - 12페이지 : 시작 : 11  끝 : 20 -> 13 /이전 : Y, 다음 : N 
	 * 
	 */
	// http://localhost:8088/board/listPage
	// http://localhost:8088/board/listPage?page=1
	// http://localhost:8088/board/listPage?pageSize=20
	// http://localhost:8088/board/listPage?page=3&pageSize=15
	
	// 게시판 리스트 - GET
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public String listPageGET(Model model,
								@ModelAttribute("result") String result,
								HttpSession session,
								Criteria cri) throws Exception {
		logger.debug(" /board/listPage -> listPageGET() ");

		session.setAttribute("viewcntCheck", true);
		
//		Criteria cri = new Criteria();
//		cri.setPage(5);
//		cri.setPageSize(5);

		// 서비스 - 디비에 저장된 글을 가져오기
		List<BoardVO> boardList = bService.boardListPage(cri);
		//logger.debug(" @@@ " + boardList);
		
		// 페이지 블럭 정보 준비 -> view 페이지 전달
		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		//pageVO.setTotalCount(360448); // 디비에서 직접 실행결과 가져오기
		pageVO.setTotalCount(bService.totalBoardCount());
		
		logger.debug(" 확인 :"+pageVO);
		model.addAttribute("pageVO", pageVO);
		// 데이터를 연결된 뷰페이지로 전달(Model)
		model.addAttribute("boardList", boardList);
		// model.addAttribute("boardList", bService.boardListAll());

		return "/board/listAll";
	}

} // controller
