package com.kh.laundry.member.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.laundry.member.model.vo.Member;

public interface MemberDao {

	Member selectMemberById(String refId);

	int insertMember(Member member);

	Member loginMember(Member member);

	

	int updatePwd(Map<String, String> param);

	int updateMember(Member member);

	int deleteAccount(int memNum);

	
	//정민
	
	//관리자모드 통계관리에서 총 회원 수를 보여주는 메소드 틀
	int  memberCount(Map<String, String> param);
	
	//관리자모드 회원관리에서 페이징 처리 메소드 틀
	List<Member> selectMemList(Map<String, String> param);


	

}
