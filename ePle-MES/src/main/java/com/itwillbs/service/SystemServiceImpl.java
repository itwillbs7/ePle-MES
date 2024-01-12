package com.itwillbs.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.CommonVO;
import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.UserVO;
import com.itwillbs.persistence.SystemDAOImpl;
@Service
public class SystemServiceImpl implements SystemService {

	
	private static final Logger logger = LoggerFactory.getLogger(SystemServiceImpl.class);
	
	@Inject
	private SystemDAOImpl sdao;

	@Override
	public void registCommons(CommonVO cvo) throws Exception {
		logger.debug("ss : registCommons 실행");
		logger.debug("cvo : " + cvo);
		logger.debug("sdao : " + sdao);
		sdao.registCommons(cvo);
	}

	@Override
	public List<CommonVO> getCommons() throws Exception {
		logger.debug("getCommons 실행");
		return sdao.getCommons();
	}

	@Override
	public CommonVO getOneCommon(CommonVO cvo) throws Exception {
		logger.debug("getCommons 실행");
		return sdao.getOneCommon(cvo);
	}
	
	@Override
	public List<CommonVO> getSomeCommons(Map<String, Object> index) throws Exception {
		// TODO Auto-generated method stub
		logger.debug("getSomeCommons 실행");
		return sdao.getSomeCommons(index);
	}

	@Override
	public List<String> getDistinctCommon(String category) throws Exception {
		// TODO Auto-generated method stub
		logger.debug("getDistinctCommon 실행");
		return sdao.getDistinctCommon(category);
	}

	@Override
	public void updateCommon(Map<String, Object> newCommon) throws Exception {
		
		logger.debug("updateCommon 실행");
		logger.debug("cvoList : " + newCommon.toString());
		sdao.updateCommon(newCommon);
		
	}

	@Override
	public void deleteCommon(CommonVO cvo) throws Exception {
		logger.debug("deleteCommon 실행");
		logger.debug("cvo : " + cvo.toString());
		sdao.deleteCommon(cvo);
		
	}

	@Override
	public int deleteSomeCommons(Map<String, Object> indexMap) throws Exception {
		// TODO Auto-generated method stub
		logger.debug("deleteSomeCommons 실행");
		return sdao.deleteSomeCommons(indexMap);
	}

	@Override
	public int registUser(UserVO uvo) throws Exception {
		// TODO Auto-generated method stub
		logger.debug("registUser 실행");
		return sdao.registUser(uvo);
	}

	@Override
	public List<UserVO> getAllUsers() throws Exception {
		logger.debug("getUsers 실행");
		return sdao.getAllUsers();
	}

	@Override
	public UserVO getOneUser(UserVO uvo) throws Exception {
		logger.debug("getOneUser 실행");
		
		return sdao.getOneUser(uvo);
	}

	@Override
	public List<UserVO> getSomeUsers(Map<String, Object> index) throws Exception {
		logger.debug("getSomeUsers 실행");
		return sdao.getSomeUsers(index);
	}
	
	@Override
	public int updateOneUser(UserVO uvo) throws Exception {
		logger.debug("updateOneUser 실행");
		return sdao.updateOneUser(uvo);
	}

	@Override
	public int deleteUser(List<String> codeList) throws Exception {
		logger.debug("deleteUser 실행");
		Map<String, Object> codeMap = new HashMap<String, Object>();
		codeMap.put("codeList", codeList);
		return sdao.deleteUser(codeMap);
	}

	@Override
	public List<CommonVO> getKeywordCommons(Map<String, Object> categoryAndKeyword) throws Exception {
		logger.debug("getKeywordCommons 실행");
		return sdao.getKeyWordCommons(categoryAndKeyword);
	}
	
	@Override
	public List<CommonVO> getKeywordCommonsPage(Map<String, Object> searchDataMap) throws Exception {
		logger.debug("getKeywordCommonsPage 실행");
		return sdao.getKeywordCommonsPage(searchDataMap);
	}

	@Override
	public List<UserVO> getKeywordUsersPage(Map<String, Object> searchDataMap) throws Exception {
		logger.debug("getKeywordUsersPage 실행");
		return sdao.getKeyWordUsersPage(searchDataMap);
	}

	@Override
	public List<CommonVO> getCommonListPage(Criteria cri) throws Exception {
		logger.debug("getCommonListPage 실행");
		logger.debug("cri : " + cri.toString());
		return sdao.getCommonListPage(cri);
	}
	
	@Override
	public List<UserVO> getUserListPage(Criteria cri) throws Exception {
		logger.debug("getUserListPage 실행");
		logger.debug("cri : " + cri.toString());
		return sdao.getUserListPage(cri);
	}

	@Override
	public int getCommonTotalCount() throws Exception {
		logger.debug("getCommonTotalCount 실행");
		return sdao.getCommonTotalCount();
	}
	
	@Override
	public int getUserTotalCount() throws Exception {
		logger.debug("getUserTotalCount 실행");
		return sdao.getUserTotalCount();
	}

	@Override
	public int getCommonSearchCount(Map<String, Object> categoryAndKeyword) throws Exception {
		// TODO Auto-generated method stub
		logger.debug("getCommonSearchCount 실행");
		return sdao.getCommonSearchCount(categoryAndKeyword);
	}
	
	@Override
	public int getUserSearchCount(Map<String, Object> categoryAndKeyword) throws Exception {
		// TODO Auto-generated method stub
		logger.debug("getUserSearchCount 실행");
		return sdao.getUserSearchCount(categoryAndKeyword);
	}

	@Override
	public List<CommonVO> getDepCommonVO() throws Exception {
		// TODO Auto-generated method stub
		logger.debug("getDepCodenames 실행");
		return sdao.getDepCommonVO();
	}

	@Override
	public List<CommonVO> getPosCommonVO() throws Exception {
		// TODO Auto-generated method stub
		logger.debug("getPosCodenames 실행");
		return sdao.getPosCommonVO();
	}

	@Override
	public int duplicateIDCheck(String id) throws Exception {
		// TODO Auto-generated method stub
		logger.debug("duplicateIDCheck 실행");
		
		// Map에 input 값 저장 후 dao 실행
		Map<String, Object> idMap = new HashMap<String, Object>();
		idMap.put("id", id);
		
		return sdao.duplicateIDCheck(idMap);
	}

	@Override
	public int duplicateEmailCheck(String email) throws Exception {
		// TODO Auto-generated method stub
		logger.debug("duplicateEmailCheck 실행");
		
		// Map에 input 값 저장 후 dao 실행
		Map<String, Object> emailMap = new HashMap<String, Object>();
		emailMap.put("email", email);
		return sdao.duplicateEmailCheck(emailMap);
	}

	@Override
	public int duplicatePhoneCheck(String phone) throws Exception {
		// TODO Auto-generated method stub
		logger.debug("duplicatePhoneCheck 실행");
		
		// Map에 input 값 저장 후 dao 실행
		Map<String, Object> phoneMap = new HashMap<String, Object>();
		phoneMap.put("phone", phone);
		return sdao.duplicatePhoneCheck(phoneMap);
	}

	@Override
	public int duplicateCommonCheck(CommonVO cvo) throws Exception {
		// TODO Auto-generated method stub
		logger.debug("duplicateCommonCheck 실행");
		return sdao.duplicateCommonCheck(cvo);
	}

	
	
	
	
}
