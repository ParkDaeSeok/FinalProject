package com.kh.laundry.washing.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.laundry.washing.model.dao.LaundryDao;
import com.kh.laundry.washing.model.vo.Laundry;
import com.kh.laundry.washing.model.vo.Lcategory;

@Service
public class LaundryServiceImpl implements LaundryService {
	
	@Autowired
	private LaundryDao laundryDao;

	
	//관리자모드 통계관리에서 세탁건수
	@Override
	public int laundryCount() {
		
		int resultLaundry = laundryDao.laundryCount();
		
		return resultLaundry;
	}

	
	//관리자모드 카테고리관리에서 세탁리스트
	@Override
	public List<Lcategory> laundryList() {
		
		List<Lcategory> list = laundryDao.laundryList();
		
		return list;
		
	}

	
	//관리자모드 카테고리관리에서 삭제기능
	@Override
	public int deleteLcategory(int lno) {
		
		return laundryDao.deleteLcategory(lno);
	}
	
	//관리자모드 카테고리관리에서 복구기능
	@Override
	public int restoreLcategory(int lno) {
		
		return laundryDao.restoreLcategory(lno);
	}

	//관리자모드 카테고리관리에서 수정기능
	@Override
	public int update(Lcategory lcategory) {
		
		return laundryDao.update(lcategory);
	}

	//관리자모드 카테고리관리에서 추가기능
	@Override
	public int insertCat(Lcategory lcategory) {
		
		return laundryDao.insertCat(lcategory);
	}

	
}
