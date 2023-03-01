package com.kh.laundry.mypage.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

import com.kh.laundry.ask.model.service.AskService;
import com.kh.laundry.ask.model.vo.Ask;
import com.kh.laundry.common.model.vo.PageInfo;
import com.kh.laundry.coupon.model.service.CouponService;
import com.kh.laundry.coupon.model.vo.Coupon;
import com.kh.laundry.member.model.service.MemberService;
import com.kh.laundry.member.model.vo.Member;

import com.kh.laundry.payment.model.service.PaymentService;

import com.kh.laundry.payment.model.vo.Payment;
import com.kh.laundry.payment.model.vo.SubscribePayment;
import com.kh.laundry.reserve.model.service.ReserveService;
import com.kh.laundry.reserve.model.vo.Reserve;
import com.kh.laundry.reserve.model.vo.ReserveDetail;
import com.kh.laundry.subscribe.model.service.SubscribeService;
import com.kh.laundry.subscribe.model.vo.Subscribe;

@Controller
@RequestMapping("/myPage")
public class MyPageController {

	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CouponService couponService;
	
	@Autowired
	private SubscribeService subscribeService;
	
	@Autowired
	private PaymentService paymentService;
	
	@Autowired
	private AskService askService;
	
	@Autowired
	private ReserveService reserveService;
	
	
	
	
	@GetMapping("/")
	public String myPage(Model model, HttpSession session)
	{
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		Member member = memberService.selectMemberById(loginUser.getMemId());

		
		if(member != null) {
		
			
			model.addAttribute("loginUser", member);
		}else {
			System.out.println("마이페이지에 멤버 못 불려옴");
		}
		
		
		return "mypage/myPage";
	}
	
	@GetMapping("/coupon.do")
	public String coupon(HttpSession session,
						 Model model) {

		Member loginUser = (Member)session.getAttribute("loginUser");
		List<Coupon> couponList = couponService.selectCouponList(loginUser.getMemNum());
		
		model.addAttribute("couponList", couponList);
		
		return "mypage/coupon";
	}
	
	@GetMapping("/subscribe.do")
	public String subscribe(HttpSession session,
						 Model model) {

		Member loginUser = (Member)session.getAttribute("loginUser");
		Subscribe sub = subscribeService.selectSubscribe(loginUser.getMemNum());
		model.addAttribute("sub", sub);
		if(sub != null) {
			ArrayList<String> subContent = new ArrayList<String>();
			if(sub.getSubOption() =="프리미엄") {
				subContent.add("바구니사이즈 30L");
				subContent.add("집앞 수거 및 배송");
				subContent.add("친환경 세재 사용");
				subContent.add("다림질 서비스");
				subContent.add("소재별 분류 세탁");
				
			}else if(sub.getSubOption() =="스탠다드") {
				subContent.add("바구니사이즈 20L");
				subContent.add("집앞 수거 및 배송");
				subContent.add("친환경 세재 사용");
				subContent.add("다림질 서비스");
				subContent.add("소재별 분류 세탁");
			}else {
				subContent.add("바구니사이즈 10L");
				subContent.add("집앞 수거 및 배송");
				subContent.add("친환경 세재 사용");
				subContent.add("소재별 분류 세탁");
				
			}
			model.addAttribute("subContent", subContent);
		}
	
		SubscribePayment payment = paymentService.selectSubPayment(sub.getSubNum());
		
		String last4digits = "";
		if(payment != null) {
			 last4digits  = payment.getCardNum().substring(12);
			
		}
		
		model.addAttribute("payment", payment);
		model.addAttribute("last4digits", last4digits);
		
		Date today = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	 	String ftToday = format.format(today);		
				
			model.addAttribute("today", ftToday);
		
		return "mypage/subscribe";
	}
	
	
	
