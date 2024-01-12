package com.production.persistence;

import java.util.List;

import com.production.domain.BOMVO;
import com.production.domain.instructionVO;
import com.production.domain.prodRequestVO;

public interface productionDAO {
	public List<instructionVO> getInstruction() throws Exception;

	public List<String> getProduct() throws Exception;

	public List<String> getLine_code() throws Exception;

	public List<String> getRequest() throws Exception;

	public List<instructionVO> ajaxSearch(String[] product,String[] line_code,String[] request, String[] dateRange) throws Exception;

	public List<prodRequestVO> getRequestList() throws Exception;

	public List<String> getProductList(String request) throws Exception;

	public int getAmount() throws Exception;

	public List<String> getLine_codeList() throws Exception;

	public void insertInstruction(instructionVO instVO) throws Exception;

	public instructionVO getInstruction(int code) throws Exception;

	public void updateInstruction(instructionVO instVO) throws Exception;

	public void disableInstruction(String[] code_arr) throws Exception;

	public requestVO getRequest(String code) throws Exception;

	public List<BOMVO> getBOM(String mapd_code) throws Exception;
}
