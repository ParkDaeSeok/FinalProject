package com.kh.laundry.payment.model.vo;

import java.time.LocalDate;

import lombok.Data;

@Data
public class SubscribePayment {
	// payment
	private int payNum;
	private int memNum;
	private int subNum;
	private int resNum;
	private int couNum;
	private String payDate;
	private String refund;
	private String cardNum;
	private String cardCom;  
	private int cardCvc;
	private String cardExpDate; 
	private String cardStatus;
	
	//subscribe
	private String subOption;
	private String subSdate;
	private String subEdate;
	private int subPrice;
	private String subDay;
	private String subStatus;
	
	// reserve
	private int resPrice;
	private String resType;
	
	// for jsp
	
	private boolean localPayDate; 

}
