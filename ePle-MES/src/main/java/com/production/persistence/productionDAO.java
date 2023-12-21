package com.production.persistence;

import java.util.List;

import com.production.domain.ajaxSearchVO;
import com.production.domain.instructionVO;

public interface productionDAO {
	public List<instructionVO> getInstruction() throws Exception;

	public List<String> getProduct() throws Exception;

	public List<String> getLine_code() throws Exception;

	public List<String> getRequest() throws Exception;

	public List<instructionVO> ajaxSearch(ajaxSearchVO vo) throws Exception;
}
