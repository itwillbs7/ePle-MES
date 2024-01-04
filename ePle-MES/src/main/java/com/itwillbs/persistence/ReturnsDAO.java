package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.RequestVO;
import com.itwillbs.domain.ReturnsVO;

public interface ReturnsDAO {
	// 페이징처리
		public List<ReturnsVO> getReturnsListPage(Criteria cri)throws Exception;
		public List<ReturnsVO> getReturnsListPage(int page)throws Exception;
		public int getReturnsCount() throws Exception;

		// 반품리스트
		public List<ReturnsVO> getReturnsListAll () throws Exception;
		// 반품등록
		public int insertReturns(ReturnsVO vo) throws Exception;
		// 반품상세보기
		public ReturnsVO getReturnsDetail(String code) throws Exception;
		
		
		
		// 반품 수정
		public int returnsUpdate(ReturnsVO vo, String id)throws Exception;
		// 반품 검색
		public List<ReturnsVO> searchReturnsAll(ReturnsVO vo)throws Exception;
		// 삭제용
		public List<ReturnsVO> getReturnsDetail(String[] code)throws Exception;
		// DB삭제용
		public int deleteReturns(String[] code)throws Exception;
		
}
