package com.kh.laundry.reserve.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.laundry.repair.model.vo.MultiRepair;
import com.kh.laundry.repair.model.vo.Repair;
import com.kh.laundry.reserve.model.vo.Reserve;
import com.kh.laundry.reserve.model.vo.ReserveDetail;
import com.kh.laundry.washing.model.vo.Laundry;
import com.kh.laundry.washing.model.vo.Lcategory;
import com.kh.laundry.washing.model.vo.MultiCategory;

@Repository
public class ReserveDaoImpl implements ReserveDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 세탁 상세 옵션을 가져오는 메서드
	@Override
	public List<Lcategory> selectLaundry() {
		
		return sqlSession.selectList("lcategory.selectLaundry");
	}

	@Override
	public int insertReserve(Reserve reserve) {
		return sqlSession.insert("reserve.insertReserve", reserve);
	}

	// 위에 세탁예약에서 예약번호를 가져오는 메서드
	@Override
	public Reserve selectReserve(Reserve reserve) {
		return sqlSession.selectOne("reserve.selectReserve", reserve);
	}
	
	// 위에서 얻어온 세탁 예약번호로 세탁테이블에 선택한 세탁옵션들을 넣기
	@Override
	public int insertLaundry(int rNum, MultiCategory multiCategory) {
		
		int result = 0;
		for(Lcategory l : multiCategory.getMultiList()) {
			int catNum = l.getCatNum();
			
			// 카테고리번호와 예약번호를 받는 런드리 객체 생성 
			Laundry laundry = new Laundry();
			laundry.setResNum(rNum);
			laundry.setCatNum(catNum);
			
			result = sqlSession.insert("laundry.insertLaundry", laundry);
		}
		
		return result;
	}

	// 예약번호를 얻은 후에 수선테이블에 선택한 수선옵션들을 넣기
	@Override
	public int insertRepair(int rNum, MultiRepair multiRepair) {
		
		int result = 0;
		for(Repair r : multiRepair.getMultiList()) {
			// repair 객체하나 생성
			Repair repair = new Repair();
			
			// 거기에 반복문으로 돌릴 r(repair)이미 있는 값들을 repair에 넣기
			repair.setResNum(rNum); // 예약번호를 넘어서 repair로 값 넘기기
			repair.setRcategory(r.getRcategory());
			repair.setLengthYN(r.getLengthYN());
			repair.setWidthYN(r.getWidthYN());
			repair.setResealYN(r.getResealYN());
			repair.setZipYN(r.getZipYN());
			repair.setRPrice(r.getRPrice());
			
			result = sqlSession.insert("repair.insertRepair", repair);
			System.out.println(result);
		}
		
		return result;
	}
	
	//정민
	@Override
	public List<Reserve> resServiceList() {
		
		return sqlSession.selectList("reserve.resServiceList");
	}

	@Override
	public int updateRes(Map<String,String> reserve2) {
		
		return sqlSession.update("reserve.updateRes" , reserve2);
	}
	
	
	
	// 재웅
	@Override
	public int reserveCount(int memNum) {
		
		return sqlSession.selectOne("reserve.reserveCount", memNum);
	}
	
	@Override
	public int reserveTypeCount(Map<String, Object> param) {
		
		return sqlSession.selectOne("reserve.reserveCount", param);
	}

	@Override
	public List<Reserve> selectResList(Map<String, Object> param) {
		
		return sqlSession.selectList("reserve.selectResList", param);
	}
	
	@Override
	public List<Reserve> selectResTypeList(Map<String, Object> param) {
		
		return sqlSession.selectList("reserve.selectResTypeList", param);
	}

	@Override
	public List<ReserveDetail> resListDetail(int resNum) {
		
		return sqlSession.selectList("reserve.resListDetail", resNum);
	}

}
