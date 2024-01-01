package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.LineVO;
import com.itwillbs.persistence.LineDAO;

@Service
public class LineServiceImpl implements LineService {

    private static final Logger logger = LoggerFactory.getLogger(LineServiceImpl.class);

    @Inject
    private LineDAO ldao;

    @Override
    public void lineWrite(LineVO lvo) throws Exception {
        logger.debug(" S : lineWrite(LineVO lvo) ");
    }

    @Override
    public List<LineVO> lineListAll() throws Exception {
        logger.debug(" S : lineListAll() ");
        return null;
    }

    @Override
    public LineVO getLine(String code) throws Exception {
        logger.debug(" S : getLine(String code) ");
        return null;
    }

    @Override
    public int lineModify(LineVO lvo) throws Exception {
        logger.debug(" S : lineModify(LineVO lvo) ");
        return 0;
    }

    @Override
    public void lineRemove(String code) throws Exception {
        logger.debug(" S : lineRemove(String code) ");
    }

    @Override
    public List<LineVO> lineListPage(Criteria cri) throws Exception {
        logger.debug(" S : lineListPage(Criteria cri) ");
        return null;
    }

    @Override
    public int totalLineCount() throws Exception {
        logger.debug(" S : totalLineCount() ");
        return 0;
    }
}