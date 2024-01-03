package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.ReturnsVO;

public interface ReturnsService {

	public List<ReturnsVO> returnsListpage(Criteria cri)throws Exception;

	public int getTotal()throws Exception;

}
