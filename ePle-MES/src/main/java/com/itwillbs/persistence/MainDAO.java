package com.itwillbs.persistence;

import java.util.HashMap;
import java.util.List;

import com.itwillbs.domain.UserVO;

public interface MainDAO {
	
	public UserVO getUserInfo(UserVO uvo) throws Exception;
	
	public List<HashMap<String, Object>> getWeeklyProduction() throws Exception;
}
