<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../common/util.jsp" %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!-- 온라인 방식-->
    <style>
        /* 화면 전체 크기 */
        html,body {
            width : 100%;
            height : 1500px;
        }

        /* content 속성 */
        .content {
            width : 100%;
            height : 100%;
            background: rgb(248, 245, 244); /* CSS 작업 추가 */
        }
        
        /* CSS 작업 추가 */
        .menubar {
        	background: white !important;
        	border-bottom : 1px solid black;
        }
        
        /* CSS 작업 추가 */
        #noMain {
        	background: rgb(248, 245, 244) !important;
        }
        
        /* content안에 div(main)속성 */
        .main {
            width : 100%;
            height : 100%;
            padding : 0 5rem; /* CSS 작업 추가 */
            padding-bottom: 5rem; /* CSS 작업 추가 */
        }

        /* 클래스 main안에 인라인 속성으로 */
        .main>div, .main>fieldset {
            display: inline-block;
        }


        /* main안에 stage속성 */
        .stage {
            width : 18%;
            height : 98.3%; /* margin-top 에 의해 내려온 테두리 맞춰주기 */
            text-align: center;
            line-height: 75px;
            position : relative;
            border-radius : 15px; /* CSS 작업 추가 */
            margin-right : 15px; /* CSS 작업 추가 */
            font-size: 25px;
            background: white; /* CSS 작업 추가 */
            margin-top : 25px; /* legend font-size 가 커져서 선을 맞추기 위해 margin 부여*/
        }
        
   		.stage div {
   			box-sizing : border-box;
   		}

        /* stage안에 step들 속성 */
        .titleStep {
            width : 100%;
            font-size: 30px;
            line-height: 50px;
            
        }
        .STEP1 {
            position: absolute;
            border-bottom : 8px solid rgb(248, 245, 244); /* CSS 작업 추가 */
            top : 6%;
            height : 15%;
            width : 100%;
        }
        .STEP2 {
            position: absolute;
            border-bottom : 8px solid rgb(248, 245, 244); /* CSS 작업 추가 */ 
            top : 21%;
            height : 15%;
            width : 100%;
        }
        .STEP3 {
            position: absolute;
            border-bottom : 8px solid rgb(248, 245, 244); /* CSS 작업 추가 */ 
            top : 36%;
            height : 15%;
            width : 100%;
        }
        .STEP4 {
            position: absolute;
            border-bottom : 8px solid rgb(248, 245, 244); /* CSS 작업 추가 */ 
            top : 51%;
            height : 15%;
            width : 100%;
        }
        .STEP5 {
            position: absolute;
            top : 66%;
            height : 15%;
            width : 100%;
        }

        /* legend에 step 글씨*/
        legend {
            font-size: 30px;
            width: auto !important;
            margin-left : 10px;
            padding: 5px;
        }

        /* main안에 select속성 */
        .select {
            vertical-align: top;
            width : 80%;
            height : 100%;
            background : white; /* CSS 작업 추가 */
			border-radius : 15px; /* CSS 작업 추가 */
			border : none; /* CSS 작업 추가 */
            box-sizing: border-box;
        }
        
        /* select속성에 selectMenu 속성 */
        .selectMenu {
            width : 100%;
            height : 100%;
            padding : 2rem; /* CSS 작업 추가 */
            text-align: center;
        }
        
        .selectMenu div {
			box-sizing : border-box;
		}


        /* step4 일 때 */
        /* selectMenu안에 totalPay와 payInfo속성 */
        .totalPay {
            display: inline-block;
            width : 28%;
            height : 80%;
        }
        /* totalpay안에 결제 관련 속성 (쿠폰함,선택내역 등등)  */
        .payment {
            width : 100%;
            height : 90%;
            border-bottom : 3px solid black;
        }
        /* 결제금액 글씨 속성 */
        .payHeader {
            width : 100%;
            height : 5%;
            font-weight: 700;
            font-size: 25px;
            line-height: 50px;
            border-bottom : 3px solid black; /* 개인적인 CSS 작업한 코드 */
            padding-top : 25px; /* 개인적인 CSS 작업한 코드 */
			padding-bottom : 65px; /* 개인적인 CSS 작업한 코드 */
        }

        /* 선택내역 및 선택요일 및 요청사항 전체 속성 */
        .payContent {
            width: 100%;
            margin-top : 20px; /* 개인적인 CSS 작업한 코드 */
        }

        /* 선택내역 글씨 속성(selectList) */
        /* 선택 날짜 글씨 속성(dayList) */
        /* 요청사항 글씨 속성(requestList)*/
        .selectList, .dayList, .requestList { 
            width : 100%;
            height : 7%;
            font-size : 17px;
            font-weight: 600;
            line-height: 30px;
        }
        
        .selectList {
			border-bottom : 2px solid black; /* 개인적인 CSS 작업한 코드 */
			padding-bottom : 10px; /* 개인적인 CSS 작업한 코드 */
			margin-bottom : 15px; /* 개인적인 CSS 작업한 코드 */
        }
        
		.dayList {
        	margin-top : 50px; /* 개인적인 CSS 작업한 코드 */
        	border-bottom : 2px solid black; /* 개인적인 CSS 작업한 코드 */
			padding-bottom : 10px; /* 개인적인 CSS 작업한 코드 */
        }
        
        #userService {
        	width : 100%;
        	height : 138px;
        	background : white;
        	overflow-x : auto; 
        	border : 2px solid black;
        }
        
        #userService>table {
        	width : 100%;
        	font-size : 13px;
        }
        
        #userService>table>thead {
        	border : 2px solid black;
        	border-top : 1px solid black;
        	border-left : 1px solid black;
        	border-right : 1px solid black;
        }

        /* 선택한 요일을 보여주는 요소에 속성(days) */
        .days {
            width : 100%;
            height : 10%;
            line-height: 50px;
            border-bottom: 2px solid black;
        }
        
        /* 쿠폰함과 결제금액/할인금액을 보여주는 요소 속성 */
        .payFooter {
            width : 100%;
            height : 30%;
            margin-top : 50px; /* 개인적인 CSS 작업한 코드 */
        }

        /* 쿠폰을 선택시 선택 쿠폰 보여주는 input태그 속성 */
        .coupon {
            width : 50%;
            height : 20%;
            margin-top: 3%;
            pointer-events : none;
        }
        /* 쿠폰함이 있는 새창으로 이동하는 버튼 속성 */
        .couponButton {
            width : 23%;
            height : 15%;
            margin-top: 3%;
            margin-bottom : 3%;
            background-color: #5995dd;
            color : white;
            border : 0;
            border-radius: 15px;
            font-weight: 600;
            font-size: 12px;
        }
        .couponButton:hover {
            cursor: pointer;
        }
        
        .couponCancel {
            width : 23%;
            height : 15%;
        	border-radius : 15px;
        	font-weight: 600;
            font-size: 12px;
            display : none;
        }
        
        /* 결제금액/할인금액을 보여주는 요소 속성*/
        .payAmount, .disAmount {
            width : 100%;
            height : 27.2%;
            font-size : 20px;
            line-height: 60px;
        }
        
        .payAmount {
        	margin-top : 30px; /* 개인적인 CSS 작업한 코드 */
        	border-top : 3px solid black; /* 개인적인 CSS 작업한 코드 */
        }
        
        /* 최종 금액을 보여주는 요소 속성 */
        .finalPay {
            height : 10%;
            font-size: 30px;
            font-weight: 650;
            line-height: 100px;
            margin-top : 30px; /* 개인적인 CSS 작업한 코드 */
            border-top: 3px solid black; /* 개인적인 CSS 작업한 코드 */
        }


        /* 결제자 정보에 대한 전체 요소 속성 */
        .payerInfo {
            display: inline-block;
            width : 70%;
            height : 80%;
            vertical-align: top;
            margin-left: 10px;
        }
        
        .payerInfo input {
        	padding : 0.3rem;
        }

        /* 결제정보/카드정보 전체를 보여주는 요소 속성 */
        .payInfo, .cardInfo {
            width : 100%;
			height : 40.5%; /* 개인적인 CSS 작업한 코드 */
			position: relative; /* 개인적인 CSS 작업한 코드 */
        }
        
        .payInfo {
        	border-bottom : 3px solid black; /* 개인적인 CSS 작업한 코드 */
        	padding-top : 5%; /* 개인적인 CSS 작업한 코드 */
			line-height : 75px; /* 개인적인 CSS 작업한 코드 */
        }
        
        
        .cardInfo {
        	text-align : center;
        	padding-top: 5%; /* 개인적인 CSS 작업한 코드 */
			line-height: 42px; /* 개인적인 CSS 작업한 코드 */
			border-bottom: 3px solid black; /* 개인적인 CSS 작업한 코드 */
        }
        
        /*  */
		input[type="number"]::-webkit-outer-spin-button,
		input[type="number"]::-webkit-inner-spin-button {
		    -webkit-appearance: none;
		    margin: 0;
		}


        /* 결제자 정보 글씨 속성 */
        .info1 {
            height : 9%;
            font-weight: 700;
            font-size: 25px;
            line-height: 104px;
            border-bottom : 3px solid black; /* 개인적인 CSS 작업한 코드 */
        }

        /* 결제 정보, 카드 정보 글씨 속성 */
        .info2 {
            width : 100%;
            height : 7%;
            font-size : 17px;
            font-weight: 600;
            line-height: 30px;
        }


        /* 결제자정보에 input태그에 관련 속성 */
        .input {
            height : 7%;
            margin-top: 3%;
        }
        
        #spanId {
        	position: absolute;
        	left : 35%;
        }
        
		#spanAddress {
        	position: absolute;
        	left : 35%;
        }
        
		#spanEmail {
        	position: absolute;
        	left : 33.5%;
        }
        
        input[name=memName],
        input[name=address],
        input[name=email] {
        	width : 26%;
        	margin-left : 9%;
        }
        
        #spanPhone {
        	position: absolute;
        	left : 32%;
        }
        
        #phone1 {
        	margin-left: 9%;
        }
        
        #phone2, #phone3 {
        	width : 7%;
        }
        
        #spanCardNum {
        	position: absolute;
        	top : 18.5%;
        	left : 32%;
        }
        
		#spanCardCVC {
        	position: absolute;
        	top : 32%;
        	left : 36%;
        }
        
		#spanCardExp {
        	position: absolute;
        	top : 46%;
        	left : 32%;
        }
        
        #cardNum1, #cardNum2,
        #cardNum3, #cardNum4 {
        	width : 6.9%;
        	margin-left: 1%;
        }
        
        #cardNum1 {
        	margin-left: 15% !important;
        } 
        
        #cardCVC {
        	width : 12%;
        	margin-left : 3% !important;
        	margin-right : 8% !important;
        }
        
        #cardCom {
        	margin-right : 3%;
        }
        
        input[name=expDate] {
        	margin-left : 2% !important;
        	margin-right : 10%;
        }

        /* 다음단계 버튼 속성 */
        .nextstep {
            text-align: center;
            width : 10%;
            height : 5%;
            background-color: #5995dd;
            color: white;
            border : 0;
            border-radius: 15px;
            font-weight: 600;
            font-size: 20px;
            margin-top: 1%;
        }
        /* 다음단계에 버튼 올렸을 시 */
        .nextstep:hover {
            cursor: pointer;
        }


    </style>
