package com.kh.laundry.payment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.laundry.card.model.vo.Card;
import com.kh.laundry.common.model.vo.PageInfo;
import com.kh.laundry.coupon.model.vo.Coupon;
import com.kh.laundry.member.controller.EmailSender;
import com.kh.laundry.member.model.vo.Member;
import com.kh.laundry.payment.model.service.PaymentService;
import com.kh.laundry.repair.model.vo.Repair;
import com.kh.laundry.reserve.model.vo.Reserve;
import com.kh.laundry.subscribe.model.vo.Subscribe;
import com.kh.laundry.washing.model.vo.Lcategory;

@Controller
@RequestMapping("/payment")
public class PaymentController {

	// PaymentService 단 @Autowired
	@Autowired
	private PaymentService paymentService;
	
	// Email 전송을 위해 @Autowired
	@Autowired
	private EmailSender emailSender;
	
	
	// step4(결제페이지) 로 넘어올 때, 사용되는 메소드
	@GetMapping("/step4.do")
	public String step4(HttpSession session, 
						Model model) {// "세탁" or "수선" 식별자 받을 예정 @RequestParam 사용	
		
		/* !!!!!! 서비스 시작할때 활성화 할것 !!!!!!

		// NPE로 인해 출력되는 500 페이지를 보여주지 않기 위한 조건문
		if(session.getAttribute("loginUser") == null) { // 모종의 이유로 로그아웃 되었을 경우
			session.setAttribute("alertMsg", "알 수 없는 이유로 로그아웃 되었습니다.");
			return "redirect:/";
		}
		*/
		
		// 현재 로그인 중인 회원의 아이디 추출
		String refId = ((Member)session.getAttribute("loginUser")).getMemId(); // memberService 에서 refId 로 받기때문에 변수명을 맞춰줌.
		
		
		// 현재 로그인 중인 회원의 회원번호 추출
		int memNum = ((Member)session.getAttribute("loginUser")).getMemNum();
		
		
		// 추후 RequestParam으로 Step3에게 받을 값 임시로 하드코딩
		String resType = "세탁";
		
		model.addAttribute("resType", resType);
		
		
		// 사용자가 예약한 예약 번호, 수거날짜, 요구사항, 총 금액 조회
		Reserve res = new Reserve();
		
		if( ! resType.equals("구독") && ! resType.equals("구독변경") ) { // 요청한 서비스가 구독이 아닐경우
			res = paymentService.selectRecentReserve(refId, resType);
			
			model.addAttribute("reserve", res);
		}
		
		// 사용자가 선택한 서비스 조회
		if(resType.equals("세탁")) { // 요청한 서비스가 세탁일 경우
			
			List<Lcategory> serviceList = paymentService.selectedLcategory(res);
			model.addAttribute("serviceList", serviceList);
			
		} else if(resType.equals("수선")) { // 요청한 서비스가 수선일 경우
			
			List<Repair> serviceList = paymentService.selectedRepair(res);
			model.addAttribute("serviceList", serviceList);
			
		} else { // 요청한 서비스가 구독 / 구독변경 일 경우
			
			Subscribe subscribe = paymentService.selectedSubscribe(memNum);
			model.addAttribute("subscribe", subscribe);
			
		}	
		
		
		// 회원의 정보 조회
		model.addAttribute("loginUser", (Member)session.getAttribute("loginUser"));
		
		
		// 회원의 카드 정보 조회
		Card cardInfo = paymentService.selectCardInfo(memNum);
		
		model.addAttribute("cardInfo", cardInfo);
		
		return "payment/step4";
	}
	
	// 쿠폰 선택 버튼 클릭 시, 사용되는 메소드
	@GetMapping("/couponPage.do")
	public String couponPage(@RequestParam int currentPage, // currentPage : 현재 페이지 No
							 HttpSession session,
							 Model model) {
		
		// 현재 로그인 중인 회원의 번호를 추출
		int memNum = ((Member)session.getAttribute("loginUser")).getMemNum();
		
		// ------------- 아래부터 페이징 처리 --------------
		
		// 현재 회원이 가진 쿠폰의 총 개수 (페이징 처리용)
		int totalCount = paymentService.couponCount(memNum);
		
		// 페이징바의 페이지 최대 개수 (페이징 처리용)
		int pageLimit = 10;
		
		// 한 페이지에 보여질 게시글의 최대 개수 (페이징 처리용)
		int listLimit = 5;
		
		// 총 페이지 개수 (페이징 처리용)
		int maxPage = (int)Math.ceil((double)totalCount / listLimit);
		
		// 페이지 하단에 보여질 페이징바의 시작수 (페이징 처리용)
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		// 페이지 하단에 보여질 페이징바의 마지막수 (페이징 처리용)
		int endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = PageInfo.builder()
					  .totalCount(totalCount)
					  .currentPage(currentPage)
					  .pageLimit(pageLimit)
					  .listLimit(listLimit)
					  .maxPage(maxPage)
					  .startPage(startPage)
					  .endPage(endPage)
					  .build();
		
		model.addAttribute("pi", pi);		
		// ------------- 페이징 처리 끝 --------------

		// 현재 로그인 중인 회원의 쿠폰 리스트 조회
		List<Coupon> couponList = paymentService.selectCouponList(memNum, pi);
		
		model.addAttribute("couponList", couponList);
		
		return "payment/coupon";
	}
	
