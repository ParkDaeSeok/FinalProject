package com.kh.laundry.coupon.model.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.laundry.coupon.model.dao.CouponDao;
import com.kh.laundry.coupon.model.vo.Coupon;


@Service
public class CouponServiceImpl implements CouponService{
	@Autowired
	private CouponDao couponDao;

	@Override
	public int insertCoupon(Coupon coupon) {
		return couponDao.insertCoupon(coupon);
	}

	@Override
	public List<Coupon> selectCouponList(int memNum) {
	
		return couponDao.selectCouponList(memNum);
	}
	// sewon
	@Override
	public List<Coupon> selectCouponListForAll() {
		
		return couponDao.selectCouponListForAll();
	}

	@Override
	public int couponEdateUpdate(int couNum) {
		return couponDao.couponEdateUpdate(couNum);
	}
	
	
}
