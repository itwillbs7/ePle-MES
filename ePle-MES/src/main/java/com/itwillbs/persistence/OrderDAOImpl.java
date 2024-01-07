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
import com.itwillbs.domain.OrderVO;
import com.itwillbs.domain.WarehouseVO;

@Repository
public class OrderDAOImpl implements OrderDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(OrderDAOImpl.class);

	private static final String NAMESPACE="com.itwillbs.mapper.OrderMapper";
	
	@Inject
	private SqlSession sqlSession;
	
	
	
	// 4-9 발주 목록 ~ 4-10 발주 검색 
	@Override
	public List<OrderVO> getOrderList(Criteria cri, String searchOrder, String searchMapd) throws Exception {
	    Map<String, Object> data = new HashMap<String, Object>(); 
	    data.put("cri", cri);
	    data.put("searchOrder", searchOrder);
	    data.put("searchMapd", searchMapd);
	    List<OrderVO> orderList = sqlSession.selectList(NAMESPACE + ".selectOrderList", data);
	    return orderList;
	}

	// 모든 발주 수
	@Override
	public int getOrderCount(String searchOrder, String searchMapd) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>(); 
	    data.put("searchOrder", searchOrder);
	    data.put("searchMapd", searchMapd);
		return sqlSession.selectOne(NAMESPACE+ ".countOrder", data);
	}
	
	// 품목 검색 팝업 
	@Override
	public List<OrderVO> SearchMAPD(Criteria cri, String mapdCode, String mapdName) throws Exception {
		Map<String,Object> data = new HashMap<String,Object>();
		data.put("cri", cri);
		data.put("mapdCode", mapdCode);
		data.put("mapdName", mapdName);
		List<OrderVO> SearchMAPD = sqlSession.selectList(NAMESPACE + ".SearchMAPD",data);
		return SearchMAPD;
	}
	
	// 모든 품목 수
	@Override
	public int getMAPDCount(String mapdCode, String mapdName) throws Exception {
		Map<String,Object> data = new HashMap<String,Object>();
		data.put("mapdCode", mapdCode);
		data.put("mapdName", mapdName);
		return sqlSession.selectOne(NAMESPACE + ".countMAPD",data);
	}
	
	// 발주 삭제	
	@Override
	public List<OrderVO> getDelInfo(String[] code_arr) throws Exception{
		Map<String, Object> data = new HashMap<>();
		data.put("code_arr", code_arr);
		List<OrderVO> delInfo = sqlSession.selectList(NAMESPACE+".getDelInfo", data);		
	    return delInfo;
	}

	@Override
	public void getDeleteOrder(String[] code_arr) throws Exception {
		Map<String,String[]>data = new HashMap<String,String[]>();
		data.put("code_arr", code_arr);
		sqlSession.delete(NAMESPACE + ".deleteOrder", data);
	}	
	
	
	
	
	
}
