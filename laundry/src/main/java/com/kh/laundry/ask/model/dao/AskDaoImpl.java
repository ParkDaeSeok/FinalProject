package com.kh.laundry.ask.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.laundry.ask.model.vo.Ask;
import com.kh.laundry.attachment.model.vo.Attachment;

@Repository
public class AskDaoImpl implements AskDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Ask> selectAskList(Map<String, Object> param) {
		return sqlSession.selectList("selectAskList", param);
	}

	@Override
	public Ask selectAskByAskNo(int askNo) {
		return sqlSession.selectOne("selectAskByAskNo", askNo);
	}
	
	
	//정민

	//관리자모드 문의관리에서 문의 리스트 
	@Override
	public List<Ask> askList() {
	
		return sqlSession.selectList("ask.askList");
	}
	//관리자모드 문의관리에서 문의 상세보기
	@Override
	public Ask adminAskDetail(int askNum) {
		
		return sqlSession.selectOne("ask.selectDetailView" , askNum);
	}
	//관리자모드 문의관리에서 문의 상세보기 답변하기
	@Override
	public int insertAnswer(Ask ask) {
		
		return sqlSession.update("ask.insertAnswer" , ask);
	}

	//관리자모드 통계관리에서 총 문의수
	@Override
	public int askCount() {
		
		return sqlSession.selectOne("ask.askCount");
	}
	
	//관리자모드 문의관리 페이징처리
	@Override
	public List<Ask> adminSelectAskList(Map<String, Integer> param) {
		
		return sqlSession.selectList("ask.adminSelectAskList" , param);
	}
	
	//관리자모드 문의관리 상세보기에서 사진 보여주기(Attachment)
	@Override
	public List<Attachment> attList(int askNum) {
		
		return sqlSession.selectList("ask.attList" , askNum);
	}
	//////
	@Override
	public int selectListCount(Map<String, String> param) {
		return sqlSession.selectOne("ask.selectListCount", param);
	}

	@Override
	public List<Ask> selectList(Map<String, String> param) {
		return sqlSession.selectList("ask.selectList", param);
	}

	@Override
	public Ask content(int askNum) {
		
		return sqlSession.selectOne("ask.detailView",askNum);
	}

	@Override
	public List<Ask> searchList(Map<String, String> param) {
		
		return sqlSession.selectList("ask.searchList",param);
	}

	@Override
	public int insertAsk(Ask param) {
		
		return sqlSession.insert("ask.insertAsk",param);
		
	}

	@Override
	public int selectAskNum(Map<String, Object> param) {
		
		return sqlSession.selectOne("ask.selectAskNum", param);
	}

	@Override
	public int insertAskAttachment(Attachment att) {
		
		return sqlSession.insert("ask.insertAskAttachment", att);
	}

	@Override
	public int askListCount(int memNum) {
		
		return sqlSession.selectOne("ask.askListCount", memNum);
	}
	
}
