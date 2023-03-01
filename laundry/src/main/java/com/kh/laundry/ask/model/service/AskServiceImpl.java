package com.kh.laundry.ask.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.laundry.ask.model.dao.AskDao;
import com.kh.laundry.ask.model.vo.Ask;
import com.kh.laundry.attachment.model.vo.Attachment;

@Service
public class AskServiceImpl implements AskService{

	@Autowired
	private AskDao askDao;

	@Override
	public List<Ask> selctAskList(Map<String, Object> param) {
		
		return askDao.selectAskList(param);
	}

	@Override
	public Ask selectAskByAskNo(int askNo) {
		return askDao.selectAskByAskNo(askNo);
	}
	
	
	//정민

	//관리자모드 문의관리에서 문의리스트 틀
	@Override
	public List<Ask> askList() {
		
		List<Ask> list = askDao.askList();
		
		return list;
	}

	
	//관리자모드 문의관리 -> 상세보기 메소드 
	@Override
	public Ask adminAskDetail(int askNum) {
		
		Ask ask = askDao.adminAskDetail(askNum);
		
		return ask;
	}
	//관리자모드 문의관리 -> 상세보기 메소드 답변하기
	@Override
	public int insertAnswer(Ask ask) {
		
		return askDao.insertAnswer(ask);
	}

	
	//관리자모드 통계관리에서 총 문의 수 
	@Override
	public int askCount() {
		
		return askDao.askCount();
	}


	//관리자모드 문의관리 페이징처리
	@Override
	public List<Ask> adminSelectAskList(Map<String, Integer> param) {
		
		return askDao.adminSelectAskList(param);
	}


	//관리자모드 문의관리 상세보기에서 사진 보여주기(Attachment)
	@Override
	public List<Attachment> attList(int askNum) {
		
		return askDao.attList(askNum);
	}
	
	////////
	@Override
	public int selectListCount(Map<String, String> param) {

		int count = askDao.selectListCount(param);
		
		return count;
	}

	@Override
	public List<Ask> selectList(Map<String, String> param) {
		
		List<Ask> list = askDao.selectList(param);
		
		return list;
	}

	@Override
	public Ask content(int askNum) {
		
		Ask ask = askDao.content(askNum);
		return ask;
	}

	@Override
	public List<Ask> searchList(Map<String, String> param) {
		
		List<Ask> list = askDao.searchList(param);
		
		return list;
	}

	@Override
	public int insertAsk(Ask param) {

		int result = askDao.insertAsk(param);
		
		return result;
	}

	@Override
	public int selectAskNum(Map<String, Object> param) {
		
		return askDao.selectAskNum(param);
	}

	@Override
	public int insertAskAttachment(Attachment att) {
		
		return askDao.insertAskAttachment(att);
	}

	@Override
	public int askListCount(int memNum) {
		
		return askDao.askListCount(memNum);
	}

	

}