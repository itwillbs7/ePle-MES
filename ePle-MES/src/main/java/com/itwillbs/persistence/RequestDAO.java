package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.RequestVO;

public interface RequestDAO {
	
	public List<RequestVO> getRequestListAll () throws Exception;
	
	public void insertRequest(RequestVO vo) throws Exception;
}
