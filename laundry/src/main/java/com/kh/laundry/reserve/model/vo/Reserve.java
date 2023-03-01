package com.kh.laundry.reserve.model.vo;

import lombok.Data;

@Data
public class Reserve {

	private int resNum;	//	RES_NUM NUMBER PRIMARY KEY, 예약번호
	private int memNum;	//	MEM_NUM NUMBER NOT NULL, 회원번호
	private String resType;	//	RES_TYPE VARCHAR2(6) NOT NULL CHECK (RES_TYPE IN('세탁', '수선')), 예약타입
	private String resDate;	//	RES_DATE DATE DEFAULT SYSDATE, 예약날짜
	private String pickupDate;	//	PICKUP_DATE DATE NOT NULL, 수거날짜
	private String request;	//	REQUEST VARCHAR2(200) NULL, 요구사항
	private String delDate;	//	DEL_DATE DATE NULL, 배달날짜
	private String resStatus;	//	RES_STATUS VARCHAR2(2) DEFAULT 'N' CHECK (RES_STATUS IN('Y', 'N')), 완료여부
	private String payStatus;	//	PAY_STATUS VARCHAR2(2) DEFAULT 'N' CHECK (PAY_STATUS IN('Y', 'N')), 결제상태
	private int totalPay;	//	TOTAL_PAY NUMBER NOT NULL, 총금액
	
}
