<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            height : 70%;
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
            height : 97.3%;
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
            height : 18%;
            width : 100%;
        }
        .STEP2 {
            position: absolute;
            border-bottom : 8px solid rgb(248, 245, 244); /* CSS 작업 추가 */
            top : 20%;
            height : 18%;
            width : 100%;
        }
        .STEP3 {
            position: absolute;
            border-bottom : 8px solid rgb(248, 245, 244); /* CSS 작업 추가 */
            top : 38%;
            height : 18%;
            width : 100%;
        }
        .STEP4 {
            position: absolute;
            border-bottom : 8px solid rgb(248, 245, 244); /* CSS 작업 추가 */
            top : 55%;
            height : 18%;
            width : 100%;
        }
        .STEP5 {
            position: absolute;
            top : 73%;
            height : 18%;
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
            overflow: scroll; 
            overflow-x : hidden;
            padding : 2rem;
            position : relative;
        }

        /* step2일 때 */
        /* 선택사항에 대한 요소 속성 */
        .serviceMenu {
            display: inline-block;
            width : 37.5%;
            height : 13.2%;
            vertical-align: top;
            margin-right : 22px;
            position : absolute;
            top : 4%;
            left : 10%;
        }
        /* 선택한 사항들이 들어가는 div 속성 */
        #insert {
            overflow: auto; 
            overflow-x:hidden;
            width:100%;
            height:85%;
            border: 1px solid black;
        }


        /* 요구사항에 대한 요소 속성 */
        .requestMenu {
             display: inline-block;
            margin-left: 15%;
            width : 30%;
            height : 16%;
            position : absolute;
            top : 4%;
            left : 37.7%;
        }

        /* selectMenu안에 laundryType/laundryPrice속성 */
        /* 세탁 대분류 속성 */
        .laundryType {
            margin-left : 2%;
            margin-top: 2%;
            width : 40%;
            height : 15.5%;
            display: inline-block;
            vertical-align: top;
        }
        /* 생활빨래 상세정보 속성 */
        .laundryPrice1 {
            margin-left: 7%;
            margin-top: 2%;
            width : 40%;
            /*height : 12.5%;*/
            display: inline-block;
        }
        /* 침구류 상세정보 속성 */
        .laundryPrice2 {
            margin-left: 7%;
            margin-top: 2%;
            width : 40%;
            /*height : 22%;*/
            display: inline-block;
        }

        /* 신발 상세정보 속성 */
        .laundryPrice3 {
            margin-left: 7%;
            margin-top: 2%;
            width : 40%;
            /*height : 20%;*/
            display: inline-block;
        }

        /* 드라이 상세정보 속성 */
        .laundryPrice4 {
            margin-left: 7%;
            margin-top: 2%;
            width : 40%;
            /*height : 30%;*/
            display: inline-block;
        }


        /* laundryPrice안에 테이블 속성 */
        .priceTable {
            width : 100%;
            height : 100%;   
        }
        /* td에 수량쪽 input태그 */
        td>input[type=number] {
            width : 50%;
        }

        /* 각 상세사항에 대한 tr태그에 대한 속성 */
        /* 생활빨래에 마우스 올렸을 시 속성 */
        .washing tr:hover {
            cursor: pointer;
            /*background-color: #5995dd;
            color: white;*/
        }
        .detailWashing tr:hover {
            cursor: pointer;
        }

        /* 침구류에 마우스 올렸을 시 속성 */
        .bedding tr:hover {
            cursor: pointer;
            /*background-color: #5995dd;
            color: white;*/
        }
        .detailBedding tr:hover {
            cursor: pointer;
        }

        /* 신발에 마우스 올렸을 시 속성 */
        .shoes tr:hover {
            cursor: pointer;
            /*background-color: #5995dd;
            color: white;*/
        }
        .detailShoes tr:hover {
            cursor: pointer;
        }

        /* 드라이클리닝에 마우스 올렸을 시 속성 */
        .dry tr:hover {
            cursor: pointer;
            /*background-color: #5995dd;
            color: white;*/
        }
        .detailDry tr:hover {
            cursor: pointer;
        }





        /* 생활빨래 클릭시 바뀌는 속성*/
        .washingLaundry {
            /*animation : bgColor 0.5s both;*/
            background-color: #D8D8D8; 
            color: black;
        }
        /*@keyframes bgColor {
            from {background-color:#E6E6E6;}
            to {background-color: #5995dd; color:white;}
        }*/
        

        /* 생활빨래 옵션 클릭시 바뀌는 속성 */
        .clickWashing {
            animation : bgColor 0.5s both;
        }
        @keyframes bgColor {
            from {background-color:#E6E6E6;}
            to {background-color: #5995dd; color:white;}
        }

        /* 침구류 클릭시 바뀌는 속성*/
        .beddingLaundry {
            /*animation : bgColor 0.5s both;*/
            background-color: #D8D8D8; 
            color: black;
        }
        /*@keyframes bgColor {
            from {background-color:#E6E6E6;}
            to {background-color: #5995dd; color:white;}
        }*/
        
        /* 침구류 옵션 클릭시 바뀌는 속성 */
        .clickBedding {
            animation : bgColor 0.5s both;
        }
        @keyframes bgColor {
            from {background-color:#E6E6E6;}
            to {background-color: #5995dd; color:white;}
        }

        /* 신발 클릭시 바뀌는 속성*/
        .shoesLaundry {
            /*animation : bgColor 0.5s both;*/
            background-color: #D8D8D8; 
            color: black;
        }
        /*@keyframes bgColor {
            from {background-color:#E6E6E6;}
            to {background-color: #5995dd; color:white;}
        }*/
        
        /* 신발 옵션 클릭시 바뀌는 속성 */
        .clickShoes {
            animation : bgColor 0.5s both;
        }
        @keyframes bgColor {
            from {background-color:#E6E6E6;}
            to {background-color: #5995dd; color:white;}
        }

        /* 드라이 클릭시 바뀌는 속성*/
        .dryLaundry {
            /*animation : bgColor 0.5s both;*/
            background-color: #D8D8D8; 
            color: black;
        }
        /*@keyframes bgColor {
            from {background-color:#E6E6E6;}
            to {background-color: #5995dd; color:white;}
        }*/
        
        /* 드라이 옵션 클릭시 바뀌는 속성 */
        .clickDry {
            animation : bgColor 0.5s both;
        }
        @keyframes bgColor {
            from {background-color:#E6E6E6;}
            to {background-color: #5995dd; color:white;}
        }


        /* 선택된 수선속성들을 추가하는 버튼 속성(클래스는 같고 아이디값이 각자 다르다) */
        .insertButton {
            width : 20%;
            background-color: #5995dd;
            color : white;
            border-radius: 5px;
            border: 0;
        }
        .insertButton:hover {
            cursor: pointer;
        }

        /* 다음단계 버튼 속성 */
        .nextstep {
            margin-top: 1%;
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
        }
        
        .reset:hover {
            cursor: pointer;
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
                <legend><b>STEP2</b></legend>
                <div class="selectMenu" style="padding: 2rem;">
                	<form action="${pageContext.request.contextPath}/reserve/laundryDay.rs" style="height:16%;" method="post">
	                    <div class="serviceMenu">
	                        <div style="font-weight: 600; text-align:center">선택한 서비스</div>
	                        <div id="insert" style="text-align:left">
	                        	<span style="font-size: 14px; margin-left: 50px;">대분류</span>
	                            <span style="font-size: 14px; margin-left: 75px;">소분류</span>
	                            <span style="font-size: 14px; margin-left: 70px;">금액</span>
	                            <br>
	                        </div>
	                    </div>
	                    <div class="requestMenu" style="text-align;">
	                        <div style="font-weight: 600; text-align:center; margin-left : 80px;">요구사항</div>
	                        <textarea name="request" cols="47" rows="4" class="request" style="resize: none; margin-left:20px;" placeholder="선택한 사항에 대한 요구사항을 작성하세요"></textarea>
	                        <input type="hidden" value="${ resType }" name="resType">
	                        <button type="submit" style="display : none;" id="hiddenButton">123</button>
	                    </div>
                    </form>
                    <table class="laundryType" style="margin-bottom: 40px;">
                        <thead class="washing" style="border: 1px solid black; border-bottom: none;">
                        <tr id="washing" class="washingLaundry">
                            <th align="left">생활빨래</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td align="left" style="border: 1px solid black; border-bottom: none;padding: 1rem;">
                                용량 단위 물빨래 서비스로 봉투에 담아주신 그대로 물세탁하고 깔끔하게 개어 드리는 상품입니다. 
                            </td>
                        </tr>
                        <tr>
                            <td id="checkWashing" height="40" style="border: 1px solid black; border-top: none;">
                                <button type='submit' class='insertButton' id='insertWashing' onclick='insertWashing();'>추가</button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="laundryPrice1">
                        <table class="priceTable">
                            <thead>
                            <tr class="title">
                                <th width="100" height="30" align="left" style="border-top: 1px solid black; background : #D8D8D8;">품목</th>
                                <th width="100" align="right" style="border-top: 1px solid black; background: #D8D8D8;">기본요금(원)</th>
                            </tr>
                            </thead>
                            <tbody class="detailWashing">
                            <c:forEach var="s" items="${ list }">
                            	<c:if test="${ s.catNum < 200 }">
	                            	<tr>
		                                <td height="30" align="center" style="border-top: 1px solid black; border-bottom : 1px solid black;">${ s.scategory }</td>
		                                <td align="center" style="border-top: 1px solid black; border-bottom : 1px solid black;">
		                                	${ s.LPrice }
		                                	<input type="hidden" value="${ s.catNum }">
		                                </td>
	                            	</tr>
                            	</c:if>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <table class="laundryType">
                        <thead class="bedding" style="border: 1px solid black; border-bottom: none;">
                        <tr id="bedding" class="beddingLaundry">
                            <th align="left">침구류</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td align="left" style="border: 1px solid black; border-bottom: none;padding: 1rem;">
                                개별 품목의 권장된 케어라벨에 따라 세탁하고 오염제거를 위한 기본 케어도 함께 진행합니다.
                            </td>
                        </tr>
                        <tr>
                            <td id="checkBedding" height="40" style="border: 1px solid black; border-top: none;">
                                <button type='submit' class='insertButton' id='insertBedding' onclick='insertBedding();'>추가</button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="laundryPrice2">
                        <table class="priceTable">
                            <thead>
                            <tr class="title">
                                <th width="100" height="30" align="left" style="border-top: 1px solid black; background : #D8D8D8;">품목</th>
                                <th width="100" align="right" style="border-top: 1px solid black; background: #D8D8D8;">기본요금(원)</th>
                            </tr>
                            </thead>
                            <tbody class="detailBedding">
                            <c:forEach var="s" items="${ list }">
                            	<c:if test="${ s.catNum > 200 && s.catNum < 300 }">
	                            	<tr>
		                                <td height="30" align="center" style="border-top: 1px solid black; border-bottom : 1px solid black;">${ s.scategory }</td>
		                                <td align="center" style="border-top: 1px solid black; border-bottom : 1px solid black;">
		                                	${ s.LPrice }
		                                	<input type="hidden" value="${ s.catNum }">
		                                </td>
	                            	</tr>
                            	</c:if>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <table class="laundryType">
                        <thead class="shoes" style="border: 1px solid black; border-bottom: none;">
                        <tr id="shoes" class="shoesLaundry">
                            <th align="left">신발</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td align="left" style="border: 1px solid black;border-bottom: none;padding: 1rem;">
                                개별 품목의 권장된 케어라벨에 따라 세탁하고 오염제거를 위한 기본 케어도 함께 진행합니다.
                            </td>
                        </tr>
                        <tr>
                            <td id="checkShoes" height="40" style="border: 1px solid black; border-top: none;">
                                <button type='submit' class='insertButton' id='insertShoes' onclick='insertShoes();'>추가</button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="laundryPrice3">
                        <table class="priceTable">
                            <thead>
                            <tr class="title">
                                <th width="100" height="30" align="left" style="border-top: 1px solid black; background : #D8D8D8;">품목</th>
                                <th width="100" align="right" style="border-top: 1px solid black; background: #D8D8D8;">기본요금(원)</th>
                            </tr>
                            </thead>
                            <tbody class="detailShoes">
                            <c:forEach var="s" items="${ list }">
                            	<c:if test="${ s.catNum > 300 && s.catNum < 400 }">
	                            	<tr>
		                                <td height="30" align="center" style="border-top: 1px solid black; border-bottom : 1px solid black;">${ s.scategory }</td>
		                                <td align="center" style="border-top: 1px solid black; border-bottom : 1px solid black;">
		                                	${ s.LPrice }
		                                	<input type="hidden" value="${ s.catNum }">
		                                </td>
	                            	</tr>
                            	</c:if>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <table class="laundryType">
                        <thead class="dry" style="border: 1px solid black; border-bottom: none;">
                        <tr id="dry" class="dryLaundry">
                            <th align="left">드라이클리닝</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td align="left" style="border: 1px solid black; border-bottom: none;padding: 1rem;">
                                	개별 품목의 권장된 케어라벨에 따라 세탁하고 오염제거를 위한 기본 케어도 함께 진행합니다.
                            </td>
                        </tr>
                        <tr>
                            <td id="checkDry" height="40" style="border: 1px solid black; border-top: none;">
                                <button type='submit' class='insertButton' id='insertDry' onclick='insertDry();'>추가</button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="laundryPrice4">
                        <table class="priceTable">
                            <thead>
                            <tr class="title">
                                <th width="100" height="30" align="left" style="border-top: 1px solid black; background : #D8D8D8;">품목</th>
                                <th width="100" align="right" style="border-top: 1px solid black; background: #D8D8D8;">기본요금(원)</th>
                            </tr>
                            </thead>
                            <tbody class="detailDry">
                            <c:forEach var="s" items="${ list }">
                            	<c:if test="${ s.catNum > 400 && s.catNum < 500 }">
	                            	<tr>
		                                <td height="30" align="center" style="border-top: 1px solid black; border-bottom : 1px solid black;">${ s.scategory }</td>
		                                <td align="center" style="border-top: 1px solid black; border-bottom : 1px solid black;">
		                                	${ s.LPrice }
		                                	<input type="hidden" value="${ s.catNum }">
		                                </td>
	                            	</tr>
                            	</c:if>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <br>
                    <br>
                    <button type="submit" class="nextstep" onclick="nextstep();">다음 단계</button>
                </div>
            </fieldset>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"></jsp:include>
    
    <script>
        $(function () {
            var step = $("legend").text();
            $("."+step).css("background-color",'#5995dd').css("color", "white");

            	/* 생활빨래 클릭시 이벤트 */
                $(".detailWashing tr").click(function() {
                     $(this).toggleClass("clickWashing");
                });
                
            	/* 침구류 클릭시 이벤트 */
                $(".detailBedding tr").click(function() {
                        $(this).toggleClass("clickBedding");
                });

            	/* 신발 클릭시 이벤트 */
                $(".detailShoes tr").click(function() {
                        $(this).toggleClass("clickShoes");
                });

            	/* 드라이 클릭시 이벤트 */                
                $(".detailDry tr").click(function() {
                        $(this).toggleClass("clickDry");
                });
        });
		
        var num = 0;
        
         /* 생활빨래 상세에서 추가 버튼 클릭시 이벤트 */
         function insertWashing() {
            var washing = document.getElementById("washing").innerText;
            
            var repair1 = document.getElementsByClassName("clickWashing");
            if(repair1.length != 0) {

                var repair= "";
                for(var i=0; i<repair1.length; i++) {                    
                	repair += repair1[i].innerText+"\t"+repair1[i].children[1].children[0].value+"/";      
                }
                var str = repair.split('/');

                for(var j=0; j<(str.length-1); j++) {
                    var str2 = str[j].split('\t');
                    document.getElementById('insert').innerHTML += "<div id='reset"+num+"' style='border: 1px solid black; background: lightblue; text-align: center;'>" 
                    													+"<input type='hidden' value="+str2[2]+" name='multiList["+num+"].catNum'>"
                    													+"<input type='text' value="+washing+" style='width:27%; border: 0; border-right: 2px solid black; background: transparent;font-size : 12px; text-align : center;' readonly name='multiList["+num+"].mcategory'>"
                                                                        +"<input type='text' value="+str2[0]+" style='width:33%; background: transparent;border: 0;border-right: 2px solid black; font-size : 12px; text-align : center;' readonly name='multiList["+num+"].scategory'>"
                                                                        +"<input type='text' value="+str2[1]+" style='width:17%; background: transparent;border: 0; text-align : center; font-size : 12px;' readonly name='multiList["+num+"].lPrice'>"
                                                                        +"<span onclick='reset(this);' style='font-size:13px; margin-left:5%; border:1px solid black;' id='"+num+"' class='reset btn btn-primary btn-sm'>취소</span> </div>";
					num = num + 1;                                                                        
                }
            
                for(var t=0; t<3; t++) {
                    for(var z=0; z<repair1.length ;z++) {
                        repair1[z].classList.remove("clickWashing");
                    }
                }
            }
            else {
                alert("옵션을 선택해야 합니다");
            }

        }

         /* 침구류 상세에서 추가 버튼 클릭시 이벤트 */
         function insertBedding() {
            var bedding = document.getElementById("bedding").innerText;
            
            var repair1 = document.getElementsByClassName("clickBedding");
            if(repair1.length != 0) {

                var repair= "";
                for(var i=0; i<repair1.length; i++) {                    
                    repair += repair1[i].innerText+"\t"+repair1[i].children[1].children[0].value+"/";      
                }
                var str = repair.split('/');

                for(var j=0; j<(str.length-1); j++) {
                    var str2 = str[j].split('\t');
                    document.getElementById('insert').innerHTML += "<div id='reset"+num+"' style='border: 1px solid black; background: lightblue; text-align: center;'> <input type='hidden' value="+str2[2]+" name='multiList["+num+"].catNum'>" 
																		+"<input type='text' value="+bedding+" style='width:27%; border: 0; border-right: 2px solid black; background: transparent; font-size : 12px; text-align : center;' readonly name='multiList["+num+"].mcategory'>"
                                                                        +"<input type='text' value="+str2[0]+" style='width:33%; background: transparent;border: 0;border-right: 2px solid black; font-size : 12px; text-align : center;' readonly name='multiList["+num+"].scategory'>"
                                                                        +"<input type='text' value="+str2[1]+" style='width:17%; background: transparent;border: 0; text-align : center; font-size : 12px;' readonly name='multiList["+num+"].lPrice'>"
                                                                        +"<span onclick='reset(this);' style='font-size:13px; margin-left:3%; border:1px solid black;' id='"+num+"' class='reset btn btn-primary btn-sm'>취소</span> </div>";
					num = num + 1;
                }
            
                for(var t=0; t<3; t++) {
                    for(var z=0; z<repair1.length ;z++) {
                        repair1[z].classList.remove("clickBedding");
                    }
                }
            }
            else {
                alert("옵션을 선택해야 합니다");
            }

        }

        /* 신발 상세에서 추가 버튼 클릭시 이벤트 */
        function insertShoes() {
            var shoes = document.getElementById("shoes").innerText;
            
            var repair1 = document.getElementsByClassName("clickShoes");
            if(repair1.length != 0) {
                var repair= "";
                for(var i=0; i<repair1.length; i++) {                    
                    repair += repair1[i].innerText+"\t"+repair1[i].children[1].children[0].value+"/";   
                }
                var str = repair.split('/');

                for(var j=0; j<(str.length-1); j++) {
                    var str2 = str[j].split('\t');
                    document.getElementById('insert').innerHTML += "<div id='reset"+num+"' style='border: 1px solid black; background: lightblue; text-align: center;'> <input type='hidden' value="+str2[2]+" name='multiList["+num+"].catNum'>"
                    													+"<input type='text' value="+shoes+" style='width:27%; border: 0; border-right: 2px solid black; background: transparent; font-size : 12px; text-align : center; padding-right : 5px;' readonly name='multiList["+num+"].mcategory'>"
                                                                        +"<input type='text' value="+str2[0]+" style='width:33%; background: transparent;border: 0;border-right: 2px solid black; font-size : 12px; text-align : center;' readonly name='multiList["+num+"].scategory'>"
                                                                        +"<input type='text' value="+str2[1]+" style='width:17%;margin-left:1%; background: transparent;border: 0; text-align : center; font-size : 12px;' readonly name='multiList["+num+"].lPrice'>"
                                                                        +"<span onclick='reset(this);' style='font-size:13px; margin-left:3%; border:1px solid black; ' id='"+num+"' class='reset btn btn-primary btn-sm'>취소</span> </div>";
                    num = num + 1;
                }

                for(var t=0; t<3; t++) {
                    for(var z=0; z<repair1.length ;z++) {
                        repair1[z].classList.remove("clickShoes");
                    }
                }
            }
            else {
                alert("옵션을 선택해야 합니다");
            }
            

        }

        /* 드라이클리닝 상세에서 추가 버튼 클릭시 이벤트 */
        function insertDry() {
            var dry = document.getElementById("dry").innerText;
            
            var repair1 = document.getElementsByClassName("clickDry");
            if(repair1.length != 0) {
                var repair= "";
                for(var i=0; i<repair1.length; i++) {                    
                    repair += repair1[i].innerText+"\t"+repair1[i].children[1].children[0].value+"/";      
                }
                var str = repair.split('/');

                for(var j=0; j<(str.length-1); j++) {
                    var str2 = str[j].split('\t');
                    document.getElementById('insert').innerHTML += "<div id='reset"+num+"' style='border: 1px solid black; background: lightblue; text-align: center;'> <input type='hidden' value="+str2[2]+" name='multiList["+num+"].catNum'>"
                    													+"<input type='text' value="+dry+" style='width:27%; border: 0; border-right: 2px solid black; background: transparent; font-size : 12px; text-align : center; padding-right:5px;' readonly name='multiList["+num+"].mcategory'>"
                                                                        +"<input type='text' value="+str2[0]+" style='width:33%; background: transparent;border: 0;border-right: 2px solid black; font-size : 12px; text-align : center;' readonly name='multiList["+num+"].scategory'>"
                                                                        +"<input type='text' value="+str2[1]+" style='width:17%;margin-left:1%; background: transparent;border: 0; text-align : center; font-size : 12px;' readonly name='multiList["+num+"].lPrice'>"
                                                                        +"<span onclick='reset(this);' style='font-size:13px; margin-left:3%; border:1px solid black; ' id='"+num+"' class='reset btn btn-primary btn-sm'>취소</span> </div>";
                    num = num + 1;                                  
                }
            
                for(var t=0; t<3; t++) {
                    for(var z=0; z<repair1.length ;z++) {
                        repair1[z].classList.remove("clickDry");
                    }
                }
            }
            else {
                alert("옵션을 선택해야 합니다");
            }

        }
    
        /* 서비스 선택사항에서 추가된 사항에서 취소 시키는 버튼을 클릭시  이벤트 */
        /* 중간에 취소하거나 해도 정상으로 name값이랑 div(id값) 들어가도록 */
        function reset(idValue) {
            var no = (Number)(idValue.id); // 버튼아이디에 그 해당하는 num을 넣어놨다
            document.getElementById("reset"+no+"").remove();

            for(var i=no; i<num-1; i++) {
                document.getElementById("insert").children[i+4].id = "reset"+i;
                document.getElementById("insert").children[i+4].children[0].name = "multiList["+i+"].catNum";
                document.getElementById("insert").children[i+4].children[1].name = "multiList["+i+"].mcategory";
                document.getElementById("insert").children[i+4].children[2].name = "multiList["+i+"].scategory";
                document.getElementById("insert").children[i+4].children[3].name = "multiList["+i+"].lPrice";
                document.getElementById("insert").children[i+4].children[4].id = no;
            }
            num = num - 1;
        }
         
        /* 다음단계버튼 눌렀을때 step3로 넘어가도록 hiddenButton 클릭되도록 */
        function nextstep() {
        	var button = document.getElementById("hiddenButton");
        	button.click();
        }
    </script>
</body>
</html>