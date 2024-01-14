package com.itwillbs.persistence;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MAPDVO;
import com.itwillbs.domain.PageVO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	private static final Logger logger = LoggerFactory.getLogger(ProductDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE ="com.itwillbs.mapper.ProductMapper";

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
		sqlSession.delete(NAMESPACE+".deleteFromWareHouse",codes);
        return sqlSession.delete(NAMESPACE + ".deleteProducts", codes);
    }

	@Override
	public int insertProduct(MAPDVO mvo) throws Exception {
		
		String code_id = mvo.getCode_id();
		if(code_id.equals("003")) {
			sqlSession.insert(NAMESPACE+".insertWareHouse",mvo);		
		}
		
		return sqlSession.insert(NAMESPACE+".insertProduct", mvo);
	}


    @Override
    public List<MAPDVO> getInfo(String[] codes) throws Exception {
        return sqlSession.selectList(NAMESPACE + ".getInfo", codes);
    }

	@Override
	public MAPDVO infoProduct(String code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".infoProduct", code);
	}
	
	@Override
	public List<MAPDVO> getProductListPage(int page) throws Exception {

		page = (page - 1) * 10;
		
		return sqlSession.selectList(NAMESPACE + ".listPage",page);
	}

	@Override
	public List<MAPDVO> getProductListPage(PageVO vo) throws Exception {
		List<MAPDVO> list = new ArrayList<MAPDVO>();
				list = sqlSession.selectList(NAMESPACE + ".listPage", vo);
				
				return list;
	}

	@Override
	public int getProductCount(PageVO vo) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".countProduct", vo);
	}
	
	@Override
	public List<MAPDVO> getCommonList(String group_id) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getCommonList", group_id);
	}
	
	@Override
	public String getRecentCode() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getRecentCode");
	}
}
