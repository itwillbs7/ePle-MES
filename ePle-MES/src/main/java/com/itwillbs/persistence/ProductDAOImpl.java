package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.MAPDVO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	private static final Logger logger = LoggerFactory.getLogger(ProductDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE ="com.itwillbs.mapper.ProductMapper";

	@Override
	public void insertProduct(MAPDVO mvo) throws Exception {
		
	}

	@Override
	public List<MAPDVO> getBoardListAll() throws Exception {
		
		return null;
	}

	@Override
	public MAPDVO getProduct(int bno) throws Exception {
		
		return null;
	}

	@Override
	public int updateProduct(MAPDVO mvo) throws Exception {
		
		return 0;
	}

	@Override
	public void updateViewCnt(int bno) throws Exception {
		
	}

	@Override
	public void deleteProduct(int bno) throws Exception {
		
	}

	@Override
	public List<MAPDVO> getBoardListPage(int page) throws Exception {
		
		return null;
	}

	@Override
	public List<MAPDVO> getBoardListPage(Criteria cri) throws Exception {
		
		return null;
	}

	@Override
	public int getBoardCount() throws Exception {
		
		return 0;
	}


	
	
	
	
	
	
	
	

}
