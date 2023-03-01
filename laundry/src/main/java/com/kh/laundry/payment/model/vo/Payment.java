package com.kh.laundry.payment.model.vo;

import lombok.Data;

@Data
public class Payment {

	private int payNum;//	PAY_NUM	NUMBER
	private int subNum;//	SUB_NUM	NUMBER
	private int resNum;//	RES_NUM	NUMBER
	private int couNum;//	COU_NUM	NUMBER
	private int cardId;//	CARD_ID	NUMBER
	private String refund;//	REFUND	VARCHAR2(2 BYTE)
	private String payDate;
	
	
	// card class sewon 
	
	private int memNum;//MEM_NUM	NUMBER
	private String cardNum;//CARD_NUM	NUMBER
	private String cardCom;  //CARD_COM	VARCHAR2(20 BYTE)
	private int cardCvc;//CARD_CVC	NUMBER
	private String expDate; //EXP_DATE	DATE
	private String status;//STATUS	VARCHAR2(2 BYTE)
	
	
	

}
