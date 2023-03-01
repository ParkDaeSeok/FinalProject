package com.kh.laundry.review.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.laundry.attachment.model.vo.Attachment;
import com.kh.laundry.review.model.vo.Review;
import com.kh.laundry.review.model.vo.ReviewWidthAttachment;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ReviewWidthAttachment> selctReviewList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("review.selctReviewList");
	}
	
	//정민
	@Override
	public int reviewCount() {
		
		return sqlSession.selectOne("review.selectCount");
	}
	
	
	
	// 재웅
	@Override
	public int insertReview(Review review) {
		
		return sqlSession.insert("review.insertReview", review);
	}

	@Override
	public Review selectReview(int resNum) {
		
		return sqlSession.selectOne("review.selectReview", resNum);
	}

	@Override
	public int insertRevAttachment(Attachment att) {
		
		return sqlSession.insert("review.insertRevAttachment", att);
	}
	
}