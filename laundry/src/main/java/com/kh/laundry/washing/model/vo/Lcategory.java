package com.kh.laundry.washing.model.vo;

import lombok.Data;

@Data
public class Lcategory {
	
	private int catNum;//	CAT_NUM NUMBER PRIMARY KEY 카테고리 번호
	private String mcategory;//	MCATEGORY VARCHAR2(20) 세탁대분류
	private String scategory;//	SCATEGORY VARCHAR2(20) 세탁소분류
	private int lPrice;//	L_PRICE NUMBER 금액
	private String status;//	STATUS VARCHAR2(2) 상태 
}
