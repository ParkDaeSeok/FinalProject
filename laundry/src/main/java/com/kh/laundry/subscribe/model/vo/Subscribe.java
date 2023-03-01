package com.kh.laundry.subscribe.model.vo;

import lombok.Data;

@Data
public class Subscribe {

	private int subNum; 
	private int memNum;
	private String subOption;
	private String subSdate;
	private String subEdate;
	private int price;
	private String subDay;
	private String status;
	private String pickupDate;
	private String delDate;
	private String memId;
}
