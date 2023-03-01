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
      
      #ask_table tr{
      cursor : pointer;
      }
      
    </style>
    <title>마이페이지</title>
  </head>
  <body>
    <jsp:include page="../common/manubar.jsp"></jsp:include>

    <div class="outer">
      <jsp:include page="./common/sideMenuBar.jsp"></jsp:include>

       <div class="mypage_container">
        <h4 >
         문의 내역
        </h4>
        <div class="mypage_content">
         <table class="table" id="ask_table" >
	        <thead>
	            <th>번호</th>
	            <th>날짜</th>
	            <th>종류</th>
	            <th>제목</th>
	            <th>답변완료</th>
	        </thead>
	        <tbody>
	        
	        <c:choose>
	        
	        	<c:when test="${!empty list }">
	        		<c:forEach var="i" items="${list }">
	        		      <tr id>
			                <td>${ i.askNum }</td>
			                	  	
      		  	    <fmt:parseDate value="${i.askDate }" var="adate" pattern="yyyy-MM-dd"/>
					<td><fmt:formatDate value="${ adate }" type="date" dateStyle="long"/> </td>
			                <td>${ i.askType}</td>
			                <td>${ i.askTitle}</td>
			                <td>
			                	<c:choose>
			                		<c:when test="${ i.ansYn == 'N' }">답변 미등록</c:when>
				                	<c:otherwise>답변 등록</c:otherwise>
			                	</c:choose>
			                </td>
	           			 </tr>
	        		</c:forEach>
	        	</c:when>
	        	<c:otherwise>
	        		<tr>
	        			<td>문의 내역이 없습니다.</td>
	        		</tr>
	        	</c:otherwise>

	        </c:choose>
	     
	        </tbody>
   		 </table>
   		 <div align="center" class="paging-area">
                        <!-- 페이징바에서 < 를 담당 : 이전페이지로 이동 -->
                        <c:if test="${pi.startPage != 1 }">
                            <button onclick="location.href='${ pageContext.request.contextPath }/myPage/askList.do?currentPage=${ pi.currentPage - 1 }'">
                                &lt;
                            </button>
                        </c:if>
            
                        <!-- 페이징바에서 숫자를 담당 -->
                        <c:forEach var="i" begin="${ pi.startPage }" end="${ pi.endPage }" step="1">
                            <!-- 버튼이 눌렸을 때 해당 페이지로 이동하게끔 -->
                            <c:choose>
                                <c:when test="${i != currentPage}">
                                    <button onclick="location.href='${ pageContext.request.contextPath }/myPage/askList.do?currentPage=${ i }'">
                                        ${ i }
                                    </button>
                                </c:when>
                                <c:otherwise>
                                    <!-- 현재 내가 보고있는 페이지일 경우에는 클릭이 안되게끔 막고싶다. -->
                                    <button disabled>${ i }</button>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
            
                        <!-- 페이징바에서 > 를 담당 : 다음페이지로 이동 -->
                        <c:if test="${pi.currentPage != pi.maxPage }">
                            <button onclick="location.href='${ pageContext.request.contextPath }/myPage/askList.do?currentPage=${ pi.currentPage + 1 }'">
                                &gt;
                            </button>
                        </c:if>
                    </div>
        	</div>
      	</div>
    </div>

    
					   

    
  </body>
  
  <script>

    $(function(){
        $("tbody tr").each(function(){
             $(this).click(function(){
                console.log("you are here!")
    
                var askNo = $(this).children().eq(0).text();
                location.href = "${pageContext.request.contextPath}/myPage/askDetail.do?askNo="+askNo;
            })
        });
    })


</script>
</html>
