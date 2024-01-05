package com.itwillbs.service.facility;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.FacilityVO;
import com.itwillbs.domain.FacMtVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.persistence.facility.MtDAO;

@Service
public class MtServiceImpl implements MtService {

	@Inject
	private MtDAO dao;
	
	@Override
	public String getRecentCode(String code) throws Exception {
		return dao.getRecentCode(code);
	}
	
	@Override
	public List<FacMtVO> getStatusList() throws Exception {
		return dao.getStatusList();
	}
	
	@Override
	public List<FacMtVO> getOrderList() throws Exception {
		return dao.getOrderList();
	}
	@Override
	public int getOrderCount() throws Exception {
		return dao.getOrderCount();
	}
	
	@Override
	public List<FacMtVO> getMtList(String code) throws Exception {
		return dao.getMtList(code);
	}
	
	@Override
	public int getMtListCount(String code) throws Exception {
		return dao.getMtListCount(code);
	}
	
	@Override
	public List<FacMtVO> getResultList(String code) throws Exception {
		return dao.getResultList(code);
	}
	
	@Override
	public int getResultCount(String code) throws Exception {
		return dao.getResultCount(code);
	}
	
	@Override
	public List<FacMtVO> getRoutineList(String code) throws Exception {
		return dao.getRoutineList(code);
	}
	
	@Override
	public int getRoutineCount(String code) throws Exception {
		return dao.getRoutineCount(code);
	}
	
	@Override
	public int insertRoutine(FacMtVO vo) throws Exception {
		return dao.insertRoutine(vo);
	}
	
	@Override
	public int setResult(FacMtVO vo) throws Exception {
		return dao.setResult(vo);
	}
	
	
	@Override
	public List<FacMtVO> getInsertedList(String emp_code) throws Exception {
		return dao.getInsertedList(emp_code);
	}
	
	@Override
	public FacMtVO getInfo(String code) throws Exception {
		return dao.getInfo(code);
	}
	
	@Override
	public int insertProblem(FacMtVO vo) throws Exception {
		return dao.insertProblem(vo);
	}
	
	@Override
	public int updateProblem(FacMtVO vo) throws Exception {
		return dao.updateProblem(vo);
	}
	
	@Override
	public int deleteProblem(String code) throws Exception {
		return dao.deleteProblem(code);
	}
}
