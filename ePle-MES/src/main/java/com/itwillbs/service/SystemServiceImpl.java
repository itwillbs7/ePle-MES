package com.itwillbs.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.CommonVO;
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

	
	
	
	
}
