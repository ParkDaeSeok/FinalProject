package com.kh.laundry.review.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.laundry.attachment.model.vo.Attachment;
import com.kh.laundry.review.model.service.ReviewService;
import com.kh.laundry.review.model.vo.Review;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@PostMapping("/review.do")
	public String insertReview(Model model,
			@ModelAttribute Review review,
			@RequestParam(required = false) MultipartFile upfile,
			HttpSession session,
			HttpServletRequest request) {
		
		int resNum = review.getResNum();
		int attresult = 0;
		int result = 0;
		
		
		result = reviewService.insertReview(review);
		
		if(result > 0) {
			Review selReview = reviewService.selectReview(resNum);
			int revNum = selReview.getRevNum();
			
			// 파일이 있을 경우
			if(!upfile.isEmpty()) {
				
				Attachment att = new Attachment();
				att.setRevNum(revNum);
				att.setFilePath("resources/reviewUpfiles/"); // 나중에 화면에 뿌려주기위해 편의상 저장해두는 일부 경로 
				att.setOrginName(upfile.getOriginalFilename());
				
				// changeName
				String originalName = att.getOrginName();
				String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
				int ranNum = (int)(Math.random() * 90000) + 10000;
				 int index =  originalName.lastIndexOf(".");
				String ext = originalName.substring(index);
				String changedName = currentTime + ranNum + ext;
				
				att.setChangeName(changedName);
				
				attresult = reviewService.insertRevAttachment(att);
				
				// 파일을 서버컴에 다운로드 
				// 실제 저장될 경로를 받아와야함!!! (full path)
				String savePath = session.getServletContext().getRealPath("resources/reviewUpfiles");
				File target = new File(savePath, att.getChangeName());
				try {
					upfile.transferTo(target);
		        } catch (IllegalStateException e) {
		            e.printStackTrace();
		        } catch (IOException e) {
		            e.printStackTrace();
		        }
				//
			} else {
				attresult = 1;
			}
			
		} else {
			session.setAttribute("alertMsg","후기를 등록실패");
		}
		
		if((result * attresult) > 0) {
			session.setAttribute("alertMsg","후기를 등록하였습니다.");
		} else {
			session.setAttribute("alertMsg","후기등록을 실패하였습니다.");
		}
		
		return "redirect:/myPage/resListDetail.do?resNum=" + resNum;
		
	}
}
