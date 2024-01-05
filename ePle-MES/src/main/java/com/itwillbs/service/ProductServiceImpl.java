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
	public List<MAPDVO> productListAll() throws Exception {
		logger.debug(" S : productListAll() ");
		return pdao.getProductListAll();
	}

	@Override
	public MAPDVO getProduct(String code) throws Exception {
		logger.debug(" S : getProduct(String code) ");
		return pdao.getProduct(code);
	}

	@Override
	public int productModify(MAPDVO mvo) throws Exception {
		logger.debug(" S : productModify(MAPDVO mvo) ");
		return pdao.updateProduct(mvo);
	}

	@Override
	public void productRemove(String code) throws Exception {
		logger.debug(" S : productRemove(String code) ");
		pdao.deleteProduct(code);
	}

	@Override
	public List<MAPDVO> productListPage(Criteria cri) throws Exception {
		logger.debug(" S : productListPage(Criteria cri) ");
		return pdao.getProductListPage(cri);
	}

	@Override
	public int totalProductCount() throws Exception {
		logger.debug(" S : totalProductCount() ");
		return pdao.getProductCount();
	}

	@Override
	public void productWrite(MAPDVO mvo) throws Exception {
		logger.debug(" S : productWrite(MAPDVO mvo) ");
	}
	
	
}
