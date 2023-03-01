package com.kh.laundry.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.laundry.review.model.service.ReviewService;
import com.kh.laundry.review.model.vo.Review;
import com.kh.laundry.review.model.vo.ReviewWidthAttachment;

@Controller
public class MainController {

	
	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("/")
	public String main(Model model) {
		
		List<ReviewWidthAttachment> revList = reviewService.selectReviewList();
		
		model.addAttribute("revList", revList);
		
		
		
		
		return "main";
	}
	
	@GetMapping("/serviceDetail.do")
	public String serviceDetail(){
		
		return "serviceDetail";
	}
	
	
}
