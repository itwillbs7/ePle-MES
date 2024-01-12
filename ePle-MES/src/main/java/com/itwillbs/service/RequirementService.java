package com.itwillbs.service;

import java.util.List;

import com.production.domain.BOMVO;
import com.production.domain.ProductVO;
import com.itwillbs.domain.MAPDVO;

public interface RequirementService {
	public List<ProductVO> getProductList() throws Exception;
	
	public ProductVO getProduct(String code) throws Exception;
	
	public List<BOMVO> getBomList(String code) throws Exception;
	
	public int addMaterial(BOMVO vo) throws Exception;
	
	public int updateMaterial(BOMVO vo) throws Exception;
	
	public int deleteMaterial(String[] code) throws Exception;
	
	public List<MAPDVO> getMapdList() throws Exception;
	
	public List<MAPDVO> getMaterialList() throws Exception;
	
	public int getRecentBno() throws Exception;
}