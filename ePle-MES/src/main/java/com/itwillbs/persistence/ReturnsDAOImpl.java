package com.itwillbs.persistence;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.RequestVO;
import com.itwillbs.domain.ReturnsVO;

@Repository
public class ReturnsDAOImpl implements ReturnsDAO {

	
	private static final Logger logger = LoggerFactory.getLogger(ReturnsDAOImpl.class);
	
	private static final String NAMESPACE="com.itwillbs.mapper.returnsMapper";

	@Override
	public List<ReturnsVO> getReturnsListPage(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ReturnsVO> getReturnsListPage(int page) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getReturnsCount() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ReturnsVO> getReturnsListAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertReturns(ReturnsVO vo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ReturnsVO getReturnsDetail(String code) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int returnsUpdate(ReturnsVO vo, String id) throws Exception {
		// TODO Auto-generated method stub
		
		return 0;
	}

	@Override
	public List<ReturnsVO> searchReturnsAll(ReturnsVO vo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ReturnsVO> getReturnsDetail(String[] code) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteReturns(String[] code) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
}
