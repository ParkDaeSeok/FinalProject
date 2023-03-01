package com.kh.laundry.coupon.model.dao;


import java.util.List;

import com.kh.laundry.coupon.model.vo.Coupon;
import com.kh.laundry.member.model.vo.Member;

public interface CouponDao {

	int insertCoupon(Coupon coupon );

	List<Coupon> selectCouponList(int memNum);

	
	// sewon
	List<Coupon> selectCouponListForAll();
	//sewon
	int couponEdateUpdate(int couNum);
}
