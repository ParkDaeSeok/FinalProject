package com.kh.laundry.subscribe.model.service;

import java.util.List;
import java.util.Map;

import com.kh.laundry.subscribe.model.vo.Subscribe;

public interface SubscribeService {

	
	// 구독 인서트하는 메서드 틀
	int insertSubscribe(Subscribe subscribe);
	
	// 구독변경 인서트하는 메서드 틀
	int insertSubChange(Subscribe subscribe);
	
	// ----------------------- sewon 
	
	
	Subscribe selectSubscribe(int memNum);



	List<Subscribe> selectSubscribeListforAll();

	int subscriptionExtension(int subNum);

	int deleteExistingSubscribe(int existingSubNum);



	int updateSuscribe(int subNum);

	List<Subscribe> selectMySubscribeList(int memNum);
	
	//정민
	//관리자모드 통계관리에서 총 구독자수 메소드 틀
	int subscribeCount();
	
	//관리자모드 통계관리에서 월별 구독자수 메소드 틀
	List<Map> subscribeMonthCount();

	
	
	
}
