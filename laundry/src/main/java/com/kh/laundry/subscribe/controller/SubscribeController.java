package com.kh.laundry.subscribe.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.laundry.card.model.vo.Card;
import com.kh.laundry.member.model.vo.Member;
import com.kh.laundry.payment.model.service.PaymentService;
import com.kh.laundry.subscribe.model.service.SubscribeService;
import com.kh.laundry.subscribe.model.vo.Subscribe;

@Controller
@RequestMapping("/subscribe")
public class SubscribeController {
	@Autowired
	private SubscribeService subscribeService;
	
	@Autowired
	private PaymentService paymentService;
	
	
	@GetMapping("/sub.sb")
	public String Sub(HttpSession session,
					  Model model ) {
		
		// 로그인을 했을 시 
		if((Member)session.getAttribute("loginUser") != null) {
			
			int memNum = ((Member)session.getAttribute("loginUser")).getMemNum();
			
			Subscribe subscribe = subscribeService.selectSubscribe(memNum);

			if(subscribe == null) {
				// 구독 없을경우(구독 신청부분으로 넘어감)
				return "subscribe/sub";
			}
			else {
				// 구독 있을경우 (구독변경 페이지로 넘어감)
				model.addAttribute("subscribe", subscribe);
				return "subscribechange/sub2c";
			}
			
		}
		else { // 로그인 안 했을 시 
			session.setAttribute("alertMsg", "로그인 후에 이용하실 수 있습니다.");
			return "redirect:/";
		}
	}
	
	// 각 요금제에 값을 받아오고 step2로 가는 메서드
	@PostMapping("/sub.sb")
	public String sub(@RequestParam (required=false) String subOption,
					  HttpSession session,
					  Model model) {
		
		if(subOption != null) {
			// /로 나눈다 첫번째는 구독옵션이고 두번째는 가격
			String[] str = subOption.split("/");
			
			
			model.addAttribute("subOption", str[0]);
			model.addAttribute("price", str[1]);
			
			return "subscribe/subq";			
		}
		else {
			session.setAttribute("alertMsg", "구독옵션을 선택하셔야합니다.");
			return "redirect:/subscribe/sub.sb";
		}
		
	}
	
