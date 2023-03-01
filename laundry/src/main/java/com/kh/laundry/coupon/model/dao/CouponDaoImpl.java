package com.kh.laundry.coupon.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.laundry.coupon.model.vo.Coupon;

@Repository
public class CouponDaoImpl implements CouponDao{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertCoupon(Coupon coupon) {
		return sqlSession.insert("coupon.insertCoupon", coupon);
	}

	@Override
	public List<Coupon> selectCouponList(int memNum) {
		return sqlSession.selectList("coupon.selectCouponList", memNum);
	}
	//sewon
	@Override
	public List<Coupon> selectCouponListForAll() {
	
		return sqlSession.selectList("coupon.selectCouponListForAll");
	}
	
	@Override
	public int couponEdateUpdate(int couNum) {
		
		return sqlSession.update("coupon.couponEdateUpdate", couNum);
	}
	
	
	
}
