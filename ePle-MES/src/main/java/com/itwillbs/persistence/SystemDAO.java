package com.itwillbs.persistence;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.CommonVO;
import com.itwillbs.domain.UserVO;

public interface SystemDAO {
	
	public void registCommons(CommonVO cvo) throws Exception;
	public List<CommonVO> getCommons() throws Exception;
	public CommonVO getOneCommon(CommonVO cvo) throws Exception;
	public void updateCommon(Map<String, Object> newCommon) throws Exception;
	public void deleteCommon(CommonVO cvo) throws Exception;
	public void userTest();
	public List<UserVO> getAllUsers() throws Exception;
	public List<UserVO> getSomeUsers(Map<String, Object> index) throws Exception;
	public UserVO getOneUser(UserVO uvo) throws Exception;
	public int updateOneUser(UserVO uvo) throws Exception;
	public int deleteUser(Map<String, Object> codeMap) throws Exception;
}
