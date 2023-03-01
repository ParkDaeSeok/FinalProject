package com.kh.laundry.reserve.model.vo;

import lombok.Data;

@Data
public class ReserveDetail {
	
	// Reserve
	private int resNum;
	private int memNum;
	private String resType;
	private String resDate;
	private String pickupDate;
	private String request;
	private String delDate;
	private String resStatus;
	private String payStatus;
	private int totalPay;
	
	// Laundry
	private int lauNum;//	LAU_NUM NUMBER PRIMARY KEY, 세탁번호
	private int catNum;//	CAT_NUM NUMBER NOT NULL, 카테고리번호
	
	// Lcategory
	private String mcategory;//	MCATEGORY VARCHAR2(20) 세탁대분류
	private String scategory;//	SCATEGORY VARCHAR2(20) 세탁소분류
	private int lPrice;//	L_PRICE NUMBER 금액
	private String status;//	STATUS VARCHAR2(2) 상태 
	
	// Repair
	private int repNum; //REP_NUM NUMBER PRIMARY KEY,  수선번호
	private String rcategory;//R_CATEGORY VARCHAR2(20) NOT NULL,  수선종류
	private String lengthYN; //LENGTH_YN VARCHAR2(2) DEFAULT 'N' CHECK (LENGTH_YN IN('Y', 'N')), 기장수선유무
	private String widthYN; //WIDTH_YN VARCHAR2(2) DEFAULT 'N' CHECK (WIDTH_YN IN('Y', 'N')),  통수선유무
	private String resealYN; //RESEAL_YN VARCHAR2(2) DEFAULT 'N' CHECK (RESEAL_YN IN('Y', 'N')),  재박음질유무
	private String zipYN; //ZIP_YN VARCHAR2(2) DEFAULT 'N' CHECK (ZIP_YN IN('Y', 'N')),  지퍼및단추수선유무
	private int rPrice; //R_PRICE NUMBER NOT NULL, 금액
	
	// Payment
	private int payNum;//	PAY_NUM	NUMBER
	private int subNum;//	SUB_NUM	NUMBER
	private int couNum;//	COU_NUM	NUMBER
	private int cardId;//	CARD_ID	NUMBER
	private String refund;//	REFUND	VARCHAR2(2 BYTE)

	// Card
	private String cardNum;//	CARD_NUM	NUMBER
	private String cardCom;//	CARD_COM	VARCHAR2(20 BYTE)
	private int cardCVC;//	CARD_CVC	NUMBER
	private String expDate;//	EXP_DATE	DATE
	
	// Coupon
	private String couType; //	COU_TYPE VARCHAR2(30) NOT NULL,
	private int discount; //	DISCOUNT NUMBER NOT NULL,
	
	// Review
	private int revNum;//	REV_NUM	NUMBER
	private String revDate;//	REV_DATE	DATE
	private String revContent;//	REV_CONTENT	VARCHAR2(500 BYTE)
	private String rate;//	RATE	VARCHAR2(10 BYTE)
	private String revStatus;//	STATUS	VARCHAR2(2 BYTE)
	
	// Attachment
	private int attNum;
	private String orginName;
	private String changeName;
	private String filePath;
	private String uploadDate;
}
