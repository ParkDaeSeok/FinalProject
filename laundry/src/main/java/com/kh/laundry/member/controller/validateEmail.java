package com.kh.laundry.member.controller;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/validate")
public class validateEmail {
	
	@Autowired
	private EmailSender emailSender;

	
	@GetMapping("/email.do")
	public String email(@RequestParam() String email) {
		
//		String userEmail ="";
		String subject ="";
		String content = "";
		String receiver ="";
		String sender ="";
		int authCode = 0;
		String authCodes = "";

		
		// 인증 번호 난수 생성

			for(int i=0; i < 6; i++) {
				
				authCode = (int)(Math.random() * 9 + 1);
				authCodes+= Integer.toString( authCode);
			}
		
		subject = "[빨래를 부탁해] 이메일 계정을 인증해주세요.";
		content = DM.dmCertificate(authCodes);
		receiver = email;
		sender = "admin@gmail.com";
		try {
			emailSender.sendMail(subject,content,receiver,sender);
			System.out.println("이메일 발송 !");
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("이메일 발송 실패!");
		}
		return authCodes;
	}
	

	@GetMapping("/emailId.do")
	public boolean emailId(@RequestParam() String email, 
						@RequestParam() String id) {
		
		
		String subject ="";
		String content = "";
		String receiver ="";
		String sender ="";
		boolean success = false;
	
		
		subject = "[빨래를 부탁해]에서 회원님의 아이디를 알려드립니다.";
		content = DM.sendId(id);
		receiver = email;
		sender = "admin@gmail.com";
		try {
			emailSender.sendMail(subject,content,receiver,sender);
			System.out.println("이메일 발송 !");
			success = true;
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("이메일 발송 실패!");
		
		}
		return success;
	}
	
	@GetMapping("/emailPwd.do")
	public boolean emailPwd(@RequestParam() String email, 
						@RequestParam() String pwd) {
		
		
		String subject ="";
		String content = "";
		String receiver ="";
		String sender ="";
		boolean success = false;
	
		
		subject = "[빨래를 부탁해]에서 회원님의 비밀번호를 알려드립니다.";
		content = DM.sendPwd(pwd);
		receiver = email;
		sender = "admin@gmail.com";
		try {
			emailSender.sendMail(subject,content,receiver,sender);
			System.out.println("이메일 발송 !");
			success = true;
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("이메일 발송 실패!");
		
		}
		return success;
	}

}
