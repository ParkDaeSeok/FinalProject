<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/util.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
        <style>
            .cardbox {
                border: 1px solid #80808040;
    			border-radius: 5px;
                width: 300px;
                margin: auto;
                padding: 0.5rem 1rem;
                display: flex;
                justify-content: center;
            }
            
         
            .cardcontent {
                text-align: center;
                font-size: 0.9rem;
                padding: 0.2rem  1rem;
   				 align-self: center;
   				 margin: 0;
            }
            .modal {
                text-align: center;
            }
        
            @media screen and (min-width: 768px) { 
                .modal:before {
                        display: inline-block;
                        vertical-align: middle;
                        content: " ";
                        height: 100%;
                }
            }
        
            .modal-dialog {
                    display: inline-block;
                    text-align: left;
                    vertical-align: middle;
            }  
            
            .reserveTable{
            
           	  width: 70%;
  			  margin: 6rem auto;
            }     
            .reserveDetailTable{
             width: 100%;
             align-self: center;
             }
             
             
             .reserveTable table th, 
             .reserveTable table td,
             .reserveDetailTable table th,
             .reserveDetailTable table td{
             
             text-align: center;
             }
             
            .reserveDetailTable table{
	            width: 90%;
	            margin: auto;
	          
	            
            }
            
            .second_section{
            	display: flex;
            	justify-content: center;
            	
            }
            .third_section{
              	display: flex;
            	justify-content: center;
            	width: 80%;
   				 margin: auto;
            }
            .review_box{
            	padding: 0rem 2rem;
            	align-self: center;
            }
            .review_box h5{
            font-weight: bold;
		    text-align: center;
		    margin-bottom: 0.4rem;
            }
            
            .review_box textarea{
             padding: 0.4rem;
             border: 1px solid #80808030;
             border-radius: 3px;
            }
            
            .usecard, 
            .total_payment{
            width: 50%;
            padding: 1rem;
           
            }
            
            .usecard h5 {
            	font-weight: bold;
            	text-align: center;
            }
            .usecard h4{
            padding: 0.3rem 0rem;
            	font-size: 1rem;
            	text-align: left;
          
  				  margin: auto;
            }
            .total_payment{
            margin-top: 1rem;
            text-align: center;
            }
            .total_payment h4{
             text-align: left;
             font-size: 1rem;
            }
            .totalpay h2{
             font-size: 1.4rem;
    			font-weight: bold;
    			margin-top: 1.5rem;
            }
            .usecoupon{
            	margin: auto;
   				 width: 50%;

            }
        </style>
    </head>
    <body>
    <jsp:include page="../common/manubar.jsp"></jsp:include>
    <div class="outer">
        <jsp:include page="./common/sideMenuBar.jsp"></jsp:include>
        <div class="reserveTable table table-striped">
            <table class="table" id="restable" >
                <thead>
                    <th>예약번호</th>
                    <th>예약날짜</th>
                    <th>서비스유형</th>
                    <th>수거날짜</th>
                    <th>도착예정날짜</th>
                    <th>세탁/수선 상태</th>
                </thead>
                <tbody>
                    <c:forEach var="r" items="${ list }" begin="0" end="0">
                        <tr>
                            <td>${ r.resNum }</td>
                            <fmt:parseDate value="${r.resDate }" var="resdate" pattern="yyyy-MM-dd"/> 
                            <td> <fmt:formatDate value="${resdate }" type="date" dateStyle="long"/></td>
                            <td>${ r.resType }</td>
                            <fmt:parseDate value="${r.pickupDate }" var="pickupdate" pattern="yyyy-MM-dd"/> 
                            <td><fmt:formatDate value="${pickupdate }" type="date" dateStyle="long"/></td>
                            <fmt:parseDate value="${r.delDate }" var="deldate" pattern="yyyy-MM-dd"/> 
                            <td><fmt:formatDate value="${deldate }" type="date" dateStyle="long"/></td>
                            <td>
                            	<c:choose>
                            		<c:when test="${ r.resStatus == 'N' }">미완료</c:when>
                            		<c:otherwise>완료</c:otherwise>
                            	</c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
           
            <div class="second_section">
	            <div class="reserveDetailTable">
	                <table  class="table table-striped">
	                    <c:forEach var="r" items="${ list }" begin="0" end="0">
	                        <c:choose>
	                            <c:when test="${ r.resType=='세탁' }">
	                                <thead>
	                                    <th>세탁물</th>
	                                    <th>종류</th>
	                                    <th>금액</th>
	                                </thead>
	                                <tbody>
	                                    <c:forEach var="r" items="${ list }">
	                                        <tr>
	                                            <td>${ r.mcategory }</td>
	                                            <td>${ r.scategory }</td>
	                                            <td>${ r.LPrice }</td>
	                                        </tr>
	                                    </c:forEach>
	                                </tbody>
	                            </c:when>
	                            <c:otherwise>
	                                <thead>
	                                    <th>수선물</th>
	                                    <th>기장수선</th>
	                                    <th>통수선</th>
	                                    <th>재박음질</th>
	                                    <th>지퍼 및 단추 수선</th>
	                                    <th>금액</th>
	                                </thead>
	                                <tbody>
	                                    <c:forEach var="r" items="${ list }">
	                                        <tr>
	                                            <td>${ r.rcategory }</td>
	                                            <td>
	                                            	<c:if test="${ r.lengthYN == 'Y' }">O</c:if>
	                                            </td>
	                                            <td>
	                                            	<c:if test="${ r.widthYN == 'Y' }">O</c:if>
	                                            </td>
	                                            <td>
	                                            	<c:if test="${ r.resealYN == 'Y' }">O</c:if>
	                                            </td>
	                                            <td>
	                                            	<c:if test="${ r.zipYN == 'Y' }">O</c:if>
	                                            </td>
	                                            <td>${ r.RPrice }</td>
	                                        </tr>
	                                    </c:forEach>
	                                </tbody>
	                            </c:otherwise>
	                        </c:choose>
	                    </c:forEach>
	                </table>
	            </div>
	            
	            <div class="review_box">
	               <c:forEach var="r" items="${ list }" begin="0" end="0">
		            <c:choose>
		                <c:when test="${ r.revNum eq 0 }">
		                    <div class="bottom">
		                        <button class="btn btn-primary btn-sm" style="width:100px; padding: 0.5rem" data-toggle="modal" data-target="#myModal">
		                           	 후기등록
		                        </button>
		                    </div> 
		                </c:when>
		                <c:otherwise>
		                <br>
		                    <h5>후기</h5>
		                    <textarea cols="40" rows="5" readonly style="resize: none">${ r.revContent }</textarea>
		                    <c:if test="${ r.attNum gt 0 }">
		                    	<img src="${ pageContext.request.contextPath }/${ r.filePath }${ r.changeName }" style="width:100px; height: 100px;"/>
		                    </c:if>
		                </c:otherwise>
		            </c:choose>
		       	  </c:forEach>
	            </div>
            </div>
            <br>
            
            <div class="third_section">
            
	            <c:forEach var="r" items="${ list }" begin="0" end="0">
	               
	                <div class="usecard">
	                    <h5>결제카드</h5>
	                    <div class="cardbox">
	                        <h4 class="cardcontent">${ r.cardCom }</h4>
	                        <br>
	                        <h5 class="cardcontent"> **** - **** - **** - ${ r.cardNum }</h5>
	                    </div>
	                    <fmt:parseDate value="${r.expDate }" var="expdate" pattern="yyyy-MM-dd"/>
	                    <h4 style="margin-top: 0.8rem;">유효 기간 : <fmt:formatDate value="${ expdate }" type="date" dateStyle="long"/></h4>
	                    
	                </div>
	                
	                <div class="total_payment">
		                <c:if test="${ !empty r.couType }">
		                    <div class="usecoupon">
		                        <h4><b> 사용한 쿠폰 </b> : ${r.couType}</h4>
		                        <h4><b> 할인율 </b> : ${r.discount} %</h4>
		                    </div>
		                </c:if>
		                <div class="totalpay">
		                  <h2> 총 결제 금액 : <fmt:formatNumber value="${r.totalPay }" type="currency" /></h2>
		                
		                </div>
	                </div>
	          </c:forEach>		
            </div>
        
            <!-- Modal --> 
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
                <div class="modal-dialog"> 
                    <div class="modal-content"> 
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">후기 등록</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> 
                        </div> 
                        <div class="modal-body">
                            <form action="../review/review.do" method="post" enctype="multipart/form-data">
                                <c:forEach var="r" items="${ list }" begin="0" end="0">
                                    <input type="hidden" name="resNum" value="${ r.resNum }"/>
                                </c:forEach>
                                <select name="rate" required>
                                    <option value="만족">만족</option>
                                    <option value="보통">보통</option>
                                    <option value="불만족">불만족</option>
                                </select>
                                <p>
                                    <textarea name="revContent" cols="40" rows="10" required></textarea>
                                </p>
                                <input type="file" name="upfile" accept=".jpg, .png, .gif" />
                                <br>
                                <button type="button" class="btn btn btn-secondary btn-sm" data-dismiss="modal" style="float: right;">취소</button>
                                <button class="btn btn-primary btn-sm" type="submit" style="float: right; margin-right: 10px;">등록</button>
                            </form>
                        </div> 
                    </div> 
                </div> 
            </div>
        </div>
    </body>
</html>