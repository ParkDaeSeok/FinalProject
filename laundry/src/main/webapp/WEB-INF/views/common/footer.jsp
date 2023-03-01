<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
      integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc"
      crossorigin="anonymous"
    />

<title>footer</title>
<style>
  /*----------------footer------------------*/
  .section_footer{
  	z-index: 100;
  }
  	ul li{
  		list-style: none;
  	}
  
      .footer2 {
    	  background: rgb(0 0 0 / 73%);
        color: white;
        display: flex;
        justify-content: space-around;
     
   		     width: 100%;
      }
      .footer2 .logo_name {
       font-size: 2rem;
        font-family: "Gugi", cursive;
        align-self: center;
        cursor: pointer;
      }
      
       .logo_name span{
       font-family: "Gugi", cursive;
      }

      .footer2_desc {
        padding: 3rem;
        font-size: 13px;
      }

      .footer2_socialmedia {
        width: 300px;
        align-self: center;
        text-align: center;
      }

      .footer2_socialmedia i {
        color: white;
        padding: 0.8rem;
        font-size: 1.3rem;
        align-items: center;
      }

</style>
</head>
<body>

      <section class="section_footer">

        <div class="footer2">
           <div class="logo_name" onclick="location.href='${pageContext.request.contextPath}/'"><span style="color: skyblue">빨래</span>를부탁해</div>
          <div class="footer2_desc">
            <p>
              사업자번호: 000-00-000000 대표: 4조 (0000) 서울특별시 영등포구
              <br />
              전화: 02) 000-0000 팩스: 02)000-0000 이메일: support@gmail.com
              <br />
            </p>
          </div>
          <div class="footer2_socialmedia">
            <a href="/"><i class="social fab fa-facebook-square"></i></a>
            <a href="/"><i class="social far fa-envelope"></i></a>
            <a href="/"><i class="social fab fa-instagram"></i></a>
            <a href="/"><i class="social fab fa-github"></i></a>
          </div>
        </div>
      </section>
 
</body>
</html>