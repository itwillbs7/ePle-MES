package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.LineVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.persistence.LineDAO;

@Service
public class LineServiceImpl implements LineService {

    private static final Logger logger = LoggerFactory.getLogger(LineServiceImpl.class);

    @Inject
    private LineDAO ldao;

	@Override
	public LineVO getLine(String code) throws Exception {
		logger.debug(" S : getLine(String code) ");
		return ldao.getLine(code);
	}

	@Override
	public int lineUpdate(LineVO lvo) throws Exception {
		logger.debug(" S : lineUpdate(LineVO lvo) ");
		return ldao.updateLine(lvo);
	}

    @Override
    public int deleteLines(String[] codes) throws Exception {
        return ldao.deleteLines(codes);
    }

    @Override
    public List<LineVO> getInfo(String[] codes) throws Exception {
        return ldao.getInfo(codes);
    }

	@Override
	public int InsertLine(LineVO lvo) throws Exception {
		return ldao.insertLine(lvo);
	}

	@Override
	public LineVO infoLine(String code) throws Exception {
		return ldao.infoLine(code);
	}
	
	@Override
	public List<LineVO> lineListPage(PageVO vo) throws Exception {
		return ldao.getLineListPage(vo);
	}

	@Override
	public int totalLineCount() throws Exception {
		return ldao.getLineCount();
	}
	
}