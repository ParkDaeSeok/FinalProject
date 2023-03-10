<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String cancelAlert = (String)session.getAttribute("cancelAlert"); 
Boolean cancel = (Boolean)session.getAttribute("cancel");

%>
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
    
    .mypage_content {
        width: 60%;
        margin: 1rem auto;
        font-size: 0.8rem;
      }
      .subscribe_info_container h5 {
        margin-top: 1rem;
      }

      .subscribe_info_container h5,
      .payment_info_container h6 {
        font-weight: bold;
        padding: 0 0 0 1rem;
      	margin:0;
      }

      .subscribe_info_container,
      .payment_info_container {
        padding: 0.5rem;
        margin: 0.1rem;
        background-color: rgba(219, 219, 219, 0.253);
      }
      .sub_service_info {
        margin: 1rem auto 0.5rem auto;
        width: 80%;
        display: flex;
        justify-content: space-between;
      }

      .service_detail ul,
      .service_price p {
        width: 100%;
        text-align: center;
      }
		
	   .service_price{
	    flex-direction: column;
	    justify-content: center;
	    align-self: center;
	    }
	    .service_price p{
	    margin:0;
	    padding: 0.3rem;
	    }
		.sub_period{
	
		text-align: center;
		margin: 0.3rem;
		
		}
      .sub_service_change button {
        padding: 0.3rem;
        margin: 0.5rem 0.8rem;
        width: 205px;
      }

      .last_payment_info {
        display: flex;
        justify-content: space-between;
        width: 65%;
        margin: auto;
      }
      .last_payment_date {
        margin-right: 1rem;
        align-self: center;
      }

      .last_payment_card_info {
        padding: 0.3rem;
        border: 1px solid black;
    
        display: flex;
        justify-content: space-between;
      }

      .card_info {
        display: flex;
        flex: 3;
      }
      .card_number {
        text-align: center;
        width: 165px;
      }
      .card_bank {
        text-align: center;
        width: 50px;
      }
      .card_payment_amt {
     	          align-self: center;
    
      }
      .next_payment {
        display: flex;
        justify-content: space-between;
        width: 74%;
        margin: auto;
      }
      .payment_info_option {
        display: flex;
        justify-content: space-between;
        width: 60%;
        margin: auto;
        margin-bottom: 1rem;
      }
      .payment_info_option a {
        font-weight: bold;
        font-size: 0.9rem;
      }
      .cardinfo_container{
          text-align: center;
      }
       .cardinfo_container label{
       padding-right: 1rem;
       }
       
       .card_info_cardnum{
        display: flex;
        justify-content: center;
        width: 90%;
        margin: auto;
        margin-bottom: 5px;
        
       }
        .card_info_cardnum input{
         width: 51.5px;
        }
        
        #myModal, #changePayment{
        z-index: 1000000;
        background: smokewhite;
        }
        
        #subcancel_alert{
       	 color: red;
       	 padding: 0.3rem;
       	 font-weight: bold;
        }
    
    </style>
    <title>?????? ?????????</title>
  </head>
  <body>
    <jsp:include page="../common/manubar.jsp"></jsp:include>

    <div class="outer">
      <jsp:include page="./common/sideMenuBar.jsp"></jsp:include>

      <div class="mypage_content">
      
       <c:choose>
         	<c:when test="${!empty sub }">
		        <div class="subscribe_info_container"> <!-- ????????? ????????? -->
		
		          <h5 align="center" style="margin-top:1rem">${sub.subOption }</h5>
		          <div class="sub_service_info">
		            <div class="sub_service_info service_detail">
		            
		              <ul>
		              <c:forEach var="i" items="${subContent}">
		                <li>${i}</li>
		     		 </c:forEach>
		              </ul>
		            </div>
		            <div class="sub_service_info service_price">
		       
		            	<p>     <fmt:formatNumber value="${sub.price }" type="currency" /> / ???</p>
		            	
		            	<p> ?????? <b> ${sub.subDay }</b></p>
		            	
		            
		            </div>
		          </div>
		          <div class="sub_period" align="center">
		      
		          <div>
		          <fmt:parseDate value="${sub.subSdate }" var="sdate" pattern="yyyy-MM-dd"/>
		          <fmt:parseDate value="${sub.subEdate }" var="edate"  pattern="yyyy-MM-dd"/>
		          <fmt:formatDate value="${sdate }" type="date" dateStyle="long"/> ~
		          <fmt:formatDate value="${edate }" type="date" dateStyle="long"/>
		         </div>
		          </div>
		          <div class="sub_service_change" align="center">
		            <button class="btn btn-primary btn-sm" onclick="location.href='${pageContext.request.contextPath }/subscribe/sub.sb'">???????????? ????????????</button>
		            
		          <c:choose>
		            <c:when test="${ payment.refund eq 'N' }">
		             
		            <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">?????? ????????????</button>
		            
		            </c:when>
		            <c:otherwise>
		             <div id="subcancel_alert">* ????????? ??????????????? ?????? ?????????.</div>	
		            </c:otherwise>
		           </c:choose>
		           
		           
		               	 
		          
		            
		           
		          </div>
		        </div>

         	
         	</c:when>
         	<c:otherwise> <!--  ?????? ???????????? ?????? ?????? -->
         	  <div style="height:230px">
         	    <div class="subscribe_info_container" style="height: 100%">
		          <h5 align="center" style="margin-top:2rem">?????? ?????????????????? ????????????.</h5>
		          <div class="sub_service_change" align="center" style="margin-top: 6rem;">
		            <button class="btn btn-primary btn-sm" onclick="location.href='${pageContext.request.contextPath }/subscribe/sub.sb'">?????? ???????????? ??????</button>
		          </div>
		        </div>
         	  </div>
         	</c:otherwise>
         </c:choose>
         <c:choose>
         	<c:when test="${!empty payment }">
	         	 <div class="payment_info_container">
		          <h6 style="margin-left: 6rem;     margin-bottom: 0.1rem;">????????? ?????????</h6>
		          <div class="payment_info last_payment_info">
		            <div class="last_payment_date">
		                 <fmt:parseDate value="${sub.subSdate }" var="pdate" pattern="yyyy-MM-dd"/>
		                 <fmt:formatDate value="${pdate }" type="date" dateStyle="long"/>
		            
		            </div>
		            <div class="last_payment_card_info">
		              <div class="card_info">
		                <div class="card_number"> **** - **** - **** - ${last4digits }</div>
		                <div class="card_bank">${payment.cardCom }</div>
		              </div>
		            </div>
		              <div class="card_payment_amt"> <fmt:formatNumber value="${sub.price }" type="currency" />???</div>
		          </div>
		          <hr />
		          <div class="payment_info next_payment">
		            <h6>?????? ?????????</h6>
		            <div class="next_payment_date">
		               <fmt:parseDate value="${sub.subEdate }" var="edate" pattern="yyyy-MM-dd"/>
		               <fmt:formatDate value="${edate }" type="date" dateStyle="long"/>
		            
		            </div>
		          </div>
		          <hr />
		          <div class="payment_info_option">
		            <a href="" data-toggle="modal" data-target="#changePayment">?????? ?????? ?????????</a>
		            <a href="${pageContext.request.contextPath}/myPage/paymentList.do">?????? ?????? ????????????</a>
		          </div>
		        </div>
         	</c:when>
         	<c:otherwise>
         		<div class="payment_info_container">
		          <h6 style=" margin-bottom: 0.1rem; text-align: center;">?????? ?????? ????????? ????????????.</h6>
		    
		        </div>
         	</c:otherwise>
         
         
         </c:choose>
       

      </div>
    
      </div>
  
		    
	<!-- The Modal for subscribe cancellation -->
		<div class="modal" id="myModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <!-- Modal body -->
		      <div class="modal-body">
		      <form action="cancelSub.do">
		      	
		        <h5 style="font-weight: bold">????????? ?????? ????????????????</h5>
		        <p>????????? ????????? ??? ??????????????????!</p>
		        <div style="width: 100%; text-align: center;">
		        <textarea rows="4" cols="50" style="resize: none; margin:auto; font-size:0.9rem;">
		        
