package com.kh.laundry.ask.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.laundry.ask.model.vo.Ask;
import com.kh.laundry.attachment.model.vo.Attachment;

public interface AskDao {

	List<Ask> selectAskList(Map<String, Object> param);

	Ask selectAskByAskNo(int askNo);

	
	//정민

	//관리자모드 문의관리  문의 리스트 메소드 틀
	List<Ask> askList();
	
	//관리자모드 문의관리에서 상세내역 -  문의 상세보기 메소드 틀
	Ask adminAskDetail(int askNum);
	
	//관리자모드 문의관리에서 상세내역 -문의 답변하는 메소드 틀 
	int insertAnswer(Ask ask);
	
	//관리자모드 통계관리에서 총 문의수
	int askCount();
	
	//관리자모드 문의관리 페이징처리
	List<Ask> adminSelectAskList(Map<String , Integer> param);
	
	//관리자모드 문의관리 상세보기에서 사진 보여주기(Attachment)
	List<Attachment> attList(int askNum);
	
	/////////
	
	int selectListCount(Map<String, String> param);

	List<Ask> selectList(Map<String, String> param);

	Ask content(int AskNum);

	List<Ask> searchList(Map<String, String> param);

	int insertAsk(Ask param);

	int selectAskNum(Map<String, Object> param);

	int insertAskAttachment(Attachment att);

	int askListCount(int memNum);
}
