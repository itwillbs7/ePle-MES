package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.MAPDVO;
import com.itwillbs.persistence.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductServiceImpl.class);
	
	@Inject
	private ProductDAO pdao;
	
	@Override
	public void boardWrite(MAPDVO mvo) throws Exception {
		logger.debug(" S : boardWrite(BoardVO vo) ");
		pdao.insertBoard(mvo);		
	}

	@Override
	public List<MAPDVO> boardListAll() throws Exception {
		logger.debug(" S : boardListAll()");
		return pdao.getBoardListAll();
	}

	@Override
	public MAPDVO getBoard(int bno) throws Exception {
		logger.debug(" S : getBoard(int bno) ");
		return pdao.getBoard(bno);
	}

	@Override
	public int boardModify(MAPDVO mvo) throws Exception {
		logger.debug(" S : boardModify(BoardVO vo) ");
		return pdao.updateBoard(mvo);
	}

	@Override
	public void incrementViewCnt(int bno) throws Exception {
		logger.debug(" S : incrementViewCnt(int bno) ");
		pdao.updateViewCnt(bno);
	}

	@Override
	public void boardRemove(int bno) throws Exception {
		logger.debug(" S : boardRemove(int bno) ");
		pdao.deleteBoard(bno);
	}

	@Override
	public List<MAPDVO> boardListPage(Criteria cri) throws Exception {
		logger.debug(" S : boardListPage(Criteria cri) ");
		return pdao.getBoardListPage(cri);
	}

	@Override
	public int totalBoardCount() throws Exception {
		logger.debug(" S : totalBoardCount()  ");
		return pdao.getBoardCount();
	}
	
	
	
	
	
	
	

	
	
	
	
	
	
	
}
