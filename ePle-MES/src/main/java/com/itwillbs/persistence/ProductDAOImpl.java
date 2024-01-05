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
	public List<MAPDVO> getProductListAll() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".selectProductList");
	}

	@Override
	public MAPDVO getProduct(String code) throws Exception {
		return null;
	}

	@Override
	public int updateProduct(MAPDVO mvo) throws Exception {
		return 0;
	}

	@Override
	public void deleteProduct(String code) throws Exception {
	}

	@Override
	public List<MAPDVO> getProductListPage(Criteria cri) throws Exception {
		return null;
	}

	@Override
	public int getProductCount() throws Exception {
		return 0;
	}

}
