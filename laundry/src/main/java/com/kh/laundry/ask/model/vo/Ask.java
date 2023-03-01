package com.kh.laundry.ask.model.vo;

import lombok.Data;

@Data
public class Ask {
	

	private int askNum;
	private int memNum;
	private String askDate;
	private String askType;
	private String askTitle;
	private String askContent;
	private String ansYn;
	private String ansContent;
	private String ansDate;
	
	
	//attachment
	

	private int attNum;
	private String originName;
	private String changeName;
	private String filePath;
	private String uploadDate;
	private String status;
	private int revNum; 
	
	//정민 관리자모드 문의관리 떄문에 memId추가
	private String memId;

	
	
}
