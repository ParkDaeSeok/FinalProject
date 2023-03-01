package com.kh.laundry.subscribe.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.laundry.subscribe.model.dao.SubscribeDao;
import com.kh.laundry.subscribe.model.vo.Subscribe;

@Service
public class SubscribeServiceImpl implements SubscribeService{
	@Autowired
	private SubscribeDao subscribeDao;

	
	// 구독 insert하는 메서드
	@Override
	public int insertSubscribe(Subscribe subscribe) {
		return subscribeDao.insertSubscribe(subscribe);
	}
	
	// 구독변경 insert하는 메서드
	@Override
	public int insertSubChange(Subscribe subscribe) {
		return subscribeDao.insertSubChange(subscribe);
	}
	
	//----------------------- sewon 
	
	
	@Override
	public Subscribe selectSubscribe(int memNum) {
		return subscribeDao.selectSubscribe(memNum);
	}

	@Override
	public List<Subscribe> selectSubscribeListforAll() {
		return subscribeDao.selectSubscribeListforAll();
	}

	@Override
	public int subscriptionExtension(int subNum) {
		
		return subscribeDao.subscriptionExtension(subNum);
	}

	@Override
	public int deleteExistingSubscribe(int existingSubNum) {
		
		return subscribeDao.deleteExistingSubscribe(existingSubNum);
	}

	@Override
	public int updateSuscribe(int subNum) {
		return subscribeDao.updateSuscribe(subNum);
	}

	@Override
	public List<Subscribe> selectMySubscribeList(int memNum) {
		return subscribeDao.selectMySubscribeList(memNum);
	}

	
	//정민
	//총 구독자수
		@Override
		public int subscribeCount() {
			
			int resultSubscribe = subscribeDao.subscribeCount();
			
			return resultSubscribe;
		}


		@Override
		public List<Map> subscribeMonthCount() {
			
			List<Map> list = subscribeDao.subscribeMonthCount();
			return list;
		}

		





	
}
