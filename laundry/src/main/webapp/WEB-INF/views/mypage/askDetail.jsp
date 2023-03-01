<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../common/util.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <style>
    
    
  
    html, body {
    	height: 100%;
    }
    
      .mypage_container {
        width: 60%;
        margin: 0rem auto;
		padding: 1.5rem;
        position: relative;
      }
      
   
      .mypage_content {
     
      	margin: 0 auto;
        width:80%;
        
      }
      
      .mypage_content h2{
      	text-align: center;
      	font-weight: bold;
      	margin-bottom: 3rem;
      }
      #askdetail-table{
      	margin: 1rem 0rem;
      	width: 90%;
  	  margin: auto;
      
      }
      
       #askdetail-table th,
        #askdetail-table td {
        text-align: center;
       }

       .askTitle{

        display: flex;
        justify-content: space-around;
        margin: 1rem auto;
        width: 90%;
       }
       .askTitle-title{
       flex :1;
       }
       .askTitle-title,
       .askContent_title{
       font-weight: bold;
     
       font-size: 1.4rem;
       }
       .askTitle_detail{
       flex:3;
       text-align: left;
       margin-left: 1rem;
       align-self:center;
       }
       .askContent{
           margin: 1rem auto;
        width: 90%;
       }
       
       .askContent_title{
       	margin: 1rem 0rem;
       }
       .askContent_detail{
       display: flex;
 	   justify-content: space-between;
       }
       
       .askContent_detail div{
        align-self: center;
       }
       
       
        .askContent_detail .contents{
         flex: 3;
         
         height: 150px;
	  border: 1px solid #e2e2e2;
	    border-radius: 5px;
	    padding: 1rem;
        }
        .askPic img{
        	width: 200px;
        	height: 150px;
        }
          .askContent_detail .askPic{
          flex:1;
          text-align: center;
          }
       .askAnwser{
           margin: 1rem auto;
        width: 90%;
       }
       
       .askAnswer_title{
          font-weight: bold;
     
       font-size: 1.4rem;
       }
       
       .askAnwser_title_date{
       text-align: right;
    font-size: 1.1rem;
    margin-right: 1rem;
       
       }
       
       .askAnswer_content{
       margin: 1rem 0rem; 
       padding: 1rem;
       border: 1px solid #e2e2e2;
   		 border-radius: 5px;
   		     min-height: 150px;
       }
    </style>
    <title>문의 상세내역</title>
  </head>
  <body>
    <jsp:include page="../common/manubar.jsp"></jsp:include>

    <div class="outer">
      <jsp:include page="./common/sideMenuBar.jsp"></jsp:include>

       <div class="mypage_container">
    
        <div class="mypage_content">
        	
	      	  <h2> 문의 내역 상세조회</h2>

    <table id="askdetail-table" class="table table-striped">
        <thead>
            <tr>
                <th>문의번호</th>
                <th>문의날짜</th>
                <th>유형</th>
            </tr>
        </thead>
         <tbody>
             <tr>
                <td>${ask.askNum }</td>
                <fmt:parseDate value="${ask.askDate }" var="adate" pattern="yyyy-MM-dd"/>
				<td><fmt:formatDate value="${ adate }" type="date" dateStyle="long"/> </td>
                <td>${ask.askType }</td>
             </tr>
         </tbody>
    </table>


     <div class="askTitle">
         <div class="askTitle-title"> 제목</div> 
         <div class="askTitle_detail">
             ${ask.askTitle}
         </div>
     </div>
     <div class="askContent">
         <div class="askContent_title">내용</div>
         <div class="askContent_detail">
             <div class="contents">
				${ask.askContent }
             </div>
             <c:if test="${ ask.changeName != null }">
	             <div class="askPic">
	             	<img src="${ pageContext.request.contextPath }/${ ask.filePath }${ ask.changeName }"/>
	             </div>
             </c:if>
         </div>
     </div>

     <div class="askAnwser">
         <div class="askAnswer_title">
            <div>답변</div>
            <c:if test="${ ask.ansContent != null }">
            <div class="askAnwser_title_date">
                <fmt:parseDate value="${ask.ansDate }" var="andate" pattern="yyyy-MM-dd"/>
				
               	답변날짜 : <fmt:formatDate value="${ andate }" type="date" dateStyle="long"/>
            </div>
            </c:if>
         </div>
         <div class="askAnswer_content">
         	<c:choose>
         		<c:when test="${ ask.ansYn == 'N' }">답변이 등록되지 않았습니다.</c:when>
         		<c:otherwise>${ask.ansContent}</c:otherwise>
			</c:choose>
         </div>

     </div>
        </div>
 
      </div>
    </div>

    
					   

    
  </body>
  
  
	</html>
