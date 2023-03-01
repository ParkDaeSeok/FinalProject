package com.kh.laundry.payment.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.laundry.card.model.vo.Card;
import com.kh.laundry.common.model.vo.PageInfo;
import com.kh.laundry.coupon.model.vo.Coupon;
import com.kh.laundry.payment.model.vo.Payment;
import com.kh.laundry.payment.model.vo.SubscribePayment;
import com.kh.laundry.repair.model.vo.Repair;
import com.kh.laundry.reserve.model.vo.Reserve;
import com.kh.laundry.subscribe.model.vo.Subscribe;
import com.kh.laundry.washing.model.vo.Lcategory;

@Repository
public class PaymentDaoImpl implements PaymentDao {

	// DB 연결을 위해 SqlSession @Autowired
	@Autowired
	private SqlSession sqlSession;

	// 사용자가 선택한 서비스의 예약 번호, 총 금액 조회하는 메소드
	@Override
	public Reserve selectRecentReserve(Map<String, Object> param) {
		return sqlSession.selectOne("payment.selectRecentReserve", param);
	}
	
	// 사용자가 Step 3 에서 선택한 세탁 서비스를 조회하는 메소드
	@Override
	public List<Lcategory> selectedLcategory(Reserve res) {
		return sqlSession.selectList("payment.selectedLcategory", res.getResNum());
	}
	
	// 사용자가 Step 3 에서 선택한 세탁 서비스를 조회하는 메소드
	@Override
	public List<Repair> selectedRepair(Reserve res) {
		return sqlSession.selectList("payment.selectedRepair", res.getResNum());
	}
	
	// 사용자가 Step 3 에서 선택한 세탁 서비스를 조회하는 메소드
	@Override
	public Subscribe selectedSubscribe(int memNum) {
		return sqlSession.selectOne("payment.selectedSubscribe", memNum);
	}

	// 현재 회원이 가진 쿠폰의 총 개수를 조회하는 메소드 (페이징 처리용)
	@Override
	public int couponCount(int memNum) {
		return sqlSession.selectOne("payment.couponCount", memNum);
	}

	// 현재 회원이 가진 쿠폰들의 정보를 조회하는 메소드
	@Override
	public List<Coupon> selectCouponList(int memNum, PageInfo pi) {
		
		// 한 페이지 당 5개의 쿠폰 정보를 보여주기 위해 WHERE 절에 쓰일 변수
		int startRow = (pi.getCurrentPage() - 1) * pi.getListLimit() + 1;
		int endRow = startRow + pi.getListLimit() - 1;
		
		// Mapper 에 여러 개의 변수를 전달해야 하기 때문에 Map 으로 가공
		Map<String, Integer> param = new HashMap<>();
		
		param.put("memNum", memNum);
		param.put("startRow", startRow);
		param.put("endRow", endRow);
		
		return sqlSession.selectList("payment.selectCouponList", param);
	}

	// 해당 회원이 카드를 가지고 있는지 조회하는 메소드
	@Override
	public Card selectCardInfo(int memNum) {
		return sqlSession.selectOne("payment.selectCardInfo", memNum);
	}
	
	// step4 에서 받은 카드 정보를 CARD 테이블에 삽입하는 메소드
	@Override
	public int insertCard(Map<String, Object> memberAndCard) {
		return sqlSession.insert("payment.insertCard", memberAndCard);
	}

	// step4 에서 받은 카드 정보를 CARD 테이블에 갱신하는 메소드
	@Override
	public int updateCard(Map<String, Object> memberAndCard) {
		return sqlSession.update("payment.updateCard", memberAndCard);
	}
	
	// step4 에서 사용한 쿠폰의 STATUS를 갱신하는 메소드
	@Override
	public int updateCoupon(int couNum) {
		return sqlSession.update("payment.updateCoupon", couNum);
	}

	// step4 에서 선택한 서비스의 RES_STATUS, PAY_STATUS 를 갱신하는 메소드
	@Override
	public int updateReservePay(Map<String, Object> param) {
		return sqlSession.update("payment.updateReservePay", param);
	}

	// 선택한 서비스에 대해 결제 정보를 PAYMENT 테이블에 삽입하는 메소드
	@Override
	public int insertPayment(Map<String, Object> param) {
		return sqlSession.insert("payment.insertPayment", param);
	}

	// 선택한 구독 서비스의 STATUS 를 갱신하는 메소드
	@Override
	public int updateSubscribeStatus(int subNum) {
		return sqlSession.update("payment.updateSubscribeStatus", subNum);
	}
	
	//------------------------------sewon--------------------------------
	
	
	@Override
	public SubscribePayment selectSubPayment(int memNum) {
		return sqlSession.selectOne("payment.selectSubPayment", memNum);
	}

	@Override
	public int changePayment(Map<String, Object> param) {
	
		return sqlSession.update("payment.changePayment", param);
	}

	@Override
	public List<SubscribePayment> paymentList(int memNum) {

		return sqlSession.selectList("payment.paymentList", memNum);
	}

	@Override
	public int updateSubNum(Map<String, Integer> param) {
		return sqlSession.update("payment.updateSubNum", param);
	}

	@Override
	public int cancelSubscription(int subNum) {
		return sqlSession.update("payment.cancelSubscription", subNum);
	}

	@Override
	public Payment isSubscribeRefund(int subNum) {
		return sqlSession.selectOne("payment.isSubscribeRefund", subNum);
	}


	
	
	
	

}
