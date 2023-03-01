<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

   <%@ include file="../common/util.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>


	<style>
		  .admin_menu {
        display: flex;
        flex-wrap: wrap;
        max-width: 900px;
        margin: auto;
        margin-bottom: 6rem;
        justify-content: space-around;
      }
      .admin_menu_manage {
        width: 300px;
        cursor: pointer;
        border: 1px solid lightgray;
        padding: 1rem;
        margin: 1rem;
        border-radius: 5px;
      }
      .admin_menu_manage:hover {
        background-color: rgba(211, 211, 211, 0.507);
      }

      .emoji {
        font-size: 4rem;
      }
      .admin_menu_manage a {
        border: none;
        background-color: none;
        font-weight: bold;
        color: black;
      }
	</style>
</head>

<body>	

    <%@ include file="../common/manubar.jsp" %>

	<div class="admin_mainpage">
	
		<h1  align="center"
        style="font-weight: bold; padding: 2rem 1rem 1rem 1rem">관리자 대시보드</h1>
        <br />
        
        
		<div class="admin_menu" align="center"> 
			<div
			class="admin_menu_manage"
			 onclick="location.href='${pageContext.request.contextPath}/admin/union.do?currentPage=1'"
			>
			<div class="emoji">🍊</div>
			<a type="button">회원관리</a>
			</div>
				
			<div
			class="admin_menu_manage" 
			onclick="location.href='${pageContext.request.contextPath}/admin/static.do'" class="list-group-item-warning"
			>
			<div class="emoji">📊</div>
			<a type="button">통계관리</a>
			</div>
			
			<div
			class="admin_menu_manage" 
			onclick="location.href='${pageContext.request.contextPath}/admin/askList.do?currentPage=1'" class="list-group-item-info"
			>
			<div class="emoji">📨</div>
			<a type="button">문의관리</a>
			</div>
			
			<div
			class="admin_menu_manage" 
			onclick="location.href='${pageContext.request.contextPath}/admin/service.do'" class="list-group-item-primary"
			>
			<div class="emoji">⏰</div>
			<a type="button">서비스관리</a>
			</div>
			
			<div
			class="admin_menu_manage" 
			onclick="location.href='${pageContext.request.contextPath}/admin/category.do'" class="list-group-item-danger"
			>
			<div class="emoji">🧺</div>
			<a type="button">카테고리관리</a>
			</div>
		
		</div>
	</div>
	     <jsp:include page="../common/footer.jsp"></jsp:include>
	
	
</body>
</html>