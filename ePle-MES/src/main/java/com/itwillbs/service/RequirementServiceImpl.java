package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.production.domain.BOMVO;
import com.production.domain.ProductVO;
import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.MAPDVO;
import com.itwillbs.persistence.RequirementDAO;

@Service
public class RequirementServiceImpl implements RequirementService {
	
	private static final Logger logger = LoggerFactory.getLogger(RequirementServiceImpl.class);
	
	@Inject
	private RequirementDAO dao;
	
	@Override
	public List<ProductVO> getProductList() throws Exception {
		return dao.getProductList();
	}
	
	@Override
	public ProductVO getProduct(String code) throws Exception {
		return dao.getProduct(code);
	}
	
	@Override
	public List<BOMVO> getBomList(String code) throws Exception {
		return dao.getBomList(code);
	}
	
	@Override
	public int addMaterial(BOMVO vo) throws Exception {
		return dao.addMaterial(vo);
	}
	
	@Override
	public int updateMaterial(BOMVO vo) throws Exception {
		return dao.updateMaterial(vo);
	}
	
	@Override
	public int deleteMaterial(String[] code) throws Exception {
		return dao.deleteMaterial(code);
	}
	
	@Override
	public List<MAPDVO> getMapdList() throws Exception {
		return dao.getMapdList();
	}
	
	@Override
	public List<MAPDVO> getMaterialList() throws Exception {
		return dao.getMaterialList();
	}
	
	@Override
	public int getRecentBno() throws Exception {
		return dao.getRecentBno();
	}
}
