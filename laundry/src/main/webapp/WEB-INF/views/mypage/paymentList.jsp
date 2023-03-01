<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../common/util.jsp" %>
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
        position: relative;
      }
      
      .mypage_container h4{
      	position: absolute;
      	top: 2%;
      	font-weight: bold;
      	left: 40%;
      }
      .mypage_content {
     
        width:80%;
        margin: 4rem auto;
        
      }
      
      .mypage_content table{
        font-size : 0.8rem;
      	text-align: center;
      }
      
    </style>
    <title>결제내역</title>
  </head>
  <body>
    <jsp:include page="../common/manubar.jsp"></jsp:include>

    <div class="outer">
      <jsp:include page="./common/sideMenuBar.jsp"></jsp:include>

       <div class="mypage_container">
     	<h4 align="center">결제 내역</h4>
        <div class="mypage_content">
        
        
        	<table class="table table-striped" >
        		<thead>
        			<th colspan="2">이용 내역</th>
        			<th>금액</th>
        			<th>결제 수단</th>
        			<th>결제 날짜</th>
        		</thead>
        		<tbody>
        		
        		<c:forEach var="i" items="${spList }" > 
        		<tr>
        		  <!-------------- 이용 내역  --------------->
        		    <c:choose>
        		  	    <c:when test="${i.subNum ne 0 }"> 
        		  	    <!-- 구독일때 -->
        		  	        <td style="padding: 0.75rem 0; text-align: right;">구독</td>
        		  	        <td style="padding: 0.75rem 0;">${i.subOption }</td>
        		  	    </c:when>
        			    <c:otherwise>
        			    
        			    	<c:choose>
        			    		<c:when test="${i.resType eq '수선' }">
        			    		 	 <td colspan="2">수선</td>
        			    		 	
        			    		</c:when>
        			    		<c:otherwise>
        			    		
        			    			<td colspan="2">세탁</td>
        			    		</c:otherwise>
        			    	</c:choose>
        	        		
             			</c:otherwise>
        		    </c:choose>
        		    
        		    	<!-------------- 금액   --------------->
        			<c:choose>
        		  	    <c:when test="${i.subNum ne 0 }">
        		  	     <!-- 구독일때 -->
        		  	        <td> <fmt:formatNumber value="${i.subPrice }" type="currency" /></td>
        		  	    </c:when>
        			    <c:otherwise>
        					<td><fmt:formatNumber value="${i.resPrice }" type="currency" /></td>
             			</c:otherwise>
        		    </c:choose>
        		    
        		   <!-------------- 결제 수단   --------------->	
        			<td>****-****-****-${i.cardNum }</td>
        		    
        		    <!-------------- 결제날짜   --------------->
        		  
	       		  	
      		  	    <fmt:parseDate value="${i.payDate }" var="pdate" pattern="yyyy-MM-dd"/>
					<td><fmt:formatDate value="${ pdate }" type="date" dateStyle="long"/> </td>
        		
        			
        		 
 
        			
        		</tr>
        		</c:forEach>
        			
        		</tbody>
        	</table>
          
        </div>
      
      </div>
    </div>

    
				   

    
  </body>
</html>
