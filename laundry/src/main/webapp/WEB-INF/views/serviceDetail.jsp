<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="./common/util.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>service detail</title>

    <style>
      body {
        margin: 0;
      }

      .section {
        height: auto;
      }
	  .section1{
		position: relative;
	  }
	
      .section1_img {
        background-image: url("./resources/image/door.jpg");
        background-size: cover;
        position: relative;
        height: 700px;
      }

      .section1_word {
        position: absolute;
        top: 55%;
        right: 8%;
        width: 500px;
        font-size: 1.5rem;
      }
      .section1_word div {
        font-weight: bold;
        font-size: 2rem;
      }

      .section2 {
        height: 400px;
      }
      .section2_bagimg {
        height: 100px;
        position: relative;
      }

      .section2_bagimg img {
        height: 355px;
        margin-left: 70%;
        margin-top: 11%;
      }

      .section2_word {
        font-size: 1.5rem;
        text-align: center;
        position: absolute;
        width: 100%;
      }

      #section2_word_title {
        font-weight: bold;
        font-size: 2rem;
        padding-bottom: 0.5rem;
      }

      .section3 {
        background: #d3d3d336;
        padding: 3rem 1rem;
        height: auto;
      }

      .section3_word {
        margin-top: 4.5rem;
        margin-bottom: 3.8rem;
        font-weight: normal;
        line-height: 1;
        font-size: 1.3rem;
        width: 500px;
        margin-left: 3rem;
      }

      .section3_word div {
        font-size: 2rem;
        font-weight: bold;
        margin-bottom: 1rem;
      }
      .section3_reserve_subscribe {
        display: flex;
        justify-content: space-between;
        width: 90%;
        margin: auto;
      }

      .section3 table {
        margin-top: 2rem;
        margin-bottom: 2rem;
        width: 90%;
        margin: auto;
        text-align: center;
      }
      .section3_reserve,
      .section3_subscribe {
        width: 540px;
      }

      .section3_reserve_word,
      .section3_subscribe_word {
        width: 490px;
        padding: 1rem;
        margin-left: 1rem;
        font-size: 0.9rem;
        margin-bottom: 2rem;
      }

      .section3_reserve_word div,
      .section3_subscribe_word div {
        font-weight: bold;
        padding: 1rem 0rem;
        font-size: 1rem;
      }

      .section4 {
        position: relative;
      }

      .section4_img {
        background-image: linear-gradient(
            rgba(0, 0, 0, 0.3),
            rgba(0, 0, 0, 0.4)
          ),
          url("./resources/image/delivery.jpg");

        height: 650px;
        background-size: cover;
      }

      .section4_word div {
        font-weight: bold;
        font-size: 3rem;
      }

      .section4_word {
        margin: 10rem;
        position: absolute;
        top: 0%;
        color: white;
        font-size: 1.5rem;
        width: 450px;
        margin-top: 12rem;
      }
    </style>
  </head>
  <body>

    <section class="section section1">
        <jsp:include page="./common/manubar.jsp"></jsp:include>
      <div class="section1_img"></div>
      <div class="section1_word">
        <div>????????? ?????? ?????????</div>
        ????????? ?????? ???????????? ????????????! ????????? ??? ????????? ??? ?????? ????????????. ?????????
        ????????? ????????? ???????????????.
      </div>
    </section>
    <section class="section section2">
      <div class="section2_bagimg">
        <img alt="bag" src="./resources/image/bag.png" />
      </div>
      <div class="section2_word">
        <p id="section2_word_title">
          ????????? ????????? ?????? ?????????, <b>????????????</b>
        </p>
        <div>
          ??????????????? ?????? ?????? ???????????? ??????????????? ??? ?????? ???????????? ?????? ???!<br />
          ???????????? ?????? ???????????? ???????????????.
        </div>
      </div>
    </section>
    <section class="section section3">
      <div class="section3_img"></div>
      <div class="section3_word">
        <div>???????????? ??????</div>
        ????????? ???????????? ?????? ????????? ???????????? ???????????? ?????? ???????????? ????????? ??????
        ???????????? ???????????? ????????? ?????? ????????? ???????????? ????????? ???????????? ??????
        ???????????????.
      </div>
      <div class="section3_reserve_subscribe">
        <div class="section3_reserve">
          <div class="section3_reserve_word">
            <div>?????? ?????????</div>
            ?????? ????????? ????????? ????????? ??????, ????????????????????? ????????? ????????????
            ????????? ?????????. ?????? ?????? ????????? ?????? ?????????????????? ????????? ???????????????.
          </div>
          <table class="table table-bordered table-sm">
            <thead>
              <th>??????</th>
              <th>??????</th>
            </thead>
            <tbody>
              <tr>
                <td colspan="2">????????????(?????????+??????)</td>
              </tr>
              <tr>
                <td>????????????(10L)</td>
                <td>3300???</td>
              </tr>
              <tr>
                <td>????????????(30L)</td>
                <td>9900???</td>
              </tr>
              <tr>
                <td colspan="2">?????????</td>
              </tr>
              <tr>
                <td>?????????,????????????</td>
                <td>9000???</td>
              </tr>
              <tr>
                <td>????????????</td>
                <td>10000???</td>
              </tr>
              <tr>
                <td>???????????????,??????</td>
                <td>15000???</td>
              </tr>
              <tr>
                <td>?????????</td>
                <td>3000???</td>
              </tr>
              <tr>
                <td>??????</td>
                <td>10000???</td>
              </tr>
              <tr>
                <td colspan="2">??????</td>
              </tr>
              <tr>
                <td>?????????</td>
                <td>10000???</td>
              </tr>
              <tr>
                <td>??????,??????</td>
                <td>7000???</td>
              </tr>
              <tr>
                <td>??????,??????</td>
                <td>15000???</td>
              </tr>
              <tr>
                <td>????????????</td>
                <td>20000???</td>
              </tr>
              <tr>
                <td colspan="2">??????????????????</td>
              </tr>
              <tr>
                <td>?????????</td>
                <td>2000???</td>
              </tr>
              <tr>
                <td>?????????,??????</td>
                <td>4000???</td>
              </tr>
              <tr>
                <td>??????,?????????</td>
                <td>4000???</td>
              </tr>
              <tr>
                <td>??????</td>
                <td>3500???</td>
              </tr>
              <tr>
                <td>??????,??????</td>
                <td>5000???</td>
              </tr>
              <tr>
                <td>??????</td>
                <td>12000???</td>
              </tr>
              <tr>
                <td>??????</td>
                <td>15000???</td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="section3_subscribe">
          <div class="section3_subscribe_word">
            <div>?????? ?????????</div>
            ?????? ????????? ?????? ?????? ????????? ???????????? ?????? ???????????????. ?????? ?????????
            ?????? ???????????? ???????????? ??? ??? ?????? ????????? ???????????????..
          </div>
          <table class="table table-bordered table-sm">
            <thead>
              <th>??????</th>
              <th>??????</th>
            </thead>
            <tbody>
              <tr>
                <td colspan="2">????????????(?????????+??????)</td>
              </tr>
              <tr>
                <td>????????????(10L)</td>
                <td>3300???</td>
              </tr>
              <tr>
                <td>????????????(30L)</td>
                <td>9900???</td>
              </tr>
              <tr>
                <td colspan="2">?????????</td>
              </tr>
              <tr>
                <td>?????????,????????????</td>
                <td>9000???</td>
              </tr>
              <tr>
                <td>????????????</td>
                <td>10000???</td>
              </tr>
              <tr>
                <td>???????????????,??????</td>
                <td>15000???</td>
              </tr>
              <tr>
                <td>?????????</td>
                <td>3000???</td>
              </tr>
              <tr>
                <td>??????</td>
                <td>10000???</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </section>
    <section class="section section4">
      <div class="section4_img"></div>
      <div class="section4_word">
        <div>?????? ??????</div>
        ????????? ?????? ????????? 3??? ??? ????????? ??? ????????? ????????? ????????? ???????????????.
      </div>
    </section>
    <jsp:include page="./common/footer.jsp"></jsp:include>
  </body>
  <script>
  	$(function(){
  		
  		$(".footer2").css("background", "smokeWhite");
  	})
  	
  </script>
</html>
