package com.production.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.production.domain.instructionVO;
import com.production.domain.requestVO;
import com.production.persistence.productionDAO;

@Service
public class productionServiceImpl implements productionService {
	
	private static final Logger logger = LoggerFactory.getLogger(productionServiceImpl.class);
	
	@Inject
	private productionDAO pdDAO;

	@Override
	public List<instructionVO> getInstruction() throws Exception{
		
		return pdDAO.getInstruction();
	}

	@Override
	public List<String> getProduct() throws Exception {
		return pdDAO.getProduct();
	}

	@Override
	public List<String> getLine_code() throws Exception {
		return pdDAO.getLine_code();
	}

	@Override
	public List<String> getRequest() throws Exception {
		return pdDAO.getRequest();
	}

	@Override
	public List<instructionVO> ajaxSearch(String[] product,String[] line_code,String[] request) throws Exception {
		return pdDAO.ajaxSearch(product,line_code,request);
	}

	@Override
	public List<requestVO> getRequestList() throws Exception {
		return pdDAO.getRequestList();
	}

	@Override
	public List<String> getProductList(String request) throws Exception {
		return pdDAO.getProductList(request);
	}

	@Override
	public int getAmount() throws Exception {
		return pdDAO.getAmount();
	}

	@Override
	public List<String> getLine_codeList() throws Exception {
		return pdDAO.getLine_codeList();
	}

	@Override
	public void insertInstruction(instructionVO instVO) throws Exception {
		pdDAO.insertInstruction(instVO);
	}

	@Override
	public instructionVO getInstruction(int code) throws Exception {
		return pdDAO.getInstruction(code);
	}

	@Override
	public void updateInstruction(instructionVO instVO) throws Exception {
		pdDAO.updateInstruction(instVO);
	}

	@Override
	public void deleteInstruction(String[] code_arr) throws Exception {
		pdDAO.deleteInstruction(code_arr);
	}

	@Override
	public requestVO getRequest(String code) throws Exception {
		return pdDAO.getRequest(code);
	}

}
