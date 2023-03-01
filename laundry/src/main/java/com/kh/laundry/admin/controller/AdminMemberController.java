package com.kh.laundry.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.laundry.ask.model.service.AskService;
import com.kh.laundry.ask.model.vo.Ask;
import com.kh.laundry.attachment.model.vo.Attachment;
import com.kh.laundry.common.model.vo.PageInfo;
import com.kh.laundry.member.model.service.MemberService;
import com.kh.laundry.member.model.vo.Member;
import com.kh.laundry.repair.model.service.RepairService;
import com.kh.laundry.reserve.model.service.ReserveService;
import com.kh.laundry.reserve.model.vo.Reserve;
import com.kh.laundry.review.model.service.ReviewService;
import com.kh.laundry.subscribe.model.service.SubscribeService;
import com.kh.laundry.subscribe.model.vo.Subscribe;
import com.kh.laundry.washing.model.service.LaundryService;
import com.kh.laundry.washing.model.vo.Lcategory;

@Controller
@RequestMapping("/admin")
public class AdminMemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AskService askService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private SubscribeService subscribeService;
	
	@Autowired
	private LaundryService laundryService;
	
	@Autowired
	private RepairService repairService;
	
	@Autowired
	private ReserveService reserveService;
	
	@Autowired
	private SqlSession sqlSession;
	
	
	
	//관리자 대시보드
	@GetMapping("/adminDash.do")
	public String adminDash() {
		return "admin/adminDash";
	}
	

	
	//회원 목록 조회 + 검색 + 페이징처리
	@GetMapping("/union.do")
	public String union(
			@RequestParam(defaultValue = "MEM_NAME") String type,
			@RequestParam(defaultValue = "") String keyword,
			Model model,
			HttpSession session,
			@RequestParam(defaultValue = "1") int currentPage) {
		
		Map<String,String> param = new HashMap<>();
		
		param.put("type", type);
		param.put("keyword", keyword);
		
		int totalCount = memberService.memberCount(param);
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
		
		param.put("startRow", String.valueOf(startRow));
		param.put("endRow",  String.valueOf(endRow));
		
		List<Member> pageList = memberService.selectMemList(param);
			
		model.addAttribute("pageList", pageList);
		model.addAttribute("param", param); // 검색상태 유지하려고 같이 보낸 값 
		
		return "admin/adminMember";
 	}
	
	
	
	//관리자모드에서 문의내역을 보여주는 메소드
	@GetMapping("/askList.do")
	public String askList(HttpSession session, Model model,
			@RequestParam int currentPage) {
		
				
				// 현재 회원이 예약한 내역 총 개수 (페이징 처리용)
				int totalCount = askService.askCount();
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
				
				Map<String, Integer> param = new HashMap<String, Integer>();
				param.put("startRow", startRow);
				param.put("endRow", endRow);
				
				List<Ask> pageList = askService.adminSelectAskList(param);
				
				model.addAttribute("pageList", pageList);
				
				return "admin/adminAsk";
		
	}
	
	//관리자모드 문의내역 상세보기
	@GetMapping("/detail.do")
	public String adminAskDetail(
			@RequestParam int askNum,
			Model model) {
		
		Ask ask = askService.adminAskDetail(askNum);
		
		List<Attachment> attList = askService.attList(askNum);
		

		
		/*
		 * 1. Attachment VO 클래스 만들기
		 * 2. List<Attachment> 형식으로 SELECT문 실행 후 해당 문의사항에 대한 첨부파일 목록 받아오기
		 * => 문의사항 번호로 조건 걸기 (WHERE 절)
		 * 3. model 로 리스트 보내기
		 * 4. jsp 에서 list 가 있다면 반복 돌려서 <img src="${ pageContext.request.contextPath }/resources/askFiles/~~~.jpg"> 로 출력하기
		 */
		model.addAttribute("ask", ask);
		
		model.addAttribute("attList" , attList);
		
		
		return "admin/adminAskDetail";
		
		
	}
	
	//관리자모드 문의내용 답변하기
	//이름은 insertAnswer이지만 UPDATE 이용함 (WHERE절 떄문에)
	@PostMapping("/insertAnswer.do")
	public String insertAnswer(@ModelAttribute Ask ask) {
		
		int insertAnswer = askService.insertAnswer(ask);
		
		return "redirect:askList.do?currentPage=1";
	}
	
	//관리자모드 통계관리
	@GetMapping("/static.do")
	public String adminStatic(Model model) {
		
		//총회원수 페이징처리떄문에 추가
		Map<String,String> param = new HashMap<>();

		// 총회원수 
		int result = memberService.memberCount(param);
		
		model.addAttribute("result" , result);
		
		//총 후기수
		int resultReview = reviewService.reviewCount();
		
		model.addAttribute("resultReview" , resultReview);
		
		//총 문의수 
		int resultAsk = askService.askCount();
		model.addAttribute("resultAsk" , resultAsk);
		
		//총 구독자수
		int resultSubscribe  = subscribeService.subscribeCount();
		
		model.addAttribute("resultSubscribe" , resultSubscribe);
		
		//총 세탁건수 
		int resultLaundry = laundryService.laundryCount();
		
		model.addAttribute("resultLaundry" , resultLaundry);
		
		//총 수선건수
		int resultRepair = repairService.repairCount();
		
		model.addAttribute("resultRepair" , resultRepair);
		
		
		//월별 구독자수
		
		List<Map> list= subscribeService.subscribeMonthCount();
		model.addAttribute("list" , list);
		
		
		return "admin/adminStatic";
		                                                 
	}
	
	//관리자모드 카테고리관리
	@GetMapping("/category.do")
	public String adminCategory(Model model) {
		
		//모듈화
		List<Lcategory> list = laundryService.laundryList();
		
		model.addAttribute("list" , list);
		
		return "admin/adminCategory";
		
		
	}
	
	//관리자모드 카테고리관리에서 삭제하기
	@GetMapping("/delete/{lno}")
	public String delete(@PathVariable int lno) {
		
		int result = laundryService.deleteLcategory(lno);
		
		if(result >0) {
			return "redirect:../category.do";
		}
		else {
			return "redirect:../category.do?error";
		}
	}
		
		
	//관리자모드 카테고리관리에서 복구하기
	@GetMapping("/restore/{lno}")
	public String restore(@PathVariable int lno) {
			
		int result = laundryService.restoreLcategory(lno);
			
		if(result >0) {
			return "redirect:../category.do";
		}
		else {
			return "redirect:../category.do?error";
		}
	}
	
	//관리자모드 카테고리관리에서 세탁종류 수정하기
	@PostMapping("/update.do")
	public String update(@ModelAttribute Lcategory lcategory) {

		int result = laundryService.update(lcategory);
					
		return "redirect:category.do";
			
	}
		
	//관리자모드 카테고리관리에서 기능추가히기 메소드
	@PostMapping("insertCat.do")
	public String insertCat(@ModelAttribute Lcategory lcategory) {
		
		int result = laundryService.insertCat(lcategory);
		
		return "redirect:category.do";
		
	}
	
		
	//관리자모드 서비스관리에서  예약서비스 리스트 
	@GetMapping("/service.do")
	public String subService(Model model) {
			
		//예약리스트
		List<Reserve> resList = reserveService.resServiceList();
		
		model.addAttribute("resList" , resList);
		
		return "admin/adminService";
		
	}
	
	//관리자모드 서비스관리에서 예약서비스리스트 배달예정날짜 수정
	@PostMapping("/updateRes.do")
	public String updateRes(@RequestParam int resNum,
							@RequestParam String delDate2) {
		
		Map<String,String> reserve2 = new HashMap<>();
		reserve2.put("resNum" , String.valueOf(resNum));
		reserve2.put("delDate",delDate2);
		
		int resultResUpdate = reserveService.updateRes(reserve2);
		
		return "redirect:service.do";
	}	
}
