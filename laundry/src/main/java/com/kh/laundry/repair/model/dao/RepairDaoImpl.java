package com.kh.laundry.repair.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.laundry.repair.model.vo.Repair;

@Repository
public class RepairDaoImpl implements RepairDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int repairCount() {
		
		return sqlSession.selectOne("repair.selectCount");
		
	}

	
}
