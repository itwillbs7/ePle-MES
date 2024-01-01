package com.production.service;

import java.sql.Timestamp;
import java.util.List;

import com.production.domain.resultVO;

public interface resultService {

	public List<resultVO> getResultList(Timestamp date, String line_code, Boolean isFinish) throws Exception;

}
