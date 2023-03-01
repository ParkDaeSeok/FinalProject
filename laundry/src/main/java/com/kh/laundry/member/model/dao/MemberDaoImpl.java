package com.kh.laundry.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.laundry.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public Member selectMemberById(String refId) {
		
		return sqlSession.selectOne("member.selectMemberById", refId);
	}

	@Override
	public int insertMember(Member member) {

		return sqlSession.insert("member.insertMember", member);
	}

	@Override
	public Member loginMember(Member member) {
	
		return sqlSession.selectOne("member.loginMember", member);
	}



	@Override
	public int updatePwd(Map<String, String> param) {
	
		return sqlSession.update("member.updatePwd", param);
	}

	@Override
	public int updateMember(Member member) {
		return sqlSession.update("member.updateMember", member);
	}

	@Override
	public int deleteAccount(int memNum) {
		return sqlSession.update("member.deleteAccount", memNum);
	}

	
	//정민
	
	@Override
	public int memberCount(Map<String, String> param) {
		
		return sqlSession.selectOne("member.selectCount", param);
	}

	//페이징처리 회원괸리 
	@Override
	public List<Member> selectMemList(Map<String, String> param) {
		
		return sqlSession.selectList("member.selectMemList", param);
	}


	

}
