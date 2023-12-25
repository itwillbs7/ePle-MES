package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.RequestSearchVO;
import com.itwillbs.domain.RequestVO;

public interface RequestDAO {
	
	public List<RequestVO> getClientList() throws Exception;

	public List<RequestVO> getRequestListAll () throws Exception;
	
	public void insertRequest(RequestVO vo) throws Exception;
	
	public RequestVO searchClient(RequestSearchVO vo) throws Exception;
}
