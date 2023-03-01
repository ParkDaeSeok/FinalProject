<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />

    <title>main</title>
    <style>
      html,
      body {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        color: white;
      }
      ul {
        padding: 0;
      }
      ul li {
        list-style: none;
      }
      .nav > ul > li {
        color: white important!;
      }

      .main1 {
        background-image: linear-gradient(
            rgba(0, 0, 0, 0.3),
            rgba(0, 0, 0, 0.4)
          ),
          url("./resources/image/laundry.jpg");
        background-size: cover;
        position: relative;
      }
      .main2 {
        /* background-image: url("./resources/image/laundry2.jpg"); */
        background-color: black;
        background-size: cover;
      }
      .main3 {
        background-image: linear-gradient(
            rgba(0, 0, 0, 0.3),
            rgba(0, 0, 0, 0.4)
          ), url("./resources/image/laundry3.jpg");
        background-size: cover;
      }
      .main4 {
     	       background-image: linear-gradient( rgb(254 254 254 / 11%), rgb(255 255 255 / 14%) ), url("./resources/image/laundry7.jpg");
       		 background-size: cover;
      }
      .main5{
              background-image: linear-gradient(
            rgba(0, 0, 0, 0.3),
            rgba(0, 0, 0, 0.4)
          ), url("./resources/image/laundry4.jpg");
        background-size: cover;
      }
      .btn_down {
        position: absolute;
        font-size: 0.8rem;
        bottom: 30px;
        right: 50%;
        cursor:pointer;
      }
      .btn_down img {
        display: block;
        margin: auto;
        margin-top: 8px;
      }

      .main1 #word {
        text-align: center;
        margin: auto;
        width: 800px;
      }
      #fullpage {
        visibility: visible;
      }
      #word {
        font-size: 3rem;

        font-weight: bold;
        z-index: 100;
      }
      .ani_fadeIn {
        animation: fade_in 2s;
      }
      @keyframes fade_in {
        0% {
          opacity: 0;
          transform: translateY(150px);
        }

        100% {
          opacity: 1;
          transform: translateY(0px);
        }
      }

      .slide-container {
        font-size: 3rem;
        background-color: rgba(245, 245, 245, 0.24);
        width: 80%;
        height: 80%;
        margin: auto;
      }
      .slide-title {
        text-align: center;
      }

      .fp-controlArrow.fp-prev {
        left: 60px;
      }
      .fp-controlArrow.fp-next {
        right: 60px;
      }

      /*---------------section 2------------------*/
      .main2_desc {
        font-size: 2.5rem;
        padding: 0rem 0rem 0rem 4rem;
		margin-top: 12rem;
        font-weight: normal;
        font-family: "Nanum Brush Script", cursive;
      }
      .main2_desc span {
         font-family: "Nanum Brush Script", cursive;
         margin-left: 8rem;
      }
      .service_container {
        display: flex;

        justify-content: center;
        font-size: 1rem;
        font-weight: normal;
		margin: 0;
        margin-top: 1rem;
      }
		#main2_word{
		
		display: flex;
	    flex-direction: column;
	    justify-content: space-between;
	    height: 100%;
		}
      .service {
        cursor: pointer;
        position: relative;
        transition: 1s;
        width:100%;
      }

      .service_img {
        background-size: cover;
        min-width: 430px;
        height: 250px;
        position: relative;
      }

      .service1 {
        background-image: linear-gradient(
            rgba(0, 0, 0, 0.3),
            rgba(0, 0, 0, 0.4)
          ),
          url("./resources/image/service1.jpg");
      }
      .service2 {
        background-image: linear-gradient(
            rgba(0, 0, 0, 0.3),
            rgba(0, 0, 0, 0.4)
          ),
          url("./resources/image/service2.jpg");
      }
      .service3 {
        background-image: linear-gradient(
            rgba(0, 0, 0, 0.3),
            rgba(0, 0, 0, 0.4)
          ),
          url("./resources/image/service3.jpg");
      }
      .service_content {
        position: absolute;
        bottom: 1.5rem;
        right: 4%;
        color: white;
        margin: auto;
    	width: 90%;
      }
      .service_title {
        font-size: 1.5rem;
        padding: 0.5rem;
        font-weight: bold;
        position: absolute;
        top: -3rem;
      }
      .service_desc {
        padding: 0.5rem;
        height: 70px;
	    font-size: 0.9rem;
	    width: 75%;
	   
      }
      .service_container  li:hover {
        filter: brightness(60%);
      }
      .goto_detail {
        padding: 0.5rem;
        border: 1px solid #fff;
        font-size: 0.857rem;
        font-weight: 500;
        text-transform: capitalize;
        width: 120px;
        margin-top: 5px;
        margin-left: 0.5rem;
        font-weight: bold;
        visibility: hidden;
        opacity: 0;
        transition: all 1s;
      }
      /*---------------section 3------------------*/

      .main3 #word {
        display: flex;
        width: 80%;
        margin: auto;
        margin-left: 8rem;
        margin-top: 2.6rem;
        font-weight: 400;
        justify-content: space-between;
      }

      #word1 {
        font-size: 3rem;
      }

      #word2 {
       
        width: 500px;
    	font-weight: normal;
    	font-size: 1.2rem;
      }

       /*---------------section 4------------------*/
      /*-----------------reviews------------------------*/
      .review_container {
        position: relative;
        color: black;
      }
      .btn_left,
      .btn_right {
        font-size: 2rem;
        font-weight: bold;
        align-self: center;
        z-index: 1000;
        position: absolute;
        top: 40%;
        cursor: pointer;
      }
      .btn_left {
        left: 3rem;
        top: 40%;
      }
      .btn_right {
        right: 3rem;
      }
      .btn_left button,
      .btn_right button {
       
        background: none;
        border: none;
        font-size: 2.5rem;
        cursor: pointer;

      }
     .btn_left button:hover,
      .btn_right button:hover{
      transform: scale(1.1);
      }
      
      .btn_left img,
      .btn_right img {
        cursor: pointer;
      }

      .review_list_container {
        display: flex;
        width: 1024px;
        margin: auto;
        overflow: hidden;
      }

      .review_list {
        display: flex;
        overflow: unset;
        padding: 1rem 0;
        margin: 0;
        max-width: 95%;
      }
      .arrow_box {
        padding: 0.5rem;
        border-radius: 0.4em;
        position: relative;
        background: #ffffff;
        border: 2px solid #2d3438;
        height: 300px;
        position: relative;
      }
      .arrow_box:after,
      .arrow_box:before {
        top: 100%;
        left: 50%;
        border: solid transparent;
        content: "";
        height: 0;
        width: 0;
        position: absolute;
        pointer-events: none;
      }

      .arrow_box:after {
        border-color: rgba(255, 255, 255, 0);
        border-top-color: #ffffff;
        border-width: 14px;
        margin-left: -14px;
      }
      .arrow_box:before {
        border-color: rgba(45, 52, 56, 0);
        border-top-color: #2d3438;
        border-width: 17px;
        margin-left: -17px;
      }
      .review_card {
        margin: 0 1rem;
        flex-shrink: 0;
        max-width: 290px;
        min-width: 290px;
      }
      .review_upper {
        display: flex;
      }

      .review_rate {
        font-size: 2rem;
        line-height: 70px;
        width: 120px;
        text-align: center;
      }

      .review_title {
        font-weight: bold;
        font-size: 1rem;
      }

      .review_content {
        margin-top: 0.8rem;
        height: 145px;
        font-size: 0.8rem;
        
      }

      .review_detail span {
        font-size: 3rem;
        font-family: "IM Fell English SC", serif;
        line-height: 29px;
        display: inline-block;
      }
      .review_writer {
        text-align: center;
        font-size: 1.5rem;
        margin-top: 1rem;
        width: 100%;
        font-weight: bold;
      }
      .review_date {
        font-size: 0.6rem;
      }
      .review_img{
      	margin-top: 0.5rem;
      	position: absolute;
  		 bottom: 0.5rem;
  		width: 96%;
  		text-align: center;
      }
      .review_img img{
     
      	height: 100px;
      	padding: 0.1rem;

      
      }

    /*---------------section 5------------------*/
    
    
        .main5_word{
    	text-align: end;
    	margin-right: 7rem;
    	font-size: 2.5rem;
    	}
      .main5_btns{
       text-align: end;
       margin-top: 3rem;
       margin-right: 7rem;
       margin-bottom: 3rem;
       
        
       }
      .main5_btns a{
        border: 2px solid white;
        padding: 0.5rem 1rem;
        border-radius: 30px;
        font-size: 1rem;
        color: white;
        margin: 0.5rem;
        font-weight: bold;
        text-decoration: none;
      }
      
      .main5_btns a:hover{
      	background: white;
      	color: black;
      }

   </style>

    <link
      href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Gugi&display=swap"
      rel="stylesheet"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script
      type="text/javascript"
      src="<c:url value='/resources/jquery.fullPage.js'/>"
    ></script>

    <link
      rel="stylesheet"
      type="text/css"
      href="<c:url value='/resources/jquery.fullPage.css'/>"
    />
  </head>
  <body>
    <div class="outer">
      <jsp:include page="./common/manubar.jsp"></jsp:include>

      <div id="fullpage">
        <div class="section main1" >
          <div id="word" class="ani_fadeIn">
            <p
              style="
                text-decoration: underline;
                font-size: 1rem;
                font-weight: normal;
              "
            >
              LAUNDRY
            </p>

            <span> 삶에 지친 당신의 어깨의 <br />짐을 덜어주고자 </span><br />

            <p
              style="
                width: 350px;
                font-size: 1.7rem;
                font-weight: normal;
                margin: auto;
                padding-top: 15px;
                font-family: 'Nanum Brush Script';
              "
            >
              우리는 계속 고민했었습니다. <br />단, 20분이라도 당신이 편안하게
              <br />
              쉴 수 있다면
            </p>
          </div>
          <span class="btn_down" onclick="location.href='/laundry/#page2'">
            SCROLL
            <img
              src="<c:url value='/resources/image/scroll_down.png'/>"
              alt="다음페이지 이동"
              class="scroll_down_img"
            />
          </span>
        </div>
        <div class="section main2">
          <div id="main2_word">
            <div class="main2_desc">
            
                "그 빨래 저희한테 주세요~ <br /> <span>저희가 깨끗이 빨아 드릴께요"</span>
            </div>
       
            <ul class="service_container">
              <li class="service indivi" onclick="location.href='${pageContext.request.contextPath }/reserve/apply.rs'">
                <div class="service_img service1">
                  <div class="service_content">
                    <div class="service_title">생활빨래</div>
                    <div class="service_desc">
                      가방에 수건, 양말, 잠옷 같은 빨랫감을 담아주시면 단독 물세탁하고 보송하게 개어 드립니다. 
                    </div>
                    <div class="goto_detail">더보기 -----></div>
                  </div>
                </div>
              </li>
              <li class="service indivi" onclick="location.href='${pageContext.request.contextPath }/subscribe/sub.sb'">
                <div class="service_img service2">
                  <div class="service_content">
                    <div class="service_title">구독서비스</div>
                    <div class="service_desc">
                   		우리집 스마트 빨래 수거함
						모바일로 빨래 수거 신청하고 빨래를부탁해 가방을 문 앞에 내놓으면 빨래 끝!
						비대면 세탁 서비스를 시작하세요.
                    </div>
                    <div class="goto_detail">더보기 -----></div>
                  </div>
                </div>
              </li>
              <li class="service indivi" onclick="location.href='${pageContext.request.contextPath }/reserve/apply.rs'">
                <div class="service_img service3">
                  <div class="service_content">
                    <div class="service_title">수선서비스</div>
                    <div class="service_desc">
                    각종 명품 의류 뿐만 아니라, 소도매 작은 시장의 옷들까지
