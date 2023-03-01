<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../common/util.jsp" %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        #coupon-table {
            width: 100%;
            position : relative;
        }

        .coupon-button {
            float : right;
            line-height: 0;
            height: 25px;
            margin-left: 10px;
        }
        
        #pageBar {
			margin : 0 auto;
			position : absolute;
			left : 40%;
        }
    </style>
</head>
<body>
    <table id="coupon-table" class="table table-bordered">
        <thead align="center">
            <tr>
            	<th>쿠폰번호</th>
                <th>쿠폰이름</th>
                <th>할인율</th>
                <th>유효기간</th>
            </tr>
        </thead>
        <tbody align="center">
        	<!-- 회원이 가지고 있는 쿠폰 리스트 화면 출력 -->
			<c:forEach var="cList" items="${ couponList }">
				<!-- yyyy-MM-dd 형식으로 만들기 위해 String to Date 로 변환 -->
				<fmt:parseDate var="issueDate" value="${ cList.issueDate }" pattern="yyyy-MM-dd"/>
				<fmt:parseDate var="expDate" value="${ cList.expDate }" pattern="yyyy-MM-dd"/>
				<tr>
					<td class="couNum">${ cList.couNum }</td>
					<td class="couType">${ cList.couType }</td>
					<td class="couDis">${ cList.discount }%</td>  
					<td>                    
						<label>
							<!-- 쿠폰 유효기간 yyyy-MM-dd 형식으로 출력 -->
							<fmt:formatDate value="${ issueDate }" pattern="yyyy-MM-dd"/> 
							~ 
							<fmt:formatDate value="${ expDate }" pattern="yyyy-MM-dd"/>
						</label>
                    	<button class="btn btn-primary coupon-button">선택</button>
                	</td>                    		
				</tr>
			</c:forEach>
        </tbody>
    </table>
    
    <div id="pageBar">
    	<ul class="pagination">
		  
		  <!-- 이용후기의 '<'버튼 이전 페이지로 이동 -->
		  <c:choose>
		  	<c:when test="${ pi.currentPage != 1 }">
		  		<li class="page-item">
		  			<a class="page-link" href="${pageContext.request.contextPath}/payment/couponPage.do?currentPage=${ pi.currentPage - 1 }">
		  				&lt;
		  			</a>
		  		</li>
		  	</c:when>
		  	<c:otherwise>
		  		<li class="page-item">
		  			<a class="page-link" href="javascript:void(0);">
		  				&lt;
		  			</a>
		  		</li>
		  	</c:otherwise>
		  </c:choose>
		  
		  
		  <c:forEach var="pageBarNum" begin="${ pi.startPage }" end="${ pi.endPage }">
		  	<c:choose>
		  		<c:when test="${ pageBarNum != pi.currentPage }">
					<li class="page-item">
			  			<a class="page-link" href="${pageContext.request.contextPath}/payment/couponPage.do?currentPage=${ pageBarNum }">
			  				${ pageBarNum }
			  			</a>
		  			</li>
		  		</c:when>
		  		<c:otherwise>
		  			<li class="page-item">
			  			<a class="page-link" href="javascript:void(0);">
			  				${ pageBarNum }
			  			</a>
		  			</li>
		  		</c:otherwise>
		  	</c:choose>
		  </c:forEach>
		  
		  
		  <!-- 이용후기의 '>'버튼 다음 페이지로 이동 -->		  
		  <c:choose>
		  	<c:when test="${ pi.currentPage != pi.maxPage }">
		  		<li class="page-item">
		  			<a class="page-link" href="${pageContext.request.contextPath}/payment/couponPage.do?currentPage=${ pi.currentPage + 1 }">
		  				&gt;
		  			</a>
		  		</li>
		  	</c:when>
		  </c:choose>	  
		  
		</ul>
    </div>
    
    
    <script>
    	$(function() {
    		
    		$(".coupon-button").on('click', function() {
    			var couponNum = $(this).parent().siblings('.couNum').text(); // 선택한 쿠폰의 쿠폰번호
    			var couponName = $(this).parent().siblings('.couType').text(); // 선택한 쿠폰의 쿠폰이름
    			var discountLength = $(this).parent().siblings('.couDis').text().length; // 선택한 쿠폰의 할인율 '%' slice를 위한 length
    			var discount = Number($(this).parent().siblings('.couDis').text().slice(0, discountLength - 1));	// 선택한 쿠폰의 할인율
    			
    			opener.setCoupon(couponNum, couponName, discount); // 부모창의 setCoupon 함수 호출
				window.close(); // 팝업창 닫기
    		});
    		
    	});
    </script>
</body>
</html>