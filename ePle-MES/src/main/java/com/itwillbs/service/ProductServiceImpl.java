package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.MAPDVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.persistence.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductServiceImpl.class);
	
	@Inject
	private ProductDAO pdao;

	@Override
	public MAPDVO getProduct(String code) throws Exception {
		logger.debug(" S : getProduct(String code) ");
		return pdao.getProduct(code);
	}

	@Override
	public int productUpdate(MAPDVO mvo) throws Exception {
		logger.debug(" S : productUpdate(MAPDVO mvo) ");
		return pdao.updateProduct(mvo);
	}

    @Override
    public int deleteProducts(String[] codes) throws Exception {
        return pdao.deleteProducts(codes);
    }
	
    @Override
    public List<MAPDVO> getInfo(String[] codes) throws Exception {
        return pdao.getInfo(codes);
    }

	@Override
	public int InsertProduct(MAPDVO mvo) throws Exception {
		return pdao.insertProduct(mvo);
	}

	@Override
	public MAPDVO infoProduct(String code) throws Exception {
		return pdao.infoProduct(code);
	}

	@Override
	public List<MAPDVO> productListPage(PageVO vo) throws Exception {
		return pdao.getProductListPage(vo);
	}

	@Override
	public int totalProductCount() throws Exception {
		return pdao.getProductCount();
	}

}
