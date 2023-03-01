package com.kh.laundry.card.model.vo;

import lombok.Data;

@Data
public class Card {

	private int cardId; //	CARD_ID	NUMBER
	private int memNum;//	MEM_NUM	NUMBER
	private String cardNum;//	CARD_NUM	VARCHAR2(20)
	private String cardCom;//	CARD_COM	VARCHAR2(20 BYTE)
	private int cardCVC;//	CARD_CVC	NUMBER
	private String expDate;//	EXP_DATE	DATE
	private String status;//	STATUS	VARCHAR2(2 BYTE)
}
