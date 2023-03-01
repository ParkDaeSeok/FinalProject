package com.kh.laundry.washing.model.vo;

import lombok.Data;

@Data
public class Laundry {

	private int lauNum;//	LAU_NUM NUMBER PRIMARY KEY, 세탁번호
	private int resNum;//  RES_NUM NUMBER NOT NULL, 예약번호
	private int catNum;//	CAT_NUM NUMBER NOT NULL, 카테고리번호
	
}
