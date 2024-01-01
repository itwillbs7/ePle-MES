package com.production.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.production.domain.resultVO;
import com.production.persistence.resultDAO;

@Service
public class resultServiceImlp implements resultService{
	
	private static final Logger logger = LoggerFactory.getLogger(resultServiceImlp.class);
	
	@Inject
	private resultDAO rsDAO;

	@Override
	public List<resultVO> getResultList(Timestamp date, String line_code, Boolean isFinish) throws Exception {
		return rsDAO.getResultList(date,line_code,isFinish);
	}

}
