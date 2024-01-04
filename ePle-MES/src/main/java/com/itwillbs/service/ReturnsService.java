package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.RequestVO;
import com.itwillbs.domain.ReturnsVO;

public interface ReturnsService {

	public List<ReturnsVO> returnsListpage(Criteria cri)throws Exception;

	public int getTotal()throws Exception;

	public ReturnsVO getinfo(String code)throws Exception;

	public List<ReturnsVO> findReturnsList(ReturnsVO vo)throws Exception;

	public int dataInsertReturns(ReturnsVO vo)throws Exception;

	public int deleteReturns(String[] code)throws Exception;

	public List<ReturnsVO> getinfo(String[] code)throws Exception;

	public int updateReturns(ReturnsVO vo, String id)throws Exception;

}
