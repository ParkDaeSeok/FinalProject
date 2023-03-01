<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sideMenuBar</title>
<style>
html, body {
        margin: 0;
		heigth: 100%;
        box-sizing: border-box;
      }
      ul {
        margin: 0;
        padding: 0;
      }
      li {
        list-style: none;
      }
      .outer {
        display: flex;
        height: 100%;
      }
      .sidemenubar_container {
        width: 20%;
      }
      .siderbar_nav {
        height: 100%;
        background-color: #3f51b5;
      }
      .sidemenubar_container ul {
        padding-top: 2.5rem;
        height: 87%;
        font-weight: bold;
      }
      .sidemenubar_container li {
        text-align: center;
        margin: 1.1rem 0;
        height: 46px;
        line-height: 50px;
        cursor: pointer;
        color: white;
      }
      .sidemenubar_container li:hover {
        background-color: #3c4a9d;
        font-size: 1.1rem;
      }

      .sidemenubar_container li a {
        text-decoration: none;
        color: white;
      }

      .mypage_container {
        width: 80%;
        padding: 1.5rem;
      }
</style>
</head>
<body>
      <div class="sidemenubar_container">
        <div class="siderbar_nav">
          <ul>
            <li onclick="location.href='${pageContext.request.contextPath}/myPage/'"><a >내 정보</a></li>
            <li onclick="location.href='${pageContext.request.contextPath}/myPage/coupon.do'"><a>쿠폰함</a></li>
            <li onclick="location.href='${pageContext.request.contextPath}/myPage/subscribe.do'"><a>구독내역</a></li>
            <li onclick="location.href='${pageContext.request.contextPath}/myPage/reserveList.do?currentPage=1'"><a >예약내역</a></li>
            <li onclick="location.href='${pageContext.request.contextPath}/myPage/askList.do?currentPage=1'"><a >문의내역</a></li>
          </ul>
        </div>
      </div>
</body>
</html>