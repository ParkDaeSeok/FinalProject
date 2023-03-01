package com.kh.laundry.coupon.model.vo;

import lombok.Data;

@Data
public class Coupon {
	
	private int couNum; //	COU_NUM NUMBER PRIMARY KEY,
	private int memNum;//	MEM_NUM NUMBER NOT NULL,
	private String couType; //	COU_TYPE VARCHAR2(30) NOT NULL,
	private String issueDate; //	ISSUE_DATE DATE DEFAULT SYSDATE,
	private String expDate; //	EXP_DATE DATE NULL,
	private int discount; //	DISCOUNT NUMBER NOT NULL,
	private String status;//	STATUS VARCHAR2(2) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')),
}
