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
            height : 98.3%; /**/
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
            top : 6%;
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
            padding : 2rem;
        }



        /* 여기서 부터 바뀌는 내용*/
        /* step1일 때 */
        /* selectMenu안에 laundry/repair에 속성 */
        .laundry, .repair {
            display: inline-block;
            width : 38%;
            height: 30%;
            margin-left: 80px;
            margin-top: 10%;
            border: 1px solid black;
            background : rgb(248, 245, 244);
        }

        /* laundry/repair 각 이미지 속성 */
        .laundry>img, .repair>img {
            margin-left: 25%;
            margin-top: 10%;
            width : 50%;
            height: 50%;
            
        }

        /* laundry/repair 이미지 밑에 수선/세탁 신청 글씨 */
        .requestWashing, .requestRepair {
            height : 35%;
            text-align: center;
            font-weight: 700;
            line-height: 125px;
            font-size: 30px;
            /*border-top: 1px solid black;*/
        }

        div[class^=request]:hover, .laundry:hover, .repair:hover {
            cursor: pointer;
            background-color: #D8D8D8;
           
        }
        /* -------------여기까지 --------*/



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
                <legend><b>STEP1</b></legend>
                <div class="selectMenu" style="padding: 2rem;">
                    <div class="laundry" onclick="laundryStep2();">
                        <img src="/laundry/resources/image/laundry-icon.png">
                        <div class="requestWashing">세탁 신청</div>
                        <input type="hidden" name="laundry" value="세탁" id="laundry">
                    </div>
                    <div class="repair" onclick="repairStep2();">
                        <img src="/laundry/resources/image/repair-icon2.png">
                        <div class="requestRepair">수선 신청</div>
                        <input type="hidden" name="repair" value="수선" id="repair">
                    </div>
                </div>
            </fieldset>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"></jsp:include>

    <script>
        /* 각 스텝별로 페이지에 사이드에 선택되도록 */
        $(function () {
            var step = $("legend").text();
            
            $("."+step).css("background-color" , '#5995dd').css("color", "white");
            
        });

        /* 빨래 step2로 이동*/
        function laundryStep2() {
            var laundry = document.getElementById("laundry").value;
            location.href= "${pageContext.request.contextPath}/reserve/detail.rs?resType="+laundry;
        }

        function repairStep2() {
            var repair = document.getElementById("repair").value;
            location.href="${pageContext.request.contextPath}/reserve/detail.rs?resType="+repair;
        }

    </script>
</body>
</html>