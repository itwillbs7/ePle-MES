package com.production.persistence;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.CommonVO;
import com.itwillbs.domain.Warehouse_HistoryVO;
import com.production.domain.BOMVO;
import com.production.domain.failedVO;
import com.production.domain.inputVO;
import com.production.domain.resultVO;

@Repository
public class resultDAOImpl implements resultDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(resultDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.itwillbs.mapper.resultMapper";

	@Override
	public List<resultVO> getResultList(String date, String[] line_code, Boolean isFinish) throws Exception {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("date", date);
		map.put("line_code", line_code);
		map.put("isFinish", isFinish);
		return sqlSession.selectList(NAMESPACE + ".getResultList",map);
	}

	@Override
	public resultVO getResult(String code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getResult",code);
	}

	@Override
	public List<failedVO> getFailedList(String code) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getFailedList",code);
	}

	@Override
	public BOMVO getBOM(String code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getBOM",code);
	}

	@Override
	public List<String> getLine_codeList() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getLine_codeList");
	}

	@Override
	public void productionStart(String code) throws Exception {
		sqlSession.update(NAMESPACE + ".productionStart",code);
		
	}
	
	@Override
	public void productionComplete(String code) throws Exception {
		sqlSession.update(NAMESPACE + ".productionComplete",code);
	}

	@Override
	public void addResult(String code) throws Exception {
		sqlSession.update(NAMESPACE + ".addResult",code);
		//지시량과 양품량이 같아지면 완료로 전환
	}
	
	@Override
	public void insertFailed(failedVO vo) throws Exception {
		sqlSession.insert(NAMESPACE + ".insertFailed",vo);
	}

	@Override
	public List<CommonVO> getCode_id() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getCode_id");
	}

	@Override
	public List<Warehouse_HistoryVO> insertInput(inputVO[] vo) throws Exception {
		List<inputVO> list = Arrays.asList(vo);
		int result = -1;
		List<Warehouse_HistoryVO> wList = new ArrayList<Warehouse_HistoryVO>();
		for (inputVO inputVO : list) {
			result = -1;
			result = sqlSession.selectOne(NAMESPACE + ".checkDuplication",inputVO);
			if (result == 1) {
				sqlSession.insert(NAMESPACE + ".insertInput",inputVO);
			}
			if (result == 0) {
				sqlSession.update(NAMESPACE + ".updateInput",inputVO);
			}
			if (result == 0 || result == 1) {
				Map<String, Object> map = new HashMap<String, Object>();
				logger.debug("inputVO : " + inputVO);
				map.put("amount", inputVO.getAmount());
				map.put("mapd_code", inputVO.getMapd_code());
				int limit = sqlSession.selectOne(NAMESPACE + ".getLimit",inputVO);
				logger.debug("limit : " + limit+1);
				map.put("limit", limit+1);
				List<String> codeList = sqlSession.selectList(NAMESPACE + ".getCode",map);
				logger.debug("codeList : " + codeList);
				List<Warehouse_HistoryVO> WarehoseList = sqlSession.selectList(NAMESPACE + ".getWarehoseVOList", codeList);
				logger.debug("wList : " + WarehoseList);
				int total = 0;
				for (Warehouse_HistoryVO warehouse_HistoryVO : WarehoseList) {
					warehouse_HistoryVO.setIo("OUT");
					if (total+warehouse_HistoryVO.getAmount() < inputVO.getAmount()) {
						total+=warehouse_HistoryVO.getAmount();
					}
					if (total+warehouse_HistoryVO.getAmount() >= inputVO.getAmount()) {
						warehouse_HistoryVO.setAmount(inputVO.getAmount() - total );
					}
				}
				logger.debug("wList2 : " + WarehoseList);
				wList.addAll(WarehoseList);
			}
		}
		return wList;
	}

	@Override
	public List<inputVO> getInput(String code) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getInput",code);
	}

	@Override
	public void insertLot(String code) throws Exception {
		sqlSession.insert(NAMESPACE + ".insertLot",code);
		sqlSession.update(NAMESPACE + ".updateAdd",code);
	}
}
