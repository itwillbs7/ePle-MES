package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.MAPDVO;
import com.itwillbs.persistence.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService{
	
private static final Logger logger = LoggerFactory.getLogger(ProductServiceImpl.class);
	
	@Inject
	private ProductDAO pdao;
	
	@Override
	public List<MAPDVO> ProductListAll() throws Exception {
		logger.debug(" S : productListAll()");
		return pdao.getProductListAll();
	}

	@Override
	public void ProductWrite(MAPDVO vo) throws Exception {
		
	}

	@Override
	public MAPDVO getProduct(int bno) throws Exception {
		return null;
	}

	@Override
	public int ProductModify(MAPDVO vo) throws Exception {
		return 0;
	}

	@Override
	public void incrementViewCnt(int bno) throws Exception {
		
	}

	@Override
	public void ProductRemove(int bno) throws Exception {
		
	}
	
	
}
