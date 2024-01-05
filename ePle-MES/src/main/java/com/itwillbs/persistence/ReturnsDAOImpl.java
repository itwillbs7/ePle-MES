package com.itwillbs.persistence;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
public class ReturnsDAOImpl implements ReturnsDAO {

	
	private static final Logger logger = LoggerFactory.getLogger(ReturnsDAOImpl.class);
	
	private static final String NAMESPACE="com.itwillbs.mapper.returnsMapper";

}
