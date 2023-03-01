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
	.ser-admin {
	width:95%;
	margin-bottom: 5rem;
		position: relative;
	}
	.ser-manage-list {
		margin:auto;
		width:95%;
	}
	.ser-manage-list table{
		margin:1rem;
	}
	.ser-manage-list table th{
		padding:0.5rem;
	}
	.table .thead-dark th {
		font-size:0.8rem;
		text-align:center;
	}
	.ser-manage-list table td{
		margin-bottom:5rem;
	}
	#dashboard{
	    float: right;
    position: absolute;

    top: 0;
    right: 2rem;
	}
	
	.modal.modal-center {
  	text-align: center;
	}

@media screen and (min-width: 1000px) { 
  .modal.modal-center:before {
    display: inline-block;
    vertical-align: middle;
    content: " ";
    height: 100%;
  }
}

.modal-dialog.modal-center {
  display: inline-block;
  text-align: center;
  vertical-align: middle; 
}
	
</style>

</head>
<body>
     <%@ include file="../common/manubar.jsp" %>
 
	<div class="ser-admin">

	<h1 align="center" style="font-weight : bold; maring:3rem">관리자모드 서비스관리</h1>
	
	<a href="${pageContext.request.contextPath}/admin/adminDash.do" id="dashboard" class="btn btn-danger" style="float:right;">대시보드</a>
	
<br><br><br>
<h2 align="center" style="font-weight : bold; maring:3rem">예악 서비스 관리</h2>

<div align="center" class="ser-manage-list">
<table class="table table-striped">
<thead class="table-primary" style="text-align:center;">
		<tr>
			<th>회원번호</th>
			<th>예약번호</th>
			<th>예약타입</th>
			<th>예약날짜</th>
			<th>수거날짜</th>
			<th>요구사항</th>
			<th>배달예정날짜</th>
			<th>수정하기</th>
		</tr>
		</thead>
		<c:choose>
			<c:when test="${empty resList }">
				<tr style="text-align:center;">
					<td colspan="8" style="text-align:center;">조회된 목록이 없습니다</td>
				</tr>
			</c:when>
			
			<c:otherwise>
				<c:forEach var="r" items="${ resList }">
					<tr style="text-align:center;">
						<td>${r.memNum }</td>
						<td class="resNum">${r.resNum }</td>
						<td>${r.resType } </td>
				<fmt:parseDate value="${r.resDate }" var="rdate" pattern="yyyy-MM-dd"/>
				<td><fmt:formatDate value="${ rdate }" type="date" dateStyle="long"/> </td>
				
				<fmt:parseDate value="${r.pickupDate }" var="pdate" pattern="yyyy-MM-dd"/>
				<td><fmt:formatDate value="${ pdate }" type="date" dateStyle="long"/> </td>
						
						<td>${r.request }</td>
						
				<fmt:parseDate value="${r.delDate }" var="dedate" pattern="yyyy-MM-dd"/>
				<td><fmt:formatDate value="${ dedate }" type="date" dateStyle="long"/> </td>
		<td><button class="updateResBtn btn btn-sm btn-primary" data-toggle="modal" data-target="#myModalforUpdateRes">수정하기</button></td>
					</tr>
				</c:forEach>
			</c:otherwise>
			
			
		</c:choose>
	</table>
</div>

<form action="updateRes.do" method="post">
	 
	<!-- The Modal for update-->
	<div class="modal modal-center fade" id="myModalforUpdateRes" tabindex="-1" role="dialog" aria-labelledby="myModalforUpdateRes">
	  <div class="modal-dialog modal-center modal-sm" role="document">
	    <div class="modal-content modal-sm">
	    
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">예약서비스 배달예정 날짜수정하기</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	      <!-- Modal body -->
	      <div class="modal-body"> 
	       	<table border="1">
	       		<tr>
		       		<th></th>
		       		<th>배달예정날짜</th>
	       		</tr>	
	       		<tr>	
	       		<td><input type="hidden" name="resNum"></td>
	       		<td><input type="date" name="delDate2" min="" max="2022-12-31" id="date1"></td>
	       		</tr>
	       	</table>
	      </div>
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="submit" id="btn" class="btn btn-danger">수정완료</button>
	      </div> 
	    </div>
	  </div>
	</div>

</form>


<script>

  
 
	$(function() {
		
		
		
		$(".updateResBtn").on("click" , function() {
			
			$("input[name=resNum]").val($(this).parent().siblings(".resNum").text()); 
			
			var delDate = new Date($(this).parent().siblings(".delDate").text());
			var yyyy = delDate.getFullYear();
			var mm = delDate.getMonth() + 1 > 9 ? delDate.getMonth() + 1 : '0' + (delDate.getMonth() + 1);
			var dd = delDate.getDate() > 9 ? delDate.getDate() : '0' + delDate.getDate();
			
			$("input[name=delDate2]").val(yyyy + "-" + mm + "-" +dd);
			
			console.log(delDate);
			console.log(yyyy);
			console.log(mm);
			console.log(dd);
			
			
		});
		
		var date = new Date(+new Date() + 3240 * 10000).toISOString().split("T")[0];
		
		$("#date1").attr("min" , date);
		
	});

</script> 
</div>
     <jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>