package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.RequestSearchVO;
import com.itwillbs.domain.RequestVO;

public interface RequestDAO {
	// 수주리스트
	public List<RequestVO> getRequestListAll () throws Exception;
	// 수주등록
	public void insertRequest(RequestVO vo) throws Exception;
	// 수주상세보기
	public RequestVO getRequestDetail(String code) throws Exception;
	//회사리스트
	public List<RequestVO> getClientList() throws Exception;
	//회사검색
	public List<RequestVO> searchClient(RequestSearchVO vo) throws Exception;
}
