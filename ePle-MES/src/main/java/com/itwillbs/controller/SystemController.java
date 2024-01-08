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
import com.itwillbs.domain.UserVO;
import com.itwillbs.service.SystemServiceImpl;

@Controller
@RequestMapping (value = "/system/*")
public class SystemController {

	
	private static final Logger logger = LoggerFactory.getLogger(SystemController.class);
	@Inject
	private SystemServiceImpl sService;
	
	@GetMapping(value = "/common/main")
	public void commonMain(Model model) throws Exception {
		logger.debug("common 실행");
		// DB로 가서 공통코드 데이터 몽땅 들고오기
		logger.debug("공통코드 리스트 : " + sService.getCommons().toString());
		model.addAttribute("CommonVO",sService.getCommons());
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
	
	@GetMapping(value = "/user/main")
	public void userMain(Model model) throws Exception {
		logger.debug("userMain 실행");
		// DB로 가서 공통코드 데이터 몽땅 들고오기
		model.addAttribute("UserVO", sService.getAllUsers());
	}
	
	@GetMapping (value = "/user/add")
	public void userAddGET() {
		logger.debug("userAddGET 실행");
		
	}
	
	@PostMapping(value = "/user/add")
	public String userAddPOST() {
		logger.debug("userAddPOST 실행");
		return "redirect:/system/user/registComplete";
	}
	
	@GetMapping(value = "/user/registComplete")
	public void userRegistComplete() {
		logger.debug("userRegistComplete");
	}
	
	@RequestMapping(value = "/user/update", method = RequestMethod.GET)
	public void userUpdateGET(@RequestParam String index, Model model) throws Exception {
		logger.debug("userUpdateGET 실행");
		logger.debug("index : " + index);
		UserVO uvo = new UserVO();
		uvo.setCode(index);
		model.addAttribute("vo", sService.getOneUser(uvo));
	}
	
	@PostMapping(value = "/user/update")
	public String userUpdatePOST(@ModelAttribute UserVO uvo) throws Exception{
		logger.debug("userUpdatePOST 실행");
		logger.debug("uvo : " + uvo.toString());
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