???????????? ??? ???????????? ??????????????? ???????????????.
???????????? ?????? ??????????????? ?????? ???????????? ???????????????. ?????? ??? 10?????? ????????? ????????? ??????????????? ???????????? ?????? ????????? ????????? ?????? ?????????.</textarea>
				</div>
				<div style="width: 100%; text-align: center;">
				     <button class="btn btn-primary btn-sm">?????? ??????</button>
				     <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">??????</button>
				 </div>
		       </form>
		      </div>
		    </div>
		  </div>
		</div>
	<!-- The Modal for change in payment method -->
		<div class="modal" id="changePayment">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <!-- Modal body -->
		      <div class="modal-body ">
		      <form action="changePayment.do" method="post">
		      	
		        <h5 style="font-weight: bold">?????? ?????? ??????</h5>
				<hr>
				<div class="cardinfo_container">
					<div class="card_info_cardnum">
					<label>????????????</label>
					<input type="text" name="cardNum1" value="****" required  maxlength="4" pattern=".{4}"   /> -
					<input type="text" name="cardNum2" value="****" required maxlength="4" pattern=".{4}" /> -
					<input type="text" name="cardNum3" value="****" required maxlength="4" pattern=".{4}"  /> -
					<input type="text" name="cardNum4" value=" ${last4digits }" required maxlength="4" pattern=".{4}"  />
					</div>
					<label>????????????</label>
					<select name="cardCom" style="width: 222px;padding: 1px 2px;" required >
						<option>??????</option>
						<option>??????</option>
						<option>??????</option>
						<option>??????</option>
					</select> <br>
					<label>CVC??????</label><input type="text" name="cardCvc" value="***" required  maxlength="3" pattern=".{3}"/> <br>
					<label>????????????</label><input type="date" name="expDate" style="width:223px" min="${today }" required/><br>
				</div>
				<br>
				<div style="width: 100%; text-align: center;">
				     <button class="btn btn-primary btn-sm">????????????</button>
				     <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">??????</button>
				 </div>
		       </form>
		      </div>
		    </div>
		  </div>
		</div>
		<script>
			$(function(){
				
				let trigger = true;
					$("input[name=cardNum1], input[name=cardNum2], input[name=cardNum3], input[name=cardNum4]").focus(function(){
							
						if(trigger == true){
							$(".card_info_cardnum input").each(function(){
									$(this).val("");	
									$("input[name=cardCvc]").val("");
						
							})
							trigger = false;
						}
					})
				})
		</script>
		
  </body>
</html>
