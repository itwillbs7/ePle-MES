package com.itwillbs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

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

import com.itwillbs.domain.CommonVO;
import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.PageVO;
import com.itwillbs.domain.UserVO;
import com.itwillbs.service.SystemServiceImpl;

@Controller
@RequestMapping (value = "/system/*")
public class SystemController {
	
	private static final Logger logger = LoggerFactory.getLogger(SystemController.class);
	@Inject
	private SystemServiceImpl sService;
	
	@GetMapping(value = "/common/main")
	public void commonMainGET(PageVO page, Criteria cri, Model model, 
			@ModelAttribute("pageNum") String pageNum) throws Exception {
		logger.debug("commonMainGET 실행");
		
		// 페이징 처리
		// 페이지 번호 없을 시 페이지번호 = 1
		if (pageNum==null || pageNum.equals("")) {
			cri.setPage(1);
		} else {
			cri.setPage(Integer.parseInt(pageNum));
		}
		// 한 페이지 당 출력할 데이터 수 
		cri.setPageSize(10);
		List<CommonVO> CommonVO = sService.getCommonListPage(cri);
		//-------------------
		logger.debug("CommonVO : " + CommonVO);
		// 페이지 블럭 처리
		page.setCri(cri);
		page.setTotalCount(sService.getCommonTotalCount());
		model.addAttribute("CommonVO", CommonVO);
		model.addAttribute("pageVO", page);
		
		// DB로 가서 공통코드 데이터 몽땅 들고오기
	}
	
	@PostMapping(value = "/common/main")
	public void commonMainPOST(@RequestParam("keyword") String keyword, 
			@RequestParam("category") String category, Model model, PageVO page, Criteria cri, 
			@ModelAttribute("pageNum") String pageNum) throws Exception{
		logger.debug("commonMainPOST 실행");
		// 페이징 처리
		if (pageNum==null || pageNum.equals("")) {
			cri.setPage(1);
		} else {
			cri.setPage(Integer.parseInt(pageNum));
		}
		cri.setPageSize(10);
		page.setCri(cri);
			// 카테고리, 키워드 확인
			logger.debug("category & keyword : " + category + ", " + keyword);
			// Map에 저장
			Map<String, Object> categoryAndKeyword = new HashMap<String, Object>();
			categoryAndKeyword.put("category", category);
			categoryAndKeyword.put("keyword", keyword);
		page.setTotalCount(sService.getCommonSearchCount(categoryAndKeyword));
		// 키워드 데이터 가져오기 (Map에 키워드+페이징 정보 같이 넘겨준다)
		Map<String, Object> searchDataMap = new HashMap<String, Object>();
		searchDataMap.put("categoryAndKeyword", categoryAndKeyword); 
		searchDataMap.put("cri", cri); 
		List<CommonVO> CommonVO = sService.getKeywordCommonsPage(searchDataMap);
		
		model.addAttribute("CommonVO", CommonVO);
		model.addAttribute("pageVO", page);
		model.addAttribute("categoryAndKeyword", categoryAndKeyword); 
		
	}
	
	
	@RequestMapping(value = "/common/add", method = RequestMethod.GET)
	public void commonAddGET() {
		logger.debug("addGET 실행");
		
	}
	
	@RequestMapping(value = "/common/add", method = RequestMethod.POST)
	public String commonAddPOST(@ModelAttribute CommonVO cvo) throws Exception {
		logger.debug("addPOST 실행");
		logger.debug("cvo : " + cvo);
		sService.registCommons(cvo);
		return "redirect:/system/common/registComplete";
		
	}
	
	@GetMapping (value = "/common/registComplete")
	public void commonRegistComplete() {
		logger.debug("registComplete 실행");
	}
	
	@GetMapping (value = "/common/update")
	public void commonUpdateGET(@RequestParam String index, Model model) throws Exception {
		logger.debug("commonUpdateGET 실행");
		logger.debug(index);
		
		// 전달받은 정보의 구분자 위치 at 계산
		int at = index.indexOf('_');
		
		// 전달받은 정보 구분자 at을 통해 subString + cvo에 저장
		CommonVO cvo = new CommonVO();
		logger.debug("group_id : " + index.substring(0, at));
		logger.debug("code_id : " + index.substring(at+1));
		cvo.setGroup_id(index.substring(0, at));
		cvo.setCode_id(index.substring(at+1));
		logger.debug("cvo : " + cvo.toString());
		logger.debug("getOneCommon : " + sService.getOneCommon(cvo));
		
		model.addAttribute("cvo", sService.getOneCommon(cvo));
		
	}
	
