package com.kh.laundry.reserve.controller;

import java.util.List;

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
import com.kh.laundry.repair.model.vo.MultiRepair;
import com.kh.laundry.repair.model.vo.Repair;
import com.kh.laundry.reserve.model.service.ReserveService;
import com.kh.laundry.reserve.model.vo.Reserve;
import com.kh.laundry.washing.model.vo.Lcategory;
import com.kh.laundry.washing.model.vo.MultiCategory;

@Controller
@RequestMapping("/reserve")
public class ReserveController {
	
	@Autowired
	private ReserveService reserveService;
	
	@Autowired
	private PaymentService paymentService;
	
	private MultiCategory multiCategory;
	private MultiRepair multiRepair;
	
	// 메뉴바에서  일반서비스신청 페이지로 넘어가는 메서드
	@GetMapping("apply.rs")
	public String apply(HttpSession session) {
		
		if((Member)session.getAttribute("loginUser") != null) {
			return "laundry/apply";			
		}
		else {
			session.setAttribute("alertMsg", "로그인 후에 이용하실 수 있습니다.");
			return "redirect:/";
		}
		
	}
	
	// step1에서 step2 상세설정으로 가는 메서드 (세탁 or 수선)
	@GetMapping("/detail.rs")
	public String detailWashing(@RequestParam String resType,
								Model model,
								HttpSession session) {
		
		// 수선/세탁에 따라서 리스트를 불러올지 말지 정함
		if(resType!=null) {
			if(resType.equals("세탁")) {
				
				List<Lcategory> list = reserveService.selectLaundry();
				
				model.addAttribute("list", list);
				model.addAttribute("resType", resType);
				
				return "laundry/washingDetail";
			}
			else {
				
				model.addAttribute("resType", resType);
				return "laundry/repairDetail";
			}
		}
		else {
			// 아마 오류이니까 오류메시지가지고 메인으로
			session.setAttribute("alertMsg", "신청타입이 없습니다.");
			return "redirect:/reserve/apply.rs";
		}
		
	}
	
	// 세탁상세설정이 step2에서 step3로 가는 메서드 (요청사항,신청내역(수선/세탁)를 보냄)
	@PostMapping("/laundryDay.rs")
	public String selectDay(@ModelAttribute MultiCategory multiList,
							@RequestParam String request,
							@RequestParam String resType,
							Model model,
							HttpSession session) {
		
		if(multiList.getMultiList() != null) {
			multiCategory = multiList;
			
			model.addAttribute("request", request);
			model.addAttribute("resType", resType);
			
			return "laundry/selectDay";			
		}
		else {
			session.setAttribute("alertMsg", "세탁옵션이 없습니다");
			model.addAttribute("resType", resType);
			return "redirect:/reserve/detail.rs";
		}
	}
	
	// 수선상세설정이 step2에서 step3로 가는 메서드 (요청사항,신청내역(수선/세탁)를 보냄)
	@PostMapping("/repairDay.rs")
	public String selectDay(@ModelAttribute MultiRepair multiList,
							@RequestParam String request,
							@RequestParam String resType,
							Model model,
							HttpSession session) {
		
		if(multiList.getMultiList() != null) {
			multiRepair = multiList;
			
			model.addAttribute("request", request);
			model.addAttribute("resType", resType);
			
			return "laundry/selectDay";			
		}
		else {
			session.setAttribute("alertMsg", "수선옵션이 없습니다");
			model.addAttribute("resType", resType);
			return "redirect:/reserve/detail.rs";
		}
		
	}
	
