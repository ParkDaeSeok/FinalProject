package com.kh.laundry.member.model.service;

import java.util.List;
import java.util.Map;

import com.kh.laundry.member.model.vo.Member;

public interface MemberService {

	Member selectMemberById(String refId);

	int insertMember(Member member);

	Member loginMember(Member member);


	int updatePwd(Map<String, String> param);

	int updateMember(Member member);

	int deleteAccount(int memNum);

	//정민

	
	//관리자모드 통계관리에서 전체 회원수 조회 기능 메소드
	int memberCount(Map<String, String> param);
	
	//관리자모드 회원관리에서 페이징처리 메소드
	List<Member> selectMemList(Map<String, String> param);	
	


	
	
}