모든 의류를 아이템으로 하는 맞춤 수선을 전문으로 하는 공간입니다.
                    </div>
                    <div class="goto_detail">더보기 -----></div>
                  </div>
                </div>
              </li>
            </ul>
        
          </div>
        </div>
        <div class="section main3" data-anchor="page2">
          <div id="word">
            <div id="word1">
              빨래 없는 생활의 시작, 
                <div class="logo" style="font-size: 2.8rem">빨래를부탁해</div>
            </div>
            <div id="word2">
              빨래를부탁해를 경험한다는 것은 <br>
              편리하고 스마트한 세탁 서비스를 시작으로 <br>
               빨래 없는 생활의 여유를 누리고 일상에 가치를 더하는 것 <br><br>
              이제 빨래는 빨래를부탁해에 맡기고  <br>소중한 사람들과 행복하고
              의미있는<br>시간을 보냈으면 좋겠습니다.
            </div>
          </div>
        </div>
        <div class="section main4">
        
        	<h3 style="    color: black; font-size: 2rem; margin-left: 3rem; margin-top: 5rem; text-align:center;"><span style="font-family: Gugi, cursive;">빨래를부탁해 </span>후기</h3>
          <div class="review_container">
            <div class="btn_left">
              <button id="slide-prev">
         		     ⬅️ 
              </button>
            </div>
            <div class="btn_right">
              <button id="slide-next" disabled>
                ➡️
              </button>
            </div>
            <div class="review_list_container">
              <ul class="review_list" id="review_list" data-position="0">
                <c:forEach var="i" items="${revList}">
                  <li id="li_review" class="review_card">
                    <div class="arrow_box">
                      <div class="review_upper">
                        <c:choose>
                          <c:when test="${i.rate eq '만족' }">
                            <div class="review_rate">😃</div>
                          </c:when>
                          <c:when test="${i.rate eq '보통' }">
                            <div class="review_rate">😐</div>
                          </c:when>
                          <c:otherwise>
                            <div class="review_rate">😟</div>
                          </c:otherwise>
                        </c:choose>

                        <div class="review_writer">
                          ${i.memId }
                          <fmt:parseDate
                            value="${i.revDate }"
                            var="redate"
                            pattern="yyyy-MM-dd"
                          />

                          <div class="review_date">
                            <fmt:formatDate
                              value="${ redate }"
                              type="date"
                              dateStyle="long"
                            />
                          </div>
                        </div>
                      </div>
                      <div class="review_content">
                        <div class="review_detail">
                          <!--   <span>“</span>-->
                          ${i.revContent }
                        </div>
                        <c:if test="${i.attNum gt 0 }">
                        <div class="review_img">
                        	<img alt="세탁" src="${ pageContext.request.contextPath }/${ i.filePath }${ i.changeName }">
                        </div>
                        </c:if>
                      </div>
                    </div>
                  </li>
                </c:forEach>
              </ul>
            </div>
          </div>
        
        </div>
         <div class="section main5">
         <div class="main5_word">
				잠들기 전 내놓으면 손 쉽게 빨래 끝!
				<div style="font-weight: bold; font-size: 2.8rem;">내 방안 스마트 세탁소, 빨래를부탁해</div>
         </div>
         <div class="main5_btns">
         <a href="${pageContext.request.contextPath}/serviceDetail.do">사용방법 보러가기</a>
         <a href="${pageContext.request.contextPath}/ask/chat.do">채팅하러 가기</a>
         </div>
         	<span>
           <jsp:include page="./common/footer.jsp"></jsp:include></span>
         </div>
   
      </div> <!-- fullpage.jsp -->
    </div>
    <script>
      $(function () {
    	  
    	  
    	$(".footer2").css({"position": "absolute", "bottom":"0px"}); 
        $(".nav > ul > li").css("color", "white");
        $("#noMain").css("display", "none");
        $(".menubar").css("background", "none");
        $(".menubar").mouseover(function () {
            $(".logo").css("padding-left", "1rem");
		 });

        $(".menubar").mouseleave(function () {
          $(".logo").css("padding-left", "0rem");
        });
        
        $(".menubar .nav > ul > li").mouseover(function () {
          $(this).css("color", "skyblue");

          $(this).mouseleave(function () {
            $(this).css("color", "white");
          });
        });
      });

      window.addEventListener("mousewheel", function () {
        $(".active").children().children().addClass("ani_fadeIn");
        $(".btn_down").removeClass("ani_fadeIn");
      });
      $(document).ready(function () {
        $("#fullpage").fullpage({
          //options here
          licenseKey: "OPEN-SOURCE-GPLV3-LICENSE",
          // autoScrolling: true,
          scrollHorizontally: true,
          anchors:['page1', 'page2', 'page3','page4','page5'],
          navigation: true,
          navigationPosition: "right",
          navigationTooltips: ["메인", "서비스", "소개", "후기", "이용방법"],
        });

        $(".service").each(function (index, item) {
          
          $(this).mouseenter(function () {
            $(this).children().children().children().eq(2).css({
              visibility: "visible",
              opacity: "100",
            });
          });
          $(this).mouseleave(function () {
           
            $(this).children().children().children().eq(2).css({
              visibility: "hidden",
              opacity: "0",
            });
          });
        });
      });
   
      // 리뷰 박스

      let slidePrev = document.getElementById("slide-prev");
      let slideNext = document.getElementById("slide-next");
      const reviewList = document.getElementById("review_list");
      const liList = document.querySelectorAll("#li_review");

      const slideLeftEvent = function () {
        let position = reviewList.getAttribute("data-position");

        if (reviewList.clientWidth < liList.length * 322 + Number(position)) {
         
          position = Number(position) - 322;
        

          $("#slide-next").attr("disabled", false);

  
        }
        reviewList.style.transform = "translateX(" + position + "px)";
        reviewList.setAttribute("data-position", position);
      };

      const slideRightEvent = function () {
        let position = reviewList.getAttribute("data-position");
        if (position < 0) {
          position = Number(position) + 322;
          if (position == 0) {
            $("#slide-next").attr("disabled", true);
            $("#slide-prev").attr("disabled", false);
          }
        }

        reviewList.style.transform = "translateX(" + position + "px)";
        reviewList.setAttribute("data-position", position);
      };

      slidePrev.addEventListener("click", slideLeftEvent);
      slideNext.addEventListener("click", slideRightEvent);
    </script>
  </body>
</html>
