package com.itwillbs.service.facility;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.LineOffVO;
import com.itwillbs.domain.LineVO;
import com.itwillbs.persistence.facility.OffDAO;

@Service
public class OffServiceImpl implements OffService{
	
	@Inject
	private OffDAO dao;
	
	@Override
	public int insert(List<LineOffVO> vo) throws Exception {
		return dao.insert(vo);
	}
	
	@Override
	public int reservation(List<LineOffVO> vo) throws Exception {
		return dao.reservation(vo);
	}
	
	@Override
	public String getRecentCode() throws Exception {
		return dao.getRecentCode();
	}
	
	@Override
	public int updateEndTime(String[] code) throws Exception {
		return dao.updateEndTime(code);
	}
	
	@Override
	public int setLineOn(String[] code) throws Exception {
		return dao.setLineOn(code);
	}
	
	@Override
	public int setLineOff(String[] code) throws Exception {
		return dao.setLineOff(code);
	}
	
	@Override
	public List<String> getRenewList(String column) throws Exception {
		return dao.getRenewList(column);
	}
	
	@Override
	public List<LineVO> getLineList() throws Exception {
		return dao.getLineList();
	}
	
	@Override
	public List<LineOffVO> getCommonGroup() throws Exception {
		return dao.getCommonGroup();
	}
	
	@Override
	public List<LineOffVO> getCommonCode(String group_id) throws Exception {
		return dao.getCommonCode(group_id);
	}
	
	@Override
	public LineVO getDetail(String code) throws Exception {
		return dao.getDetail(code);
	}
	
	@Override
	public List<LineOffVO> getDetailList(String code) throws Exception {
		return dao.getDetailList(code);
	}
	
	@Override
	public void setLineOffComplete() throws Exception {
		dao.setLineOffComplete();
	}
	
	@Override
	public List<LineOffVO> getReservateList() throws Exception {
		return dao.getReservateList();
	}
	
	@Override
	public LineOffVO getResDetail(String code) throws Exception {
		return dao.getResDetail(code);
	}
	
	@Override
	public List<LineOffVO> getSameInfo(LineOffVO vo) throws Exception {
		return dao.getSameInfo(vo);
	}
	
	@Override
	public int updateRes(Map<String, Object> map) throws Exception {
		return dao.updateRes(map);
	}
	
	@Override
	public int deleteRes(String[] code) throws Exception {
		return dao.deleteRes(code);
	}
}