	// step2에서 날짜까지 받아서 구독에 insert하고 step3결제로 가는 메서드
	@PostMapping("subq.sb")
	public String subq(@ModelAttribute Subscribe subscribe,
					   HttpSession session,
					   Model model) {
		
		// 오늘 날짜로부터 +30일인 결제 취소일 계산하는 
		Date today = new Date();
		
		Calendar cal = Calendar.getInstance();
		
		SimpleDateFormat dtFormat = new SimpleDateFormat("yyyyMMdd");
		
		cal.setTime(today); 
		cal.add(Calendar.DATE, 30);
		
		// 날짜를 계산한것
		String date = dtFormat.format(cal.getTime());
		
		// 결제취소일을 넣는 
		subscribe.setSubEdate(date);
		
		// 로그인한 회원번호 받기
		int memNum = ((Member)session.getAttribute("loginUser")).getMemNum();
		
		// 회원번호 구독 객체에 넣기
		subscribe.setMemNum(memNum);
		
		// 구독들의 정보를 가지고 insert
		int result = subscribeService.insertSubscribe(subscribe);
		
		if(result>0) { // 성공
			
			Subscribe sub = paymentService.selectedSubscribe(memNum);
			model.addAttribute("subscribe", sub);
			
			// 회원의 정보 조회
			model.addAttribute("loginUser", (Member)session.getAttribute("loginUser"));
			
			
			// 회원의 카드 정보 조회
			Card cardInfo = paymentService.selectCardInfo(memNum);
			
			model.addAttribute("cardInfo", cardInfo);
			
			model.addAttribute("resType", "구독");
			
			return "payment/step4";
		}
		else { // 실패
			session.setAttribute("alertMsg", "구독신청에 실패했습니다");
			return "redirect:/";
		}
		
	}
	

	
	//구독 변경 시작 (/laundry/src/main/webapp/WEB-INF/views/subscribechange/sub2c.sb)
		// 제일 처음 메서드에 바꾸는게 있어서 없어도 될 것 같네요
//		@GetMapping("/sub2c.sb")
//		public String Sub2c() {
//			return "subscribechange/sub2c";
//		}
		
		
		// step1에서 바꾼 구독 변경과 원래 있던 구독요일을 받아온다 그리고 step2로 가는 메서드
		@PostMapping("/sub2c.sb")
		public String sub2c(@RequestParam (required=false)String subOption,
							@RequestParam String subDay,
							@RequestParam String subEdate,
							HttpSession session,
						  	Model model) {
			
			//System.out.println(subOption);

			if(subOption != null) {
				// /로 나눈다
				String[] str = subOption.split("/");
				
				
				model.addAttribute("subOption", str[0]);
				model.addAttribute("price", str[1]);
				model.addAttribute("subDay", subDay);
				model.addAttribute("subEdate", subEdate);
				
				return "subscribechange/subqc";
				
			}
			else {
				session.setAttribute("alertMsg", "구독옵션을 선택하셔야합니다.");
				return "redirect:/subscribe/sub.sb";
			}
			
			
		}
		
		
		// 구독변경 step2에서 결제로 이동하는 메서드
		@GetMapping("/subqc.sb")
		public String sub2c(@ModelAttribute Subscribe subscribe,
						    HttpSession session,
						    Model model) {

			
			// 제대로 들어갔는지 확인
			//System.out.println(subscribe);
			
			
		
			// 오늘 날짜로부터 +30일인 결제 취소일 계산하는 
			//Date today = new Date();
		
			Calendar cal = Calendar.getInstance();
		
			SimpleDateFormat dtFormat = new SimpleDateFormat("yyyyMMdd");

			// 받아온 edate를 년/월/일로 나누어서 int형으로 정하는 
			int year = Integer.parseInt(subscribe.getSubEdate().substring(0,4));
			int month = Integer.parseInt(subscribe.getSubEdate().substring(5,7));
			int day = Integer.parseInt(subscribe.getSubEdate().substring(8,10));
		
			// 나눈 년/월/일을 cal에 저장
			cal.set(Calendar.YEAR , year);
		    cal.set(Calendar.MONTH , month-1);
		    cal.set(Calendar.DAY_OF_MONTH , day+1);
		    
		    String eDate = dtFormat.format(cal.getTime());
		    // subEdate를 정해서 넣기전에 subEdate를  구독변경 subSdate로 지정하는 메서드 
		 	subscribe.setSubSdate(eDate);
			
		    
		    // 그 eDate에 +30일을 하는 
			cal.add(Calendar.DATE, 30);
		
			// 날짜를 계산한것
			String date = dtFormat.format(cal.getTime());
		
			//System.out.println(date);
		
			// 결제취소일을 넣는 
			subscribe.setSubEdate(date);
		
			// 로그인한 회원번호 받기
			int memNum = ((Member)session.getAttribute("loginUser")).getMemNum();
		
			// 회원번호 구독 객체에 넣기
			subscribe.setMemNum(memNum);
			
		
			// 구독들의 정보를 가지고 구독변경 인서트
			int result = subscribeService.insertSubChange(subscribe);
		
			if(result>0) { // 성공
				
				Subscribe sub = paymentService.selectedSubscribe(memNum);
				model.addAttribute("subscribe", sub);
				
				// 회원의 정보 조회
				model.addAttribute("loginUser", (Member)session.getAttribute("loginUser"));
				
				
				// 회원의 카드 정보 조회
				Card cardInfo = paymentService.selectCardInfo(memNum);
				
				model.addAttribute("cardInfo", cardInfo);
				
				model.addAttribute("resType", "구독변경");
				
				return "payment/step4";
			}
			else { // 실패
				session.setAttribute("alertMsg", "구독변경에 실패했습니다");
				return "redirect:/";
			}
	}
		
}
