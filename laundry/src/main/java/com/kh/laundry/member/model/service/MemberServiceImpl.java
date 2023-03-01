package com.kh.laundry.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.laundry.member.model.dao.MemberDao;
import com.kh.laundry.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao memberDao;

	@Override
	public Member selectMemberById(String refId) {
	
		return memberDao.selectMemberById(refId);
	}

	@Override
	public int insertMember(Member member) {
	
		return  memberDao.insertMember(member);
	}

	@Override
	public Member loginMember(Member member) {
		
		return  memberDao.loginMember(member);
	}




	@Override
	public int updatePwd(Map<String, String> param) {
		
		return  memberDao.updatePwd(param);
	}

	@Override
	public int updateMember(Member member) {
		
		return  memberDao.updateMember(member);
	}

	@Override
	public int deleteAccount(int memNum) {
		return  memberDao.deleteAccount(memNum);
	}
	
	//정민

	@Override
	public int memberCount(Map<String, String> param) {
		
		int result = memberDao.memberCount(param);
		
		return result;
	}

	@Override
	public List<Member> selectMemList(Map<String, String> param) {
		
		return memberDao.selectMemList(param);
	}

	
}

