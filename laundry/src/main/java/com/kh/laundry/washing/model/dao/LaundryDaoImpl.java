package com.kh.laundry.washing.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.laundry.washing.model.vo.Laundry;
import com.kh.laundry.washing.model.vo.Lcategory;

@Repository
public class LaundryDaoImpl implements LaundryDao {
	
	@Autowired
	private SqlSession sqlSession;

	
	//관리자모드 통계관리에서 세탁건수
	@Override
	public int laundryCount() {
		
		return sqlSession.selectOne("laundry.selectCount");
	}

	//관리자모드 카테고리관리에서 세탁리스트
	@Override
	public List<Lcategory> laundryList() {
		
		return sqlSession.selectList("laundry.selectLaundry");
	}

	//관리자모드 카테고리관리에서 삭제기능
	@Override
	public int deleteLcategory(int lno) {
		
		return sqlSession.update("laundry.deleteLcategory",lno);
	}

	//관리자모드 카테고리관리에서 복구기능
	@Override
	public int restoreLcategory(int lno) {
		
		return sqlSession.update("laundry.restoreLcategory" , lno);
	}

	//관리자모드 카테고리관리에서 수정기능
	@Override
	public int update(Lcategory lcategory) {
		
		return sqlSession.update("laundry.update", lcategory);
	}

	//관리자모드 카테고리관리에서 추가기능
	@Override
	public int insertCat(Lcategory lcategory) {
		
		return sqlSession.insert("laundry.insertCat" , lcategory);
	}

}
