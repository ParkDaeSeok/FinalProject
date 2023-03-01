package com.kh.laundry.subscribe.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.laundry.subscribe.model.vo.Subscribe;

@Repository
public class SubscribeDaoImpl implements SubscribeDao {
	
	@Autowired
	private SqlSession sqlSession;

	// 구독 인서트 하는 메서드
	@Override
	public int insertSubscribe(Subscribe subscribe) {
		return sqlSession.insert("subscribe.insertSubscribe", subscribe);
	}
	
	// 구독 변경 인서트하는 메서드
	@Override
	public int insertSubChange(Subscribe subscribe) {
		return sqlSession.insert("subscribe.insertSubChange", subscribe);
	}

	
	// -------------------------- sewon 
	@Override
	public Subscribe selectSubscribe(int memNum) {
	
		return sqlSession.selectOne("subscribe.selectSubscribe", memNum);
	}


	@Override
	public List<Subscribe> selectSubscribeListforAll() {
		return sqlSession.selectList("subscribe.selectSubscribeListforAll");
	}

	@Override
	public int subscriptionExtension(int subNum) {
		return sqlSession.update("subscribe.subscriptionExtension", subNum);
		
	}

	@Override
	public int deleteExistingSubscribe(int existingSubNum) {
		return sqlSession.update("subscribe.deleteExistingSubscribe", existingSubNum);
	}


	@Override
	public int updateSuscribe(int subNum) {
		return sqlSession.update("subscribe.updateSuscribe", subNum);
	}

	@Override
	public List<Subscribe> selectMySubscribeList(int memNum) {
		return sqlSession.selectList("subscribe.selectMySubscribeList", memNum);
	}


	//정민
	//총 구독자수
		@Override
		public int subscribeCount() {
			
			return sqlSession.selectOne("subscribe.subscribeCount");
		}

		@Override
		public List<Map> subscribeMonthCount() {
			
			return sqlSession.selectList("subscribe.subscribeMonthCount");
		}


		
	
	
}