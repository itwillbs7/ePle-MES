package com.itwillbs.persistence.facility;

import java.util.List;

import com.itwillbs.domain.FacilityOrderVO;
import com.itwillbs.domain.MAPDVO;
import com.itwillbs.domain.PageVO;

public interface FacilityOrderDAO {
	// 설비 발주 신청 리스트, 페이징 처리 O, 검색 불필요, 정렬 O
	
	public int getFacilityOrderCount(PageVO vo) throws Exception;
	
	public List<FacilityOrderVO> getFacilityOrderList(PageVO vo) throws Exception;
	
	public int insertFacilityOrder(FacilityOrderVO vo) throws Exception;
	
	public int updateFacilityOrder(FacilityOrderVO vo) throws Exception;
	
	public int deleteFacilityOrder(String[] codeList) throws Exception;
	
	public List<MAPDVO> getMapdList(String group_id) throws Exception;
	
	public String getRecentCode() throws Exception;
	
	public FacilityOrderVO getDetail(String code) throws Exception;
}