	// 수선예약을 insert하고 step4로 가는 메서드
	@PostMapping("/pay.py")
	public String insertReserve(@ModelAttribute Reserve reserve,
			                    HttpSession session,
								Model model) {
		
		// 현재 로그인 중인 회원의 아이디 추출
	    String refId = ((Member)session.getAttribute("loginUser")).getMemId(); // memberService 에서 refId 로 받기때문에 변수명을 맞춰줌.
	    
	    // 회원번호 받기
	    int memNum = ((Member)session.getAttribute("loginUser")).getMemNum();
	    reserve.setMemNum(memNum);
		
		// 타입이 세탁일시
		if(reserve.getResType().equals("세탁")) {
			
			int price = 0;
			if(multiCategory.getMultiList() != null) { //세탁의 값들이 있을때
				
				// 총금액 구하는 반복문
				for(Lcategory l : multiCategory.getMultiList()) {
					price += l.getLPrice(); // 총가격 구함
				}
				reserve.setTotalPay(price); // 총 가격을 예약vo에
				
				// 예약 insert (세탁)
				int result = reserveService.insertReserve(reserve);
				
				if(result>0) { // 성공시 그 예약번호 select해서 예약번호가져오기
					
					// 사용자가 예약한 예약 번호 및 총 금액 조회
					Reserve res = paymentService.selectRecentReserve(refId, reserve.getResType());
					
					if(res != null) { // 성공시 예약번호를 제대로 가져왔을 때
						int rNum = res.getResNum();
						
						int result2 = reserveService.insertLaundry(rNum, multiCategory);
						
						if(result2>0) { // 다 성공 시
							
							List<Lcategory> serviceList = paymentService.selectedLcategory(res);
								
								// 회원의 카드 정보 조회
								Card cardInfo = paymentService.selectCardInfo(memNum);

								// 회원의 정보 조회
								model.addAttribute("loginUser", (Member)session.getAttribute("loginUser"));
								// 카드 정보
								model.addAttribute("cardInfo", cardInfo);
								// 선택서비스 셀렉
								model.addAttribute("serviceList", serviceList);
								model.addAttribute("reserve", res);
								model.addAttribute("resType", reserve.getResType());
								
								return "payment/step4";	
								
						}
						else { // 실패
							// 실패메시지(런드리테이블 인서트 실패)
							session.setAttribute("alertMsg", "세탁신청에 실패했습니다");
							return "redirect:/";
						}
					}
					else { // 예약번호를 못 가져옴
						// 실패메시지
						session.setAttribute("alertMsg", "예약번호가 없습니다");
						return "redirect:/";
					}
				}
				else { // 실패
					// 예약 인서트실패메시지
					session.setAttribute("alertMsg", "예약에 실패했습니다");
					return "redirect:/";
				}
				
			}
			else { // 세탁물들이 없을때
				session.setAttribute("alertMsg", "세탁옵션이 없습니다");
				return "redirect:/";
			}
		}
		else if(reserve.getResType().equals("수선")) { // 타입이 수선일시
			
			int price = 0;
			if(multiRepair.getMultiList() != null) { // 수선의 값들이 있을때
				
				for(Repair r : multiRepair.getMultiList()) {
					price += r.getRPrice();
				}
				reserve.setTotalPay(price);
				
				// 예약 insert (수선)
				int result = reserveService.insertReserve(reserve);
				
				if(result>0) { // 성공시 그 예약번호 select해서 예약번호가져오기
					
					Reserve res = paymentService.selectRecentReserve(refId, reserve.getResType());
					
					if(res != null) { // 예약번호를 잘 가져왔을때
						int rNum = res.getResNum();
						
						int result2 = reserveService.insertRepair(rNum, multiRepair);
						
						if(result2>0) { // 다 성공 시
							
							List<Repair> serviceList = paymentService.selectedRepair(res);
							
							// 회원의 카드 정보 조회
							Card cardInfo = paymentService.selectCardInfo(memNum);

							// 회원의 정보 조회
							model.addAttribute("loginUser", (Member)session.getAttribute("loginUser"));
							// 카드 정보
							model.addAttribute("cardInfo", cardInfo);
							// 선택서비스 셀렉
							model.addAttribute("serviceList", serviceList);
							model.addAttribute("reserve", res);
							model.addAttribute("resType", reserve.getResType());
							
							return "payment/step4";
						}
						else { // 실패
							// 실패메시지(리페어테이블 인서트 실패)
							session.setAttribute("alertMsg", "수선신청에 실패했습니다");
							return "redirect:/";
						}
					}
					else { // 예약번호 가져오기 실패
						//실패메시지(예약번호 실패)
						session.setAttribute("alertMsg", "예약번호가 없습니다");
						return "redirect:/";
					}
					
				}
				else { // 예약 실패
					//실패메시지(예약 insert실패)
					session.setAttribute("alertMsg", "예약에 실패했습니다");
					return "redirect:/";
				}
			}
			else {
				session.setAttribute("alertMsg", "수선옵션이 없습니다");
				return "redirect:/";
			}
		}
		
		// 신청타입이 없을 때
		session.setAttribute("alertMsg", "신청타입이 없습니다.");
		return "redirect:/";
		
		
	}
}
