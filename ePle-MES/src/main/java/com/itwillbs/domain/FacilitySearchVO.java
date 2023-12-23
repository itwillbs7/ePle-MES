package com.itwillbs.domain;

public class FacilitySearchVO extends SearchVO{
	public boolean isNull() {
		return (getBetweenDateLeft() == null || getBetweenDateRight() == null);
	}
}
