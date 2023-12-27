package com.itwillbs.domain.facility;

import com.itwillbs.domain.SearchVO;

public class FacilitySearchVO extends SearchVO{
	public boolean isNull() {
		return (getBetweenDateLeft() == null || getBetweenDateRight() == null);
	}
}
