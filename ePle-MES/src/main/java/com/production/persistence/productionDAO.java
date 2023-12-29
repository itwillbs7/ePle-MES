package com.production.persistence;

import java.util.List;

import com.production.domain.instructionVO;
import com.production.domain.requestVO;

public interface productionDAO {
	public List<instructionVO> getInstruction() throws Exception;

	public List<String> getProduct() throws Exception;

	public List<String> getLine_code() throws Exception;

	public List<String> getRequest() throws Exception;

	public List<instructionVO> ajaxSearch(String[] product,String[] line_code,String[] request) throws Exception;

	public List<requestVO> getRequestList() throws Exception;

	public List<String> getProductList(String request) throws Exception;

	public int getAmount() throws Exception;

	public List<String> getLine_codeList() throws Exception;

	public void insertInstruction(instructionVO instVO) throws Exception;

	public instructionVO getInstruction(int code) throws Exception;

	public void updateInstruction(instructionVO instVO) throws Exception;
}
