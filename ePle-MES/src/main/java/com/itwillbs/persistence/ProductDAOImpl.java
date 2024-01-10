package com.itwillbs.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		return sqlSession.selectOne(NAMESPACE + ".getProduct",code);
	}

	@Override
	public int updateProduct(MAPDVO mvo) throws Exception {
		return sqlSession.update(NAMESPACE +".updateProduct", mvo);
	}

	@Override
    public int deleteProducts(String[] codes) {
        return sqlSession.delete(NAMESPACE + ".deleteProducts", codes);
    }

	@Override
	public int insertProduct(MAPDVO mvo) throws Exception {
		return sqlSession.insert(NAMESPACE+".insertProduct", mvo);
	}


    @Override
    public List<MAPDVO> getInfo(String[] codes) throws Exception {
        return sqlSession.selectList(NAMESPACE + ".getInfo", codes);
    }

	// 품목 검색 팝업 
	@Override
	public List<MAPDVO> SearchProduct(Criteria cri, String mapdCode, String mapdName) throws Exception {
		Map<String,Object> data = new HashMap<String,Object>();
		data.put("cri", cri);
		data.put("mapdCode", mapdCode);
		data.put("mapdName", mapdName);
		List<MAPDVO> SearchProduct = sqlSession.selectList(NAMESPACE + ".SearchProduct",data);
		return SearchProduct;
	}
	
	// 모든 품목 수
	@Override
	public int getProductCount(String mapdCode, String mapdName) throws Exception {
		Map<String,Object> data = new HashMap<String,Object>();
		data.put("mapdCode", mapdCode);
		data.put("mapdName", mapdName);
		return sqlSession.selectOne(NAMESPACE + ".countProduct",data);
	}
    
    
}
