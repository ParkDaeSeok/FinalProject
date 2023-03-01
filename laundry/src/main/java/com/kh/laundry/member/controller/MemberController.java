package com.kh.laundry.member.controller;



import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.laundry.coupon.model.service.CouponService;
import com.kh.laundry.coupon.model.vo.Coupon;
import com.kh.laundry.member.model.service.MemberService;
import com.kh.laundry.member.model.vo.Member;
import com.kh.laundry.payment.model.service.PaymentService;
import com.kh.laundry.payment.model.vo.Payment;
import com.kh.laundry.subscribe.model.service.SubscribeService;
import com.kh.laundry.subscribe.model.vo.Subscribe;




@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CouponService couponService;
	
	@Autowired
	private SubscribeService subscribeService;
	
	@Autowired
	private PaymentService paymentService;
	
	@GetMapping("/register.do")
	public String register() {
		
		return "member/register";
	}
	@GetMapping("/login.do")
	public String login() {
		
		return "member/login";
	}
	@PostMapping("/login.do")
	public String login(@ModelAttribute Member member,
						HttpSession session,
						HttpServletRequest request,
						Model model){
		
		
	
		
		
	
	

		// 만료된 쿠폰 업데이트 하기 
		List<Coupon> cList = couponService.selectCouponListForAll();
		
		if(cList != null) {

			LocalDate now = LocalDate.now();
			for(Coupon c: cList) {
					String expDate = c.getExpDate();
					String shortExpDate = expDate.substring(0,10);
					LocalDate expLocalDate = LocalDate.parse(shortExpDate, DateTimeFormatter.ISO_DATE);
					int compare = now.compareTo(expLocalDate);
					if(compare > 0) {
				
						int result = couponService.couponEdateUpdate(c.getCouNum());
						
						if(result > 0) {
							System.out.println("만료된 쿠폰 삭제 완료");
						}else {
							System.out.println("만료된 쿠폰 삭제 실패");
						}
					}
	
			}
		}
		
		// 내 구독 업데이트 하기 
		Member user = memberService.selectMemberById(member.getMemId());
		List<Subscribe> mySList = subscribeService.selectMySubscribeList(user.getMemNum());
		Subscribe myActiveSubscribe = subscribeService.selectSubscribe(user.getMemNum());
		
		
		
		if(mySList != null && mySList.size() > 1) {
			
		

			// 환불 신청이 되어있다.
			
	
			Payment payment = paymentService.isSubscribeRefund(myActiveSubscribe.getSubNum());
	
			LocalDate now = LocalDate.now();
			if(payment != null && payment.getRefund().equals("Y")) {
			
				String expDate = myActiveSubscribe.getSubEdate();
				String shortExpDate = expDate.substring(0,10);
				LocalDate expLocalDate = LocalDate.parse(shortExpDate, DateTimeFormatter.ISO_DATE);
				int compare = now.compareTo(expLocalDate);
				if(compare > 0) {
			
					int result = subscribeService.deleteExistingSubscribe(myActiveSubscribe.getSubNum());
					
					if(result > 0) {
						System.out.println("만료된 구독 N으로 업데이트 완료");
					}else {
						System.out.println("만료된 구독 업데이트 실패");
					}
				}
			}else {
				// 환불 신청이 안되어있다.
				
				
				if(myActiveSubscribe != null) {
					LocalDate now2 = LocalDate.now();
					
					
					String expDate = myActiveSubscribe.getSubEdate();
					String shortExpDate = expDate.substring(0,10);
					LocalDate expLocalDate = LocalDate.parse(shortExpDate, DateTimeFormatter.ISO_DATE);
					int compare = now2.compareTo(expLocalDate);
					if(compare > 0) {
							
						
							// 새롭게 추가된 구독정보로 Y업데이트하기
							if(mySList.size() > mySList.indexOf(myActiveSubscribe)+1) {
								// mySList의 길이가 현재 active인 인덱스 + 1 값보다 클때
								
								int result = subscribeService.updateSuscribe(mySList.get(mySList.size() -1 ).getSubNum());
								int result2 = subscribeService.deleteExistingSubscribe(myActiveSubscribe.getSubNum());
								
							
								if(result * result2> 0) {
									
									Map<String, Integer> param = new HashMap<String, Integer>();
									param.put("existingSubNum", myActiveSubscribe.getSubNum());
									param.put("newSubNum", mySList.get(mySList.size() -1 ).getSubNum());
									
									int result3 = paymentService.updateSubNum(param);
									if(result3 > 0) {
										System.out.println("payment subNum 업데이트 성공");
									}else {
										System.out.println("payment subNum 업데이트 실패");
									}
									
									
								}else {
									System.out.println("구독 업데이트 실패 또는 payment업데이트 실패");
								}
							}else {
								
							System.out.println("새로 추가된 업데이트가 없다.");
							}
					}else {
						System.out.println("기존 구독이 만료가 되지 않음");
					}
				}else {
					System.out.println("현재 active한 구독이 없음");
				}
				
				
				
			}
			
			
			
			
			
		}else {
			System.out.println("나의 구독 리스트가 없거나 업데이트할 구독 정보가 없다");
		}
		
		

		// 모든 회원 구독 연장하기 

				List<Subscribe> sList = subscribeService.selectSubscribeListforAll();
			
				if(sList != null) {
					LocalDate now2 = LocalDate.now();
					
					for(Subscribe s: sList) {
						
						
							String expDate = s.getSubEdate();
							String shortExpDate = expDate.substring(0,10);
							LocalDate expLocalDate = LocalDate.parse(shortExpDate, DateTimeFormatter.ISO_DATE);
							int compare = now2.compareTo(expLocalDate);
							if(compare > 0) {
						
								int result = subscribeService.subscriptionExtension(s.getSubNum());
								// update paydate in payment table
								
								if(result > 0) {
									System.out.println("구독 연장  완료");
								}else {
									System.out.println("구독 연장 실패");
								}
							}
					
					}
				}
		// 로그인 세션 처리
		
		Member loginUser = memberService.loginMember(member);
		
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			model.addAttribute("loginUser", loginUser);
			return "redirect:/";
			
		}else {
			session.setAttribute("alertMsg", "로그인에 실패하셨습니다.");
			return "redirect:login.do";
			
		}
		

		
	
	}
	
	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	@GetMapping("/findId.do")
	public String findId() {
		return "member/findId";
	}
	@GetMapping("/findPwd.do")
	public String findPwd() {
		return "member/findPwd";
	}
	

	
	@PostMapping("/insert.do")
	public String memberInsert(@ModelAttribute Member member, 
							   @RequestParam(required = false) String refId,
							   HttpSession session) {
		
		int result =0; // 회원등록
		int result2 = 0; // 친구 쿠폰 등록
		int result3 = 0; // 웰컴 쿠폰 등록
		
		if(refId != "") {
			
			Member selectedMember = memberService.selectMemberById(refId);
			member.setRecNum(selectedMember.getMemNum());
		}
		
			
		
		
		result = memberService.insertMember(member);
		
		if(result > 0) {
			
			if(refId.length() > 0) {
				
				// 친구 아이디가 있다면 친구추천 쿠폰 등록
				Coupon couFriend = new Coupon();
				couFriend.setMemNum(member.getRecNum());
				couFriend.setCouType("recFriend");
				couFriend.setDiscount(10);
				result2 =	couponService.insertCoupon(couFriend);
				if(result2 > 0) {
					System.out.println("친구한테 쿠폰이 전달되었습니다.");
				}else {
					System.out.println("친구 쿠폰 전달이 실패");
				}
			}
			
			
			// 웰컴 쿠폰 등록
			Coupon cou = new Coupon();
			Member newMember = memberService.selectMemberById(member.getMemId());
			cou.setMemNum(newMember.getMemNum());
			cou.setCouType("welcome");
			cou.setDiscount(30);
			result3 =	couponService.insertCoupon(cou);
			
			
			
			
			if(result2 > 0 && result3 > 0 ) {
				// 친구 추천 + 웰컴쿠폰 
				session.setAttribute("alertMsg", "환영합니다:) 회원님께 welcome 쿠폰이 지급되었습니다! "+refId+"께 친구 추천 쿠폰이 지급되었습니다."+"[마이페이지-쿠폰함]을 확인해보세요.");
			}else if(result2 == 0 && result3 >0) {
				//  웰컴쿠폰 
				session.setAttribute("alertMsg", "환영합니다:) 회원님께 welcome 쿠폰이 지급되었습니다! [마이페이지-쿠폰함]을 확인해보세요.");
			}else {
				session.setAttribute("alertMsg","환영합니다:)");
			}	
			
	
		}else {
			System.out.println("회원 추가가 실패했습니다.");
		}
	
		
		return "redirect:login.do";
	}
}
