package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.RequestVO;
import com.itwillbs.persistence.RequestDAO;

@Service
public class RequestServiceImpl implements RequestService {
	
	private static final Logger logger = LoggerFactory.getLogger(RequestServiceImpl.class);
	
	@Inject
	private RequestDAO rdao;

	@Override
	public List<RequestVO> requestList() throws Exception {
		logger.debug("requestList()");
		return rdao.getRequestListAll();
	}

	@Override
	public void dataInsertRequest(RequestVO vo) throws Exception {
		logger.debug("dataInsertRequest(RequestVO vo) : "+vo);
		rdao.insertRequest(vo);
		
	}
	
	
	
	
}
