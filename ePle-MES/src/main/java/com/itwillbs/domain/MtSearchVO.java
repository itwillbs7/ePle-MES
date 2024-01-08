package com.itwillbs.domain;

import lombok.Data;

@Data
public class MtSearchVO extends SearchVO{
	private final String[] searchMenu = {"m.code", "f.name", "mt_subject", "e1.name", "e2.name"};
	private final String[] searchKor = {"코드", "물품명", "제목" ,"작성자", "담당자"};
	
	public boolean getIsnull() {
		if(getSearchKeyword() == null) return true;
		else return false;
	}
}