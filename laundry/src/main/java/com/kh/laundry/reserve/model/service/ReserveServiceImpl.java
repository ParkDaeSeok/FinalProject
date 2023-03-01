package com.kh.laundry.reserve.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.laundry.repair.model.vo.MultiRepair;
import com.kh.laundry.reserve.model.dao.ReserveDao;
import com.kh.laundry.reserve.model.vo.Reserve;
import com.kh.laundry.reserve.model.vo.ReserveDetail;
import com.kh.laundry.washing.model.vo.Lcategory;
import com.kh.laundry.washing.model.vo.MultiCategory;

@Service
public class ReserveServiceImpl implements ReserveService {
	
	@Autowired
	private ReserveDao reserveDao;

	// 세탁 상세 옵션을 가져오는 메서드
	@Override
	public List<Lcategory> selectLaundry() {
		
		List<Lcategory> list = reserveDao.selectLaundry();
		
		return list;
	}

	// 세탁 예약을 넣는 메서드
	@Override
	public int insertReserve(Reserve reserve) {
		
		return reserveDao.insertReserve(reserve);
	}
	
	// 위에 세탁예약에서 예약번호를 가져오는 메서드
	@Override
	public Reserve selectReserve(Reserve reserve) {
		return reserveDao.selectReserve(reserve);
	}

	// 위에서 얻어온 세탁 예약번호로 세탁테이블에 선택한 세탁옵션들을 넣기
	@Override
	public int insertLaundry(int rNum, MultiCategory multiCategory) {
		return reserveDao.insertLaundry(rNum, multiCategory);
	}

	// 예약번호를 얻은 후에 수선테이블에 선택한 수선옵션들을 넣기
	@Override
	public int insertRepair(int rNum, MultiRepair multiRepair) {
		return reserveDao.insertRepair(rNum, multiRepair);
	}
	
	//정민
	@Override
	public List<Reserve> resServiceList() {
		
		return reserveDao.resServiceList();
	}

	@Override
	public int updateRes(Map<String,String> reserve2) {
		
		return reserveDao.updateRes(reserve2);
	}
	
	
	// 재웅
	@Override
	public int reserveCount(int memNum) {
		
		return reserveDao.reserveCount(memNum);
	}
	
	@Override
	public int reserveTypeCount(Map<String, Object> param) {
		
		return reserveDao.reserveTypeCount(param);
	}
	
	@Override
	public List<Reserve> selectResList(Map<String, Object> param) {
		
		return reserveDao.selectResList(param);
	}

	@Override
	public List<Reserve> selectResTypeList(Map<String, Object> param) {
		
		return reserveDao.selectResTypeList(param);
	}
	
	@Override
	public List<ReserveDetail> resListDetail(int resNum) {
		
		return reserveDao.resListDetail(resNum);
	}
	


}
