package com.kh.laundry.member.model.vo;

import lombok.Data;

@Data
public class Member {

	
	private int memNum; //	MEM_NUM NUMBER PRIMARY KEY,
	private String memId;//	MEM_ID VARCHAR2(20) UNIQUE NOT NULL,
	private String memPwd;//	MEM_PWD VARCHAR2(20) NOT NULL,
	private String memName;//	MEM_NAME VARCHAR2(20) NOT NULL,
	private String email;//	EMAIL VARCHAR2(30) UNIQUE NOT NULL,
	private String phone;//	PHONE VARCHAR2(11) NOT NULL,
	private String post;//	POST VARCHAR2(10) NOT NULL,
	private String address;//    ADDRESS VARCHAR2(80) NOT NULL,
	private int recNum;//	REC_NUM NUMBER NULL,
	private String enrollDate;//	ENROLL_DATE DATE DEFAULT SYSDATE,
	private String status;//	STATUS VARCHAR2(2) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N'))
}
