package com.itwillbs.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.RequestVO;
import com.itwillbs.domain.ReturnsVO;
import com.itwillbs.domain.ShipmentVO;

@Repository
public class ReturnsDAOImpl implements ReturnsDAO {

	private static final Logger logger = LoggerFactory.getLogger(ReturnsDAOImpl.class);

	private static final String NAMESPACE = "com.itwillbs.mapper.returnsMapper";

	@Inject
	private SqlSession sqlSession;

	@Override
	public List<ReturnsVO> getReturnsListPage(Criteria cri) throws Exception {
		logger.debug("╔═══*.·:·.☽✧   페이징 처리 리스트 뽑기    ✧☾.·:·.*═══╗");
		logger.debug("╚═══*.·:·.☽✧    ✦    ✧☾.·:·.*═══╝");
		return sqlSession.selectList(NAMESPACE + ".listPage", cri);

	}

	@Override
	public List<ReturnsVO> getReturnsListPage(int page) throws Exception {
		logger.debug("╔═══*.·:·.☽✧   페이징 처리 계산    ✧☾.·:·.*═══╗");
		page = (page - 1) * 10;
		return sqlSession.selectList(NAMESPACE + ".listPage", page);
	}

	@Override
	public int getReturnsCount() throws Exception {
		logger.debug("╔═══*.·:·.☽✧   반품 총 갯수    ✧☾.·:·.*═══╗");
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + ".countReturns");
	}

	@Override
	public List<ReturnsVO> getReturnsListAll() throws Exception {
		logger.debug("╔═══*.·:·.☽✧   페이징 처리 없이 리스트    ✧☾.·:·.*═══╗");
		return sqlSession.selectList(NAMESPACE + ".getReturnsList");
	}

	@Override
	public ReturnsVO getReturnsDetail(String code) throws Exception {
		logger.debug("╔═══*.·:·.☽✧   반품 정보 상세 보기    ✧☾.·:·.*═══╗");

		return sqlSession.selectOne(NAMESPACE + ".getReturnsInfo", code);
	}
	

	@Override
	public String getRecentCode(String code) throws Exception {
		logger.debug("╔═══*.·:·.☽✧   코드 찾기   ✧☾.·:·.*═══╗");
		String result =  code.substring(0, code.length()-3);
		return sqlSession.selectOne(NAMESPACE+".getRecentCode", result);
	}

	@Override
	public int insertReturns(ReturnsVO vo) throws Exception {
		logger.debug("╔═══*.·:·.☽✧   반품 등록하기   ✧☾.·:·.*═══╗");
		// 반품을 등록했을 때
		// 1. 반품등록하기
		logger.debug("════*.·:·.☽✧ "+vo+"✧☾.·:·.*═════");

		int result = sqlSession.insert(NAMESPACE + ".insertReturns", vo);

		// 2. 수주코드로 수주상태 "반품"으로 변경하기 (우리는 오직 반품 그리고 폐기다)
		String request = vo.getRequest_code();

		if (result == 1) {
			// 수주상태변경
			result = sqlSession.update(NAMESPACE + ".updateRequestStatus", request);
			// 수주 반품등록여부 변경?

			logger.debug("╚═══*.·:·.☽✧   수주상태 변경 완료     ✧☾.·:·.*═══╝");
		}

		return result;
	}
	
	//============================= add/search 용
	
	
	@Override
	public List<ShipmentVO> getShipmentList() throws Exception {
		logger.debug("╔═══*.·:·.☽✧   출하 목록 가져오기   ✧☾.·:·.*═══╗");
		
		return sqlSession.selectList(NAMESPACE+".selectShipmentCodeList");
	}
	
	@Override
	public ShipmentVO getShipmentList(String code) throws Exception {
		logger.debug("╔═══*.·:·.☽✧   코드로 출하내역 가져오기   ✧☾.·:·.*═══╗");
		logger.debug("code : "+code);
		// 코드로 출하내역 가져오기
		Map<String, String> params = new HashMap<>();
		params.put("code", code);
		return sqlSession.selectOne(NAMESPACE+".selectShipmentCodeList", params);
	}

	@Override
	public List<ShipmentVO> findShipment(String clientName, String productName) throws Exception {
		logger.debug("╔═══*.·:·.☽✧   출하정보 검색하기   ✧☾.·:·.*═══╗");
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("clientName", clientName);
		paramMap.put("productName", productName);
		return sqlSession.selectList(NAMESPACE+".findShipment", paramMap);
	}
	
	
	@Override
	public List<ReturnsVO> selectLOTList(String request_code,String ship_code) throws Exception {
		logger.debug("╔═══*.·:·.☽✧   LOT 리스트 가져오기   ✧☾.·:·.*═══╗");
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("request_code", request_code);
		paramMap.put("ship_code", ship_code);
		
		return sqlSession.selectList(NAMESPACE+".getLOTList", paramMap);
	}
	
	//============================= add/search 용



	@Override
	public int returnsUpdate(ReturnsVO vo, String id) throws Exception {
		logger.debug("╔═══*.·:·.☽✧   반품 수정하기 전단계   ✧☾.·:·.*═══╗");
		// 반품정보 수정할 때
		// 1. 기존 출하번호와 새로운 출하번호가 다를 시 기존 수주번호의 수주상태를 출하완료로 변경
		// 2. 반품 정보 업데이트
		// 3. 새로운 수주번호의 수주상태를 "반품"으로 변경한다
		String code = vo.getCode();
		ReturnsVO check = sqlSession.selectOne(NAMESPACE + ".getReturnsInfo", code);

		String request = check.getRequest_code();
		String newReqs = vo.getRequest_code();
		if (!request.equals(newReqs)) {
			// 기존 수주코드와 새로 입력된 수주코드가 일치하지 않으면 수주상태를 출하완료로 변경
			sqlSession.update(NAMESPACE + ".updateBeforeUpdate", request);
		}

		String prevStatus = check.getStatus(); // 이전상태
		String newStatus = vo.getStatus(); // 수정할 상태
		if (request.equals(newReqs)) {
			// 수주코드의 변경이 없을 때 출하상태의 변경이 있을 경우(폐기 -> 반품등록)
			if (prevStatus.equals("폐기") && !prevStatus.equals(newStatus)) {
				sqlSession.update(NAMESPACE + ".updateBeforeUpdate2", request);
			}
		}
		logger.debug("╚═══*.·:·.☽✧   수주상태 변경 완료     ✧☾.·:·.*═══╝");

		logger.debug("╔═══*.·:·.☽✧   반품 수정하기   ✧☾.·:·.*═══╗");
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userid", id);
		paramMap.put("vo", vo);
		return sqlSession.update(NAMESPACE + ".updateReturnsInfo", paramMap);
	}


	@Override
	public List<ReturnsVO> searchReturnsAll(ReturnsVO vo) throws Exception {
		logger.debug("╔═══*.·:·.☽✧   반품 검색하기   ✧☾.·:·.*═══╗");

		List list = sqlSession.selectList(NAMESPACE + ".research", vo);

		logger.debug("╚═══*.·:·.☽✧   검색 완료     ✧☾.·:·.*═══╝");

		return list;
	}

	@Override
	public List<ReturnsVO> getReturnsDetail(String[] code) throws Exception {
		logger.debug("╔═══*.·:·.☽✧   반품 삭제내용 불러오기   ✧☾.·:·.*═══╗");
		Map<String, Object> params = new HashMap<>();
		params.put("code", code);
		List vo = sqlSession.selectList(NAMESPACE + ".getDeleteInfo", params);
		logger.debug("╚═══*.·:·.☽✧   불러오기 완료     ✧☾.·:·.*═══╝");
		return vo;
	}

	@Override
	public int deleteReturns(String[] code) throws Exception {
		logger.debug("╔═══*.·:·.☽✧   반품 삭제하기  ✧☾.·:·.*═══╗");

		int result = 0;

		Map<String, Object> params = new HashMap<>();
		params.put("code", code);
		// 수주상태 변경?
//		result = sqlSession.update(NAMESPACE + ".updateStatusBeforeDelete", params);

//		if (result >= 1) {
//			result = 0;
			result = sqlSession.delete(NAMESPACE + ".deleteReturnsData", params);
//		}
			logger.debug("╚═══*.·:·.☽✧   삭제하기 완료     ✧☾.·:·.*═══╝");

		return result;
	}

	@Override
	public int changeDispose(String[] code) throws Exception {
		logger.debug("╔═══*.·:·.☽✧   반품상태 폐기처리 하기  ✧☾.·:·.*═══╗");
		// 반품상태 폐기처리로 변경하기
		// 1. 반품상태 변경 + dispose 폐기 1 로 변경 
		int result = 0;

		Map<String, Object> params = new HashMap<>();
		params.put("code", code);
		
		result = sqlSession.update(NAMESPACE+".statusChangetoDispose",params);
		logger.debug("╚═══*.·:·.☽✧   반품 상태 변경 완     ✧☾.·:·.*═══╝");
		
		return result;
	}
	
	

}
