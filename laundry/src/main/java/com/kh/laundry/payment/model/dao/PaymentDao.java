package com.kh.laundry.payment.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.laundry.card.model.vo.Card;
import com.kh.laundry.common.model.vo.PageInfo;
import com.kh.laundry.coupon.model.vo.Coupon;
import com.kh.laundry.payment.model.vo.Payment;
import com.kh.laundry.payment.model.vo.SubscribePayment;
import com.kh.laundry.repair.model.vo.Repair;
import com.kh.laundry.reserve.model.vo.Reserve;
import com.kh.laundry.subscribe.model.vo.Subscribe;
import com.kh.laundry.washing.model.vo.Lcategory;

public interface PaymentDao {	
	
	// 사용자가 Step3 에서 예약한 예약 번호, 총 금액을 조회하는 메소드용 틀
	Reserve selectRecentReserve(Map<String, Object> param);
	
	// 사용자가 Step 3 에서 선택한 세탁 서비스를 조회하는 메소드용 틀
	List<Lcategory> selectedLcategory(Reserve res);
	
	// 사용자가 Step 3 에서 선택한 수선 서비스를 조회하는 메소드용 틀
	List<Repair> selectedRepair(Reserve res);
	
	// 사용자가 Step 3 에서 선택한 구독 서비스를 조회하는 메소드용 틀
	Subscribe selectedSubscribe(int memNum);
	
	
	// 현재 회원이 가진 쿠폰의 총 개수를 조회하는 메소드용 틀 (페이징 처리용)
	int couponCount(int memNum);
	
	// 현재 회원이 가진 쿠폰들의 정보를 조회하는 메소드용 틀
	List<Coupon> selectCouponList(int memNum, PageInfo pi);
	
	
	// 해당 회원이 카드를 가지고 있는지 조회하는 메소드용 틀
	Card selectCardInfo(int memNum);
	
	// step4 에서 받은 카드 정보를 CARD 테이블에 삽입하는 메소드용 틀
	int insertCard(Map<String, Object> memberAndCard);
	
	// step4 에서 받은 카드 정보를 CARD 테이블에 갱신하는 메소드용 틀
	int updateCard(Map<String, Object> memberAndCard);
	
	// step4 에서 사용한 쿠폰의 STATUS를 갱신하는 메소드용 틀
	int updateCoupon(int couNum);
	
	// step4 에서 선택한 서비스의 RES_STATUS, PAY_STATUS 를 갱신하는 메소드용 틀
	int updateReservePay(Map<String, Object> param);
	
	// 선택한 서비스에 대해 결제 정보를 PAYMENT 테이블에 삽입하는 메소드용 틀
	int insertPayment(Map<String, Object> param);
	
	// 선택한 구독 서비스의 STATUS 를 갱신하는 메소드용 틀 
	int updateSubscribeStatus(int subNum);
	
	
	//----------------------sewon -----------------------
	
	

	SubscribePayment selectSubPayment(int memNum);

	int changePayment(Map<String, Object> param);

	List<SubscribePayment> paymentList(int memNum);

	int updateSubNum(Map<String, Integer> param);

	int cancelSubscription(int subNum);

	Payment isSubscribeRefund(int subNum);


	
	
	
	
	
	
}
