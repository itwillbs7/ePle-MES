package com.production.service;

import java.sql.Timestamp;
import java.util.List;

import com.production.domain.BOMVO;
import com.production.domain.failedVO;
import com.production.domain.resultVO;

public interface resultService {

	public List<resultVO> getResultList(Timestamp date, String line_code, Boolean isFinish) throws Exception;

	public resultVO getResult(String code) throws Exception;

	public List<failedVO> getFailedList(String code) throws Exception;

	public BOMVO getBOM(String code) throws Exception;

}
