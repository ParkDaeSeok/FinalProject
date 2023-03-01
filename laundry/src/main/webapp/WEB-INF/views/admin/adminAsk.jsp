<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ include file="../common/util.jsp" %>
    
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script><!--온라인 방식-->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<title>관리자모드 문의 관리</title>

<style>
	.ask-admin{
		width: 95%;
		margin-bottom: 5rem;
		position: relative;
	}
	
	.ask-manage-list {
		margin:auto;
		width:95%;
		}
	.paging-area button {
		border: 1px solid black;
	}

	.ask-manage-list table {
		margin : 1rem;
	}
	.ask-manage-list table th {
		padding: 0.5rem;
	}
	.table .thead-dark th {
		font-size:0.8rem;
		text-align:center;
	}
	.ask-manage-list table td{
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

	<div class="ask-admin">
		<h1 align="center" style="font-weight : bold; maring:3rem">관리자모드 문의관리</h1>
		<a href="${pageContext.request.contextPath}/admin/adminDash.do" class="btn btn-danger" id="dashboard" style="float:right;">대시보드</a>
		
		<br><br><br>
	
	<div align="center" class="ask-manage-list">
	
	<table class="table table-striped">
	<thead class="table-primary" style="text-align:center;">
		<tr>
			<th>문의번호</th>
			<th>회원아이디</th>
			<th>문의종류</th>
			<th>문의제목</th>
			<th>문의내용</th>
			<th>문의날짜</th>
			<th>답변유무</th>
			<th>답변날짜</th>
		</tr>
		</thead>
		
		<tbody>
		<c:choose>
			<c:when test="${empty pageList }">
			<tr>
				<td colspan="8" style="text-align:center;">조회된 목록이 없습니다</td>
			</tr>
			</c:when>
			
			<c:otherwise>
				<c:forEach var="m" items="${pageList }">
				
				<tr style="text-align:center;">
				
					<td>${m.askNum }</td>
					<td>${m.memId }</td>
					<td>${m.askType }</td>
					<td>${m.askTitle }</td>
					<td>${m.askContent }</td>
				<fmt:parseDate value="${m.askDate }" var="adate" pattern="yyyy-MM-dd"/>
				<td><fmt:formatDate value="${ adate }" type="date" dateStyle="long"/> </td>
					<td>${m.ansYn }</td>
				<fmt:parseDate value="${m.ansDate }" var="andate" pattern="yyyy-MM-dd"/>
				<td><fmt:formatDate value="${ andate }" type="date" dateStyle="long"/> </td>
				</tr>
				
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</tbody>
	</table>
	</div>
	
	<!-- 페이징처리 -->
	<div align="center" class="paging-area">
                        <!-- 페이징바에서 < 를 담당 : 이전페이지로 이동 -->
                        <c:choose>
                        <c:when test="${pi.currentPage != 1 }">
                            <button class="btn btn-secondary btn-sm" type="button" onclick="location.href='${ pageContext.request.contextPath }/admin/askList.do?currentPage=${ pi.currentPage - 1 }'">
                                &lt;
                            </button>
                        </c:when>
                        <c:otherwise>
                        <button type="button" class="btn btn-secondary btn-sm">
                        	&lt;
                        </button>
                        </c:otherwise>
                        </c:choose>
                        <!-- 페이징바에서 숫자를 담당 -->
                        <c:forEach var="i" begin="${ pi.startPage }" end="${ pi.endPage }" step="1">
                            <!-- 버튼이 눌렸을 때 해당 페이지로 이동하게끔 -->
                            <c:choose>
                                <c:when test="${i != currentPage}">
                                    <button class="btn btn-secondary btn-sm" onclick="location.href='${ pageContext.request.contextPath }/admin/askList.do?currentPage=${ i }'">
                                        ${ i }
                                    </button>
                                </c:when>
                                <c:otherwise>
                                    <!-- 현재 내가 보고있는 페이지일 경우에는 클릭이 안되게끔 막고싶다. -->
                                    <button class="btn btn-secondary btn-sm" disabled>${ i }</button>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <!-- 페이징바에서 > 를 담당 : 다음페이지로 이동 -->
                        <c:if test="${pi.currentPage != pi.maxPage }">
                            <button class="btn btn-secondary btn-sm" onclick="location.href='${ pageContext.request.contextPath }/admin/askList.do?currentPage=${ pi.currentPage + 1 }'">
                                &gt;
                            </button>
                        </c:if>
                    </div>
	
	
	<script>
		$(function() {
			$("table>tbody>tr").click(function() {
			
				var ano = $(this).children().eq(0).text();
				
				location.href="${ pageContext.request.contextPath }/admin/detail.do?askNum=" +ano;
				
			})
		});	
	</script>
	</div>
	     <jsp:include page="../common/footer.jsp"></jsp:include>
	
</body>
</html>



















