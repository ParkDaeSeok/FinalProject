package com.kh.laundry.review.model.dao;

import java.util.List;

import com.kh.laundry.attachment.model.vo.Attachment;
import com.kh.laundry.review.model.vo.Review;
import com.kh.laundry.review.model.vo.ReviewWidthAttachment;

public interface ReviewDao {

	List<ReviewWidthAttachment> selctReviewList();
	
	//정민
	//관리자모드 통계관리에서 총 후기수 메소드 틀
	int reviewCount();
		
	

	// 재웅
	int insertReview(Review review);
	
	Review selectReview(int resNum);
	
	int insertRevAttachment(Attachment att);
}
