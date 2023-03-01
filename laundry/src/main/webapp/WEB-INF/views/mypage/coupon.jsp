<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 <%@ include file="../common/util.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <style>
        html, body {
    	height: 100%;
    	overflow:hidden;
    }
    
      .mypage_container {
        width: 60%;
        margin: 0rem auto;
        padding: 1.5rem;
      }
   
      .myinfo {
        display: flex;
        padding: 1rem;
        text-align: center;
      }
      .myinfo_title {
        font-size: 1rem;
        font-weight: bold;
        padding: 0.5rem;
        flex: 1;
      }
      .myinfo_content {
        flex: 2;
        padding: 0.5rem;
      }

      .address {
        grid-column: 1/3;
      }

      .address .myinfo_title {
        text-align: left;
        padding-left: 2.2rem;
        width: 100px;
      }
      .mypage-btns {
        display: flex;
        justify-content: flex-end;
      }
      .mypage-btns button {
        margin-left: 0.5rem;
      }
    
      .mypage_content {
      	text-align: center;
        display: grid;
        grid-template-columns: 1fr 1fr ;
        width:90%;
        margin: 2rem auto;
        grid-row-gap: 2rem;
      }
    
    	/*-----------------coupon-----------------*/
      .coupon_img {
      
        position: relative;
        width:340px;
    
        
      }
      .coupon_img img{
        width: 340px;
        height: 135px;
      }
      .coupon {
     
        display: flex;
        justify-content: center;
        width: 230px;
        position: absolute;
        top: 38px;
        left: 66px;
      }
      .coupon_percent {
        font-size: 2.5rem;
        font-weight: bold;
        text-align: center;
        align-self: center;
        color: #13896a;
    	font-family: "Gugi", cursive;
        
      }
      .coupon_right {
        padding: 0.3rem;
        font-weight: bold;
        width: 100%;
      }

      .coupon_exp {
        display: flex;
        justify-content: center;
        font-size: 0.7rem;
        width: 100%;
      }
      .exp_date_title {
        align-self: center;
        font-weight: bold;
        font-size: 0.8rem;
		margin-right: 0.4rem;
      }
      .exp_date_content {
        padding: 0.5rem;

        font-weight: bold;
      }
      .coupon_type {
        font-size: 1rem;
        text-align: center;
            color: #28a745;
    font-family: "Gugi", cursive;
      }
      
      .coupon_img{
      margin: auto;
      }
    
    </style>
    <title>마이페이지</title>
  </head>
  <body>
    <jsp:include page="../common/manubar.jsp"></jsp:include>

    <div class="outer">
      <jsp:include page="./common/sideMenuBar.jsp"></jsp:include>

       <div class="mypage_container">
        <h4 align="center" style="font-weight: bold; padding: 1rem">
          내 쿠폰함
        </h4>
        <div class="mypage_content">
          
          <c:forEach var="i" items="${couponList }">
          
          
          
           <div class="coupon_container">
           	<div class="coupon_img">
      			<img src="${pageContext.request.contextPath }/resources/image/ticket2.png" />
			      <div class="coupon">
			        <div class="coupon_percent">${i.discount}%</div>
			        <div class="coupon_right">
			          <div class="coupon_exp">
			            <div class="exp_date_title">기간</div>
			            
			            <fmt:parseDate value="${i.issueDate }" var="isd" pattern="yy-MM-dd"/> 
			            <fmt:parseDate value="${i.expDate }" var="exd" pattern="yy-MM-dd"/>
			            <fmt:formatDate value="${isd }" type="date" dateStyle="short"  /> ~
			             <fmt:formatDate value="${exd }" type="date" dateStyle="short"/>
			      
			          </div>
			          <div class="coupon_type">${i.couType } 쿠폰</div>
			        </div>
			      </div>
		      </div>
		    </div>
		          
          </c:forEach>
          
          
          
        </div>
      </div>
    </div>
    
					   


    
  </body>
</html>
