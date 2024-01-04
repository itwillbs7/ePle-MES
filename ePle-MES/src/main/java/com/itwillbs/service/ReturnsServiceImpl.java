package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.RequestVO;
import com.itwillbs.domain.ReturnsVO;
import com.itwillbs.persistence.ReturnsDAO;

@Service
public class ReturnsServiceImpl implements ReturnsService {

	
	private static final Logger logger = LoggerFactory.getLogger(ReturnsServiceImpl.class);
	
	@Inject
	private ReturnsDAO rtdao;

	@Override
	public List<ReturnsVO> returnsListpage(Criteria cri)throws Exception {
		logger.debug("페이징처리하기 "+cri);

		return rtdao.getReturnsListPage(cri);
	}

	@Override
	public int getTotal() throws Exception {
		logger.debug("servide : getTotal()");
		return rtdao.getReturnsCount();
	}

	@Override
	public ReturnsVO getinfo(String code) throws Exception {
		logger.debug("반품 상세보기");
		return rtdao.getReturnsDetail(code);
	}

	// ============== add / search
	// ============== add / search
	@Override
	public List<ReturnsVO> findReturnsList(ReturnsVO vo) throws Exception {
		// 전체검색
		logger.debug("service findReturnsList(ReturnsVO vo) : "+vo);
		return rtdao.searchReturnsAll(vo);
	}

	@Override
	public void dataInsertReturns(ReturnsVO vo) throws Exception {
		logger.debug("반품추가 dataInsertReturns(RequestVO vo)"+vo);
		rtdao.insertReturns(vo);
	}


	@Override
	public List<ReturnsVO> getinfo(String[] code) throws Exception {
		logger.debug("삭제리스트 가져오기"+code);
		return rtdao.getReturnsDetail(code);
	}
	@Override
	public void deleteReturns(String[] code) throws Exception {
		logger.debug("삭제하기 deleteReturns(String[] code) "+code);
		rtdao.deleteReturns(code);
	}

	@Override
	public void updateReturns(ReturnsVO vo, String id) throws Exception {
		logger.debug("수정내용 updateReturns(RequestVO vo, String id)");
		rtdao.returnsUpdate(vo, id);
	}
	
	
	
	
}
