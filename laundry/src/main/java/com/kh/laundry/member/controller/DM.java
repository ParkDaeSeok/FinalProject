package com.kh.laundry.member.controller;

import java.util.Calendar;


public class DM {
	
	public static String dmCertificate(String authCodes) {
		
		Calendar now = Calendar.getInstance();
		
		
		String content = "";
		content += "<!DOCTYPE html>";
		content += "<html lang='en'>";
		content += "<head>";
		content += "<meta charset=\"UTF-8\" />";
		content += "<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />";
		content += "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />";
		content += "<title>Document</title>";
		content += "</head>";
		content += " <body>";
		content += "<br/><br/>";
		content += "<h3>인증번호 발송 안내</h3>";
		content += "<hr/>";
		content += "<div>";
		content += "<p>안녕하세요! <strong>빨래는부탁해</strong>입니다.</p>";
		content += "<p>인증번호를 다음과 같이 알려드립니다.</p>";
		content += "<br/>";
		content += "<p>인증번호: <b>"+authCodes+"</b></p>";
		content += "<p>발급시간: <b>"+now.get(Calendar.YEAR)+"년"+ (now.get(Calendar.MONTH)+1)+"월"+ now.get(Calendar.DAY_OF_MONTH)+"일"+now.get(Calendar.HOUR_OF_DAY)+"시"+now.get(Calendar.MINUTE)+"분"+now.get(Calendar.SECOND)+"초"+"</b></p>";
		content += "<br/>";
		content += "<p>감사합니다.</p>";
		content += "<br/>";
		content += "</body>";
		content += "</html>";
		

		
		return content;
	}

	public static String sendId(String id) {

		
		
		String content = "";
		content += "<!DOCTYPE html>";
		content += "<html lang='en'>";
		content += "<head>";
		content += "<meta charset=\"UTF-8\" />";
		content += "<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />";
		content += "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />";
		content += "<title>Document</title>";
		content += "</head>";
		content += " <body>";
		content += "<br/><br/>";
		content += "<h3>아이디 찾기</h3>";
		content += "<hr/>";
		content += "<div>";
		content += "<p>안녕하세요! <strong>빨래는부탁해</strong>입니다.</p>";
		content += "<p>찾으시는 아이디를 를 다음과 같이 알려드립니다.</p>";
		content += "<br/>";
		content += "<p>아이디: <b>"+id+"</b></p>";
		
		content += "<br/>";
		content += "<p>감사합니다.</p>";
		content += "<br/>";
		content += "</body>";
		content += "</html>";
		

		
		return content;
	}

	public static String sendPwd(String pwd) {
	
		String content = "";
		content += "<!DOCTYPE html>";
		content += "<html lang='en'>";
		content += "<head>";
		content += "<meta charset=\"UTF-8\" />";
		content += "<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />";
		content += "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />";
		content += "<title>Document</title>";
		content += "</head>";
		content += " <body>";
		content += "<br/><br/>";
		content += "<h3>비밀번호 찾기</h3>";
		content += "<hr/>";
		content += "<div>";
		content += "<p>안녕하세요! <strong>빨래는부탁해</strong>입니다.</p>";
		content += "<p>찾으시는 비밀번호를 를 다음과 같이 알려드립니다.</p>";
		content += "<br/>";
		content += "<p>아이디: <b>"+pwd+"</b></p>";
		
		content += "<br/>";
		content += "<p>감사합니다.</p>";
		content += "<br/>";
		content += "</body>";
		content += "</html>";
		

		
		return content;
	}

}
