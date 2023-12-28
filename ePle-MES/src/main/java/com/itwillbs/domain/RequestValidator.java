package com.itwillbs.domain;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class RequestValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return RequestVO.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub

	}

}