	// step4 -> step5 로 넘어갈때 사용되는 메소드
	@PostMapping("/step5.do")
	public String step5(@RequestParam Map<String, Object> memberAndCard,
						HttpSession session,
						Model model) {
		
		// 현재 로그인 중인 회원의 아이디 추출
		String refId = ((Member)session.getAttribute("loginUser")).getMemId(); // memberService 에서 refId 로 받기때문에 변수명을 맞춰줌.
		
		// 현재 로그인 중인 회원의 번호를 추출
		int memNum = ((Member)session.getAttribute("loginUser")).getMemNum();
		
		// 현재 로그인 중인 회원의 번호를 memberAndCard MAP 에 삽입
		memberAndCard.put("memNum", memNum);
		
		String resType = (String)memberAndCard.get("resType");
		
		
		// 입력받은 유효기간이 DB에 들어갈 때, 오류가 나지 않도록 년도와 월 순서 바꾸기
		String expTemp = memberAndCard.get("expDate").toString().substring(3, 5) 
						 + "/" 
						 + memberAndCard.get("expDate").toString().substring(0, 2) 
						 + "/01"; // YY/MM/DD 형태로 완성되어짐.
		
		memberAndCard.put("expDate", expTemp); // YY/MM/DD 형태로 기존 유효기간을 덮어씌움.
		
		// 해당 회원이 카드를 가지고 있는지 조회하는 메소드
		Card card = paymentService.selectCardInfo(memNum);
		
		// 해당 회원에 대한 카드 정보를 INSERT 또는 UPDATE 해주는 메소드
		if(card == null) { // 현재 회원이 기존에 가지고 있는 카드가 없다면
		
			// CARD 테이블에 입력한 카드 정보 INSERT
			paymentService.insertCard(memberAndCard);
			
			card = paymentService.selectCardInfo(memNum);
			memberAndCard.put("cardId", card.getCardId());
			
		} else if( ! card.getCardNum().equals((String)memberAndCard.get("cardNum")) ) { // 현재 회원이 기존에 가지고 있는 카드번호와 입력한 카드 번호가 동일하지 않다면
			
			// 기존 카드 정보를 업데이트 하기 위해 cardID 값을 memberAndCard 에 넣어줌
			memberAndCard.put("cardId", card.getCardId());

			// CARD 테이블에 입력한 카드 정보 UPDATE
			paymentService.updateCard(memberAndCard);
			
		}

		//------------------------------이쪽이 추가-------------------------------------
		// 사용자가 예약한 예약 번호, 수거날짜, 요구사항, 총 금액 조회
		Reserve res = new Reserve();
		
		if( ! resType.equals("구독") ) { // 요청한 서비스가 구독이 아닐경우
			res = paymentService.selectRecentReserve(refId, resType);
			
			model.addAttribute("reserve", res);
		}
		
		// 사용자가 선택한 서비스 조회
		if(resType.equals("세탁")) { // 요청한 서비스가 세탁일 경우
			
			List<Lcategory> serviceList = paymentService.selectedLcategory(res);
			model.addAttribute("serviceList", serviceList);
			
		} else if(resType.equals("수선")) { // 요청한 서비스가 수선일 경우
			
			List<Repair> serviceList = paymentService.selectedRepair(res);
			model.addAttribute("serviceList", serviceList);
			
		} else { // 요청한 서비스가 구독일 경우
			
			Subscribe subscribe = paymentService.selectedSubscribe(memNum);
			model.addAttribute("subscribe", subscribe);
			
		}		
		//-------------------------------------------------------------------
		
		model.addAttribute("memberAndCard", memberAndCard);
		
		return "payment/step5";
	}
	
	
	// step5 에서 결제하기 버튼 클릭 시 사용되는 메소드
	@PostMapping("/payConfirm.do")
	public String payConfirm(@RequestParam Map<String, Object> memberAndCard,
							 HttpSession session,
							 Model model) {
		
		// 현재 로그인 중인 회원의 번호를 추출
		int memNum = ((Member)session.getAttribute("loginUser")).getMemNum();
		
		// Email 전송을 위해 미리 Subscribe 객체 생성
		Subscribe subscribe = new Subscribe();
		
		// RESERVE 테이블의 PAY_STATUS 를 Y로 변경 및 PAYMENT 테이블에 INSERT 하는 메소드
		if( memberAndCard.get("resNum") != "" ) { // 선택한 서비스가 세탁/수선 일 경우
			
			Map<String, Object> param = new HashMap<>();
			
			String subNum = (String)memberAndCard.get("subNum"); // 값이 "" 이기 때문에 String 으로 받기
			int resNum = Integer.parseInt((String)memberAndCard.get("resNum"));
			String couNum = (String)memberAndCard.get("couNum");
			String cardId = (String)memberAndCard.get("cardId");
			int totalPrice = Integer.parseInt(memberAndCard.get("totalPrice").toString().replace("원", ""));

			param.put("resNum", resNum);
			param.put("totalPrice", totalPrice);
			
			// 쿠폰 사용했다면 "사용함" 으로 처리하는 메소드
			if( memberAndCard.get("couNum") != "" ) { // 쿠폰을 사용했다면, true
				
				paymentService.updateReservePay(param);
				
				param.put("subNum", subNum); // PAYMENT 테이블에 INSERT 하기위해 MAP 에 값 할당
				param.put("couNum", couNum); // PAYMENT 테이블에 INSERT 하기위해 MAP 에 값 할당
				param.put("cardId", cardId); // PAYMENT 테이블에 INSERT 하기위해 MAP 에 값 할당
				
				paymentService.updateCoupon(Integer.parseInt(couNum)); // 사용한 쿠폰 상태를 변경하기 위해 updateCoupon 호출
				
				paymentService.insertPayment(param); // PAYMENT 테이블에 INSERT
				
			} else { // 쿠폰을 사용하지 않았다면, true
				
				paymentService.updateReservePay(param);
				
				param.put("subNum", subNum); // PAYMENT 테이블에 INSERT 하기위해 MAP 에 값 할당
				param.put("couNum", couNum); // PAYMENT 테이블에 INSERT 하기위해 MAP 에 값 할당
				param.put("cardId", cardId); // PAYMENT 테이블에 INSERT 하기위해 MAP 에 값 할당
				
				paymentService.insertPayment(param); // PAYMENT 테이블에 INSERT
				
			}
			
		} else if( memberAndCard.get("resType").equals("구독") ) { // 선택한 서비스가 구독일 경우
			
			Map<String, Object> param = new HashMap<>();
			
			int subNum = Integer.parseInt((String)memberAndCard.get("subNum"));
			String resNum = (String)memberAndCard.get("resNum");		
			String couNum = (String)memberAndCard.get("couNum");
			String cardId = (String)memberAndCard.get("cardId");
			
			param.put("subNum", subNum); // PAYMENT 테이블에 INSERT 하기위해 MAP 에 값 할당
			param.put("resNum", resNum); // PAYMENT 테이블에 INSERT 하기위해 MAP 에 값 할당
			param.put("couNum", couNum); // PAYMENT 테이블에 INSERT 하기위해 MAP 에 값 할당
			param.put("cardId", cardId); // PAYMENT 테이블에 INSERT 하기위해 MAP 에 값 할당
			
			subscribe = paymentService.selectedSubscribe(memNum); // Email 전송을 위해 구독 정보 조회
			
			paymentService.updateSubscribeStatus(subNum); // SUBSCRIBE 테이블에 STATUS = 'Y' 로 UPDATE
			
			paymentService.insertPayment(param); // PAYMENT 테이블에 INSERT
			
		} else { // 선택한 서비스가 구독변경일 경우
			
			subscribe = paymentService.selectedSubscribe(memNum); // Email 전송을 위해 구독 정보 조회
			
		}

		// 모든 로직이 끝나고, 사용자에게 영수증 이메일 전송
		String path = session.getServletContext().getRealPath("/WEB-INF/views/payment");
		String subject = "[빨래를 부탁해] 서비스 이용 내역";
		String content = new EmailContent().insertContent((String)memberAndCard.get("resType"), subscribe, path, memberAndCard);
		String receiver = "aksuue9797@gmail.com"; // 서비스 신청한 회원의 Email 값 : (String)memberAndCard.get("email");
		String sender = "admin@gmail.com";
		
		emailSender.sendMail(subject, content, receiver, sender);
		
		if( memberAndCard.get("resType").equals("구독변경") ) { // 신청한 서비스가 구독 변경일 때, true 
			session.setAttribute("alertMsg", "구독 정보가 성공적으로 변경되었습니다.");
		} else {
			session.setAttribute("alertMsg", "결제가 성공적으로 완료되었습니다.");
		}
		
		return "redirect:/";
	}
	
}
