package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.CommonVO;
import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.UserVO;

public interface SystemService {
	
	public void registCommons(CommonVO cvo) throws Exception;
	public List<CommonVO> getCommons() throws Exception;
	public CommonVO getOneCommon(CommonVO cvo) throws Exception;
	public void updateCommon(Map<String, Object> newCommon) throws Exception; 
	public void deleteCommon(CommonVO cvo) throws Exception;
	public int registUser(UserVO uvo) throws Exception;
	public List<UserVO> getAllUsers() throws Exception;
	public List<UserVO> getSomeUsers(Map<String, Object> index) throws Exception;
	public UserVO getOneUser(UserVO uvo) throws Exception;
	public int updateOneUser(UserVO uvo) throws Exception;
	public int deleteUser(List<String> codeList) throws Exception;
	public List<CommonVO> getKeywordCommons(Map<String, Object> categoryAndKeyword) throws Exception;
	public List<UserVO> getKeywordUsersPage(Map<String, Object> searchDataMap) throws Exception;
	public List<UserVO> getUserListPage(Criteria cri) throws Exception;
	public int getUserTotalCount() throws Exception;
	public int getUserSearchCount(Map<String, Object> categoryAndKeyword) throws Exception;
	public List<CommonVO> getDepCommonVO() throws Exception;
	public List<CommonVO> getPosCommonVO() throws Exception;
}
