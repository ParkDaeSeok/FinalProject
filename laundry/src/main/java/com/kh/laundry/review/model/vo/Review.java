package com.kh.laundry.review.model.vo;

import lombok.Data;

@Data
public class Review {

	
	private int resNum;//	RES_NUM	NUMBER
	private int revNum;//	REV_NUM	NUMBER
	private String revDate;//	REV_DATE	DATE
	private String revContent;//	REV_CONTENT	VARCHAR2(500 BYTE)
	private String rate;//	RATE	VARCHAR2(10 BYTE)
	private String revStatus;//	STATUS	VARCHAR2(2 BYTE)
	private int memNum;
	private String memName;
	private String memId;


	
}
