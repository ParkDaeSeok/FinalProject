<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ include file="../common/util.jsp" %>
<!DOCTYPE html>
<html lang="en">
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
            z-index : 1;
	    }
	
        /* header 속성 */
        .header {
            width : 100%;
            height : 15%;
            background-color: lightgray;
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


        /* main안에 stage속성(content에 왼쪽사이드) */
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

        /* main안에 select속성(fieldset태그의 속성) */
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
		
		.selectMenu input { /* 개인적인 CSS 작업한 코드 */
			padding : 0.3rem;
			border : none;
			pointer-events : none;
			width : 30% !important;
			margin-left : 20% !important;
		}
		
		.selectMenu textarea {
			pointer-events : none;
		}
        

        /* step5 일 때 */
        /* selectMenu안에 결제확인전체페이지  */
        .checkPay {
            margin-left : 10%;
            margin-top : 1%;
            width : 80%;
            height : 90%;
            font-weight: 700;
            
        }

        /* 결제 확인 글씨 정보*/
        .check {
            height : 7%;
            font-size: 25px;
            line-height: 80px;
            border-bottom : 3px solid black; /* 개인적인 CSS 작업한 코드 */
        }

        /* 결제확인 정보(payerInfo) */
        .payerInfo2 {
            width: 100%;
            height : 80%;
        }

        /* step4도 같은 속성 있음 */
        /* input태그와 textarea태그에 속성 */
        .input {
            width : 15%;
            height : 7%;
            margin-top: 3%;
        }

        /* 결제자 정보 전체 요소 속성 */
        .payInfo2 {
            width : 100%;
            height: 40%;
            padding : 3% 0; /* 개인적인 CSS 작업한 코드 */
			position: relative; /* 개인적인 CSS 작업한 코드 */
            border-bottom: 3px solid black; /* 개인적인 CSS 작업한 코드 */
        }
        
        #spanId { /* 개인적인 CSS 작업한 코드 */
        	position: absolute;
        	left : 38%;
        	top : 28%;
        }
        
		#spanAddress { /* 개인적인 CSS 작업한 코드 */
        	position: absolute;
        	left : 38%;
        	top : 46%;
        }
        
		#spanEmail { /* 개인적인 CSS 작업한 코드 */
        	position: absolute;
        	left : 36.5%;
			top : 65%;
        }
        
        #spanPhone { /* 개인적인 CSS 작업한 코드 */
        	position: absolute;
        	left : 35%;
			top : 82.5%;
        }

        /* 상세정보 전체 요소 속성 */
        .detailInfo {
            width : 100%;
            height : 60%;
            position: relative; /* 개인적인 CSS 작업한 코드 */
			padding : 3% 0; /* 개인적인 CSS 작업한 코드 */
        }
        
        #spanService { /* 개인적인 CSS 작업한 코드 */
        	position: absolute;
        	top : 14%;
        	left : 32.5%;
        }
        
		#spanDays { /* 개인적인 CSS 작업한 코드 */
        	position: absolute;
			top : 23.5%;
        	left : 34.5%;
        }
        
		#spanCardNum { /* 개인적인 CSS 작업한 코드 */
        	position: absolute;
        	top : 33%;
        	left : 34.5%;
        }
        
		#spanCardCom { /* 개인적인 CSS 작업한 코드 */
        	position: absolute;
        	top : 42.5%;
        	left : 36.8%;        	
        }        
        
		#spanUserService { /* 개인적인 CSS 작업한 코드 */
        	position: absolute;
			top : 52%;
        	left : 34.5%;  
        }        
        
		#spanRequest { /* 개인적인 CSS 작업한 코드 */
        	position: absolute;    
			top : 87%;
        	left : 34.5%;  
        }
        
		#userService {
        	width : 35%;
        	height : 138px;
        	background : white;
        	overflow-x : auto;
        	margin : 3% 0 3% 45%; 
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
        
        /* 결제자 정보  */
        .info3 {
            width : 100%;
            height : 12%;
            font-size : 17px;
            font-weight: 600;
            line-height: 30px;
        }

        /* 상세 정보 */
        .info4 {
            width : 100%;
            height : 7%;
            font-size : 17px;
            font-weight: 600;
            line-height: 30px;
        }

        /* 총금액 보여주는 div요소 속성 */
        .lastPay {
            width: 100%;
            height : 13%;
            line-height: 100px;
            font-size: 25px;
            border-top : 3px solid black;
            border-bottom : 3px solid black;
        }
        
        /* 결제하기/취소하기 버튼*/
        .submit, .reset {
            width : 9%;
            height : 5%;
            border-radius: 15px;
            border: 0;
            font-weight: 600;
            font-size: 20px;
            background-color: #5995dd;
            color : white;
            margin-top: 1%;
        }
        .submit:hover, .reset:hover {
            cursor: pointer;
            color: #5995dd;
            background-color: white;
        }
        
        
        .mySpinner {
        	z-index : 100001;
        }
        
        .modal.show {
        	display : flex !important;
        }
        
        .modal-dialog {
        	align-self : center;
        }
        
        


        /* footer 속성 */
        .footer {
            width : 100%;
            height : 15%;
            background-color: #bbb;
        }
    </style>
