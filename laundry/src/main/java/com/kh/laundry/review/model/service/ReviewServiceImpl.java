package com.kh.laundry.review.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.laundry.attachment.model.vo.Attachment;
import com.kh.laundry.review.model.dao.ReviewDao;
import com.kh.laundry.review.model.vo.Review;
import com.kh.laundry.review.model.vo.ReviewWidthAttachment;

@Service
public class ReviewServiceImpl implements ReviewService {

	
	@Autowired
	private ReviewDao reviewDao;

	@Override
	public List<ReviewWidthAttachment> selectReviewList() {
		// TODO Auto-generated method stub
		return reviewDao.selctReviewList();
	}
	
	//정민
	@Override
	public int reviewCount() {
		
		int resultReview = reviewDao.reviewCount();
		
		return resultReview;
	}
	
	
	// 재웅
	@Override
	public int insertReview(Review review) {
		
		return reviewDao.insertReview(review);
	}

	@Override
	public Review selectReview(int resNum) {
		
		return reviewDao.selectReview(resNum);
	}

	@Override
	public int insertRevAttachment(Attachment att) {
		
		return reviewDao.insertRevAttachment(att);
	}
}
