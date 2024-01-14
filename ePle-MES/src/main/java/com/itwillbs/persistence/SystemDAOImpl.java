package com.itwillbs.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.CommonVO;
import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.UserVO;

@Repository
public class SystemDAOImpl implements SystemDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(SystemDAOImpl.class);
	private final String NAMESPACE = "com.itwillbs.mapper.systemMapper";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void registCommons(CommonVO cvo) throws Exception {
		logger.debug("dd : registCommons 실행");
		logger.debug("dd : sqlSession = " + sqlSession);
		sqlSession.selectOne(NAMESPACE+".insertCommons", cvo);
		
	}

	@Override
	public List<CommonVO> getCommons() throws Exception {
		logger.debug("getCommons 실행");
		return sqlSession.selectList(NAMESPACE+".selectCommons");
	}

	@Override
	public CommonVO getOneCommon(CommonVO cvo) throws Exception {
		logger.debug("getOneCommon 실행");
		logger.debug("cvo : " + sqlSession.selectOne(NAMESPACE+".selectOneCommon", cvo));
		return sqlSession.selectOne(NAMESPACE+".selectOneCommon", cvo);
	}
	
	@Override
	public List<CommonVO> getSomeCommons(Map<String, Object> index) throws Exception {
		logger.debug("getSomeCommons 실행");
		return sqlSession.selectList(NAMESPACE+".selectSomeCommons", index);
	}

	@Override
	public List<String> getDistinctCommon(String category) throws Exception {
		// TODO Auto-generated method stub
		logger.debug("getDistinctCommon 실행");
		logger.debug("category : " + category);
		return sqlSession.selectList(NAMESPACE+".selectDistinctCommon", category);
	}

	@Override
	public void updateCommon(Map<String, Object> newCommon) throws Exception {
		
		logger.debug("updateCommon 실행");
		logger.debug("cvoList : " + newCommon.toString());
		sqlSession.update(NAMESPACE+".updateCommon", newCommon);
		
	}

	@Override
	public void deleteCommon(CommonVO cvo) throws Exception {
		
		logger.debug("deleteCommon 실행");
		logger.debug("cvo : " + cvo.toString());
		sqlSession.delete(NAMESPACE+".deleteCommon", cvo);
	}

	@Override
	public int deleteSomeCommons(Map<String, Object> indexMap) throws Exception {
		// TODO Auto-generated method stub
		logger.debug("deleteSomeCommons 실행");
		return sqlSession.delete(NAMESPACE+".deleteSomeCommons", indexMap);
	}

	@Override
	public int registUser(UserVO uvo) throws Exception {
		// TODO Auto-generated method stub
		logger.debug("registUser 실행");
		return sqlSession.insert(NAMESPACE+".insertUser", uvo);
	}

	@Override
	public List<UserVO> getAllUsers() throws Exception {
		logger.debug("getUsers 실행");
		return sqlSession.selectList(NAMESPACE+".selectAllUsers");
	}

	@Override
	public UserVO getOneUser(UserVO uvo) throws Exception {
		logger.debug("getOneUser 실행");
		return sqlSession.selectOne(NAMESPACE+".selectOneUser", uvo);
	}
	
	@Override
	public List<UserVO> getSomeUsers(Map<String, Object> index) throws Exception {
		logger.debug("getSomeUsers 실행");
		return sqlSession.selectList(NAMESPACE+".selectSomeUsers", index);
	}

	@Override
	public int updateOneUser(UserVO uvo) throws Exception {
		logger.debug("updateOneUser 실행");
		return sqlSession.update(NAMESPACE+".updateOneUser", uvo);
	}

	@Override
	public int deleteUser(Map<String, Object> codeMap) throws Exception {
		logger.debug("deleteUser 실행");
		return sqlSession.delete(NAMESPACE+".deleteUser", codeMap);
	}

	@Override
	public List<CommonVO> getKeyWordCommons(Map<String, Object> categoryAndKeyword) throws Exception {
		logger.debug("getKeyWordCommons 실행");
		logger.debug(categoryAndKeyword.toString());
		return sqlSession.selectList(NAMESPACE+".selectKeyWordCommon", categoryAndKeyword);
	}

	@Override
	public List<CommonVO> getKeywordCommonsPage(Map<String, Object> searchDataMap) throws Exception {
		logger.debug("getKeywordCommonsPage 실행");
		return sqlSession.selectList(NAMESPACE+".selectKeyWordCommonPage", searchDataMap);
	}
	
	@Override
	public List<UserVO> getKeyWordUsersPage(Map<String, Object> searchDataMap) throws Exception {
		logger.debug("getKeyWordUsersPage 실행");
		return sqlSession.selectList(NAMESPACE+".selectKeyWordUserPage", searchDataMap);
	}

	@Override
	public List<CommonVO> getCommonListPage(Criteria cri) throws Exception {
		logger.debug("getCommonListPage 실행");
		logger.debug("cri : " + cri.toString());
		return sqlSession.selectList(NAMESPACE+".selectCommonListPage", cri);
	}
	
	@Override
	public List<UserVO> getUserListPage(Criteria cri) throws Exception {
		logger.debug("getUserListPage 실행");
		logger.debug("cri : " + cri.toString());
		return sqlSession.selectList(NAMESPACE+".selectUserListPage", cri);
	}
	
	@Override
	public int getCommonTotalCount() throws Exception {
		logger.debug("getCommonTotalCount 실행");
		return sqlSession.selectOne(NAMESPACE+".selectCommonTotalCount");
	}

	@Override
	public int getUserTotalCount() throws Exception {
		logger.debug("getUserTotalCount 실행");
		return sqlSession.selectOne(NAMESPACE+".selectUserTotalCount");
	}

	@Override
	public int getCommonSearchCount (Map<String, Object> categoryAndKeyword) throws Exception {
		// TODO Auto-generated method stub
		logger.debug("getCommonSearchCount 실행");
		logger.debug("검색어 : " + categoryAndKeyword.get("keyword").toString());
		return sqlSession.selectOne(NAMESPACE+".selectCommonSearchCount", categoryAndKeyword);
	}
	
	@Override
	public int getUserSearchCount(Map<String, Object> categoryAndKeyword) throws Exception {
		// TODO Auto-generated method stub
		logger.debug("getUserSearchCount 실행");
		logger.debug("검색어 : " + categoryAndKeyword.get("category").toString());
		return sqlSession.selectOne(NAMESPACE+".selectUserSearchCount", categoryAndKeyword);
	}

	@Override
	public List<CommonVO> getDepCommonVO() throws Exception {
		// TODO Auto-generated method stub
		logger.debug("getDepCodenames 실행");
		return sqlSession.selectList(NAMESPACE+".selectDepCodenames");
	}

	@Override
	public List<CommonVO> getPosCommonVO() throws Exception {
		// TODO Auto-generated method stub
		logger.debug("getPosCodenames 실행");
		return sqlSession.selectList(NAMESPACE+".selectPosCodenames");
	}

	@Override
	public int duplicateIDCheck(Map<String, Object> idMap) throws Exception {
		// TODO Auto-generated method stub
		logger.debug("duplicateCheck 실행");
		return sqlSession.selectOne(NAMESPACE+".duplicateIDCheck", idMap);
	}

	@Override
	public int duplicateEmailCheck(Map<String, Object> emailMap) throws Exception {
		// TODO Auto-generated method stub
		logger.debug("duplicateEmailCheck 실행");
		return sqlSession.selectOne(NAMESPACE+".duplicateEmailCheck", emailMap);
	}

	@Override
	public int duplicatePhoneCheck(Map<String, Object> phoneMap) throws Exception {
		// TODO Auto-generated method stub
		logger.debug("duplicatePhoneCheck 실행");
		return sqlSession.selectOne(NAMESPACE+".duplicatePhoneCheck", phoneMap);
	}

	@Override
	public int duplicateCommonCheck(CommonVO cvo) throws Exception {
		// TODO Auto-generated method stub
		logger.debug("duplicateCommonCheck 실행");
		return sqlSession.selectOne(NAMESPACE+".duplicateCommonCheck", cvo);
	}
	
	
	
	
}
