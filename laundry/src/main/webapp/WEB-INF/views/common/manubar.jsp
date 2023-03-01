<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>메뉴바</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <style>
    
    *{
    font-family: 'Noto Sans KR', sans-serif;
    }
       .menubar {
        position: fixed;
        height: 100px;
        width: 100%;
		background-color: white;
        z-index: 100000;
      }
      .logo {
        font-size: 2rem;
        font-family: "Gugi", cursive;
        align-self: center;
        cursor: pointer;
        transition: 1s;
      }
      
      .logo span{
       font-family: "Gugi", cursive;
      }
      .menubar .nav {
        width: 90%;
        display: flex;
        justify-content: space-between;
        margin: auto;
        font-size: 1rem;
        transition: 1s;
        line-height: 65px;
      }

      .menubar .nav > ul {
        display: flex;

        list-style: none;
        justify-content: flex-end;
      }
      .menubar .nav > ul > li {
        font-weight: bold;
        color: black;
        text-decoration: none;
        cursor: pointer;
        padding: 1rem;
      }

      .menubar .nav > ul > a {
        line-height: 98px;
        font-size: 0.9rem;
        padding-right: 1rem;
      }
      .menubar .nav:hover {
        font-size: 1.05rem;
        padding-left: 1rem;
        padding-right: 1rem;
       
      }
      .menubar .nav > ul > li:hover {
        color: skyblue;
        transform: scale(1.1);
      }
    </style>
  </head>
  <body>
  
    <c:if test="${!empty alertMsg }">
     <script>
    	var msg = "${alertMsg}";
    	alert(msg);
    </script>
    	<c:remove var="alertMsg" scope="session"/>
    </c:if>
    <div class="menubar">
      <div class="nav">
        <div class="logo" onclick="location.href='${pageContext.request.contextPath}/'"><span style="color: skyblue">빨래</span>를부탁해</div>

        <ul>
       
          
          <c:choose>
          
          	<c:when test="${!empty loginUser }">
         
          		<c:choose>
          			<c:when test="${loginUser.memId == 'admin'}">
          			 	<a id="welcome">${ loginUser.memName }님 환영합니다!</a>
         				<li onclick="location.href='${pageContext.request.contextPath }/admin/adminDash.do'">관리자 대시보드</li>
         				<li onclick="location.href='${pageContext.request.contextPath }/member/logout.do'">로그아웃</li>
          			</c:when>
          			<c:otherwise>
          				<a id="welcome">${ loginUser.memName }님 환영합니다!</a>
         				<li onclick="location.href='${pageContext.request.contextPath }/reserve/apply.rs'">세탁 서비스</li>
         				<li onclick="location.href='${pageContext.request.contextPath }/subscribe/sub.sb'">구독 서비스</li>
         				<li onclick="location.href='${pageContext.request.contextPath }/ask/main.do'">고객 지원</li>
         				<li onclick="location.href='${pageContext.request.contextPath }/myPage/'">마이페이지</li>
         				<li onclick="location.href='${pageContext.request.contextPath }/member/logout.do'">로그아웃</li>
          			</c:otherwise>         		
          		</c:choose>
          	</c:when>
          	<c:otherwise>
          
     	    <li onclick="location.href='${pageContext.request.contextPath }/reserve/apply.rs'">세탁 서비스</li>
         		<li onclick="location.href='${pageContext.request.contextPath }/subscribe/sub.sb'">구독 서비스</li>
         		<li onclick="location.href='${pageContext.request.contextPath }/ask/main.do'">고객 지원</li>
	          	<li onclick="location.href='${pageContext.request.contextPath }/member/login.do'">
	           		 로그인
	          	</li>
          	</c:otherwise>
          </c:choose>

        </ul>
      </div>
    </div>
    

 
    <div id="noMain" style="padding: 3rem"></div>
  </body>
</html>
