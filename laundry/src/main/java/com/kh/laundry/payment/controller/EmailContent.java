package com.kh.laundry.payment.controller;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.util.Map;

import org.springframework.web.bind.annotation.RestController;

import com.kh.laundry.subscribe.model.vo.Subscribe;

public class EmailContent {

	public String insertContent(String resType, 
								Subscribe subscribe,
								String path,
								Map<String, Object> memberAndCard) {
		
		// 조건문을 위한 변수 세팅
		DecimalFormat formatter = new DecimalFormat("###,###,###"); // 숫자에 3자리마다 ',' 를 표기해줌. 예) 111,222,333
		
		// memberAndCard 객체에서 미리 이메일 내용에 들어갈 변수 세팅
		String memName = (String)memberAndCard.get("memName");
		String address = (String)memberAndCard.get("address");
		String phone = (String)memberAndCard.get("phone");
		String cardNum = (String)memberAndCard.get("cardNum").toString().substring(12, 16); // 카드 마지막 4자리만 cardNum에 넣기
		String cardCom = (String)memberAndCard.get("cardCom");
		int totalPrice = Integer.parseInt(memberAndCard.get("totalPrice").toString().replace("원", ""));
		
		// 세탁 / 수선 에서 쓰일 변수
		String pickupDate = "";
		String delDate = "";
		
		// 구독 / 구독변경 에서 쓰일 변수
		String subSdate = "";
		String subEdate = "";
		String subDay = "";
		String delDay = "";
		
		if( subscribe.getSubSdate() != null ) {
			subSdate = subscribe.getSubSdate().substring(0, 11);
			subEdate = subscribe.getSubEdate().substring(0, 11);
			subDay = subscribe.getSubDay();
			delDay = delDay(subDay);
		} else {
			pickupDate = (String)memberAndCard.get("pickupDate");
			delDate = (String)memberAndCard.get("delDate");
		}
		
		// 이메일 전송에 필요한 변수
		String content = ""; // 실제 내용이 들어갈 변수
		String temp = ""; // reader.readLine() 시, 임시로 담아두었다가 content에게 전달
		
		try {
			
			BufferedReader reader = new BufferedReader( new InputStreamReader(new FileInputStream(path + "/receiptForm.html"), "UTF-8") );
			
		    while( (temp = reader.readLine()) != null) {     
		    	
		    	if( temp.contains("title1") ) { // 결제자 정보 넣어주기
		    		content += temp;
		    		content += "<table border=\"0\" id=\"userInfo\">";
		    		content += "<tbody>";
		    		content += "<tr>";
		    		content += "<th>이름 : </th>";
		    		content += "<td>" + memName + "</td>";
		    		content += "</tr>";
		    		content += "<tr>";
		    		content += "<th>주소 : </th>";
		    		content += "<td>" + address + "</td>";
		    		content += "</tr>";
		    		content += "<tr>";
		    		content += "<th>전화번호 : </th>";
		    		content += "<td>" + phone + "</td>";
		    		content += "</tr>";
		    		content += "</tbody>";
		    		content += "</table>";
			        content += "\r\n";
		    	} else if ( temp.contains("title2") ) { // 상세 정보 넣어주기
		    		content += temp;
		    		content += "<table border=\"0\" id=\"detailInfo\">";
		    		content += "<tbody>";
		    		content += "<tr>";
		    		content += "<th>신청 서비스 : </th>";
		    		content += "<td>" + resType + "</td>";
		    		content += "</tr>";		
		    		
		    		/* 아래부터 신청 서비스에 따라 다르게 발송할 메일 내용 */
		    		if( ! subSdate.equals("")) { // 구독 시작일이 "" 값이 아닐 경우, true
			    		content += "<tr>";
			    		content += "<th>구독 시작일 : </th>";
			    		content += "<td>" + subSdate + "</td>";
			    		content += "</tr>";
			    		content += "<tr>";
			    		content += "<th>구독 만료일 : </th>";
			    		content += "<td>" + subEdate + "</td>";
			    		content += "</tr>";
		    		}
		    		
		    		if( ! resType.contains("구독")) { // 신청 서비스에 "구독" 이라는 단어가 포함되어 있지 않으면, true 
			    		content += "<tr>";
			    		content += "<th>수거 날짜 : </th>";
			    		content += "<td>" + pickupDate + "</td>";
			    		content += "</tr>";
			    		content += "<tr>";
			    		content += "<th>도착 예정 날짜 : </th>";
			    		content += "<td>" + delDate + "</td>";
			    		content += "</tr>";	
		    		} else { // 신청 서비스가 구독 또는 구독변경일 경우 true
			    		content += "<tr>";
			    		content += "<th>수거 날짜 : </th>";
			    		content += "<td>매주 " + subDay + "</td>";
			    		content += "</tr>";
			    		content += "<tr>";
			    		content += "<th>도착 예정 날짜 : </th>";
			    		content += "<td>매주 " + delDay + "</td>";
			    		content += "</tr>";	
		    		}
		    		/* -------------- 여기까지 신청 서비스에 따라 다르게 발송 ------------ */
		    		
		    		content += "<tr>";
		    		content += "<th>카드 번호 : </th>";
		    		content += "<td>**** - **** - **** - " + cardNum + "</td>";
		    		content += "</tr>";
		    		content += "<tr>";
		    		content += "<th>카드사 : </th>";
		    		content += "<td>" + cardCom + "</td>";
		    		content += "</tr>";
		    		content += "</tbody>";
		    		content += "</table>";
			        content += "\r\n";
		    	} else if( temp.contains("price1") ) { // 결제 금액 넣어주기
		    		
		    		if( resType.equals("구독변경") ) { // 신청 서비스가 구독변경일 경우 true
			    		content += temp;
			    		content += "<span>결제 예정 금액 : " + formatter.format(totalPrice) + "원</span>";
				        content += "\r\n";		    			
		    		} else {
			    		content += temp;
			    		content += "<span>결제 금액 : " + formatter.format(totalPrice) + "원</span>";
				        content += "\r\n";	
		    		}
		    		
		    	} else { // 변동될 값이 없는 경우, 그냥 읽어오기
			        content += temp;
			        content += "\r\n";	
		    	}
		    }
			
		} catch (UnsupportedEncodingException | FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return content;
	}
	
	// 구독 도착 예정 날짜를 구하는 메소드
	public String delDay(String subDay) { 
		
		String delDay = "";
		
		switch(subDay) {
			case "일요일" : delDay = "수요일"; break;
				
			case "월요일" : delDay = "목요일"; break;
			
			case "화요일" : delDay = "금요일"; break;
			
			case "수요일" : delDay = "토요일"; break;
			
			case "목요일" : delDay = "일요일"; break;
			
			case "금요일" : delDay = "월요일"; break;
			
			case "토요일" : delDay = "화요일"; break;
		}
		
		return delDay;
	}
	
}
