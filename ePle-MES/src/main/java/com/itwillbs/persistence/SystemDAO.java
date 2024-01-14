package com.itwillbs.persistence;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.CommonVO;
import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.UserVO;

public interface SystemDAO {
	
	public void registCommons(CommonVO cvo) throws Exception;
	public List<CommonVO> getCommons() throws Exception;
	public CommonVO getOneCommon(CommonVO cvo) throws Exception;
	public List<CommonVO> getSomeCommons(Map<String, Object> index) throws Exception;
	public List<String> getDistinctCommon(String category) throws Exception;
	public void updateCommon(Map<String, Object> newCommon) throws Exception;
	public void deleteCommon(CommonVO cvo) throws Exception;
	public int deleteSomeCommons(Map<String, Object> indexMap) throws Exception;
	public List<CommonVO> getKeyWordCommons(Map<String, Object> categoryAndKeyword) throws Exception;
	public List<CommonVO> getPosCommonVO() throws Exception;
	public List<CommonVO> getDepCommonVO() throws Exception;
	public List<CommonVO> getCommonListPage(Criteria cri) throws Exception;
	public int getCommonTotalCount() throws Exception;
	public List<CommonVO> getKeywordCommonsPage(Map<String, Object> searchDataMap) throws Exception;
	public int getCommonSearchCount (Map<String, Object> categoryAndKeyword) throws Exception;
	public int duplicateCommonCheck(CommonVO cvo) throws Exception;
	
	
	public int registUser(UserVO uvo) throws Exception;
	public List<UserVO> getAllUsers() throws Exception;
	public List<UserVO> getSomeUsers(Map<String, Object> index) throws Exception;
	public UserVO getOneUser(UserVO uvo) throws Exception;
	public int updateOneUser(UserVO uvo) throws Exception;
	public int deleteUser(Map<String, Object> codeMap) throws Exception;
	public List<UserVO> getUserListPage(Criteria cri) throws Exception;
	public List<UserVO> getKeyWordUsersPage(Map<String, Object> searchDataMap) throws Exception;
	public int getUserTotalCount() throws Exception;
	public int getUserSearchCount(Map<String, Object> categoryAndKeyword) throws Exception;
	public int duplicateIDCheck(Map<String, Object> idMap) throws Exception;
	public int duplicateEmailCheck(Map<String, Object> emailMap) throws Exception;
	public int duplicatePhoneCheck(Map<String, Object> phoneMap) throws Exception;
}
