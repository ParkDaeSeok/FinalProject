package com.kh.laundry.payment.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.laundry.card.model.vo.Card;
import com.kh.laundry.common.model.vo.PageInfo;
import com.kh.laundry.coupon.model.vo.Coupon;
import com.kh.laundry.member.model.dao.MemberDao;
import com.kh.laundry.payment.model.dao.PaymentDao;
import com.kh.laundry.payment.model.vo.Payment;
import com.kh.laundry.payment.model.vo.SubscribePayment;
import com.kh.laundry.repair.model.vo.Repair;
import com.kh.laundry.reserve.model.vo.Reserve;
import com.kh.laundry.subscribe.model.vo.Subscribe;
import com.kh.laundry.washing.model.vo.Lcategory;

@Service
public class PaymentServiceImpl implements PaymentService {

	// PaymentDao 단 @Autowired
	@Autowired
	private PaymentDao paymentDao;
	
	// MemberDao 단 @Autowired
	@Autowired
	private MemberDao memberDao;

	// 
	@Override
	public Reserve selectRecentReserve(String refId, String resType) {
		
		// 회원 번호 조회
		int memNum = memberDao.selectMemberById(refId).getMemNum();
		
		// Mapper에서 String과 int 를 parameter 로 주어야 하기 때문에 Map으로 가공
		Map<String, Object> param = new HashMap<>();
		
		param.put("resType", resType); // "세탁" or "수선" 의 값을 가진 resType 넣기
		param.put("memNum", memNum); // 현재 로그인 중인 회원의 회원번호 넣기
		
		// 예약 번호, 총 금액 조회
		Reserve res = paymentDao.selectRecentReserve(param);
		
		return res;
	}
	
	// 사용자가 Step 3 에서 선택한 세탁 서비스를 조회하는 메소드
	@Override
	public List<Lcategory> selectedLcategory(Reserve res) {
		
		// 선택한 서비스 조회
		List<Lcategory> serviceList = paymentDao.selectedLcategory(res);
		
		return serviceList;
	}
	
	// 사용자가 Step 3 에서 선택한 수선 서비스를 조회하는 메소드
	@Override
	public List<Repair> selectedRepair(Reserve res) {
		
		// 선택한 서비스 조회
		List<Repair> serviceList = paymentDao.selectedRepair(res);
		
		return serviceList;
	}
	
	// 사용자가 Step 3 에서 선택한 구독 서비스를 조회하는 메소드
	@Override
	public Subscribe selectedSubscribe(int memNum) {
		
		// 선택한 서비스 조회
		Subscribe subscribe = paymentDao.selectedSubscribe(memNum);
		
		return subscribe;
	}

	// 현재 회원이 가진 쿠폰의 총 개수를 조회하는 메소드 (페이징 처리용)
	@Override
	public int couponCount(int memNum) {
		
		int totalCount = paymentDao.couponCount(memNum);
		
		return totalCount;
	}

	// 현재 회원이 가진 쿠폰들의 정보를 조회하는 메소드
	@Override
	public List<Coupon> selectCouponList(int memNum, PageInfo pi) {
		
		List<Coupon> couponList = paymentDao.selectCouponList(memNum, pi);
		
		return couponList;
	}
	
	// 해당 회원이 카드를 가지고 있는지 조회하는 메소드	
	@Override
	public Card selectCardInfo(int memNum) {
		
		Card cardInfo = paymentDao.selectCardInfo(memNum);
		
		return cardInfo;
	}
	

	// step4 에서 받은 카드 정보를 CARD 테이블에 삽입하는 메소드
	@Override
	public int insertCard(Map<String, Object> memberAndCard) {
		
		int result = paymentDao.insertCard(memberAndCard);
		
		return result;
	}

	// step4 에서 받은 카드 정보를 CARD 테이블에 갱신하는 메소드
	@Override
	public int updateCard(Map<String, Object> memberAndCard) {
		
		int result = paymentDao.updateCard(memberAndCard);
		
		return result;
	}

	// step4 에서 사용한 쿠폰의 STATUS를 갱신하는 메소드
	@Override
	public int updateCoupon(int couNum) {
		
		int result = paymentDao.updateCoupon(couNum);
		
		return result;
	}

	// step4 에서 선택한 서비스의 RES_STATUS, PAY_STATUS 를 갱신하는 메소드
	@Override
	public int updateReservePay(Map<String, Object> param) {
		
		int result = paymentDao.updateReservePay(param);
		
		return result;
	}

	// 선택한 서비스에 대해 결제 정보를 PAYMENT 테이블에 삽입하는 메소드
	@Override
	public int insertPayment(Map<String, Object> param) {
		
		int result = paymentDao.insertPayment(param);
		
		return result;
	}

	// 선택한 구독 서비스의 STATUS 를 갱신하는 메소드
	@Override
	public int updateSubscribeStatus(int subNum) {
		
		
		int result = paymentDao.updateSubscribeStatus(subNum);
		
		return result;
	}
	
	// ---------------------------sewon ------------------------
	
	@Override
	public SubscribePayment selectSubPayment(int memNum) {
		return paymentDao.selectSubPayment(memNum);
	}

	@Override
	public int changePayment(Map<String, Object> param) {
		
		return paymentDao.changePayment(param);
	}

	@Override
	public List<SubscribePayment> paymentList(int memNum) {
		
		return paymentDao.paymentList(memNum);
	}

	@Override
	public int updateSubNum(Map<String, Integer> param) {
		return paymentDao.updateSubNum(param);
	}

	@Override
	public int cancelSubscription(int subNum) {
		
		return paymentDao.cancelSubscription(subNum);
	}

	@Override
	public Payment isSubscribeRefund(int subNum) {
		return paymentDao.isSubscribeRefund(subNum);
	}


	
	
}
