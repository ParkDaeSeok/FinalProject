package com.kh.laundry.ask.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.multipart.MultipartFile;

import com.kh.laundry.ask.model.service.AskService;
import com.kh.laundry.ask.model.vo.Ask;
import com.kh.laundry.attachment.model.vo.Attachment;
import com.kh.laundry.common.model.vo.PageInfo;
import com.kh.laundry.member.model.vo.Member;

@Controller
@RequestMapping("/ask")
public class AskController {
	
	@Autowired
	private AskService askService;
	
	@GetMapping("/main.do")
	public String main() {
		return "ask/main";
	}
	
	@GetMapping("/board.do")
	public String board(
			@RequestParam(defaultValue = "1") int currentPage,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "계정관리") String category, 
			Model model) {
		
		// 페이징처리
		// 변수 7가지 필요
		int totalCount;
		// int currentPage;
		int pageLimit;
		int listLimit;
		
		int maxPage;
		int startPage;
		int endPage;

		Map<String, String> param = new HashMap<>();
		param.put("keyword", keyword);
		param.put("category", category);
		
		if(category.equals("검색")) {
			param.remove("category");
		}
		
		totalCount = askService.selectListCount(param); // 총 게시글 갯수 
		
		pageLimit = 10;
		
		listLimit = 10;
		
		maxPage = (int)Math.ceil((double)totalCount / listLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
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
		
		System.out.println(pi);
		
		model.addAttribute("pi", pi); // 페이징바 만들때를 대비해서 jsp 로 보냄 
		
		// 한 페이지 내의 시작 게시글의 순번이랑 종료 게시글의 순번을 가져오기 위함
		int startRow = (pi.getCurrentPage() - 1) * pi.getListLimit() + 1;
		int endRow = startRow + pi.getListLimit() -1;
		
		param.put("startRow", String.valueOf(startRow));
		param.put("endRow",  String.valueOf(endRow));
//		param.put("category",category);
//		
//		if(category.equals("검색")) {
//			param.remove("category");
//		}
		
		List<Ask> list = null;
		
		list=  askService.selectList(param);

		for(Ask a : list) {
		System.out.println(a);
		}
			
		model.addAttribute("param", param);
		model.addAttribute("keyword", keyword);
		model.addAttribute("list",list);
		model.addAttribute("category",category);
		model.addAttribute("currentPage",currentPage);
		
		return "ask/board";
	}
	@GetMapping("/content.do")
	public String content(
			@RequestParam int bno,
			Model model) {
		
		Ask ask = askService.content(bno);
		
		model.addAttribute("ask", ask);
		
		return "ask/content";
	}
	// 문의 창띄우는 메소드
	@GetMapping("/inq.do")
	public String inq(
			HttpSession session) {
		
		if((Member)session.getAttribute("loginUser") != null) {
			return "ask/inquiry";			
		}
		else {
			session.setAttribute("alertMsg", "로그인 후에 이용하실 수 있습니다.");
			return "redirect:/";
		}
	}
	// 문의
	@PostMapping("/inq.do")
	public String inq(
			@RequestParam(required = false) MultipartFile upfile,
			@RequestParam String inqtype,
			@RequestParam String inqtitle,
			@RequestParam String inqcontent,
			HttpSession session) {
		
	
		
		Member mem = (Member)session.getAttribute("loginUser");
		int memNum = mem.getMemNum();
		Map<String, Object> param = new HashMap<String, Object>();
		
		Ask ask = new Ask();
		ask.setMemNum(mem.getMemNum());
		ask.setAskType(inqtype);
		ask.setAskTitle(inqtitle);
		ask.setAskContent(inqcontent);
		
		int result = askService.insertAsk(ask);
		
		param.put("memNum", memNum);
		param.put("askContent", inqcontent);
		
		int askNum = askService.selectAskNum(param);
		int attresult = 0;
		
		if(result > 0) {
			// 파일이 있을 경우
			if(!upfile.isEmpty()) {
				
				Attachment att = new Attachment();
				att.setAskNum(askNum);
				att.setFilePath("resources/askUpfiles/"); // 나중에 화면에 뿌려주기위해 편의상 저장해두는 일부 경로 
				att.setOrginName(upfile.getOriginalFilename());
				
				// changeName
				String originalName = att.getOrginName();
				String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
				int ranNum = (int)(Math.random() * 90000) + 10000;
				 int index =  originalName.lastIndexOf(".");
				String ext = originalName.substring(index);
				String changedName = currentTime + ranNum + ext;
				
				att.setChangeName(changedName);
				
				attresult = askService.insertAskAttachment(att);
				
				// 파일을 서버컴에 다운로드 
				// 실제 저장될 경로를 받아와야함!!! (full path)
				String savePath = session.getServletContext().getRealPath("resources/askUpfiles");
				File target = new File(savePath, att.getChangeName());
				try {
					upfile.transferTo(target);
		        } catch (IllegalStateException e) {
		            e.printStackTrace();
		        } catch (IOException e) {
		            e.printStackTrace();
		        }
			} else {
				attresult = 1;
			}
		} else {
			session.setAttribute("alertMsg","문의 등록 실패");
		}
		
		if((result * attresult) > 0) {
			session.setAttribute("alertMsg","문의를 등록하였습니다.");
		} else {
			session.setAttribute("alertMsg","문의등록을 실패하였습니다.");
		}
		
		
//		Map<String, String> param = new HashMap<>();
//		param.put("inqtype", inqtype);
//		param.put("inqtitle", inqtitle);
//		param.put("inqcontent", inqcontent);
//		
//		param.put("memnum", Integer.toString(mem.getMemNum()));
//		
//		int result = askService.insertAsk(param);
		
		return "redirect:/ask/main.do";
	}
	@GetMapping("/chat.do")
	public String chat() {
		return "ask/chat";
	}
	
}
