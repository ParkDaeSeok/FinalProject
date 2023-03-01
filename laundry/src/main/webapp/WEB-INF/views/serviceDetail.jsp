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
        <div>스마트 세탁 서비스</div>
        누워서 하는 스마트한 눕방빨래! 잠자기 전 빨래를 문 앞에 놔주세요. 그러면
        저희가 알아서 해결합니다.
      </div>
    </section>
    <section class="section section2">
      <div class="section2_bagimg">
        <img alt="bag" src="./resources/image/bag.png" />
      </div>
      <div class="section2_word">
        <p id="section2_word_title">
          내방안 스마트 세탁 돌보미, <b>빨래가방</b>
        </p>
        <div>
          핸드폰으로 빨래 예약 신청하고 빨래가방을 문 앞에 내놓으면 빨래 끝!<br />
          스마트한 세탁 서비스를 시작하세요.
        </div>
      </div>
    </section>
    <section class="section section3">
      <div class="section3_img"></div>
      <div class="section3_word">
        <div>합리적인 가격</div>
        라이프 스타일에 맞게 세탁을 구독하고 얽매이지 않고 자유롭게 맡기고 어떤
        요금제를 선택하든 알뜰한 일상 월정액 서비스는 할인된 금액으로 이용
        가능합니다.
      </div>
      <div class="section3_reserve_subscribe">
        <div class="section3_reserve">
          <div class="section3_reserve_word">
            <div>예약 서비스</div>
            예약 이용은 맡기는 횟수와 품목, 세탁물의양만큼 요금이 부과되는
            서비스 입니다. 안심 정찰 가격에 의해 투명하게세탁 요금이 계산됩니다.
          </div>
          <table class="table table-bordered table-sm">
            <thead>
              <th>분류</th>
              <th>가격</th>
            </thead>
            <tbody>
              <tr>
                <td colspan="2">생활빨래(물빨래+셔츠)</td>
              </tr>
              <tr>
                <td>생활빨래(10L)</td>
                <td>3300원</td>
              </tr>
              <tr>
                <td>생활빨래(30L)</td>
                <td>9900원</td>
              </tr>
              <tr>
                <td colspan="2">침구류</td>
              </tr>
              <tr>
                <td>홑이불,이불패드</td>
                <td>9000원</td>
              </tr>
              <tr>
                <td>일반이불</td>
                <td>10000원</td>
              </tr>
              <tr>
                <td>극세사이불,토퍼</td>
                <td>15000원</td>
              </tr>
              <tr>
                <td>커버류</td>
                <td>3000원</td>
              </tr>
              <tr>
                <td>베개</td>
                <td>10000원</td>
              </tr>
              <tr>
                <td colspan="2">신발</td>
              </tr>
              <tr>
                <td>운동화</td>
                <td>10000원</td>
              </tr>
              <tr>
                <td>구두,로퍼</td>
                <td>7000원</td>
              </tr>
              <tr>
                <td>워커,부츠</td>
                <td>15000원</td>
              </tr>
              <tr>
                <td>어그부츠</td>
                <td>20000원</td>
              </tr>
              <tr>
                <td colspan="2">드라이크리닝</td>
              </tr>
              <tr>
                <td>셔츠류</td>
                <td>2000원</td>
              </tr>
              <tr>
                <td>맨투맨,후드</td>
                <td>4000원</td>
              </tr>
              <tr>
                <td>니트,스웨터</td>
                <td>4000원</td>
              </tr>
              <tr>
                <td>바지</td>
                <td>3500원</td>
              </tr>
              <tr>
                <td>자켓,점퍼</td>
                <td>5000원</td>
              </tr>
              <tr>
                <td>코트</td>
                <td>12000원</td>
              </tr>
              <tr>
                <td>패딩</td>
                <td>15000원</td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="section3_subscribe">
          <div class="section3_subscribe_word">
            <div>구독 서비스</div>
            예약 서비스 가격 보다 할인된 금액으로 이용 가능합니다. 생활 패턴에
            맞는 요금제를 선택하여 한 달 빨래 고민을 해결하세요..
          </div>
          <table class="table table-bordered table-sm">
            <thead>
              <th>분류</th>
              <th>가격</th>
            </thead>
            <tbody>
              <tr>
                <td colspan="2">생활빨래(물빨래+셔츠)</td>
              </tr>
              <tr>
                <td>생활빨래(10L)</td>
                <td>3300원</td>
              </tr>
              <tr>
                <td>생활빨래(30L)</td>
                <td>9900원</td>
              </tr>
              <tr>
                <td colspan="2">침구류</td>
              </tr>
              <tr>
                <td>홑이불,이불패드</td>
                <td>9000원</td>
              </tr>
              <tr>
                <td>일반이불</td>
                <td>10000원</td>
              </tr>
              <tr>
                <td>극세사이불,토퍼</td>
                <td>15000원</td>
              </tr>
              <tr>
                <td>커버류</td>
                <td>3000원</td>
              </tr>
              <tr>
                <td>베개</td>
                <td>10000원</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </section>
    <section class="section section4">
      <div class="section4_img"></div>
      <div class="section4_word">
        <div>새벽 배송</div>
        모바일 수거 신청시 3일 뒤 회원님 문 앞으로 깨끗한 빨래가 배송됩니다.
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
