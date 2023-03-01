package com.kh.laundry.repair.model.vo;

import lombok.Data;

@Data
public class Repair {
	
	
	private int repNum; //REP_NUM NUMBER PRIMARY KEY,  수선번호
	private int resNum; //RES_NUM NUMBER NOT NULL,  예약번호
	private String rcategory;//R_CATEGORY VARCHAR2(20) NOT NULL,  수선종류
	private String lengthYN; //LENGTH_YN VARCHAR2(2) DEFAULT 'N' CHECK (LENGTH_YN IN('Y', 'N')), 기장수선유무
	private String widthYN; //WIDTH_YN VARCHAR2(2) DEFAULT 'N' CHECK (WIDTH_YN IN('Y', 'N')),  통수선유무
	private String resealYN; //RESEAL_YN VARCHAR2(2) DEFAULT 'N' CHECK (RESEAL_YN IN('Y', 'N')),  재박음질유무
	private String zipYN; //ZIP_YN VARCHAR2(2) DEFAULT 'N' CHECK (ZIP_YN IN('Y', 'N')),  지퍼및단추수선유무
	private int rPrice; //R_PRICE NUMBER NOT NULL, 금액
	
}