</head>
<body>
    <jsp:include page="../common/manubar.jsp"></jsp:include>
    
    <div class="content">
        <div class="main">
            <c:choose>
            	<c:when test="${ resType == '구독' }"> <!-- 요청한 서비스가 구독일 경우  -->
            		<div class="stage">
		                <div class="titleStep">
		                    <b>구독 신청 / 결제</b>
		                </div>
		                <div class="STEP1">
		                    <b>STEP 1</b> <br>
		                    구독 신청
		                </div>
		                <div class="STEP2">
		                    <b>STEP 2</b> <br>
		                    날짜 선택
		                </div>
		                <div class="STEP3">
		                    <b>STEP 3</b> <br>
		                    결제 정보 작성
		                </div>
		                <div class="STEP4">
		                    <b>STEP 4</b> <br>
		                    결제 확인
		                </div>
		            </div>
            	</c:when>
            	<c:when test="${ resType == '구독변경' }"> <!-- 요청한 서비스가 구독변경일 경우 -->
            		<div class="stage">
		                <div class="titleStep">
		                    <b>구독 변경 / 결제</b>
		                </div>
		                <div class="STEP1">
		                    <b>STEP 1</b> <br>
		                    구독 옵션 변경
		                </div>
		                <div class="STEP2">
		                    <b>STEP 2</b> <br>
		                    날짜 선택
		                </div>
		                <div class="STEP3">
		                    <b>STEP 3</b> <br>
		                    결제 정보 작성
		                </div>
		                <div class="STEP4">
		                    <b>STEP 4</b> <br>
		                    결제 확인
		                </div>
		            </div>
            	</c:when>
            	<c:otherwise> <!-- 요청한 서비스가 세탁/수선일 경우  -->
            		<div class="stage">
		                <div class="titleStep">
		                    <b>예약/결제</b>
		                </div>
		                <div class="STEP1">
		                    <b>STEP 1</b> <br>
		                    세탁 및 수선 신청             
		                </div>
		                <div class="STEP2">
		                    <b>STEP 2</b> <br>
		                    상세 설정
		                </div>
		                <div class="STEP3">
		                    <b>STEP 3</b> <br>
		                    시간/날짜 선택
		                </div>
		                <div class="STEP4">
		                    <b>STEP 4</b> <br>
		                    결제 정보 작성
		                </div>
		                <div class="STEP5">
		                    <b>STEP 5</b> <br>
		                    결제 확인
		                </div>
		            </div>
            	</c:otherwise>
            </c:choose>

            
            <fieldset class="select">
            	<c:choose>
            		<c:when test="${ resType == '구독' or resType == '구독변경' }"> <!-- 요청한 서비스가 구독/구독변경 일 경우  -->
            			<legend><b>STEP3</b></legend>
            		</c:when>
            		<c:otherwise> <!-- 요청한 서비스가 세탁/수선일 경우  -->
            			<legend><b>STEP4</b></legend>
            		</c:otherwise>
            	</c:choose>
                <div class="selectMenu">
                    <div class="totalPay">
                        <div class="payment">
                            <div class="payHeader">결제 금액</div>
                            <div class="payContent">
                                <div class="selectList">선택 내역</div>
                                <div id="userService">
                                	<table class="table table-hover table-sm" border="1" align="center">
                                		<thead>
                                			<c:choose>
                                				<c:when test="${ resType == '세탁' }"> <!-- 요청한 서비스가 세탁일 경우 -->
	                                				<tr style="background: #D8D8D8;">
		                                				<th>대분류</th>
		                                				<th>소분류</th>
		                                				<th>가격</th>
		                                			</tr>
                                				</c:when>
                                				<c:when test="${ resType == '수선' }"> <!-- 요청한 서비스가 수선일 경우 -->
	                                				<tr style="background: #D8D8D8;">
		                                				<th>대분류</th>
		                                				<th>기장</th>
		                                				<th>너비</th>
		                                				<th>수선</th>
		                                				<th>지퍼</th>
		                                				<th>가격</th>
		                                			</tr>
                                				</c:when>
                                				<c:otherwise> <!-- 요청한 서비스가 구독일 경우 -->
                                					<tr style="background: #D8D8D8;">
		                                				<th>구독옵션</th>
		                                				<th>시작일</th>
		                                				<th>만료일</th>
		                                			</tr>
                                				</c:otherwise>
                                			</c:choose>
                                		</thead>
                                		<tbody>
                                		<c:choose>
                                			<c:when test="${ resType == '세탁' }"> <!-- 요청한 서비스가 세탁일 경우 -->
	                                			<c:forEach var="sList" items="${ serviceList }">
		                                			<tr>
														<td>${ sList.mcategory }</td>
														<td>${ sList.scategory }</td>
														<td>${ sList.LPrice }원</td>                      		
		                                			</tr>
	                                			</c:forEach>
                                			</c:when>
                                			<c:when test="${ resType == '수선' }"> <!-- 요청한 서비스가 수선일 경우 -->
	                                			<c:forEach var="sList" items="${ serviceList }">
		                                			<tr>
		                                				<td>${ sList.rcategory }</td>
		                                				<td>${ sList.lengthYN }</td>
		                                				<td>${ sList.widthYN }</td>
		                                				<td>${ sList.resealYN }</td>
		                                				<td>${ sList.zipYN }</td>
		                                				<td>${ sList.RPrice }원</td>
		                                			</tr>
	                                			</c:forEach>
                                			</c:when>
                                			<c:otherwise> <!-- 요청한 서비스가 구독일 경우 -->
												<tr>
													<td>${ subscribe.subOption }</td>
													<fmt:parseDate var="fmtsubSdate" pattern="yyyy-MM-dd" value="${ subscribe.subSdate }"/>
													<td><fmt:formatDate pattern="yyyy-MM-dd" value="${ fmtsubSdate }"/></td>
													<fmt:parseDate var="fmtsubEdate" pattern="yyyy-MM-dd" value="${ subscribe.subEdate }"/>
													<td><fmt:formatDate pattern="yyyy-MM-dd" value="${ fmtsubEdate }"/></td>                      		
	                                			</tr>
                                			</c:otherwise>
                                		</c:choose>
                                		</tbody>
                                	</table>
                                </div>
                                <c:choose>
                                	<c:when test="${ resType == '구독' or resType == '구독변경' }"> <!-- 요청한 서비스가 구독일 경우 -->
                              			<div class="dayList" style="padding-top : 60px;">선택 요일</div>
                                		<div class="days">${ subscribe.subDay }</div>
                                	</c:when>
                                	<c:otherwise> <!-- 요청한 서비스가 세탁, 수선일 경우 -->
										<div class="dayList">선택 날짜</div>
										<fmt:parseDate var="fmtPickupDate" pattern="yyyy-MM-dd" value="${ reserve.pickupDate }"/>
                                		<div class="days"><fmt:formatDate pattern="yyyy-MM-dd" value="${ fmtPickupDate }"/></div>
                                	</c:otherwise>
                                </c:choose>
                            </div>
                                <c:choose>
                                	<c:when test="${ resType == '구독' or resType == '구독변경' }"> <!-- 요청한 서비스가 구독/구독변경 일 경우 -->
                                		<div class="payFooter">
	                                	    <div class="finalPay" style="margin-top : 110%">
					                            <span>최종 금액</span>
					                            <span id="totalPrice">${ subscribe.price }원</span>
				                        	</div>
			                        	</div>
                                	</c:when>
                                	<c:otherwise> <!-- 요청한 서비스가 세탁, 수선일 경우 -->
		                              	<div class="payFooter">
		                                <input type="text" class="coupon" placeholder="선택한 쿠폰 이름"> <br>
		                                <button type="button" class="couponButton">쿠폰 선택</button>
		                                <button type="button" class="btn btn-danger couponCancel">선택 취소</button>
                                	       	<div class="payAmount">
                                	       		<b>
				                                    <span>결제 금액</span>
				                                    <!-- fmt 사용해서 3자릿수 마다 ',' 출력되게끔 -->
				                                    <span>${ reserve.totalPay }원</span>
			                                    </b>
			                                </div>
			                                <div class="disAmount">
			                                	<b>
				                                    <span>할인 금액</span>                               
				                                    <span id="discountPrice">0원</span>
			                                    </b>
			                                </div>
			                            </div>
			                            <div class="finalPay">
				                            <span>최종 금액</span>
				                            <span id="totalPrice">${ reserve.totalPay }원</span>
			                        	</div>
                                	</c:otherwise>
                                </c:choose>
                        </div>
                    </div>
                    <form action="${ pageContext.request.contextPath }/payment/step5.do" method="post" onsubmit="return formCheck();" style="display : inline;">
                    	<input type="hidden" name="resNum" value="${ reserve.resNum }"> <!-- 예약 번호 Controller 로 전달 -->
                    	<input type="hidden" name="resType" value="${ resType }"> <!-- 예약 타입 Controller 로 전달 -->
                    	<input type="hidden" name="subNum" value="${ subscribe.subNum }"> <!-- 구독 번호 Controller 로 전달 -->
                    	<input type="hidden" name="couNum"> <!-- 사용한 쿠폰 번호 Controller 로 전달 -->
                    	<input type="hidden" name="totalPrice"> <!-- 최종 금액 Controller 로 전달 -->
	                    <div class="payerInfo">
	                        <div class="info1">결제자 정보</div>
	                        <div class="payInfo">
	                            <div class="info2">결제 정보</div>
                      			<span id="spanId">이름</span><input type="text" name="memName" class="input" maxlength="6" value="${ loginUser.memName }"> <br>
                      			<span id="spanAddress">주소</span><input type="text" name="address" class="input" value="${ loginUser.address }"> <br>
                      			<span id="spanEmail">이메일</span><input type="text" name="email" class="input" value="${ loginUser.email }"> <br>
								<span id="spanPhone">전화번호</span>                           
	                            <input type="hidden" name="phone">
	                            <select id="phone1">
									<option value="null" selected>선택</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
								</select>
	                            <input type="text" id="phone2" class="input" maxlength="4" style="margin-left: 1.8%;">
	                            <input type="text" id="phone3" class="input" maxlength="4" style="margin-left: 1.8%;">	                                                  
	                        </div> <!-- // payInfo -->
	                        <div class="cardInfo">
	                        	<c:choose>
	                        		<c:when test="${ cardInfo.cardNum != null }"> <!-- 로그인한 회원이 가진 카드가 있을 경우, 해당 카드 정보 미리 화면에 출력 -->
              							<div class="info2">카드 정보</div>
			                            <span id="spanCardNum">카드번호</span>
			                            <input type="hidden" name="cardId" value="${ cardInfo.cardId }"> <!-- 카드 ID Controller 로 전달 -->
			                            <input type="hidden" name="cardNum"> <!-- 카드 번호 Controller 로 전달 -->
			                            <input type="hidden" name="cardCVC"> <!-- 카드 CVC Controller 로 전달 -->
			                            <input type="text" id="cardNum1" class="input" maxlength="4" value="">
			                            <input type="text" id="cardNum2" class="input" maxlength="4" value="">
			                            <input type="text" id="cardNum3" class="input" maxlength="4" value="">
			                            <input type="text" id="cardNum4" class="input" maxlength="4" value=""> <br>
			                            <span id="spanCardCVC">CVC</span><input type="text" id="cardCVC" class="input" maxlength="3" placeholder="3자리 숫자" value="${ cardInfo.cardCVC }" style="margin-left: 7%;"> <br>
			                            <span id="spanCardExp">유효기간</span><input type="text" name="expDate" class="input" maxlength="5" placeholder="MM/YY" value="${ cardInfo.expDate }" style="margin-left: 2.9%; width: 9%;"> <br>
			                            <select id="cardCom" name="cardCom" class="input">
			                                <option value="null">카드사 선택</option>
			                                <!-- 카드 정보가 아래 옵션 값과 맞으면 selected 속성 부여 -->
			                                <option value="우리" <c:if test="${ cardInfo.cardCom == '우리' }">selected</c:if>>우리카드</option>
			                                <option value="신한" <c:if test="${ cardInfo.cardCom == '신한' }">selected</c:if>>신한카드</option>
			                                <option value="농협" <c:if test="${ cardInfo.cardCom == '농협' }">selected</c:if>>농협카드</option>
			                                <option value="국민" <c:if test="${ cardInfo.cardCom == '국민' }">selected</c:if>>국민카드</option>
			                            </select>
	                        		</c:when>
	                        		<c:otherwise> <!-- 로그인한 회원이 가진 카드가 없을 경우, 빈 상태로 화면에 출력 -->
	                        			<div class="info2">카드 정보</div>
			                            <span>카드번호</span>
			                            <input type="hidden" name="cardNum"> <!-- 카드 번호 Controller 로 전달 -->
			                            <input type="hidden" name="cardCVC"> <!-- 카드 CVC Controller 로 전달 -->
			                            <input type="text" id="cardNum1" class="input" maxlength="4">
			                            <input type="text" id="cardNum2" class="input" maxlength="4">
			                            <input type="text" id="cardNum3" class="input" maxlength="4">
			                            <input type="text" id="cardNum4" class="input" maxlength="4"> <br>
			                            <span>CVC</span><input type="text" id="cardCVC" class="input" maxlength="3" placeholder="3자리 숫자" style="margin-left: 7%;"> <br>
			                            <span>유효기간</span><input type="text" name="expDate" class="input" maxlength="5" placeholder="MM/YY" style="margin-left: 2.9%; width: 9%;"> <br>
			                            <select id="cardCom" name="cardCom" class="input">
			                                <option value="null" selected>카드사 선택</option>
			                                <option value="우리">우리카드</option>
			                                <option value="신한">신한카드</option>
			                                <option value="농협">농협카드</option>
			                                <option value="국민">국민카드</option>
			                            </select>
	                        		</c:otherwise>
	                        	</c:choose>
	                        	<br>
	                        	<!-- 현재 로그인한 회원의 카드 정보가 있다면, 기존 정보 사용 또는 직접 입력 버튼 출력 -->
	                        	<c:if test="${ cardInfo.cardNum != null}">
	                        		<input type="radio" id="existingInfo" name="infoButton" value="existingInfo" checked><label for="existingInfo">기존 카드 사용</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        			<input type="radio" id="customInfo" name="infoButton"  value="customInfo"><label for="customInfo">직접 입력</label>
	                        	</c:if>   
	                        </div> <!-- // cardInfo -->
	                    </div> <!-- // payerInfo -->
	                    <button type="submit" class="nextstep">다음 단계</button>  
	            	</form>       
                </div>              
            </fieldset>
            
        </div>
         <jsp:include page="../common/footer.jsp"></jsp:include>
    </div>
   

    <script>
    	//footer 바닥으로 css 고정
    	
    
    
    	var formChk = 1;
    
        $(function() {
            var step = $("legend").text();
            $("." + step).css("background-color" , '#5995dd').css("color", "white");
            
            /* ---------- 회원의 전화번호 화면에 넣어주는 스크립트 코드 ---------- */
            // 해당 회원의 전화번호를 화면에 미리 넣어주기
            var phoneInfo = ${"" + loginUser.phone } + ""; // 숫자 -> 문자 로 변환하기 위해 + "" 사용
                       
            switch (phoneInfo.substring(0,2)){ // number 타입으로 받기 때문에 맨 앞에 0이 잘림.
            
	            case "10" :
	                $("#phone1").val("010").prop("selected", true);
	                break;
	            case "11" :
	            	$("#phone1").val("011").prop("selected", true);
	                break;
	            case "16" :
	            	$("#phone1").val("016").prop("selected", true);
	                break;
          	}          
            
            $("#phone2").val(phoneInfo.substring(2,6)); // 4번째 자리 ~ 7번째 자리 전화번호
            $("#phone3").val(phoneInfo.substring(6,11)); // 8번째 자리 ~ 11번째 자리 전화번호
            /* ---------------------------------------------------- */


            /* ---------- 카드 관련 스크립트 코드 ---------- */            	          
            $("input[name=infoButton]").on("click", function() {
            	
            	if( $(this).attr("id")  == "existingInfo" ) { // 클릭된 버튼 ID 값이 existingInfo 라면, true

            		formChk = 0;
            		
                    // 해당 회원이 가진 카드 정보를 화면에 미리 넣어주기
                    var cardNumInfo = "${ cardInfo.cardNum }"; // 숫자 -> 문자 로 변환하기 위해 "" 사용
                    var cardCVCInfo = "${ cardInfo.cardCVC }";
                    var cardExpDateInfo = "${ cardInfo.expDate }";
                    var cardComInfo = "${ cardInfo.cardCom }"; 
                    
                    // 미리 hidden 태그에 값 넣어두기
                    $("input[name=cardNum]").val(cardNumInfo);
                    $("input[name=cardCVC]").val(cardCVCInfo);
                    
                    $("#cardNum1").val("****"); // 1번째 자리 ~ 4번째 자리 카드 번호
                    $("#cardNum2").val("****"); // 5번째 자리 ~ 8번째 자리 카드 번호
                    $("#cardNum3").val("****"); // 9번째 자리 ~ 12번째 자리 카드 번호
                    $("#cardNum4").val(cardNumInfo.substring(12,16)); // 13번째 자리 ~ 16번째 자리 카드 번호
                    
                    $("#cardCVC").val("***"); // 카드 CVC 번호
	                $("input[name=expDate]").val(cardExpDateInfo); // 카드 유효 기간

                    // 입력 박스 readonly 속성 부여
                    $("#cardNum1").attr("readonly", true);
                    $("#cardNum2").attr("readonly", true);
                    $("#cardNum3").attr("readonly", true);
                    $("#cardNum4").attr("readonly", true);
                    
                    $("#cardCVC").attr("readonly", true);
                    
                    $("input[name=expDate]").attr("readonly", true);
                    
                    // 카드사 Select 태그 클릭 제한 및 값 할당
                    $("#cardCom").focus(function() {
                    	this.initialSelect = this.selectedIndex;
                    });
                    
                    $("#cardCom").change(function() {
                    	this.selectedIndex = this.initialSelect;
                    });
                    
                    $("#cardCom").val(cardComInfo);
            		
            	} else if( $(this).attr("id") == "customInfo" ) { // 클릭된 버튼 ID 값이 customInfo 라면, true

            		formChk = 1;
            		
	                $("#cardNum1").val(""); // 1번째 자리 ~ 4번째 자리 카드 번호
	                $("#cardNum2").val(""); // 5번째 자리 ~ 8번째 자리 카드 번호
	                $("#cardNum3").val(""); // 9번째 자리 ~ 12번째 자리 카드 번호
	                $("#cardNum4").val(""); // 13번째 자리 ~ 16번째 자리 카드 번호
	                
	                $("#cardCVC").val(""); // 카드 CVC 번호
	                $("input[name=expDate]").val(""); // 카드 유효 기간
	
	                // 입력 박스 readonly 속성 부여
	                $("#cardNum1").attr("readonly", false);
	                $("#cardNum2").attr("readonly", false);
	                $("#cardNum3").attr("readonly", false);
	                $("#cardNum4").attr("readonly", false);
	                
	                $("#cardCVC").attr("readonly", false);
	                
	                $("input[name=expDate]").attr("readonly", false);
	                
                    // 카드사 Select 태그 클릭 제한 및 값 초기화
                    $("#cardCom").off("focus change");
                    $("#cardCom").val("null");
            	
            	}
            	
            });
            
            if( ${ cardInfo.cardNum != null } ) { // 로그인한 회원의 카드 정보가 존재할 경우
                $("#existingInfo").trigger("click"); // 화면 로딩 후, 기존 정보 사용 버튼 클릭되어짐.	
            };
            
            /* ---------------------------------------------------- */
            
            
            /* ---------- 쿠폰 관련 스크립트 코드 ---------- */
            // 쿠폰 선택 버튼 클릭 시, 쿠폰창 Open
            $(".couponButton").on('click', function() {
				window.open('${pageContext.request.contextPath}/payment/couponPage.do?currentPage=1', '_blank', 'resizable=no width=600 height=500');
            });
            
            // 쿠폰 선택 취소 버튼 클릭 시, 이벤트 시작
            $(".couponCancel").on("click", function() {
            	
            	$("#discountPrice").text(0 + "원"); // 할인 금액을 0원으로 초기화
            	$("#totalPrice").text(${ reserve.totalPay } + "원"); // 총 금액을 결제 금액으로 초기화
            	
            	$(".coupon").val(""); // 선택한 쿠폰 이름 input 태그 값을 초기화
            	$("input[name=couNum]").val(""); // hidden 태그에 값을 초기화
            	$(".couponCancel").hide(); // 쿠폰 선택 취소 버튼 숨기기
            }); 
            /* ---------------------------------------------------- */
        });
        
     	// 쿠폰 선택 팝업 창에서 선택한 값이 전달되어짐.
        function setCoupon(couponNum, couponName, discount) {
			
     		var totalPay = ${ reserve.totalPay } + ""; // resType 이 구독일 때, 오류 방지를 위해 값을 변수에 저장
     		
        	var discountPay = Number(totalPay) * discount / 100; // 총 금액 * 할인율 / 100 = 할인 금액
        	var payPriceTmp = Number(totalPay); // 연산할 때 실행순서를 맞추기 위해 payPrice 를 var 변수에 담기	
     		
     		$("#discountPrice").text(discountPay + "원"); // 할인 금액을 화면에 출력
     		$("#totalPrice").text( (payPriceTmp - discountPay) + "원"); // 총 금액을 화면에 출력
     		    		

        	$(".coupon").val(couponName); // 선택한 쿠폰 이름 input 태그 값을 선택한 쿠폰 이름으로 변경
			$("input[name=couNum]").val(couponNum); // hidden 태그에 값 할당하여, Controller 로 넘길 준비
        	$(".couponCancel").show(); // 쿠폰 선택 취소 버튼 보이기
        };
        
        // 다음 페이지로 이동하기 전에, 입력 양식에 맞게 입력했는지 확인
        function formCheck() {
        	
        	// 정규표현식
        	var nameReg = /^[가-힣]{2,6}$/; // 한글 단어만 2글자 ~ 6글자
        	var emailReg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; //앞부분은 영문자, 영문자와 숫자만 6 ~ 15자 / 뒷부분은 14자까지
        	var phoneReg = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/; // 숫자만       	
        	var cardNumReg = /(\d{4})(\d{4})(\d{4})(\d{4})/;
        	var cardCVCReg = /(\d{3})/;
        	var cardDateReg = /(0[1-9]|1[0-2])\/[0-9]{2}/;

        	var phone = $("#phone1").val()
        			  + $("#phone2").val()
        			  + $("#phone3").val();       	
        	

        	var cardNum = $("#cardNum1").val() 
        				+ $("#cardNum2").val() 
        				+ $("#cardNum3").val() 
        				+ $("#cardNum4").val();

        	
        	if( ! nameReg.test($("input[name=memName]").val()) ) { // 이름이 정규표현식과 맞지 않을 때
        		alert("이름은 한글로 2 ~ 6글자 사이로 작성해야 합니다.");
        		return false;
        	}
        	
        	if( ! emailReg.test($("input[name=email]").val()) ) { // 이름이 정규표현식과 맞지 않을 때
        		alert("이메일은 이메일형식으로 작성해야 합니다.");
        		return false;
        	}        	
        	
        	if( ! phoneReg.test( phone ) ) { // 전화번호가 정규표현식과 맞지 않을 때
        		alert("전화번호는 숫자로만 작성해야 합니다.");
        		return false;
        	}

        	if( formChk == 1 ) { // 카드 정보를 직접 입력할 경우
            	if( ! cardNumReg.test( cardNum ) ) { // 카드번호가 정규표현식과 맞지 않을 때
            		alert("카드 번호는 숫자로만 4자리씩 입력해야 합니다.");
            		return false;
            	}

            	
            	if( ! cardCVCReg.test($("#cardCVC").val()) ) { // CVC번호가 정규표현식과 맞지 않을 때
            		alert("CVC 번호는 숫자로만 3자리 입력해야합니다.");
            		return false;
            	}
            	
            	if( ! cardDateReg.test($("input[name=expDate]").val()) ) { // 유효기간이 정규표현식과 맞지 않을 때
            		alert("유효 기간은 '월/년도' 형식으로 입력해야 합니다.");
            		return false;
            	}
            	
            	
    			if( $("#cardCom option:selected").val() == "null" ) { // 카드사를 선택하지 않았을 때
    				alert("카드사를 선택해주세요.");
    				return false;
    			}
        	}

			if( formChk == 1 ) { // 카드 정보를 직접 입력할 경우
				$("input[name=cardNum]").val(cardNum); // hidden 태그에 값 할당하여, Controller 로 넘길 준비
				$("input[name=cardCVC]").val($("#cardCVC").val()); // hidden 태그에 값 할당하여, Controller 로 넘길 준비	
			}					
			$("input[name=phone]").val(phone); // hidden 태그에 값 할당하여, Controller 로 넘길 준비
			$("input[name=totalPrice]").val($("#totalPrice").text()); // hidden 태그에 값 할당하여, Controller 로 넘길 준비
				
        }
        
        
    </script>
</body>
</html>