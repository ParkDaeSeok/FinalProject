<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ include file="../common/util.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>float를 이용한 box정렬</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!-- 온라인 방식 -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet" />
</head>

<style>
	
	html, body {
		height: auto;
	}
	
	body {
		font-family: "Noto Sans KR", sans-serif;
		color: #666666;
	}
	
	ul, li {
		list-style: none;
	}
	
	a {
		color: #666666;
		text-decoration: none;
	}
	a:hover {
		text-decoration: none;
	}
	
	h1, h2, h3, h4, h5, h6 {
		line-height: 1;
	}
	
	/*섹션 넓이 지정*/
	section {
		min-width: 1320px;
	}
	
	/*.inner 구성잡기 1320X650 */
	#container section .inner {
		width: 1320px;
		min-height: 485px;
		padding-top: 100px;
		margin: 0 auto;
	}
	#container section .sr{
		text-align:center;
		padding-top : 100px;
		font-size:30px;
		padding-bottom : 100px;
	}
	/*li 수평정렬, 넓이설정*/
	#container section .inner .box_wrap li {
		float: left;
		padding: 0 20px;
		width: calc(20% - 10px);
	}
	
	/*.items 구성잡기*/
	#container section .inner .box_wrap li .items {
		border: 1px solid black;
		padding: 45px 0;
		/*270px - (상하패딩 90px)*/
		height: 224px;
		cursor:pointer;
	}
	#container section .inner .box_wrap li .hide{
		display:none;
		margin-top:100px;
		width:1190px;
		border:1px solid gray;
		margin-right:246px;
	}
	#container section .inner .box_wrap li .items:hover{
		background:skyblue;
		color:white;
	}
	
	/*text 구성잡기*/
	#container section .inner .box_wrap li .items h3 {
		font-size: 20px;
		line-height: 20px;
		margin-left:20px;
		margin-right:20px;
	}
	
	#container section .inner .box_wrap li .items p {
		margin: 32px 0;
		line-height: 24px;
		margin-left:20px;
		margin-right:20px;
	}
	#foot{
		min-width: 1320px;
	}
	#foot .aba{
		width:1320px;
		min-height:670px;
		padding-top:100px;
		margin:0 auto;
	}
	#foot .aba h2{
		margin-bottom:40px;
		margin-left:60px;
	}
	#foot .aba .foot-body{
		width:1320px;
		height:170px;
	}
	#foot .aba .foot-body .bab li{
		display:block;
		float: left;
		padding: 0 20px;
		width: calc(20% - 10px);
	}
	#foot .aba .foot-body .bab li .box{
		border: 1px solid #e3e3e3;
		padding: 30px 0;
		height: 100px;
	}
	#foot .aba .foot-body .bab li .box:hover{
		background : skyblue;
		color:white;
	}
	#foot .aba .foot-body .bab li .box p{
		text-align:center;
		font-size:30px;
		line-height: 24px;
		margin-left:20px;
		margin-right:20px;
		margin-top:5px
	}
	#foot .aba .foot-foot{
		width:1320px;
		height:200px;
	}
	#foot .aba .foot-foot .ccc li {
		display:block;
		float: left;
		padding: 0 20px;
		width: calc(50% - 25px);
	}
	#foot .aba .foot-foot .ccc li .box{
		border: 1px solid #e3e3e3;
		padding: 30px 0;
		height: 150px;
	}
	#foot .aba .foot-foot .ccc li .box:hover{
		background : skyblue;
		color:white;
	}
	#foot .aba .foot-foot .ccc li .box p{
		text-align:center;
		font-size:50px;
		line-height: 24px;
		margin-left:20px;
		margin-right:20px;
		margin-top:30px;
	}
	#CC{
		width:100%;
		height:300px;
		background-image:url("../resources/image/laundry5.jpg") ;
		background-position:center;
		cursor:pointer;
	}
	#CC .tt{
		text-align:center;
		padding-top:100px;
	}
	
