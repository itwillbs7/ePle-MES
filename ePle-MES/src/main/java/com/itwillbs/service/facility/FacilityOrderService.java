package com.itwillbs.service.facility;

import java.util.List;

import com.itwillbs.domain.FacilityOrderVO;
import com.itwillbs.domain.PageVO;

public interface FacilityOrderService {
	public List<FacilityOrderVO> getList(PageVO vo) throws Exception;
	public int insertOrder(FacilityOrderVO vo) throws Exception;
	public int updateOrder(FacilityOrderVO vo) throws Exception;
	public int deleteOrder(String[] codeList) throws Exception;
	public FacilityOrderVO getOrder(FacilityOrderVO vo) throws Exception;
	public List<FacilityOrderVO> getCommonList(String group_id) throws Exception;
	public String getRecentCode() throws Exception;
}