package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.RequestVO;
import com.itwillbs.domain.ReturnsVO;
import com.itwillbs.domain.ShipmentVO;
import com.itwillbs.persistence.ReturnsDAO;

@Service
public class ReturnsServiceImpl implements ReturnsService {

	
	private static final Logger logger = LoggerFactory.getLogger(ReturnsServiceImpl.class);
	
	@Inject
	private ReturnsDAO rtdao;

	@Override
	public List<ReturnsVO> returnsListpage(ReturnsVO vo,Criteria cri)throws Exception {
		logger.debug("페이징처리하기 "+cri);

		return rtdao.getReturnsListPage(vo,cri);
	}

	@Override
	public int getTotal(ReturnsVO vo) throws Exception {
		logger.debug("servide : getTotal()");
		return rtdao.getReturnsCount(vo);
	}

	@Override
	public ReturnsVO getinfo(String code) throws Exception {
		logger.debug("반품 상세보기");
		return rtdao.getReturnsDetail(code);
	}

	// ============== add / search
	
	
	@Override
	public List<ShipmentVO> getShipmentList() throws Exception {
		logger.debug("반품처리할 수 있는 출하 리스트 가져오기");
		return rtdao.getShipmentList();
	}
	
	
	
	@Override
	public ShipmentVO getShipmentList(String code) throws Exception {
		logger.debug("출하정보에서 반품정보로 넘어감");
		
		return rtdao.getShipmentList(code);
	}
	
	

	@Override
	public List<ShipmentVO> findShipment(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return rtdao.findShipment(cri);
	}

	@Override
	public List<ShipmentVO> findShipment(String clientName, String productName, Criteria cri) throws Exception {
		logger.debug("회사명, 상품명 검색해서 출하정보 가져오기!");
		return rtdao.findShipment(clientName, productName,cri);
	}

	@Override
	public int getShipmentTotal() throws Exception {
		// TODO Auto-generated method stub
		return rtdao.getShipmentTotal();
	}

	@Override
	public int getShipmentTotal(String clientName, String productName) throws Exception {
		logger.debug("검색결과토탈가져오기 검색결과토탈가져오기 검색결과토탈가져오기");
		return rtdao.getShipmentTotal(clientName, productName);
	}
	
	

	@Override
	public List<ReturnsVO> getLOTList(String request_code,String ship_code) throws Exception {
		logger.debug("Service : request_code "+ request_code);
		return rtdao.selectLOTList(request_code,ship_code);
	}

	// ============== add / search
	@Override
	public List<ReturnsVO> findReturnsList(ReturnsVO vo) throws Exception {
		// 전체검색
		logger.debug("service findReturnsList(ReturnsVO vo) : "+vo);
		return rtdao.searchReturnsAll(vo);
	}
	
	@Override
	public String getRecentCode(String vocode) throws Exception {
		logger.debug("반품번호 찾기");
		return rtdao.getRecentCode(vocode);
	}

	@Override
	public int dataInsertReturns(ReturnsVO vo) throws Exception {
		logger.debug("반품등록하기 dataInsertReturns(RequestVO vo)"+vo);
		
		return rtdao.insertReturns(vo);
		
	}

	@Override
	public int updateReturns(ReturnsVO vo, String id) throws Exception {
		logger.debug("수정하기 updateReturns(RequestVO vo, String id)");
		return rtdao.returnsUpdate(vo, id);
	}

	@Override
	public List<ReturnsVO> getinfo(String[] code) throws Exception {
		logger.debug("삭제리스트 가져오기"+code);
		return rtdao.getReturnsDetail(code);
	}
	@Override
	public int deleteReturns(String[] code) throws Exception {
		logger.debug("삭제하기 deleteReturns(String[] code) "+code);
		return rtdao.deleteReturns(code);
	}


	@Override
	public int disposeReturns(String[] code) throws Exception {
		logger.debug("폐기 deleteReturns(String[] code) "+code);

		return rtdao.changeDispose(code);
	}
	
	
	
	
	
}
