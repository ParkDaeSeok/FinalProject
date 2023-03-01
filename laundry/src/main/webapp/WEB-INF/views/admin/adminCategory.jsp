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
	.cat-admin{
		width: 95%;
		margin-bottom: 5rem;
		position: relative;
	}
	
	.cat-manage-list {
		margin:auto;
		width:95%;
		}

	.cat-manage-list table {
		margin : 1rem;
	}
	.cat-manage-list table th {
		padding: 0.5rem;
	}
	.table .thead-dark th {
		font-size:0.8rem;
		text-align:center;
	}
	.cat-manage-list table td{
		margin-bottom:5rem;
	}


	#addCat{
	
    margin-bottom:5rem;
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


<div class="cat-admin">
	<h1 align="center" style="font-weight : bold; maring:3rem">관리자모드 카테고리관리</h1>
	
	<a href="${pageContext.request.contextPath}/admin/adminDash.do" id="dashboard" class="btn btn-danger" style="float:right;">대시보드</a>
	<a class="insertCat btn btn-success" data-toggle="modal" id="addCat" data-target="#myModalforInsertCat" style="float:right;">기능추가하기</a>
	<div align="center" class="cat-manage-list">
		
		<!-- 기능추가하기  모달  -->	
	<form action="insertCat.do" method="post">
	
	<!-- The Modal for update-->
	<div class="modal modal-center fade" id="myModalforInsertCat" tabindex="-1" role="dialog"  aria-labelledby="myModalforInsertCat">
	  <div class="modal-dialog modal-center modal-xl" role="document">
	    <div class="modal-content modal-xl ">
	    
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">세탁 기능추가하기</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	      <!-- Modal body -->
	      <div class="modal-body"> 
	      
	       	<table>
	       		<tr>
		       		<th>세탁카테고리번호</th>
		       		<th>세탁대분류</th>
		       		<th>세탁소분류</th>
		       		<th>금액</th>
	       		</tr>	
	       		
	       		<tr>	
		       		<td><input type="text" name="catNum"></td>
		       		<td><input type="text" name="mcategory"></td>
		       		<td><input type="text" name="scategory"></td>
		       		<td><input type="text" name="lPrice"></td>
	       		</tr>
	       		
	       	</table>
	      </div>
	      <!-- Modal footer -->
	      <div class="modal-footer" >
	        <button type="submit" id="btn" class="btn btn-danger">추가완료</button>
	      </div> 
	    </div>
	  </div>
	</div>

</form>
		<!-- 기능추가하기 버튼 모달  여기까지-->
		
		<table class="table table-striped">
		<thead class="table-primary" style="text-align:center;">
			<tr>
				<th>번호</th>
				<th>세탁대분류</th>
				<th>세탁소분류</th>
				<th>가격</th>
				<th>현재상태</th>
				<th>수정</th>
				<th>삭제</th>
				<th>복구</th>
			</tr>
			</thead>
			<tr>
				<c:choose>
				<c:when test="${ empty list }">
					<tr>
						<td colspan="8" style="text-align:center;">조회된 목록이 없습니다.</td>
					</tr>
				</c:when>
				
				<c:otherwise>
					<c:forEach var="l" items="${list }">
						<tr style="text-align:center;">
							<td class="catNum">${l.catNum }</td>
							<td class="mcategory">${l.mcategory }</td>
							<td class="scategory">${l.scategory }</td>
							<td class="lPrice">${l.LPrice }</td>
							<td class="status">${l.status }</td>
							<td><button class="updateBtn btn btn-sm btn-primary" data-toggle="modal" data-target="#myModalforUpdate"   >수정하기</button></td>
							<td><a href="delete/${l.catNum }" class="btn btn-danger btn-sm">삭제하기</a></td>
							<td><a href="restore/${l.catNum }" class="btn btn-info btn-sm">복구하기</a></td>
							
						</tr>
					</c:forEach>
				</c:otherwise>
				</c:choose>
			</tr>
		</table>
	</div>
	
	
	
 <form action="update.do" method="post">
	 
	<!-- The Modal for update-->
	    	<div class="modal modal-center fade" id="myModalforUpdate" tabindex="-1" role="dialog"  aria-labelledby="myModalforUpdate">
	  <div class="modal-dialog modal-center modal-xl" role="document">
	    <div class="modal-content modal-xl">
	    
	    
	    
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">세탁 종류/가격 수정하기</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	      <!-- Modal body -->
	      <div class="modal-body"> 
	       	<table border="1">
	       		<tr>
		       		<th></th>
		       		<th>대분류</th>
		       		<th>소분류</th>
		       		<th>가격</th>
		       		<th></th>
	       		</tr>	
	       		<tr>	
	       		<td><input type="hidden" name="catNum"></td>
	       		<td><input type="text" name="mcategory"></td>
	       		<td><input type="text" name="scategory"></td>
	       		<td><input type="text" name="lPrice"></td>
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
		
		$(".updateBtn").on("click", function() {
			
			// 수정하기 전에 원래 내용을 일단 보여줌 => 수정하게끔
			$("input[name=catNum]").val($(this).parent().siblings(".catNum").text()); 
			$("input[name=mcategory]").val($(this).parent().siblings(".mcategory").text()); 
			$("input[name=scategory]").val($(this).parent().siblings(".scategory").text());
			$("input[name=lPrice]").val(Number($(this).parent().siblings(".lPrice").text()));

			//console.log($(this).parent().siblings(".catNum").text());
			//$("input[name=catNum]").val($(this).parent().siblings(".catNum").text())
			
		});	
		
	});
</script>
</div>
     <jsp:include page="../common/footer.jsp"></jsp:include>


</body>
</html>