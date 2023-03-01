<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ include file="../common/util.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도움말 게시판</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!-- 온라인 방식 -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
		padding-bottom : 50px;
	}
	#container .inner{
		width: 1320px;
		min-height: 485px;
		padding-top: 100px;
		margin: 0 auto;
	}
	#container .inner .box{
		height:70px;
		box-sizing:border-box;
		border: 1px solid black;
		margin-bottom:100px;
	}
	#container .inner .box .box_in{
		text-align:center;
		width:20%;
		height:100%;
		vertical-align: middle;
		float:left;
		border-right:1px solid black;
	}
	#container .inner .box .box_in p {
		margin-top:15px;
		font-size:24px;
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
				<form method="get" onsubmit="return false">
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
			<h3 style="margin-bottom:20px;background:">도움말</h3>
				<div class="box">
					<a href="${pageContext.request.contextPath}/ask/board.do?category=계정관리">
					<div class="box_in">
						<p>계정관리</p>
					</div>
					</a>
					<a href="${pageContext.request.contextPath}/ask/board.do?category=서비스">
					<div class="box_in">
						<p>서비스</p>
					</div>
					</a>
					<a href="${pageContext.request.contextPath}/ask/board.do?category=구독">
					<div class="box_in">
						<p>구독</p>
					</div>
					</a>
					<a href="${pageContext.request.contextPath}/ask/board.do?category=결제/환불">
					<div class="box_in">
						<p>결제 / 환불</p>
					</div>
					</a>
					<a href="${pageContext.request.contextPath}/ask/board.do?category=기타">
					<div class="box_in">
						<p>기타</p>
					</div>
					</a>
				</div>
		
		<table class="table table-hover">
		<c:choose>
			<c:when test="${ empty list }">
				<tr>
					<td colspan="3">게시글이 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="b" items="${ list }">
					<tr>
						<td style="width:3%; text-align:center">
							${ b.askNum }
						</td>
						<td style="width:17%;text-align:center;">
							${ b.askType }
						</td>
						<td style="width:70%">${ b.askTitle }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
		</table>
		<script>
			$(function(){
				 $("tr").click(function(){
					var bno = $(this).children().eq(0).text();
					if(bno != "게시글이 없습니다."){
					location.href="/laundry/ask/content.do?bno=" + bno ; 
					} 
				});
			});
		</script>
		<!-- 페이징바 만들기 -->
		<!-- 조건문 1페이지가 아닌경우 : < 버튼 만들기 => currentPage - 1 로 이동시키기  -->
		<!-- 
			반복문 숫자를 담당하는 부분 만들기 1 2 3 4 
			버튼이 눌렸을 때 해당 페이지로 이동하게끔 
			현재 내가 보고있는 페이지일경우 해당 버튼이 클릭 안되게끔
		-->
		<!-- 조건문 마지막페이지가 아닌경우 : > 버튼 만들기 => currentPage + 1 로 이동시키기 -->
		
			<br><br><br>
			<div style="display:block; text-align:center">
				<!-- 페이징바에서 < 를 담당 : 이전페이지로 이동 -->
				
				<c:if test="${ pi.currentPage != 1 }">
        	 		<button onclick="location.href='${pageContext.request.contextPath}/ask/board.do?category=${ category }&keyword=${ keyword }&currentPage=${ pi.currentPage - 1 }'">
        	 			&lt;
        	 		</button>
	        	</c:if>
		        		
        	 	<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p" step="1">
        	 		<c:choose>
        	 			<c:when test="${ p != currentPage }">
        	 				<button onclick="location.href='${ pageContext.request.contextPath }/ask/board.do?category=${ category }&keyword=${ keyword }&currentPage=${ p }'">
        	 					${ p }
        	 				</button>
        	 			</c:when>
        	 			<c:otherwise>
        	 				<button disabled>${ p }</button>
        	 			</c:otherwise>
        	 		</c:choose>
        	 	</c:forEach>
        	 	
        	 	<c:if test="${ pi.currentPage != pi.maxPage && pi.totalCount != 0}">
        	 		<button onclick="location.href='${pageContext.request.contextPath}/ask/board.do?category=${ category }&keyword=${ keyword }&currentPage=${ pi.currentPage + 1 }'">
        	 			&gt;
        	 		</button>
        	 	</c:if>
        	</div>
			<br><br><br>
		</div>
	</div>
	
	
</body>
</html>