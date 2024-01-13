package com.itwillbs.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.UserVO;
import com.itwillbs.persistence.MainDAOImpl;

@Service
public class MainServiceImpl implements MainService {
	
	private static final Logger logger = LoggerFactory.getLogger(MainServiceImpl.class);
	@Inject
	private MainDAOImpl mdao;
	
	@Override
	public UserVO getUserInfo(UserVO uvo) throws Exception {
		logger.debug("getUserInfo");
		
		return mdao.getUserInfo(uvo);
	}

}