</head>
<body>

    <jsp:include page="../common/manubar.jsp"></jsp:include>
    <div class="content">
        <div class="main">
            <c:choose>
            	<c:when test="${ memberAndCard.resType == '구독' }"> <!-- 요청한 서비스가 구독일 경우  -->
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
            	<c:when test="${ memberAndCard.resType == '구독변경' }"> <!-- 요청한 서비스가 구독변경일 경우 -->
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
            		<c:when test="${ memberAndCard.resType == '구독' or memberAndCard.resType == '구독변경' }"> <!-- 요청한 서비스가 구독/구독변경 일 경우  -->
            			<legend><b>STEP4</b></legend>
            		</c:when>
            		<c:otherwise> <!-- 요청한 서비스가 세탁/수선일 경우  -->
            			<legend><b>STEP5</b></legend>
            		</c:otherwise>
            	</c:choose>
                <form action="${ pageContext.request.contextPath }/payment/payConfirm.do" method="post">
                	<input type="hidden" name="subNum" value="${ memberAndCard.subNum }">
                	<input type="hidden" name="resNum" value="${ memberAndCard.resNum }">
                	<input type="hidden" name="couNum" value="${ memberAndCard.couNum }">
                	<input type="hidden" name="cardId" value="${ memberAndCard.cardId }">
                	<input type="hidden" name="totalPrice" value="${ memberAndCard.totalPrice }">
                	<fmt:parseDate var="fmtDelDate" pattern="yyyy-MM-dd" value="${ reserve.delDate }"/>
                	<input type="hidden" name="delDate" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${ fmtDelDate }"/>">
	                <div class="selectMenu">
	                    <div class="checkPay">
	                        <div class="check">결제 확인</div>
	                            <c:choose>
	                            	<c:when test="${ memberAndCard.resType == '구독' or memberAndCard.resType == '구독변경' }"> <!-- 신청한 서비스가 구독/구독변경 일 경우 -->
	                            		<div class="payerInfo2">
				                            <div class="payInfo2">
				                                <div class="info3">결제자 정보</div>
				                                <span id="spanId">이름</span> <input type="text" name="memName" class="input" value="${ memberAndCard.memName }" style="margin-left: 5%;"> <br>
				                                <span id="spanAddress">주소</span> <input type="text" name="address" class="input" value="${ memberAndCard.address }" style="margin-left: 5%;"> <br>
				                                <span id="spanEmail">이메일</span> <input type="email" name="email" class="input" value="${ memberAndCard.email }" style="margin-left: 5%;"> <br>
				                                <span id="spanPhone">전화번호</span> <input type="text" name="phone" class="input" value="${ memberAndCard.phone }" style="margin-left: 5%;">
				                            </div>			                            
				                            <div class="detailInfo">
					                                <div class="info4">상세 정보</div>
					                                <span id="spanService" style="top : 16.5%;">신청 서비스</span> <input type="text" name="resType" class="input" value="${ memberAndCard.resType }" style="margin-left: 5%;"> <br>
					                                <span id="spanDays" style="top : 27%;">선택 요일</span> <input type="text" name="pickupDate" class="input" value="${ subscribe.subDay }" style="margin-left: 5%;"> <br>
					                                <input type="hidden" name="cardNum" value="${ memberAndCard.cardNum }">
					                                <span id="spanCardNum" style="top : 38%;">카드 번호</span> <input type="text" id="cardMaskingNum" class="input" style="margin-left: 3%;"> <br>
					                                <span id="spanCardCom" style="top : 49.5%;">카드사</span> <input type="text" name="cardCom" class="input" value="${ memberAndCard.cardCom }" style="margin-left: 5%;"> <br>
			                                		<span id="spanUserService" style="top : 60%;">상세 사항</span> 
					                                <div id="userService">                                	
						                                <table class="table table-hover table-sm" border="1" align="center">
					                                		<thead>
			                                					<tr style="background: #D8D8D8">
					                                				<th>구독옵션</th>
					                                				<th>시작일</th>
					                                				<th>만료일</th>
					                                			</tr>
					                                		</thead>
					                                		<tbody>
																<tr>
																	<td>${ subscribe.subOption }</td>
																	<fmt:parseDate var="fmtsubSdate" pattern="yyyy-MM-dd" value="${ subscribe.subSdate }"/>
																	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${ fmtsubSdate }"/></td>
																	<fmt:parseDate var="fmtsubEdate" pattern="yyyy-MM-dd" value="${ subscribe.subEdate }"/>
																	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${ fmtsubEdate }"/></td>                      		
					                                			</tr>
					                                		</tbody>
					                                	</table>
					                                </div> <br>
					                            </div>
					                        </div>
					                        <div class="lastPay">
					                            <span>총 금액</span> 
					                            <span>${ memberAndCard.totalPrice }</span>
					                        </div>				                            
	                            	</c:when>
	                            	<c:otherwise> <!-- 신청한 서비스가 세탁/수선일 경우 -->
	                            		<div class="payerInfo2">
				                            <div class="payInfo2">
				                                <div class="info3">결제자 정보</div>
				                                <span id="spanId">이름</span> <input type="text" name="memName" class="input" value="${ memberAndCard.memName }" style="margin-left: 5%;"> <br>
				                                <span id="spanAddress">주소</span> <input type="text" name="address" class="input" value="${ memberAndCard.address }" style="margin-left: 5%;"> <br>
				                                <span id="spanEmail">이메일</span> <input type="email" name="email" class="input" value="${ memberAndCard.email }" style="margin-left: 5%;"> <br>
				                                <span id="spanPhone">전화번호</span> <input type="text" name="phone" class="input" value="${ memberAndCard.phone }" style="margin-left: 5%;">
				                            </div>			                            
				                            <div class="detailInfo">
					                                <div class="info4">상세 정보</div>
					                                <span id="spanService">신청 서비스</span> <input type="text" name="resType" class="input" value="${ memberAndCard.resType }" style="margin-left: 5%;"> <br>
					                                <fmt:parseDate var="fmtPickupDate" pattern="yyyy-MM-dd" value="${ reserve.pickupDate }"/> <!-- YYYY/MM/DD 형식으로 바꿔주기 -->
					                                <span id="spanDays">수거 날짜</span> <input type="text" name="pickupDate" class="input" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${ fmtPickupDate }"/>" style="margin-left: 5%;"> <br>
					                                <input type="hidden" name="cardNum" value="${ memberAndCard.cardNum }">
					                                <span id="spanCardNum">카드 번호</span> <input type="text" id="cardMaskingNum" class="input" style="margin-left: 5%;"> <br>
					                                <span id="spanCardCom">카드사</span> <input type="text" name="cardCom" class="input" value="${ memberAndCard.cardCom }" style="margin-left: 5%;"> <br>
					                                <span id="spanUserService">상세 사항</span> 
					                                <div id="userService">                                	
						                                <table class="table table-hover table-sm" border="1" align="center">
					                                		<thead>
					                                			<c:choose>
					                                				<c:when test="${ memberAndCard.resType == '세탁' }"> <!-- 요청한 서비스가 세탁일 경우 -->
						                                				<tr style="background: #D8D8D8">
							                                				<th>대분류</th>
							                                				<th>소분류</th>
							                                				<th>가격</th>
							                                			</tr>
					                                				</c:when>
					                                				<c:otherwise> <!-- 요청한 서비스가 수선일 경우 -->
					                                					<tr style="background: #D8D8D8">
							                                				<th>대분류</th>
							                                				<th>기장</th>
							                                				<th>너비</th>
							                                				<th>수선</th>
							                                				<th>지퍼</th>
							                                				<th>가격</th>
							                                			</tr>
					                                				</c:otherwise>
					                                			</c:choose>
					                                		</thead>
					                                		<tbody>
																<c:choose>
						                                			<c:when test="${ memberAndCard.resType == '세탁' }"> <!-- 요청한 서비스가 세탁일 경우 -->
							                                			<c:forEach var="sList" items="${ serviceList }">
								                                			<tr>
																				<td>${ sList.mcategory }</td>
																				<td>${ sList.scategory }</td>
																				<td>${ sList.LPrice }원</td>     
								                                			</tr>
							                                			</c:forEach>
						                                			</c:when>
						                                			<c:otherwise> <!-- 요청한 서비스가 수선일 경우 -->
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
						                                			</c:otherwise>
																</c:choose>
					                                		</tbody>
					                                	</table>
					                                </div> <br>
					                                <span id="spanRequest">요청 사항</span> <textarea name="request" cols="33" rows="3" style="resize:none; margin-left: 25%;">${ reserve.request }</textarea> <br>
					                            </div>
					                        </div>
					                        <div class="lastPay">
					                            <span>총 금액</span> 
					                            <span>${ memberAndCard.totalPrice }</span>
					                        </div>	
	                            	
	                            	</c:otherwise>
	                            </c:choose>
	                    </div>
	                    <br><br>
	                    <c:choose>
	                    	<c:when test="${ memberAndCard.resType == '구독변경' }"> <!-- 신청한 서비스가 구독변경일 경우, true -->
	                    		<button type="submit" class="submit" data-toggle="modal" data-target="#spinner">변경하기</button> &nbsp;&nbsp;&nbsp;
	                    		<button type="button" class="reset" onclick="location.href='${ pageContext.request.contextPath }/'">취소하기</button>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<button type="submit" class="submit" data-toggle="modal" data-target="#spinner">결제하기</button> &nbsp;&nbsp;&nbsp;
	                    		<button type="button" class="reset" onclick="location.href='${ pageContext.request.contextPath }/'">취소하기</button>	                    		
	                    	</c:otherwise>
	                    </c:choose>
                	</div>
                </form>
            </fieldset>
        </div>
    </div>
   
    
      <!-- The Spinner -->
	 <div class="modal mySpinner" id="spinner" style="display : none" data-keyboard="false" data-backdrop="static">
	   <div class="modal-dialog">
	       <!-- Spinner body -->
	       <div class="spinner-border text-primary">
	       </div>
	   </div>
	 </div>
	 
    <jsp:include page="../common/footer.jsp"></jsp:include>

    <script>
        $(function() {
            var step = $("legend").text();
            $("."+step).css("background-color" , '#5995dd').css("color", "white");
            

            var cardNum = $("input[name=cardNum]").val();
            
            $("#cardMaskingNum").val("************" + cardNum.substring(12, 16));
            

        });
    </script>
</body>
</html>