</style>
<body>
	<%@ include file="../common/manubar.jsp"%>
	
	<div id="CC" onclick="main();">
		<div class="tt">
			<h1>
				<b><h1>빨래를부탁해 고객센터</h1></b>
			</h1>
			
		</div>
	</div>
	<script>
		function main(){
			location.href="/laundry/ask/main.do"
		}
	</script>
	<div id="container">
		<section id="first">
			
			<script>
			    // html dom 이 다 로딩된 후 실행된다.
			 //   $(document).ready(function(){
		        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
			 //       $(".box_wrap>li .items").click(function(){
			 //           var $submenu = $(this).next("div");
			            
			 //           $.each($(this).next("div"),function(index,el){
			            	
				//            if($submenu.is(":visible")){
				 //           	$submenu.slideUp();
				 //           }
				 //           else{
				 //           	$submenu.slideDown();
				 //           }
			     //       });
			     //   });
			    //});
			    $(function(){
                $(".box_wrap>li .items").click(function(){
    
                   var $p = $("#hide");

                   
                   if($p.css("display") == "none"){
                	   
	   					$p.slideDown();

	   					if($(this).attr("id") == "items1") {
	   						$("#faqTitle").text("비밀번호 찾기");
	   						$("#faqContent").text("로그인창에서 아이디,비밀번호 찾기로 이메일 인증을 통해 찾으실 수 있습니다.");
	   					} else if($(this).attr("id") == "items2") {
	   						$("#faqTitle").text("사용 방법");
	   						$("#faqContent").text("메인페이지 아래 사용 방법에서 확인하실 수 있습니다.");
	   					} else if($(this).attr("id") == "items3") {
	   						$("#faqTitle").text("회원 탈퇴");
	   						$("#faqContent").text("마이페이지 -> 게정 삭제 를 통해 이용하실 수 있습니다.");
	   					} else if($(this).attr("id") == "items4") {
	   						$("#faqTitle").text("인증 메일");
	   						$("#faqContent").text("이메일이 늦게 수신되거나 스팸메일함을 확인해보세요. 확인 후에도 수신이 안된다면 실시간 상담을 통해 관리자와 상담해주세요.");
	   					} else if($(this).attr("id") == "items5") {
	   						$("#faqTitle").text("문의 신청");
	   						$("#faqContent").text("아래 문의/신고 버튼으로 문의 부탁드립니다. 빠른 상담을 원하실 경우 실시간 상담을 이용해주세요.");
	   					}
	   					
                    }
                    else{
    				
                    	/* if($(this).attr("id") == "items1") {
    						$("#faqTitle").text("비밀번호 찾는 방법");
    						$("#faqContent").text("비밀번호 찾기 버튼을 누르시면 찾을 수 있습니다.");
    					} else if($(this).attr("id") == "items2") {
    						$("#faqTitle").text("결제 정보 수정하는 방법");
    						$("#faqContent").text("관리자에게 물어보세요.");
    					} else if($(this).attr("id") == "items3") {
    						$("#faqTitle").text("items3");
    						$("#faqContent").text("items3");
    					} else if($(this).attr("id") == "items4") {
    						$("#faqTitle").text("items4");
    						$("#faqContent").text("items4");
    					} else if($(this).attr("id") == "items5") {
    						$("#faqTitle").text("items5");
    						$("#faqContent").text("items5");
    					} */
    					
	   					$p.slideUp();
                    }
    
                });
            });
			    
			</script>
			<div style="width:100%; background: rgb(250, 250, 250); height:auto;">
			<div class="inner">
			<h2 style="margin-bottom:40px; margin-left:60px;">자주 묻는 도움말</h2>
				<ul class="box_wrap">
					<li>
						<div class="items" id="items1">
							<h3>01</h3>
							<p>
								비밀번호를 잊어버렸는데 어디서 찾나요?
							</p>
						</div>
						<div class="hide" id="hide">
							<h3 id="faqTitle"></h3>
							<p id="faqContent">
							</p>
						</div>
					</li>
					<li>
						<div class="items" id="items2">
							<h3>02</h3>
							<p>
								세탁서비스는 어떻게 신청하는 건가요?
							</p>
							<p></p>
						</div>
					</li>
					<li>
						<div class="items" id="items3">
							<h3>03</h3>
							<p>
								회원 탈퇴는 어떻게 하는 건가요?
							</p>
						</div>
					</li>
					<li>
						<div class="items" id="items4">
							<h3>04</h3>
							<p>
								인증 메일이 오지 않아요.
							</p>
						</div>
					</li>
					<li>
						<div class="items" id="items5">
							<h3>05</h3>
							<p>
								세탁/수선을 맡긴 의류에 문제가 있어요.
							</p>
						</div>
					</li>
				</ul>
			</div>
			</div>
		</section>
	</div>
	<div style="clear:both;"></div>
	<div id="foot">
		<div class="aba">
			<div class="foot-head">
				<h2>문의유형별 도움말 보기</h2>
			</div>
			<div class="foot-foot">
				<ol class="ccc">
					<li>
					<a href="${pageContext.request.contextPath}/ask/inq.do">
						<div class="box">
							<p>문의 / 신고</p>
						</div>
					</a>	
					</li>
					<li>
					<a href="${pageContext.request.contextPath}/ask/chat.do">
						<div class="box">
							<p>실시간 상담</p>
						</div>
					</a>	
					</li>
				</ol>
			</div>
		</div>
	</div>
</body>
</html>