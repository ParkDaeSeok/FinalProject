<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ include file="../common/util.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>


<style>
	.member-admin{
		width: 95%;
		margin-bottom: 5rem;
		position: relative;
	}
	
	.mem-manage-list {
		margin:auto;
		width:95%;
		}
	.paging-area button {
		border: 1px solid black;
	}
	.mem-manage-search{
		margin:1rem;
		}
	.mem-manage-list table {
		margin : 1rem;
	}
	.mem-manage-list table th {
		padding: 0.5rem;
	}
	.table .thead-dark th {
		font-size:0.8rem;
		text-align:center;
	}
	.mem-manage-list table td{
		margin-bottom:5rem;
	}

	#dashboard{
	    float: right;
    position: absolute;

    top: 0;
    right: 2rem;
	}

	
</style>

</head>
<body>
    <%@ include file="../common/manubar.jsp" %>

<div class="member-admin">
	<h1 align="center" style="font-weight : bold; margin: 3rem">회원관리</h1> 	
	
	<a href="${pageContext.request.contextPath}/admin/adminDash.do" id="dashboard" class="btn btn-danger" style="float:right;">대시보드</a>
	
	
			
<div align="center" class="mem-manage-search" style="margin-bottom:2rem">
<br><br>
	<form action="union.do" method="get">
		<input type="hidden" name="currentPage" value=1>
		<select name="type">
			<option value="MEM_NAME">이름</option>
			<option value="ADDRESS">주소</option>
		</select>
		<input type="text" name="keyword" placeholder="검색어 입력">
		<button class="btn btn-primary btn-sm" type="submit">검색</button>
	</form>
</div>
	
	<div class="mem-manage-list">
		<table class="table table-striped">
		<thead class="table-primary" style="text-align:center;">
		<tr>
			<th>회원번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>우편번호</th>
			<th>주소</th>
			<th>추천인회원번호</th>
			<th>가입날짜</th>
		</tr>
		</thead>
		<c:choose>
		<c:when test="${ empty pageList}">
		<tr>
			<td colspan="8" style="text-align:center;">조회된 목록이 없습니다</td>
		</tr>
		</c:when>
		
		<c:otherwise>
			<c:forEach var="m" items="${ pageList}">
			<tr style="text-align:center;">
				<td>${ m.memNum }</td>
				<td>${ m.memId }</td>
				<td>${ m.memName }</td>
				<td>${ m.email }</td>
				<td>${ m.phone }</td>
				<td>${ m.post }</td>
				<td>${ m.address }</td>
				<c:choose>
					<c:when test="${ m.recNum gt 0 }">
				<td>${m.recNum }</td>					
					</c:when>
					<c:otherwise>
									<td>없음</td>
					</c:otherwise>
				</c:choose>
				<fmt:parseDate value="${m.enrollDate }" var="endate" pattern="yyyy-MM-dd"/>
				<td><fmt:formatDate value="${ endate }" type="date" dateStyle="long"/> </td>
			</tr>
			
			</c:forEach>
		</c:otherwise>
		</c:choose>
		</table>
		</div>

	<br><br>
	
	<div id="paging-area" align="center" class="paging-area">
						
                        <!-- 페이징바에서 < 를 담당 : 이전페이지로 이동 -->
                        <c:if test="${pi.currentPage != 1 }">
                            <button class="btn btn-secondary btn-sm" onclick="location.href='${ pageContext.request.contextPath }/admin/union.do?type=${ param.type }&keyword=${ param.keyword }&currentPage=${ pi.currentPage - 1 }'">
                                &lt;
                            </button>
                        </c:if>
                        
                        <!-- 페이징바에서 숫자를 담당 -->
                        <c:forEach var="i" begin="${ pi.startPage }" end="${ pi.endPage }" step="1">
                            <!-- 버튼이 눌렸을 때 해당 페이지로 이동하게끔 -->
                            <c:choose>
                                <c:when test="${i ne currentPage}">
                                    <button class="btn btn-secondary btn-sm" onclick="location.href='${ pageContext.request.contextPath }/admin/union.do?type=${ param.type }&keyword=${ param.keyword }&currentPage=${ i }'">
                                        ${ i }
                                    </button>
                                </c:when>
                                <c:otherwise>
                                    <!-- 현재 내가 보고있는 페이지일 경우에는 클릭이 안되게끔 막고싶다. -->
                                    <button class="btn btn-secondary btn-sm" type="button" disabled>${ i }</button>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        
                        <!-- 페이징바에서 > 를 담당 : 다음페이지로 이동 -->
                        <c:if test="${pi.currentPage ne pi.maxPage }">
                            <button class="btn btn-secondary btn-sm" onclick="location.href='${ pageContext.request.contextPath }/admin/union.do?type=${ param.type }&keyword=${ param.keyword }&currentPage=${ pi.currentPage + 1 }'">
                                &gt;
                            </button>
                        </c:if>
                    </div>
                  </div>
                    
               	     <jsp:include page="../common/footer.jsp"></jsp:include>
               
</body>
</html>