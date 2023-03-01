package com.kh.laundry.coupon.model.service;


import java.util.List;

import com.kh.laundry.coupon.model.vo.Coupon;


public interface CouponService {

	int insertCoupon(Coupon coupon);

	List<Coupon> selectCouponList(int memNum);
	
	// sewon
	List<Coupon> selectCouponListForAll();

	int couponEdateUpdate(int couNum);


}
