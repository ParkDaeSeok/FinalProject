<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
   <%@ include file="../common/util.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>로그인</title>
    <style>
    
    	html, body{
    	height: 100%;
    }
      .login_container {
        padding: 2rem 2rem 5rem 2rem;
        heigth: 100%;
        position: relatvie;
       
      }

      .login_form_container {
        padding: 1.5rem 2.5rem 0rem 2.5rem;
      }

      .login_form_container th {
      	text-align: center;
       padding-right: 1rem;
      }
      
      .login_form_container td input{
      	width: 195px;
      }

      .login_btns {
        padding: 1rem;
      }
      .login_btns button {
        width: 70px;
      }
      .bottomLogin {
        display: flex;
        font-size: 11px;
        justify-content: space-between;
        width: 325px;
        margin: 1rem auto;
      }
      .bottomLogin a {
        display: block;
        font-weight: bold;
        font-size: 0.8rem;
      }
    </style>
  </head>
  <body>
    <%@ include file="../common/manubar.jsp" %>

    <div class="login_container">
      <h2 style="text-align: center; font-weight: bold; margin-top: 1rem">
        WELCOME
      </h2>
      <div class="login_form_container" align="center">
        <form action="login.do" method="post">
          <table>
            <tr>
              <th>아이디</th>
              <td><input type="text" name="memId" required /></td>
            </tr>
            <tr>
              <th>비밀번호</th>
              <td><input type="password" name="memPwd" required /></td>
            </tr>
          </table>
          <div class="login_btns" align="center">
            <button class="btn btn-primary btn-sm" type="submit">로그인</button>
          </div>
        </form>
      </div>
      <div align="center" class="bottomLogin">
        <a href="register.do">계정이 아직 없으신가요? Click!</a>
        <a href="findId.do">아이디/비밀번호 찾기</a>
      </div>
      
    </div>
     <jsp:include page="../common/footer.jsp"></jsp:include>
  </body>
  <script>
  	$(function(){
  		$(".section_footer").css("position","absolute");
  		$(".section_footer").css("bottom",0);
  		$(".section_footer").css("width","100%");
  		
  	})
  	
  
  </script>

</html>
