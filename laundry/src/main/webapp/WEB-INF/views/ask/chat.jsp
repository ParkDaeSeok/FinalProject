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
/*	.stepone, .steptwo, .stepthree {
		display: inline-block;
		width: 400px;
		height: 800px;
		margin: 3rem;
	}*/
	
	
	.step{
	display: flex;
	justify-content: space-between;
	margin: 6rem auto;
	width: 95%;
	}

	.step h4 {
	 margin-bottom: 1rem;
	}
	
	.steptwo img,
	.stepthree img{
		width: 400px;
		heigth: 700px;
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
	<div class="step">
		<div class="stepone">
			<h4>1. 오른쪽 아래 실시간 채팅 버튼을 눌러주세요.</h4>
			<img src="<c:url value='/resources/image/chat_button.jpg'/>"/>
		</div>
		<div class="steptwo">
			<h4>2. 채팅 시작을 위한 양식을 입력해주세요.</h4>
			<img src="<c:url value='/resources/image/chat_form.jpg'/>"/>
		</div>
		<div class="stepthree">
			<h4>3. 버튼을 눌러 관리자와 채팅을 시작하세요.</h4>
			<img src="<c:url value='/resources/image/chat_start.jpg'/>"/>
		</div>
	</div>
	<!--Start of Tawk.to Script-->
		<script type="text/javascript">
			var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
			(function(){
			var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
			s1.async=true;
			s1.src='https://embed.tawk.to/60ebf4a5649e0a0a5ccbbae2/1facr7ah5';
			s1.charset='UTF-8';
			s1.setAttribute('crossorigin','*');
			s0.parentNode.insertBefore(s1,s0);
			})();
		</script>
	<!--End of Tawk.to Script-->
	
</body>
</html>