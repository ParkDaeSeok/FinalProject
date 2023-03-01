<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ include file="../common/util.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	.modal-body table{
	   margin-left:auto; 
    margin-right:auto;
	}
	.modal{
		align:center;
	}
</style>

</head>
<body>
	
	<h1 align="center" style="font-weight : bold; maring:3rem">문의 상세보기</h1>
		<a href="${ pageContext.request.contextPath }/admin/askList.do?currentPage=1" class="btn btn-danger" style="float:right;">목록가기</a>
		<a class="insertAnsBtn btn btn-success" data-toggle="modal" data-target="#myModalforInsertAns" style="float:right;">답변하기</a>
		

	<table class="table table-striped">
	<thead class="table-primary">
		<tr>
			<th>문의 번호</th>
			<th>문의 유형</th>
			<th>회원아이디</th>
			<th>문의 제목</th>
		</tr>
	</thead>
		<tr>
			<td>${ ask.askNum }</td>
			<td>${ ask.askType }</td>
			<td>${ ask.memId }</td>
			<td>${ask.askTitle }</td>
		</tr>
	</table>
	<h3>문의내용 </h3>
	<textarea rows="20" cols="100" readonly style="resize:none; "> ${ ask.askContent } </textarea>
	
	
	<div style="float:right">
	<h3>사진</h3>	
	<c:choose>
		<c:when test="${ empty attList }">
			<h4>조회된 목록이 없습니다</h4>
		</c:when>
		<c:otherwise>
			<c:forEach var="att" items="${ attList }">
				<img src="${ pageContext.request.contextPath }/${ att.filePath }/${ att.changeName }">
				<br>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</div>
	
	
	<!-- 문의 답변하기  -->
	

	<form action="insertAnswer.do" method="post">
	 
	<!-- The Modal for update-->
	<div class="modal" id="myModalforInsertAns" align="center">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">문의 답변하기</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	      <!-- Modal body -->
	      <div class="modal-body" >  
	       	<table border="1">
	       		<tr>
		       		<th></th>
		       		<th>답변 내용</th>
	       		</tr>	
	       		<tr>	
	       		<td><input type="hidden" name="askNum" value="${ask.askNum }"></td>
	       		<td><textarea name="ansContent" cols="30" rows="10" style="resize:none"></textarea></td>
	       		</tr>
	       	</table>
	      </div>
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="submit" id="btn" class="btn btn-danger">답변완료</button>
	      </div> 
	    </div>
	  </div>
	</div>

</form>
	
</body>
</html>