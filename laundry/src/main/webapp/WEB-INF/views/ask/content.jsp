<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ include file="../common/util.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도움말 게시판</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!-- 온라인 방식 -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet" />
<style>
	body {
			font-family: "Noto Sans KR", sans-serif;
			color: #666666;
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
	#aba section .inner {
		width: 1320px;
		min-height: 485px;
		padding-top: 100px;
		margin: 0 auto;
	}
	#aba section .sr{
		text-align:center;
		padding-top : 100px;
		font-size:30px;
		padding-bottom : 100px;
	}
	#container .inner{
		width: 1320px;
		min-height: 485px;
		margin: 0 auto;
		
	}
	#container .inner .box{
		height: 500px;
		border-top:2px solid black;
		border-bottom:2px solid black;
	}
	#container .inner .box .head{
		margin-left:20px;
		height: 70px;
	}
	#container .inner .box .content{
		margin-left:20px
	}
</style>
</head>
<body>
	<%@ include file="../common/manubar.jsp" %>
	
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
	
	<div id="aba">
		<section id="first">
			<div class="sr">
				<form action="" method="get" onsubmit="return false">
					<b>도움말 검색</b>&nbsp;&nbsp; 
					<input id="search" onkeyup="enterkey();" type="text" style="padding-left:15px"/>
					<script>
						function enterkey() {
							if (window.event.keyCode == 13) {
								var keyword = document.getElementById('search').value;
								
								location.href="board.do?category=검색&keyword="+keyword;
							}
							
						}
					</script>
				</form>
			</div>
		</section>
	</div>
	<div id="container">
		<div class="inner">
			<h4 style="margin-bottom:20px">도움말 상세보기</h4>
			<div class="box">
				<div class="head">
					<b style="font-size:28px">${ ask.askTitle }</b> <br>${ ask.askType }
				</div>
				<hr>
				<div class="content">
					<div style="font-size:28px">
						${ ask.askContent }
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="width:1320px; height:200px; margin:auto; text-align:center; margin-top:100px">
		<button onclick="board();">목록으로</button>
	</div>
	<script>
		function board(){
			location.href="${pageContext.request.contextPath}/ask/board.do?category=계정관리"
		}
	</script>
	
</body>
</html>