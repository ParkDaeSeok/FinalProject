package com.kh.laundry.member.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.laundry.member.model.vo.Member;

@RestController
@RequestMapping("/member")
public class MemberRestController {

	
	@Autowired
	private SqlSession sqlSession; // 여기다가 바로 해도 돼?
	
	@GetMapping("/idCheck.do")
	public String idCheck(@RequestParam String checkId) {
		
		Member member = sqlSession.selectOne("member.selectMemberById", checkId);
		
			if(member != null) {
				return "NNNNN";
			}else {
				return "YYYYY";
			}

	}
	
	@GetMapping("/emailCheck.do")
	public String emailCheck(@RequestParam String checkEmail) {
		
		Member member = sqlSession.selectOne("member.selectMemberByEmail", checkEmail);
		if(member != null) {
			return "NNNNN";
		}else {
			return "YYYYY";
		}
	}
	
	@GetMapping("/refIdCheck.do")
	public String refIdCheck(@RequestParam String userId) {
		
		Member member = sqlSession.selectOne("member.selectMemberById", userId);
		if(member != null) {
			return "NNNNN";
		}else {
			return "YYYYY";
		}
	}
	
	
	@GetMapping("/selectIdByEmail.do")
	public String selectIdByEmail(@RequestParam String checkEmail) {
		
		Member member = sqlSession.selectOne("member.selectMemberByEmail", checkEmail);
		if(member != null) {
			return member.getMemId();
		}else {
			return "N";
		}
	}

	@GetMapping("/selectPwdByEmailAndName.do")
	public String selectPwdByEmailAndName(@RequestParam String email,
										@RequestParam String name) {
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("email", email);
		param.put("name", name);
		
		Member member = sqlSession.selectOne("member.selectPwdByEmailAndName", param);
		
		if(member != null) {
			return member.getMemPwd();
		}else {
			return "N";
		}
	}

	
}