	@GetMapping("/updateForm.do")
	public String updateForm(Model model, 
							HttpSession session
							) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		Member member = memberService.selectMemberById(loginUser.getMemId());

		
		if(member != null) {	
			
			
			// 핸드폰 번호 나누기
			String phone = member.getPhone();
			 
			 String p1 = phone.substring(0,3);
			 String p2 = phone.substring(3,7);
			 String p3 = phone.substring(7);
			 
			
			 // 이메일 나누기
			 String email = member.getEmail();
			 
			 String e1 = email.substring(0,email.indexOf("@"));
			 String e2 = email.substring(email.indexOf("@")+1);
		
	
			 // 주소
			 String address = member.getAddress();
			
				 
			String a1 = address.substring(0, address.indexOf("동")+1);
				 
			
			 String a2 = address.substring(address.indexOf("동")+1);

		
			 
			model.addAttribute("loginUser", member);
			model.addAttribute("p1", p1);
			model.addAttribute("p2", p2);
			model.addAttribute("p3", p3);
			model.addAttribute("e1", e1);
			model.addAttribute("e2", e2);
			model.addAttribute("a1", a1);
			model.addAttribute("a2", a2);
			
			
			
		}else {
			System.out.println("마이페이지에 멤버 못 불려옴");
		}
		
		
		return "mypage/updateForm";
	}
	
	@PostMapping("/update.do")
	public String update(@ModelAttribute Member member,
						HttpSession session) {
		int result = memberService.updateMember(member);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "내 계정 정보가 업데이트 되었습니다.");
		}else {
			session.setAttribute("alertMsg", "내 계정 정보 업데이트에 실패하였습니다.");
		}
		
		 return "redirect:/myPage/";
		
	}
	
	@PostMapping("/updatePwd.do")
	public String updatePwd(@RequestParam String newPwd,
							@RequestParam String memNum,
							HttpSession session) {
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("newPwd", newPwd);
		param.put("memNum", memNum);	
	 int result = memberService.updatePwd(param);
	 
		 if(result > 0) {
			 session.setAttribute("alertMsg", "비밀번호 변경에 성공하였습니다.");
			 return "redirect:/myPage/";
		 }else {
			 
			 session.setAttribute("alertMsg", "비밀번호 변경에 실패하셨습니다.");
			 return "redirect:/myPage/";
		 }
			
			
	}
	
	@GetMapping("/cancelSub.do")
	public String cancelSub(HttpSession session, HttpServletRequest request)	{
		
	
		Member loginUser = (Member)session.getAttribute("loginUser");
		Subscribe sub = subscribeService.selectSubscribe(loginUser.getMemNum());

	
	
		int result = paymentService.cancelSubscription(sub.getSubNum());
		Payment payment = paymentService.isSubscribeRefund(sub.getSubNum());
	
		
			session.setAttribute("payment", payment);
		if(result > 0) {
			session.setAttribute("alertMsg", "구독을 성공적으로 취소하셨습니다.");
			session.setAttribute("cancelAlert", "구독은 만료일까지 유지 됩니다.");

	
		}else {
			session.setAttribute("alertMsg", "구독 취소에 실패하였습니다.");
		}
		
		
		
		return "redirect:subscribe.do";
	}
	
	@PostMapping("/changePayment.do")
	public String changePayment(@RequestParam String cardNum1,
								@RequestParam String cardNum2,
								@RequestParam String cardNum3,
								@RequestParam String cardNum4,
								@RequestParam String cardCom,
								@RequestParam String cardCvc,
								@RequestParam String expDate,
								HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String cardNum = cardNum1+cardNum2+cardNum3+cardNum4;	

		
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("cardNum", cardNum);
		param.put("cardCom", cardCom);
		param.put("cardCvc", cardCvc);
		param.put("expDate", expDate);
		param.put("memNum", loginUser.getMemNum());
		
		int result = paymentService.changePayment(param);
		
		if(result > 0) {
			session.setAttribute("alertMsg","결제 수단 정보 변경에 성공하셨습니다.");
		}else {
			session.setAttribute("alertMsg","결제 수단 정보 변경에 실패하였습니다.");
		}
		
		
		return "redirect:subscribe.do";
		
	}
	
	@GetMapping("/deleteAccount.do")
	public String deleteAccount(HttpSession session) {
		
	Member loginUser =	(Member)session.getAttribute("loginUser");
		
		int result = memberService.deleteAccount(loginUser.getMemNum());
		
		if(result > 0) {
			
			session.removeAttribute("loginUser");
			session.setAttribute("alertMsg", "계정이 삭제되었습니다. 안녕히가세요ㅠㅠ");
			
		}else {
			session.setAttribute("alertMsg", "계정 삭제에 실패하였습니다.");
		}
		
		return "redirect:/";
	}
	
	@GetMapping("/paymentList.do")
	public String paymentList(HttpSession session, Model model) {
		
	Member loginUser =	(Member)session.getAttribute("loginUser");
		
		List<SubscribePayment> spList = paymentService.paymentList(loginUser.getMemNum());	
		
		for(int i =0; i< spList.size(); i++) {
		spList.get(i).setCardNum(spList.get(i).getCardNum().substring(12));;
			
	
		
		
		}
		model.addAttribute("spList", spList);
		
		
	
		
		
		return "mypage/paymentList";
	}
	
	@GetMapping("/askList.do")
	public String selectAskList(HttpSession session,
			@RequestParam int currentPage,
			Model model) {
			
		Member loginUser = (Member)session.getAttribute("loginUser");
		Map<String, Object> param = new HashMap<String, Object>();
		int totalCount = 0;
		int memNum = loginUser.getMemNum();
		
		param.put("memNum", memNum);
		
		
		List<Ask> list = new ArrayList<Ask>();
		
		totalCount = askService.askListCount(memNum);
		// 페이징바의 페이지 최대 개수 (페이징 처리용)
		int pageLimit = 5;

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
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getListLimit() + 1;
		int endRow = startRow + pi.getListLimit() -1;
		
		param.put("startRow", startRow);
		param.put("endRow", endRow);
		
		list =  askService.selctAskList(param);
		
		model.addAttribute("list", list);
		return  "mypage/askList";
	}
	
	@GetMapping("/askDetail.do")
	public String askDetail(@RequestParam String askNo, Model model) {
	  Ask ask =	askService.selectAskByAskNo(Integer.parseInt(askNo));
	  
	  
	  model.addAttribute("ask", ask);
		
		return "mypage/askDetail";
		
	}
	
	
	
	// 재웅
	@GetMapping("/reserveList.do")
	public String reserveList(HttpSession session, Model model,
			@RequestParam int currentPage,
			@RequestParam(required = false, defaultValue= "default") String resType) {
		
		Member loginUser =	(Member)session.getAttribute("loginUser");
		
		int memNum = loginUser.getMemNum();
		
		int totalCount = 0;
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("memNum", memNum);
		param.put("resType", resType);
		
		
		if(resType.equals("default")) {
			// 현재 회원이 예약한 내역 총 개수 (페이징 처리용)
			totalCount = reserveService.reserveCount(memNum);
		} else {
			totalCount = reserveService.reserveTypeCount(param);
		}
		

		// 페이징바의 페이지 최대 개수 (페이징 처리용)
		int pageLimit = 5;

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
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getListLimit() + 1;
		int endRow = startRow + pi.getListLimit() -1;
		
		param.put("startRow", startRow);
		param.put("endRow", endRow);
		
		List<Reserve> list = new ArrayList<Reserve>();
		
		if(resType.equals("default")) {
			list = reserveService.selectResList(param);
		} else {
			list = reserveService.selectResTypeList(param);
		}
		
		
		model.addAttribute("list", list);
		
		return "mypage/reserveList";
	}
	
	@GetMapping("/resListDetail.do")
	public String content(
			@RequestParam int resNum,
			Model model) {
		
		
		List<ReserveDetail> list = reserveService.resListDetail(resNum);
		String cardNum = list.get(0).getCardNum();
		
		String last4digits = cardNum.substring(12);
		list.get(0).setCardNum(last4digits);
		
		model.addAttribute("list", list);
		
			
		// 응답뷰 지정
		return "mypage/reserveListDetail";

		
	}

	
}
