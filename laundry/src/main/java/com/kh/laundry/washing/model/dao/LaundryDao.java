package com.kh.laundry.washing.model.dao;

import java.util.List;

import com.kh.laundry.washing.model.vo.Laundry;
import com.kh.laundry.washing.model.vo.Lcategory;

public interface LaundryDao {
	
	//관리자모드 통계관리에서 총 세탁건수 메소드틀
	int laundryCount();
	
	//관리자모드 카테고리관리에서 세탁종류 리스트 틀
	List<Lcategory> laundryList();
	
	//관리자모드 카테고리관리에서 삭제하기 메소드 틀
	int deleteLcategory(int lno);
	
	//관리자모드 카테고리관리에서 ㅂ복구하기메소드 틀
		int restoreLcategory(int lno);
		
	//관리자모드 카테고리관리에서 수정하기 메소드틀
	int update(Lcategory lcategory);
	
	//관리자모드 카테고리관리에서 추가하기 메소드 틀
	int insertCat(Lcategory lcategory);
	

}
