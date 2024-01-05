package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.ReturnsVO;
import com.itwillbs.persistence.ReturnsDAO;

@Service
public class ReturnsServiceImpl implements ReturnsService {

	
	private static final Logger logger = LoggerFactory.getLogger(ReturnsServiceImpl.class);
	
	@Inject
	private ReturnsDAO rdao;

	@Override
	public List<ReturnsVO> returnsListpage(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotal() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
	
}
