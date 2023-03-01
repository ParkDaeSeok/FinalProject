<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../common/util.jsp" %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    
    <!--제이쿼리 ui css-->
    <!--<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">-->
    
    <!--제이쿼리 style css-->
    <!--<link rel="stylesheet" href="/resources/demos/style.css">-->
    
    <!--제이쿼리 js-->
    <!--<script src="https://code.jquery.com/jquery-1.12.4.js"></script>-->
    
    <!--제이쿼리 ui js-->
    <!--<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!-- 온라인 방식-->
    <!-- <link rel="stylesheet" href="/laundry/resources/bootstrap-datepicker.css">-->
    <!-- <script src="/laundry/resources/bootstrap-datepicker.js"></script>-->


    <link href="/laundry/resources/datepicker.min_kcg.css" rel="stylesheet" type="text/css" media="all">
	<!-- Air datepicker css -->
	<script src="/laundry/resources/datepicker_kcg.js"></script>
	<script src="/laundry/resources/datepicker.ko_kcg.js"></script>
    <style>
        /* 화면 전체 크기 */
        html,body {
            width : 100%;
            height : 1500px;
        }
        div {
            box-sizing: border-box;
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
        
        /**/
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
            height : 98.3%;
            text-align: center;
            line-height: 75px;
            position : relative;
            font-size: 25px;
            /**/
            border-radius: 15px; 
            background : white;
            margin-top : 22px;
            margin-right : 15px;
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
            top : 5%;
            height : 12%;
            width : 100%;
        }
        .STEP2 {
            position: absolute;
            border-bottom : 8px solid rgb(248, 245, 244); /* CSS 작업 추가 */
            top : 18%;
            height : 12%;
            width : 100%;
        }
        .STEP3 {
            position: absolute;
            border-bottom : 8px solid rgb(248, 245, 244); /* CSS 작업 추가 */
            top : 30%;
            height : 12%;
            width : 100%;
        }
        .STEP4 {
            position: absolute;
            border-bottom : 8px solid rgb(248, 245, 244); /* CSS 작업 추가 */
            top : 42%;
            height : 12%;
            width : 100%;
        }
        .STEP5 {
            position: absolute;
            top : 54%;
            height : 12%;
            width : 100%;
        }
        

        /* legend에 step 글씨*/
        legend {
            font-size: 20px;
            width : auto !important;
            margin-left: 10px;
            padding: 5px;
        }



        /* main안에 select속성 */
        .select {
            vertical-align: top;
            width : 80%;
            height : 100%;
            box-sizing: border-box;
            /**/
            background : white; /* CSS 작업 추가 */
			border-radius : 15px; /* CSS 작업 추가 */
			border : none; /* CSS 작업 추가 */
        }
        
        /* select속성에 selectMenu 속성 */
        .selectMenu {
            width : 100%;
            height : 100%;
            text-align: center;
        }

        /* step3 일 때 */
        /* selectMenu안에 date,timeSelect 속성 */
        .dateSelect {
            vertical-align: top;
            display: inline-block;
            width : 40%;
            height: 33.5%;
            margin-top: 10%;
            /*padding-right : 5%;*/
        }

        /* 날짜 선택 글씨 속성 */
        .choiceDay {
            width : 100%;
            height : 22%;
            font-weight: 700;
            font-size: 25px;
            line-height: 70px;
            border-bottom : 3px groove black;
        }
        /* 날짜 선택 하는 폼 속성*/
        #datepicker {
            margin-top: 25%;
            width : 70%;
            height : 20%;    
            border-radius: 5px;
            border : 0px;
            font-size: 1.2rem;
            cursor: pointer;
            
        }

 		 #datepicker:hover{
 		 border: 1px solid black;
 		 color:black;
 		 
 		 }
        /* 수거 및 배달완료 날짜 보여주는 속성*/
        .deliveryDay {
            display: inline-block;
            width : 40%;
            height : 50%;
            margin-top: 10%;
            /*margin-left: 5%;*/
            /*border-left : 1px groove black;*/
            padding-left : 5%
            
        }

        /* 수거 희망 날짜 속성 및 배달 예정 날짜 속성 */
        .startDay, .endDay {
            width : 100%;
            height: 50%;
            text-align: center;
             position: relative;
        }

        /* 수거 희망 날짜 배달 예정 날짜 (글씨) 관련 속성 */
        .day {
            width : 100%;
            height : 30%;
            line-height: 70px;
            font-weight: 700;
            font-size: 25px;
            border-bottom : 3px groove black;
        }
        /* 수거예정 날짜(내가 달력에서 선택한 값이) 속성*/
        .date1 {
            width : 100%;
            height : 30%;
            font-size: 20px;
            line-height: 70px;
            margin-top: 6rem;
            
        }

        /* 배달예정 날짜 속성*/
        .date2 {
            width : 100%;
            height : 30%;
            font-size: 20px;
            line-height: 70px;
        }

        /* 배달 날짜 설명에 대한 속성 */
        .explain {
            width: 100%;
            height : 40%;
            line-height: 100px;
            position: absolute;
   			 bottom: -20px;
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
        }
        /* 다음단계에 버튼 올렸을 시 */
        .nextstep:hover {
            cursor: pointer;
            background-color: white;
            color :#5995dd;
            font-size : 20px;
        }
        
        /* 수거날짜/배달날짜 보여주는 input태그 속성 */
        #pickupDate, #delDate {
        	background : white;
        	text-aling : center;
        	border : 0;
        	width : 110px;
        	font-size : 20px;
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
                    날짜 선택
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
            <fieldset class="select">
                <legend><b>STEP3</b></legend>
                <div class="selectMenu" style="padding: 2rem;">
                    <div class="dateSelect">
                        <div class="choiceDay">
                           	 날짜 선택
                        </div>
                        <input type="text" id="datepicker" name="date" class="calender" placeholder=" 수거날짜를 선택해주세요" style="background:#FAFAFA; text-align:center;">
                    </div>
                    
                    <div class="deliveryDay">
                    	<form action="${pageContext.request.contextPath}/reserve/pay.py" method="post" style="height:100%;">
                        <div class="startDay">
                            <div class="day">수거 희망 날짜</div>
                            <div class="date1">
                                <input type="text" name="pickupDate" id="pickupDate" readonly>
                            </div>
                            <div class="explain">
                               	빨래와 수선은 3일이 걸립니다.
                            </div>
                        </div>
                        <div class="endDay">
                            <div class="day">배달 예정 날짜</div>
                            <div class="date2">
                                <input type="text" name="delDate" id="delDate" readonly>
                            </div>
                        </div>
                        <input type="hidden" value="${ resType }" name="resType">
                        <input type="hidden" value="${ request }" name="request">
                        <button type="submit" style="display:none;" id="hiddenButton"></button>
                        </form>
                    </div>
                    <br><br><br>   
                    <button type="submit" class="nextstep" onclick="nextstep();">다음 단계</button>                 
                </div>

            
            </fieldset>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"></jsp:include>
    
    <script>
		/* 각자 step에 맞는 사이드바에서 step 배경색 바꾸기*/
		$(function() {
		
	       var step = $("legend").text();
	       $("."+step).css("background-color" , '#5995dd').css("color", "white");
		
		});
    
        $("#datepicker").datepicker({
            format : "yyyy-mm-dd",
            language: 'ko',
            minDate : new Date()
        });
        
        /* 수거예정날짜와 배달예정날짜 보여주는 이벤트 */
        $("#datepicker").datepicker({
            onSelect: function(dateText) {
                $("#pickupDate").val($("#datepicker").val());

                var pDate = $("#pickupDate").val();

                /* 받아온 날짜를 연/월/일로 나누어서 변수에 */
                var pYear = (Number)(pDate.substring(0,4));
                var pMonth = (Number)(pDate.substring(5,7));
                var pDay = (Number)(pDate.substring(8,10));

                // 받아온 변수로 그날에 맞는 date 
                var date = new Date(pYear, pMonth-1, pDay);
                // 받아온 날짜보다 +3일
                var date2 = new Date(date.setDate(date.getDate()+3));

                var year = date2.getFullYear(); // 받아온 날짜 +3일에 연도
                var month = date2.getMonth()+1; // 받아온 날짜 +3일에 월
                var day = date2.getDate(); // 받아온 날짜 +3일에 일
                
                var date3=""; // yyyy-mm-dd로 맞추기위한 변수
                if(month>=1 && month<10) { // 받아온 날짜 +3일에 월이 1~9월일 경우
                    if(day>=1 && day<10) { // 받아온 날짜 +3일에 일이 1~9일일 경우
                        date3 = year+"-0"+month+"-0"+day;
                    }
                    else {
                        date3 = year+"-0"+month+"-"+day;
                    }
                }
                else { // 받아온 날짜 +3일에 월이 10,11,12월일 경우
                    if(day>=1 && day<10) {
                        date3 = year+"-"+month+"-0"+day;
                    }
                    else {
                        date3 = year+"-"+month+"-"+day;
                    }
                }-
				$("#delDate").val(date3);
                
            }
        });

        /* 다음단계버튼 눌렀을때 step3로 넘어가도록 hiddenButton 클릭되도록 */
        function nextstep() {
        	
        	if($("#datepicker").val() == "") {
            	alert("날짜를 선택해야합니다.");
            }
        	else {
	        	var button = document.getElementById("hiddenButton");
	        	button.click();
        	}
        	
        }
        
    </script>
</body>
</html>