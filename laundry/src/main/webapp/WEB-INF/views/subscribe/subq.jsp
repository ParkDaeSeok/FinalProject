<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            /**/
            height : 100%;
            background : rgb(248, 245, 244); /**/
        }
        
        /**/
        .menubar {
        	background : white !important;
        	border-bottom : 1px solid black;
        }
        /**/
        #noMain {
        	background : rgb(248, 245, 244) !important;
        }
        
        /* content안에 div(main)속성 */
        .main {
            width : 100%;
            height : 100%;
            padding : 0 5rem; /**/
            padding-bottom : 5rem;
        }
        
        /* 클래스 main안에 인라인 속성으로 */
        .main>div, .main>fieldset {
            display: inline-block;
        }
        /* main안에 step속성 */
        .stage {
            width : 18%;
            height : 98.7%;
            text-align: center;
            line-height: 75px;
            position : relative;
            font-size: 25px;
            /**/
            border-radius : 15px;
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
            border-bottom : 8px solid rgb(248, 245, 244); /**/
            top : 6%;
            height : 12%;
            width : 100%;
        }
        .STEP2 {
            position: absolute;
            border-bottom : 8px solid rgb(248, 245, 244); /**/
            top : 18%;
            height : 12%;
            width : 100%;
        }
        .STEP3 {
            position: absolute;
            border-bottom : 8px solid rgb(248, 245, 244); /**/
            top : 30%;
            height : 12%;
            width : 100%;
        }
        .STEP4 {
            position: absolute;
            top : 42%;
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
            background : white; /**/
            border-radius : 15px; /**/
            border : none; /**/
        }
        /* select속성에 selectMenu 속성 */
        .selectMenu {
            width : 100%;
            height : 100%;
            text-align: center;
            padding : 2rem;
        }
        
        /* step2 일 때 */
        /* selectMenu안에 날짜 선택 글씨 속성 */
        .day {
            width : 30%;
            height : 10%;
            text-align: center;
            margin: 0 auto;
            margin-top: 3%;
            font-size: 40px;
            font-weight: 700;
        }
        
        /* 날짜 버튼들 속성 */        
        #ck-button {
            margin : 4px;            
            overflow : auto;
            float : left;
            height : 100%;
            width : 90%;
            margin-left : 5%;
            margin-top : 5%;
            position: relative;
        }
        /* 각 버튼별로 label속성 */
        #ck-button label {
            float : left;
            width : 10%;
            height : 5%;
            margin-left : 3.5%;
            border-radius : 15px;
            margin-top : 2%;
        }
        /* 각버튼별 label에 span속성 (각버튼들 글씨속성) */
        #ck-button label span {
            text-align : center;
            padding : 3px 0px;
            display : block;
            border-radius : 15px;
            font-weight : 600;
            height : 100%;
            box-sizing : border-box;
            background-color : #a3c5ee;
            color : white;
        }
        /* 체크하는 거 없애는 속성 */
        #ck-button label input {
            position:absolute;
            top:-20px;
        }
        /* 글씨에 마우스 올라갔을 시 색깔 바뀌는 */
        /*
        #ck-button input:hover + span {
            background-color:white;
            color:#a3c5ee;
        }
        */
        /* 체크됐을 시 바뀌는 */
        #ck-button input:checked + span {
            background-color : #5995dd2b;
            color: #3b77bf;
            font-weight: bold;
        }
        /* 체크됐을 때 마우스 올릴 시 */
        /*
        #ck-button input:checked:hover + span {
            background-color :#a3c5ee;
            color:#fff;
        }
        */
        /* 내가 선택한 날짜를 보여주는 속성*/
        .checkDay {
            width : 40%;
            height : 10%;
            font-size: 20px;
            font-weight: 500;
            line-height: 70px;
            position: absolute;
            top : 25%;
            left : 30%;
        }
        #hidden {
        	display : none;
        }
        /* 날짜선택에 대한 설명 속성 */
        .subExplain {
            width: 50%;
            height : 10%;
            font-size: 25px;
            font-weight: 700;
            line-height: 70px;
            position: absolute;
            top : 41%;
            left : 25%;
        }
        /* 다음단계버튼에 대한 속성 */
        .nextstep2 {
            text-align: center;
            width : 11.5%;
            height : 5.5%;
            background-color: #5995dd;
            color: white;
            border : 0;
            border-radius: 15px;
            font-weight: 600;
            font-size: 15px;
            margin-top: 25%;
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
            <fieldset class="select">
                <legend><b>STEP2</b></legend>
                <div class="selectMenu">
                    <div class="day">
                        	날짜 선택
                    </div>
                    <form action="${pageContext.request.contextPath }/subscribe/subq.sb" style="height:70%; width:100%;" method="post">
                    <div id="ck-button">
                        <label>
                            <input type="radio" name="subDay" value="월요일" onclick="onlyDay(this);"><span>월요일</span> 
                        </label> 
                        <label>
                            <input type="radio" name="subDay" value="화요일" onclick="onlyDay(this);"><span>화요일</span> 
                        </label> 
                        <label>
                            <input type="radio" name="subDay" value="수요일" onclick="onlyDay(this);"><span>수요일</span>
                        </label> 
                        <label>
                            <input type="radio" name="subDay" value="목요일" onclick="onlyDay(this);"><span>목요일</span>
                        </label>
                        <label>
                            <input type="radio" name="subDay" value="금요일" onclick="onlyDay(this);"><span>금요일</span> 
                        </label> 
                        <label>
                            <input type="radio" name="subDay" value="토요일" onclick="onlyDay(this);"><span>토요일</span>
                        </label>
                        <label>
                            <input type="radio" name="subDay" value="일요일" onclick="onlyDay(this);"><span>일요일</span>
                        </label>
                        <div class="checkDay">선택한 날짜는 <span id="day1" value="subDay"  style="font-weight: bold; color:blue;"></span>입니다.</div>
                        <input type="hidden" name="subOption" value="${ subOption }">
                        <input type="hidden" name="price" value="${ price }">
                        <input type="button" value="다음 단계"class="nextstep2" onclick="sub();">
                        <button type="submit" id="hidden">123</button>
                        <div class="subExplain">모든 구독서비스는 주1회만 선택 가능</div>
                    </div>
                    </form>
                </div>
            </fieldset>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"></jsp:include>

    <script>
        $(function () {
            var step = $("legend").text();
            $("."+step).css("background-color" , '#5995dd').css("color", "white");
        });
        function onlyDay(chk) {
            var str = chk.value;
            document.getElementById("day1").innerText = str;
        }
        
		function sub() {
        	
        	var num = 0;
        	
           	$("input:radio[name=subDay]").each(function() {
   				
                   if($(this).is(":checked")) {
                   		$("#hidden").trigger("click");
                   		num = num + 1;
                   }
                   
            });
           	
           	if(num == 0) {
	           	alert("옵션을 선택해야 합니다");       		
           	}
            
        }
        
    </script>
</body>
</html>