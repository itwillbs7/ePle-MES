package com.itwillbs.persistence;

import com.itwillbs.domain.UserVO;

public interface MainDAO {
	
	public UserVO getUserInfo(UserVO uvo) throws Exception;
	
	
}
