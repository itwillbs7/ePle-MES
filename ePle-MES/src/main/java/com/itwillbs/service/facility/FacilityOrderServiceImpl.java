package com.itwillbs.service.facility;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.FacilityOrderVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.persistence.facility.FacilityOrderDAO;

@Service
public class FacilityOrderServiceImpl implements FacilityOrderService{
	
	@Inject
	private FacilityOrderDAO dao;
	
	@Override
	public int getListCount(PageVO vo) throws Exception {
		return dao.getFacilityOrderCount(vo);
	}
	
	@Override
	public List<FacilityOrderVO> getList(PageVO vo) throws Exception {
		return dao.getFacilityOrderList(vo);
	}
	
	@Override
	public int insertOrder(FacilityOrderVO vo) throws Exception {
		return dao.insertFacilityOrder(vo);
	}
	
	@Override
	public int updateOrder(FacilityOrderVO vo) throws Exception {
		return dao.updateFacilityOrder(vo);
	}
	
	@Override
	public int deleteOrder(String[] codeList) throws Exception{
		return dao.deleteFacilityOrder(codeList);
	}
	
	@Override
	public List<FacilityOrderVO> getCommonList(String group_id) throws Exception {
		return dao.getCommonList(group_id);
	}

	@Override
	public String getRecentCode() throws Exception {
		return dao.getRecentCode();
	}
	
	@Override
	public FacilityOrderVO getDetail(String code) throws Exception {
		return dao.getDetail(code);
	}
}
