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
            top : 6%;
            height : 16%;
            width : 100%;
        }
        .STEP2 {
            position: absolute;
            border-bottom : 8px solid rgb(248, 245, 244); /* CSS 작업 추가 */
            top : 21%;
            height : 16%;
            width : 100%;
        }
        .STEP3 {
            position: absolute;
            border-bottom : 8px solid rgb(248, 245, 244); /* CSS 작업 추가 */
            top : 36%;
            height : 16%;
            width : 100%;
        }
        .STEP4 {
            position: absolute;
            border-bottom : 8px solid rgb(248, 245, 244); /* CSS 작업 추가 */
            top : 51%;
            height : 16%;
            width : 100%;
        }
        .STEP5 {
            position: absolute;
            border-bottom : 8px solid rgb(248, 245, 244); /* CSS 작업 추가 */
            top : 66%;
            height : 16%;
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
            top : 40px;
            left : 95px;
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
            top : 40px;
            left : 415px;
        }

        /* selectMenu안에 laundryType/laundryPrice속성 */
        /* 세탁 대분류 속성 */
        .laundryType {
            margin-top: 2%;
            width : 40%;
            height : 12.5%;
            display: inline-block;
            vertical-align: top;
        }
        /* 생활빨래 상세정보 속성 */
        .laundryPrice1 {
            margin-left: 7%;
            margin-top: 2%;
            width : 40%;
            height : 20%;
            display: inline-block;
        }
        /* 침구류 상세정보 속성 */
        .laundryPrice2 {
            margin-left: 7%;
            margin-top: 2%;
            width : 40%;
            height : 20%;
            display: inline-block;
        }

        /* 신발 상세정보 속성 */
        .laundryPrice3 {
            margin-left: 7%;
            margin-top: 2%;
            width : 40%;
            height : 20%;
            display: inline-block;
        }

        /* laundryPrice안에 테이블 속성 */
        .priceTable {
            width : 100%;
            height : 100%;   
        }

        /* 각 상세사항에 대한 tr태그에 대한 속성 */
        .pants tr:hover {
            cursor: pointer;
            /*background-color: #5995dd;
            color: white;*/
        }
        .detailPants tr:hover {
            cursor: pointer;
            /*
            background-color: #5995dd;
            color: white;
            */
        }

        .shirts tr:hover {
            cursor: pointer;
            /*background-color: #5995dd;
            color: white;*/
        }
        .detailShirts tr:hover {
            cursor: pointer;
        }

        .jacket tr:hover {
            cursor: pointer;
            /*background-color: #5995dd;
            color: white;*/
        }
        .detailJacket tr:hover {
            cursor: pointer;
        }
        

        /* td에 수량쪽 input태그 */
        td>input[type=number] {
            width : 50%;
        }

        /* 바지 옵션 클릭시 바뀌는 속성 */
        .clickPants {
            animation : bgColor 0.5s both;
        }
        @keyframes bgColor {
            from {background-color:#E6E6E6;}
            to {background-color: #5995dd; color:white;}
        }

        /* 바지 클릭시 바뀌는 속성*/
        .pantsRepair {
            /*animation : bgColor 0.5s both;*/
            background-color: #D8D8D8;
            color: black;
        }
        /*@keyframes bgColor {
            from {background-color:#E6E6E6;}
            to {background-color: #5995dd; color:white;}
        }*/

        
        /* 셔츠 옵션 클릭시 바뀌는 속성 */
        .clickShirts {
            animation : bgColor 0.5s both;
        }
        @keyframes bgColor {
            from {background-color:#E6E6E6;}
            to {background-color: #5995dd; color:white;}
        }
        /* 셔츠 클릭시 바뀌는 속성*/
        .shirtsRepair {
            /*animation : bgColor 0.5s both;*/
            background : #D8D8D8;
            color : black;
        }
        /*@keyframes bgColor {
            from {background-color:#E6E6E6;}
            to {background-color: #5995dd; color:white;}
        }*/

         /* 자켓 옵션 클릭시 바뀌는 속성 */
        .clickJacket {
            animation : bgColor 0.5s both;
        }
        @keyframes bgColor {
            from {background-color:#E6E6E6;}
            to {background-color: #5995dd; color:white;}
        }
        /* 자켓 클릭시 바뀌는 속성*/
        .jacketRepair {
            /*animation : bgColor 0.5s both;*/
            background : #D8D8D8;
            color : black;
        }
        /*@keyframes bgColor {
            from {background-color:#E6E6E6;}
            to {background-color: #5995dd; color:white;}
        }*/
        
        
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
                	<form action="${pageContext.request.contextPath}/reserve/repairDay.rs" style="height:16%;" method="post">
	                    <div class="serviceMenu">
	                        <div style="font-weight: 600; text-align:center">선택한 서비스</div>
	                        <div id="insert" style="text-align:left"> 
	                            <span style="font-size: 14px; margin-left:10px;">수선종류</span>
	                            <span style="font-size: 14px;">기장수선</span>
	                            <span style="font-size: 14px;">통수선</span>
	                            <span style="font-size: 14px;">재박음질</span>
	                            <span style="font-size: 14px;">지퍼/단추수선</span>
	                            <span style="font-size: 14px;">금액</span>
	                            <br>
	                        </div>
	                    </div>
	                    <div class="requestMenu">
	                        <div style="font-weight: 600; text-align:center; margin-left : 40px;">요구사항</div>
	                        <textarea name="request" cols="47" rows="4" class="request" style="resize: none;" placeholder="선택한 사항에 대한 요구사항을 작성하세요"></textarea>
	                        <input type="hidden" value="${ resType }" name="resType">
	                        <button type="submit" style="display : none;" id="hiddenButton">123</button>
	                    </div>
                    </form>
                    <table class="laundryType" >
                        <thead class="pants" style="border: 1px solid black; border-bottom: none;">
                        <tr id="pants" class="pantsRepair">
                            <th align="left">바지</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td align="left" style="border: 1px solid black;border-bottom: none;padding: 1rem;">
				                                바지 기장,통은 원하시는 수선사이즈를 요청사항에 작성해주세요.
				                                단추 및 지퍼는 비슷한 상품으로 교체합니다.
                            </td>
                        </tr>
                        <tr>
                            <td id="checkPants" height="40" style="border: 1px solid black; border-top: none;">
                                <button type='submit' class='insertButton' id='insertPants' onclick='insertPants();'>추가</button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="laundryPrice1">
                        <table class="priceTable">
                            <thead>
                            <tr class="title">
                                <th width="100" height="30" align="left" style="border-top: 1px solid black; background : #D8D8D8;">품목</th>
                                <th width="100" align="right" style="border-top: 1px solid black; background : #D8D8D8;">기본요금(원)</th>
                            </tr>
                            </thead>
                            <tbody class="detailPants">
                            <tr>
                                <td height="30" align="center" style="border-top: 1px solid black; border-bottom : 1px solid black;">기장수선</td>
                                <td align="center" style="border-top: 1px solid black; border-bottom : 1px solid black;">3000</td>
                            </tr>
                            <tr>
                                <td height="30" align="center" style="border-top: 1px solid black; border-bottom : 1px solid black;">통수선</td>
                                <td align="center" style="border-top: 1px solid black; border-bottom : 1px solid black;">5000</td>
                            </tr>
                            <tr>
                                <td height="30" align="center" style="border-top: 1px solid black; border-bottom : 1px solid black;">재박음질</td>
                                <td align="center" style="border-top: 1px solid black; border-bottom : 1px solid black;">5000</td>
                            </tr>
                            <tr>
                                <td height="30" align="center" style="border-top: 1px solid black; border-bottom : 1px solid black;">지퍼/단추수선</td>
                                <td align="center" style="border-top: 1px solid black; border-bottom : 1px solid black;">5000</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <table class="laundryType">
                        <thead class="shirts" style="border: 1px solid black; border-bottom: none;">
                        <tr id="shirts" class="shirtsRepair">
                            <th align="left">셔츠</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td align="left" style="border: 1px solid black;border-bottom: none;padding: 1rem;">
                                바지 기장,통은 원하시는 수선사이즈를 요청사항에 작성해주세요.
                                단추 및 지퍼는 비슷한 상품으로 교체합니다.
                            </td>
                        </tr>
                        <tr>
                            <td id="checkShirts" height="40" style="border: 1px solid black; border-top: none;">
                                <button type='submit' class='insertButton' id='insertShirts' onclick='insertShirts();'>추가</button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="laundryPrice2">
                        <table class="priceTable">
                            <thead>
                            <tr class="title">
                                <th width="100" height="30" align="left" style="border-top: 1px solid black; background : #D8D8D8;">품목</th>
                                <th width="100" align="right" style="border-top: 1px solid black; background : #D8D8D8;">기본요금(원)</th>
                            </tr>
                            </thead>
                            <tbody class="detailShirts">
                            <tr>
                                <td height="30" align="center" style="border-top: 1px solid black; border-bottom : 1px solid black;">기장수선</td>
                                <td align="center" style="border-top: 1px solid black; border-bottom : 1px solid black;">3000</td>
                            </tr> 
                            <tr>
                                <td height="30" align="center" style="border-top: 1px solid black; border-bottom : 1px solid black;">통수선</td>
                                <td align="center" style="border-top: 1px solid black; border-bottom : 1px solid black;">5000</td>
                            </tr>
                            <tr>
                                <td height="30" align="center" style="border-top: 1px solid black; border-bottom : 1px solid black;">재박음질</td>
                                <td align="center" style="border-top: 1px solid black; border-bottom : 1px solid black;">5000</td>
                            </tr>
                            <tr>
                                <td height="30" align="center" style="border-top: 1px solid black; border-bottom : 1px solid black;">지퍼/단추수선</td>
                                <td align="center" style="border-top: 1px solid black; border-bottom : 1px solid black;">5000</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <table class="laundryType">
                        <thead class="jacket" style="border: 1px solid black; border-bottom: none;">
                        <tr id="jacket" class="jacketRepair">
                            <th align="left">자켓</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td align="left" style="border: 1px solid black;border-bottom: none;padding: 1rem;">
                                자켓 기장,통은 원하시는 수선사이즈를 요청사항에 작성해주세요.
                                단추 및 지퍼는 비슷한 상품으로 교체합니다.
                            </td>
                        </tr>
                        <tr>
                            <td id="checkJacket" height="40" style="border: 1px solid black; border-top: none;">
                                <button type='submit' class='insertButton' id='insertJacket' onclick='insertJacket();'>추가</button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="laundryPrice3">
                        <table class="priceTable">
                            <thead>
                            <tr class="title">
                                <th width="100" height="30" align="left" style="border-top: 1px solid black; background : #D8D8D8;">품목</th>
                                <th width="100" align="right" style="border-top: 1px solid black; background : #D8D8D8;">기본요금(원)</th>
                            </tr>
                            </thead>
                            <tbody class="detailJacket">
                            <tr>
                                <td height="30" align="center" style="border-top: 1px solid black; border-bottom : 1px solid black;">기장수선</td>
                                <td align="center" style="border-top: 1px solid black; border-bottom : 1px solid black;">3000</td>
                            </tr> 
                            <tr>
                                <td height="30" align="center" style="border-top: 1px solid black; border-bottom : 1px solid black;">통수선</td>
                                <td align="center" style="border-top: 1px solid black; border-bottom : 1px solid black;">5000</td>
                            </tr>
                            <tr>
                                <td height="30" align="center" style="border-top: 1px solid black; border-bottom : 1px solid black;">재박음질</td>
                                <td align="center" style="border-top: 1px solid black; border-bottom : 1px solid black;">5000</td>
                            </tr>
                            <tr>
                                <td height="30" align="center" style="border-top: 1px solid black; border-bottom : 1px solid black;">지퍼/단추수선</td>
                                <td align="center" style="border-top: 1px solid black; border-bottom : 1px solid black;">5000</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <br><br>
                    <button type="submit" class="nextstep" onclick="nextstep();">다음 단계</button>
                </div>
            </fieldset>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"></jsp:include>


    <script>
        $(function () {
            var step = $("legend").text();
            $("."+step).css("background-color" ,'#5995dd').css("color", "white");
            
            
            /* 바지 클릭시 이벤트 */
            //$("#pants").click(function() {
                /*
                $(this).css("background", "#5995dd");
                $(this).css("color", "white");
                */
                //$(this).toggleClass("pantsRepair");
                
                $(".detailPants tr").click(function() {
                    //$(this).css("background", "#5995dd");
                    //$(this).css("color", "white");
                    //if($("#pants").hasClass("pantsRepair")) {
                        $(this).toggleClass("clickPants");
                    //}
                });

                //console.log($("#pants").hasClass("pantsRepair"));

                /*if($("#pants").hasClass("pantsRepair")) {
                    $("#checkPants").html("<button type='submit' class='insertButton' id='insertPants' onclick='insertPants();'>추가</button>");
                }
                else {
                    $("#checkPants").empty();
                }*/
            //});

            /* 셔츠 클릭시 이벤트 */
            //$("#shirts").click(function() {
                /*
                $(this).css("background", "#5995dd");
                $(this).css("color", "white");
                */
                //$(this).toggleClass("shirtsRepair");
                
                $(".detailShirts tr").click(function() {
                    
                    //$(this).css("background", "#5995dd");
                    //$(this).css("color", "white");
                	//if($("#shirts").hasClass("shirtsRepair")){
                        $(this).toggleClass("clickShirts");
                    //} 
                });

                //console.log($("#shirts").hasClass("shirtsRepair"));

                /*if($("#shirts").hasClass("shirtsRepair")) {
                    $("#checkShirts").html("<button type='submit' class='insertButton' id='insertShirts' onclick='insertShirts();'>추가</button>");
                }
                else {
                    $("#checkShirts").empty();
                }*/
            //});

            /* 자켓 클릭시 이벤트 */
            //$("#jacket").click(function() {
                /*
                $(this).css("background", "#5995dd");
                $(this).css("color", "white");
                */
                //$(this).toggleClass("jacketRepair");
                
                $(".detailJacket tr").click(function() {
                    //$(this).css("background", "#5995dd");
                    //$(this).css("color", "white");
                    //if($("#jacket").hasClass("jacketRepair")) {
                        $(this).toggleClass("clickJacket");
                    //}
                });

                //console.log($("#jacket").hasClass("jacketRepair"));

                /*if($("#jacket").hasClass("jacketRepair")) {
                    $("#checkJacket").html("<button type='submit' class='insertButton' id='insertJacket' onclick='insertJacket();'>추가</button>");
                }
                else {
                    $("#checkJacket").empty();
                }*/
            //});


        });
        
        var num = 0;

        /* 바지에서 추가 버튼 클릭시 이벤트 */
        function insertPants() {
            var pants = document.getElementById("pants").innerText;
            //console.log(pants);
            
            var repair1 = document.getElementsByClassName("clickPants");
            if(repair1.length != 0) {
                //console.log("repair1 : "+repair1);

                var repair= "";
                for(var i=0; i<repair1.length; i++) {
                    repair += repair1[i].innerText+",";
                }
                //console.log("repair : "+repair);
                var str="";
                str += repair.split(',');
                //console.log("str : "+str);
                
                var str2="";
                str2 += str.split('\t');
                
                //console.log(typeof str2);
                //console.log("str2 : "+str2);

                var str3 = str2.split(',');

                //console.log(typeof str3);
                //console.log("str3 : "+str3);

                var length = "N";
                var width = "N";
                var reseal = "N";
                var zip = "N";
                var price = 0;

                for(var j=0; j<(str3.length-1); j++) {
                    if(j % 2 == 0) {
                        if(str3[j] == "기장수선") {
                            length = "Y";
                        }
                        else if(str3[j] == "통수선") {
                            width = "Y";
                        }
                        else if(str3[j] == "재박음질") {
                            reseal = "Y";
                        }
                        else {
                            zip = "Y";
                        }
                    }
                    else {
                        price += Number(str3[j]);
                    }
                }
                document.getElementById('insert').innerHTML += "<div id='reset"+num+"'' style='border: 1px solid black; background: lightblue;'> <input type='text' value="+pants+" style='width:17%; border: 0; border-right: 2px solid black; background: lightblue; font-size : 12px; text-align : center;' readonly name='multiList["+num+"].rcategory'>"
                                                                        +"<input type='text' value="+length+" style='width:12%; background: transparent; border: 0; font-size : 12px; text-align : center;' readonly name='multiList["+num+"].lengthYN'>"
                                                                        +"<input type='text' value="+width+" style='width:12%; background: transparent; border: 0; font-size : 12px; text-align : center;' readonly name='multiList["+num+"].widthYN'>"
                                                                        +"<input type='text' value="+reseal+" style='width:12%; background: transparent; border: 0; font-size : 12px; text-align : center;' readonly name='multiList["+num+"].resealYN'>"
                                                                        +"<input type='text' value="+zip+" style='width:18%; background: transparent; border: 0; border-right: 2px solid black; font-size : 12px; text-align : center;' readonly  name='multiList["+num+"].zipYN'>"
                                                                        +"<input type='text' value="+price+" style='width: 15%; background: transparent; border: 0; text-align : center; font-size : 12px;' readonly  name='multiList["+num+"].rPrice'>"
                                                                        +"<span onclick='reset(this);' style='font-size:13px; margin-left:1%; border:1px solid black; ' id='"+num+"' class='reset btn btn-primary btn-sm'>취소</span> </div>";
            	num = num + 1;
                

                for(var t=0; t<3; t++) {
                    for(var z=0; z<repair1.length ;z++) {
                        repair1[z].classList.remove("clickPants");
                    }
                }
                
            }
            else {
                alert("옵션을 선택해야 합니다");
            }
            
            //document.getElementById("pants").classList.toggle('pantsRepair');
            //document.getElementById("insertPants").remove();
        }

        /* 셔츠에서 추가 버튼 클릭시 이벤트 */
        function insertShirts() {
            var shirts = document.getElementById("shirts").innerText;
            //console.log(shirts);
            
            var repair1 = document.getElementsByClassName("clickShirts");
            if(repair1.length != 0) {
                //console.log("repair1 : "+repair1);

                var repair= "";
                for(var i=0; i<repair1.length; i++) {
                    repair += repair1[i].innerText+",";
                }
                //console.log("repair : "+repair);
                var str="";
                str += repair.split(',');
                //console.log("str : "+str);
                
                var str2="";
                str2 += str.split('\t');
                
                //console.log(typeof str2);
                //console.log("str2 : "+str2);

                var str3 = str2.split(',');

                //console.log(typeof str3);
                //console.log("str3 : "+str3);

                var length = "N";
                var width = "N";
                var reseal = "N";
                var zip = "N";
                var price = 0;

                for(var j=0; j<(str3.length-1); j++) {
                    if(j % 2 == 0) {
                        if(str3[j] == "기장수선") {
                            length = "Y";
                        }
                        else if(str3[j] == "통수선") {
                            width = "Y";
                        }
                        else if(str3[j] == "재박음질") {
                            reseal = "Y";
                        }
                        else {
                            zip = "Y";
                        }
                    }
                    else {
                        price += Number(str3[j]);
                    }
                }
                document.getElementById('insert').innerHTML += "<div id='reset"+num+"' style='border: 1px solid black; background: lightblue;'> <input type='text' value="+shirts+" style='width:17%; border: 0; border-right: 2px solid black; background: lightblue; font-size : 12px; text-align : center;' readonly name='multiList["+num+"].rcategory'>"
													                +"<input type='text' value="+length+" style='width:12%; background: transparent; border: 0; font-size : 12px; text-align : center;' readonly name='multiList["+num+"].lengthYN'>"
													                +"<input type='text' value="+width+" style='width:12%; background: transparent; border: 0; font-size : 12px; text-align : center;' readonly name='multiList["+num+"].widthYN'>"
													                +"<input type='text' value="+reseal+" style='width:12%; background: transparent; border: 0; font-size : 12px; text-align : center;' readonly name='multiList["+num+"].resealYN'>"
													                +"<input type='text' value="+zip+" style='width:18%; background: transparent; border: 0; border-right: 2px solid black; font-size : 12px; text-align : center;' readonly  name='multiList["+num+"].zipYN'>"
													                +"<input type='text' value="+price+" style='width: 15%; background: transparent; border: 0; text-align : center; font-size : 12px;' readonly  name='multiList["+num+"].rPrice'>"
													                +"<span onclick='reset(this);' style='font-size:13px; margin-left:1%; border:1px solid black; ' id='"+num+"' class='reset btn btn-primary btn-sm'>취소</span> </div>";
				num = num + 1;
                

                for(var t=0; t<3; t++) {
                    for(var z=0; z<repair1.length ;z++) {
                        repair1[z].classList.remove("clickShirts");
                    }
                }
                
            }
            else {
                alert("옵션을 선택해야 합니다");
            }
            
            //document.getElementById("shirts").classList.toggle('shirtsRepair');
            //document.getElementById("insertShirts").remove();
        }
        
        /* 자켓에서 추가 버튼 클릭시 이벤트 */
        function insertJacket() {
            var jacket = document.getElementById("jacket").innerText;
            //console.log(jacket);
            
            var repair1 = document.getElementsByClassName("clickJacket");
            if(repair1.length != 0) {
                //console.log("repair1 : "+repair1);

                var repair= "";
                for(var i=0; i<repair1.length; i++) {
                    repair += repair1[i].innerText+",";
                }
                //console.log("repair : "+repair);
                var str="";
                str += repair.split(',');
                //console.log("str : "+str);
                
                var str2="";
                str2 += str.split('\t');
                
                //console.log(typeof str2);
                //console.log("str2 : "+str2);

                var str3 = str2.split(',');

                //console.log(typeof str3);
                //console.log("str3 : "+str3);

                var length = "N";
                var width = "N";
                var reseal = "N";
                var zip = "N";
                var price = 0;

                for(var j=0; j<(str3.length-1); j++) {
                    if(j % 2 == 0) {
                        if(str3[j] == "기장수선") {
                            length = "Y";
                        }
                        else if(str3[j] == "통수선") {
                            width = "Y";
                        }
                        else if(str3[j] == "재박음질") {
                            reseal = "Y";
                        }
                        else {
                            zip = "Y";
                        }
                    }
                    else {
                        price += Number(str3[j]);
                    }
                }
                document.getElementById('insert').innerHTML += "<div id='reset"+num+"' style='border: 1px solid black; background: lightblue;'> <input type='text' value="+jacket+" style='width:17%; border: 0; border-right: 2px solid black; background: lightblue; font-size : 12px; text-align : center;' readonly name='multiList["+num+"].rcategory'>"
														                +"<input type='text' value="+length+" style='width:12%; background: transparent; border: 0; font-size : 12px; text-align : center;' readonly name='multiList["+num+"].lengthYN'>"
														                +"<input type='text' value="+width+" style='width:12%; background: transparent; border: 0; font-size : 12px; text-align : center;' readonly name='multiList["+num+"].widthYN'>"
														                +"<input type='text' value="+reseal+" style='width:12%; background: transparent; border: 0; font-size : 12px; text-align : center;' readonly name='multiList["+num+"].resealYN'>"
														                +"<input type='text' value="+zip+" style='width:18%; background: transparent; border: 0; border-right: 2px solid black; font-size : 12px; text-align : center;' readonly  name='multiList["+num+"].zipYN'>"
														                +"<input type='text' value="+price+" style='width: 15%; background: transparent; border: 0; text-align : center; font-size : 12px;' readonly  name='multiList["+num+"].rPrice'>"
														                +"<span onclick='reset(this);' style='font-size:13px; margin-left:1%; border:1px solid black; ' id='"+num+"' class='reset btn btn-primary btn-sm'>취소</span> </div>";
				num = num + 1;
                

                for(var t=0; t<3; t++) {
                    for(var z=0; z<repair1.length ;z++) {
                        repair1[z].classList.remove("clickJacket");
                    }
                }
                
            }
            else {
                alert("옵션을 선택해야 합니다");
            }
            
            //document.getElementById("jacket").classList.toggle('jacketRepair');
            //document.getElementById("insertJacket").remove();
        }


         /* 서비스 선택사항에서 추가된 사항에서 취소 시키는 버튼을 클릭시  이벤트 */
        function reset(idValue) {
            //console.log("buttonId : " + idValue.id);
            var no = (Number)(idValue.id); // 버튼아이디에 그 해당하는 num을 넣어놨다
            console.log(document.getElementById("reset"+no+""));
            document.getElementById("reset" +no+"").remove();

            var j = 1; 
            //console.dir(document.getElementById("insert"));
            //console.dir(document.getElementById("insert").children[j+7]);
            //console.dir(document.getElementById("insert").children[j+7].id);
            //console.dir(document.getElementById("insert").children[j+7].children[0]);
            //console.dir(document.getElementById("insert").children[j+7].children[0].name); // 선택서비스에서 첫번째의 첫번째 인풋의 네임값
            //console.log("no : "+no);

            //console.log(num);

            //console.log(typeof no);

            for(var i = no; i < num - 1; i++) {
                //console.log("i : "+i);
                //console.log(document.getElementById('insert').children[i+7]);
                document.getElementById("insert").children[i+7].id = "reset"+i;
                document.getElementById("insert").children[i+7].children[0].name = "multiList["+i+"].rcategory";
                document.getElementById("insert").children[i+7].children[1].name = "multiList["+i+"].lengthYN";
                document.getElementById("insert").children[i+7].children[2].name = "multiList["+i+"].widthYN";
                document.getElementById("insert").children[i+7].children[3].name = "multiList["+i+"].resealYN";
                document.getElementById("insert").children[i+7].children[4].name = "multiList["+i+"].zipYN";
                document.getElementById("insert").children[i+7].children[5].name = "multiList["+i+"].rPrice";
                document.getElementById("insert").children[i+7].children[6].id = no;
            }
            num = num - 1;
            //console.log("num-1 : "+ num);
        }

         
        /* 다음단계버튼 눌렀을때 step3로 넘어가도록 hiddenButton 클릭되도록 */
        function nextstep() {
        	var button = document.getElementById("hiddenButton");
        	button.click();
        }
    </script>
</body>
</html>