	@PostMapping (value = "/common/update")
	public void commonUpdatePOST(@RequestParam String index, CommonVO cvo) throws Exception {
		logger.debug("commonUpdatePOST 실행");
		logger.debug("index : " + index);
		// 수정하기 전 index로 해당 데이터 찾고, 입력받은 값 = cvo으로 수정
		// List배열로 넘겨준다? -> Map으로 넘겨준다
		// indexCVO 객체 생성 후 index 정보 배열에 저장, 전달받은 입력 값(cvo) 배열에 저장
		// Mapper로 전달해 꺼내쓰기?
		
		// 전달받은 정보의 구분자 위치 at 계산
		int at = index.indexOf('_');
		
		// 전달받은 정보 구분자 at을 통해 subString + newCvo에 저장
		logger.debug("cvo : " + cvo.toString());
		
		
		// Map에 cvo, newCvo 저장
		Map<String, Object> newCommon = new HashMap<String, Object>();
		newCommon.put("old_group_id", index.substring(0, at));
		newCommon.put("old_code_id", index.substring(at+1));
		newCommon.put("new_group_id", cvo.getGroup_id());
		newCommon.put("new_group_name", cvo.getGroup_name());
		newCommon.put("new_code_id", cvo.getCode_id());
		newCommon.put("new_code_name", cvo.getCode_name());
		newCommon.put("new_sortorder", cvo.getSortorder());
		newCommon.put("new_active", cvo.getActive());
		logger.debug("Map : " + newCommon.toString());
		
		sService.updateCommon(newCommon);
		
	}
	
	@GetMapping(value = "/common/delete")
	public String commonDeleteGET(@RequestParam String index) throws Exception {
		
		logger.debug("commonDeleteGET 실행");
		logger.debug("index : " + index);
		
		// 전달받은 정보의 구분자 위치 at 계산
		int at = index.indexOf('_');
		
		CommonVO cvo = new CommonVO();
		cvo.setGroup_id(index.substring(0, at));
		cvo.setCode_id(index.substring(at+1));
		
		logger.debug(cvo.toString());
		
		sService.deleteCommon(cvo);
		return "redirect:/system/common/deleteComplete";
		
	}
	
	@GetMapping (value = "/common/deleteComplete")
	public void commondeleteComplete() {
		logger.debug("deleteComplete 실행");
	}
	
	// 사용자(사원) 관리 ====================================================================================
	
	
	@GetMapping(value = "/user/main")
	public void userMainGET(PageVO page, Criteria cri, Model model, 
			@ModelAttribute("pageNum") String pageNum
			) throws Exception {
		logger.debug("userMainGET 실행");
		// 페이징 처리
		if (pageNum==null || pageNum.equals("")) {
			cri.setPage(1);
		} else {
			cri.setPage(Integer.parseInt(pageNum));
		}
		cri.setPageSize(10);
		List<UserVO> UserVO = sService.getUserListPage(cri);
		logger.debug("UserVO : " + UserVO);
		// 페이지 블럭 처리
		page.setCri(cri);
		page.setTotalCount(sService.getUserTotalCount());
		model.addAttribute("UserVO", UserVO);
		model.addAttribute("pageVO", page);
	}
	
	@PostMapping(value = "/user/main")
	public void userMainPOST(Model model, @RequestParam("category") String category, @RequestParam("keyword") String keyword, 
			PageVO page, Criteria cri, @ModelAttribute("pageNum") String pageNum) throws Exception {
		logger.debug("userMainPOST 실행");
		// 페이징 처리            
		if (pageNum==null || pageNum.equals("")) {
			cri.setPage(1);
		} else {
			cri.setPage(Integer.parseInt(pageNum));
		}
		cri.setPageSize(10);
		
		// 카테고리, 키워드 확인
		logger.debug("category & keyword : " + category + ", " + keyword);
		
			// Map에 저장
			Map<String, Object> categoryAndKeyword = new HashMap<String, Object>();
			categoryAndKeyword.put("category", category);
			categoryAndKeyword.put("keyword", keyword);
		
		// 키워드 데이터 가져오기 (Map에 키워드+페이징 정보 같이 넘겨준다)
		Map<String, Object> searchDataMap = new HashMap<String, Object>();
		searchDataMap.put("categoryAndKeyword", categoryAndKeyword);
		searchDataMap.put("cri", cri);
		List<UserVO> UserVO = sService.getKeywordUsersPage(searchDataMap);
		model.addAttribute("UserVO", UserVO);
		
		
		// 페이지 블럭 처리
		page.setCri(cri);
		page.setTotalCount(sService.getUserSearchCount(categoryAndKeyword));
		logger.debug("@@@@@키워드로 찾은 사용자의 수 : " + sService.getUserSearchCount(categoryAndKeyword));
		model.addAttribute("UserVO", UserVO);
		model.addAttribute("pageVO", page);
		model.addAttribute("categoryAndKeyword", categoryAndKeyword);
	}
	
	@GetMapping (value = "/user/add")
	public void userAddGET(Model model) throws Exception{
		logger.debug("userAddGET 실행");
		model.addAttribute("DepList", sService.getDepCommonVO());
		model.addAttribute("PosList", sService.getPosCommonVO());
		
	}
	
