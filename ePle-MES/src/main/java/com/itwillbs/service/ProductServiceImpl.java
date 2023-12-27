package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.MAPDVO;
import com.itwillbs.persistence.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductServiceImpl.class);
	
	@Inject
	private ProductDAO pdao;

	@Override
	public void productWrite(MAPDVO mvo) throws Exception {
		logger.debug(" S : productWrite(MAPDVO mvo) ");
	}

	@Override
	public List<MAPDVO> productListAll() throws Exception {
		logger.debug(" S : productListAll() ");
		return null;
	}

	@Override
	public MAPDVO getProduct(int bno) throws Exception {
		logger.debug(" S : getProduct(int bno) ");
		return null;
	}

	@Override
	public int productModify(MAPDVO mvo) throws Exception {
		logger.debug(" S : productModify(MAPDVO mvo) ");
		return 0;
	}

	@Override
	public void incrementViewCnt(int bno) throws Exception {
		logger.debug(" S : incrementViewCnt(int bno) ");
		
	}

	@Override
	public void productRemove(int bno) throws Exception {
		logger.debug(" S : productRemove(int bno) ");
	}

	@Override
	public List<MAPDVO> productListPage(Criteria cri) throws Exception {
		logger.debug(" S : productListPage(Criteria cri) ");
		return null;
	}

	@Override
	public int totalProductCount() throws Exception {
		logger.debug(" S : totalProductCount() ");
		return 0;
	}
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
}
