package com.production.persistence;

import java.sql.Timestamp;
import java.util.List;

import com.production.domain.resultVO;

public interface resultDAO {

	public List<resultVO> getResultList(Timestamp date, String line_code, Boolean isFinish) throws Exception;
	
}