	@PostMapping(value = "/user/add")
	public String userAddPOST(@ModelAttribute UserVO uvo, @RequestParam("dep") String dep, 
			@RequestParam("pos") String pos, 
			@RequestParam("address1") String address1, @RequestParam("address2") String address2, @RequestParam("postcode") String postcode) throws Exception {
		logger.debug("userAddPOST 실행");
		
		uvo.setAddress(address1+","+address2+","+postcode);
		
		// 사원코드는 입사년월일 6자리 + 휴대전화번호 끝 4자리로 자동생성된다.
		logger.debug(uvo.getHiredate().toString());
		String [] hiredateArr = uvo.getHiredate().toString().split("-");
		uvo.setCode(hiredateArr[0].substring(2, 4)+hiredateArr[1]+hiredateArr[2]+uvo.getPhone().substring(7, 11));
		String[] depArr = dep.split(",");
		String[] posArr = pos.split(",");
		
		uvo.setDep_group(depArr[0]);
		uvo.setDep_id(depArr[1]);
		uvo.setPos_group(posArr[0]);
		uvo.setPos_id(posArr[1]);
		int result = sService.registUser(uvo);
		if (result == 1) {
			return "redirect:/system/user/registComplete";
		}
		return "redirect:/system/user/registFail";
	}
	
	@GetMapping(value = "/user/registComplete")
	public void userRegistComplete() {
		logger.debug("userRegistComplete");
	}
	
	@GetMapping(value = "/user/registFail")
	public void userRegistFail() {
		logger.debug("userRegistFail");
	}
	
	@RequestMapping(value = "/user/update", method = RequestMethod.GET)
	public void userUpdateGET(@RequestParam String index, Model model) throws Exception {
		logger.debug("userUpdateGET 실행");
		logger.debug("index : " + index);
		UserVO uvo = new UserVO();
		uvo.setCode(index);
		uvo = sService.getOneUser(uvo);
		String[] addressArr = uvo.getAddress().split(",");
		model.addAttribute("address1", addressArr[0]);
		model.addAttribute("address2", addressArr[1]);
		model.addAttribute("postcode", addressArr[2]);
		model.addAttribute("DepList", sService.getDepCommonVO());
		model.addAttribute("PosList", sService.getPosCommonVO());
		model.addAttribute("vo", uvo);
	}
	
	@PostMapping(value = "/user/update")
	public String userUpdatePOST(@ModelAttribute UserVO uvo, @RequestParam("dep") String dep, 
			@RequestParam("pos") String pos, @RequestParam(name="activeCheckbox",defaultValue = "off") String active, 
			@RequestParam("address1") String address1, @RequestParam("address2") String address2, @RequestParam("postcode") String postcode) throws Exception{
		logger.debug("userUpdatePOST 실행");
		logger.debug("uvo : " + uvo.toString());
		
		uvo.setAddress(address1+","+address2+","+postcode);
		
		String[] depArr = dep.split(",");
		String[] posArr = pos.split(",");
		
		uvo.setDep_group(depArr[0]);
		uvo.setDep_id(depArr[1]);
		uvo.setPos_group(posArr[0]);
		uvo.setPos_id(posArr[1]);
		
		// 사용여부 체크유무에 따라 사용여부 저장
		logger.debug("사용여부 : " + active);
		if(active.equals("on")) {
			uvo.setActive(1);
			logger.debug("사용여부 on, setActive : 1");
		} else {
			uvo.setActive(0);
			logger.debug("사용여부 off, setActive : 0");
		}
		
		int result = sService.updateOneUser(uvo);
		if(result == 1) {
			return "redirect:/system/user/updateComplete";
		} else {
			return "redirect:/system/user/updateFail";
			
		}
	}
	
	@GetMapping(value = "/user/updateComplete")
	public void userUpdateComplete() {
		
	}
	
	@GetMapping(value = "/user/updateFail")
	public void userUpdateFail() {
		
	}
	
	@GetMapping (value = "/user/delete")
	public void userDeleteGET (@RequestParam("indexes") String indexes, 
			Model model) throws Exception{
		logger.debug("userDeleteGET 실행");
		logger.debug("index : " + indexes);
		Map<String,Object> index = new HashMap<String, Object>();
		index.put("indexArray", indexes.split(","));
		// 배열로 mapper에 인자 넘겨주고 List(UserVO)받기
		model.addAttribute("userList", sService.getSomeUsers(index));
	}
	
	
	
	@PostMapping(value = "/user/delete")
	public String userDeletePOST (@RequestParam("codeList") List<String> codeList, Model model) throws Exception{
		logger.debug("userDeletePOST 실행");
		logger.debug("codeList : " + codeList);
		model.addAttribute("result", sService.deleteUser(codeList));
		return "/system/user/deleteComplete";
	}
	
	@GetMapping(value = "/user/deleteComplete")
	public void userDeleteComplete() {
		logger.debug("userDeleteComplete 실행");
	}
	
	@GetMapping(value = "/user/detail")
	public void userDetail(@RequestParam("index") String index, Model model) throws Exception{
		logger.debug("userDetail 실행");
		logger.debug("index : " + index);
		UserVO uvo = new UserVO();
		uvo.setCode(index);
		model.addAttribute("vo", sService.getOneUser(uvo));
	}
	
}
