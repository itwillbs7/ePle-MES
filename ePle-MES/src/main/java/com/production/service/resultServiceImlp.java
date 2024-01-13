package com.production.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.CommonVO;
import com.production.domain.BOMVO;
import com.production.domain.failedVO;
import com.production.domain.inputVO;
import com.production.domain.resultVO;
import com.production.persistence.resultDAO;

@Service
public class resultServiceImlp implements resultService{
	
	private static final Logger logger = LoggerFactory.getLogger(resultServiceImlp.class);
	
	@Inject
	private resultDAO rsDAO;

	@Override
	public List<resultVO> getResultList(String date, String[] line_code, Boolean isFinish) throws Exception {
		return rsDAO.getResultList(date,line_code,isFinish);
	}

	@Override
	public resultVO getResult(String code) throws Exception {
		return rsDAO.getResult(code);
	}

	@Override
	public List<failedVO> getFailedList(String code) throws Exception {
		return rsDAO.getFailedList(code);
	}

	@Override
	public BOMVO getBOM(String code) throws Exception {
		return rsDAO.getBOM(code);
	}

	@Override
	public List<String> getLine_codeList() throws Exception {
		return rsDAO.getLine_codeList();
	}

	@Override
	public void productionStart(String code) throws Exception {
		rsDAO.productionStart(code);
		
	}
	
	@Override
	public void productionComplete(String code) throws Exception {
		rsDAO.productionComplete(code);
		
	}
	@Override
	public void addResult(String code) throws Exception {
		rsDAO.addResult(code);
		
	}

	@Override
	public void insertFailed(failedVO vo) throws Exception {
		rsDAO.insertFailed(vo);
	}

	@Override
	public List<CommonVO> getCode_id() throws Exception {
		return rsDAO.getCode_id();
	}

	@Override
	public void insertInput(inputVO[] vo) throws Exception {
		rsDAO.insertInput(vo);
	}

	@Override
	public List<inputVO> getInput(String code) throws Exception {
		return rsDAO.getInput(code);
	}

	@Override
	public void insertLot(String code) throws Exception {
		rsDAO.insertLot(code);
	}
}
