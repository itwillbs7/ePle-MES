package com.itwillbs.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.itwillbs.domain.CommonVO;
import com.itwillbs.persistence.SystemDAOImpl;
import com.zaxxer.hikari.HikariDataSource;

@RunWith (SpringJUnit4ClassRunner.class)
@ContextConfiguration (locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class systemTests {
	
	
	@Inject
	private SystemDAOImpl sdao;
	@Inject
	private HikariDataSource ds;
	@Test
	public void 시스템디비테스트() throws Exception{
		Connection con = ds.getConnection();
		
		for(int i=1;i<101;i++) {
			
			for(int j=1; j<4;j++) {
				String sql = "insert into EMPLOYEES(code,id,dep_group,pos_group,dep_id,pos_id, "
						+ "pw,name,hiredate,phone,email,address) "
						+ "values(?,?,?,?,?,?,?,?,?,?,?,?)";
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setString(3, "그룹명"+(i*3+j-1));
				pstmt.setString(4, "코드명"+j);
				
				pstmt.setString(1, "test"+(i*3+j-1));
				pstmt.setString(2, ""+(i*3+j-1));
				pstmt.setString(5, "그룹ID"+(i*3+j-1));
				pstmt.setString(6, "코드ID"+j);
				pstmt.setString(7, "1234");
				pstmt.setString(8, "테스트");
				pstmt.setString(9, "2000-07-07");
				pstmt.setString(10, "010123400"+(i*3+j-1));
				pstmt.setString(11, "test"+(i*3+j-1)+"@naver.com");
				pstmt.setString(12, "부산광역시 진구 "+(i*3+j-1)+"번대로");
				
				pstmt.executeUpdate();
			}
			
		}
		
	}
	

}
