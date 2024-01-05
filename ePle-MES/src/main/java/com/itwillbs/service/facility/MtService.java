package com.itwillbs.service.facility;

import java.util.List;

import com.itwillbs.domain.FacMtVO;

public interface MtService {
	// 최근 코드 들고오기
	public String getRecentCode(String code) throws Exception;
	
	// status
	public List<FacMtVO> getStatusList() throws Exception;
	public List<FacMtVO> getOrderList() throws Exception;
	public int getOrderCount() throws Exception;
	
	// detail
	// 보전 신청 목록
	public int getMtListCount(String code) throws Exception;
	public List<FacMtVO> getMtList(String code) throws Exception;
	
	// 보전 완룍 목록
	// 일상 보전
	public int getRoutineCount(String code) throws Exception;
	public List<FacMtVO> getRoutineList(String code) throws Exception;
	
	// 사후 보전
	public int getResultCount(String code) throws Exception;
	public List<FacMtVO> getResultList(String code) throws Exception;
	
	public int insertRoutine(FacMtVO vo) throws Exception;
	public int setResult(FacMtVO vo) throws Exception;
	
	// list(직원)
	public List<FacMtVO> getInsertedList(String emp_code) throws Exception;
	
	public int insertProblem(FacMtVO vo) throws Exception;
	public int updateProblem(FacMtVO vo) throws Exception;
	public int deleteProblem(String code) throws Exception;
}