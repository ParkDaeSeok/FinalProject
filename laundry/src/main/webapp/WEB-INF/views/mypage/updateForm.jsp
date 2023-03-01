<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../common/util.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <style>
    
        html, body {
    	height: 100%;
    	overflow:hidden;
    }
      .mypage_container {
        width: 80%;
        padding: 1.5rem;
      }
      .mypage_content {
        width: 60%;
        margin: auto;
        height: 50%;
        font-size: 0.8rem;
      }

      .form-group {
        margin-bottom: 0.3rem;
      }

      .form-group input,
      .form-group select {
        font-size: 0.8rem;
      }

      .mypage-btns {
        display: flex;
        justify-content: flex-end;
      }
      .mypage-btns button {
        margin-left: 0.5rem;
      }
    </style>
    <title>마이페이지</title>
  </head>
  <body>
    <jsp:include page="../common/manubar.jsp"></jsp:include>

    <div class="outer">
      <jsp:include page="./common/sideMenuBar.jsp"></jsp:include>

      <div class="mypage_container">
        <h4 align="center" style="font-weight: bold; padding: 1rem">
          내 계정 정보
        </h4>
        <div class="mypage_content">
          <form action="update.do" method="post">
            <input type="hidden" name="memNum" value="${loginUser.memNum }" />
            <div class="form-group">
              <div class="form-row">
                <div class="col" style="max-width: 200px">
                  <label> 이름</label>
                  <input
                    type="text"
                    class="form-control"
                    id="userName"
                    name="memName"
                    value="${ loginUser.memName }"
                    maxlength="6"
                  />
                </div>

                <div class="form-group" id="phone-form">
                  <label>휴대폰</label> <br />
                  <input type="hidden" name="phone" id="phone" />

                  <div class="form-row">
                    <div class="col form-group">
                      <select
                        class="form-control"
                        id="phone-front"
                        style="font-size: 0.8rem"
                        required
                      >
                        <option value="N">선택</option>
                        <option>010</option>
                        <option>011</option>
                        <option>016</option>
                      </select>
                    </div>

                    <label class="phone-dash">-</label>
                    <div class="col form-group">
                      <input
                        type="text"
                        class="form-control"
                        id="phone-mid"
                        value="${ p2}"
                        maxlength="4"
                      />
                    </div>
                    <label class="phone-dash">-</label>
                    <div class="col form-group">
                      <input
                        type="text"
                        class="form-control"
                        id="phone-back"
                        maxlength="4"
                        value="${p3}"
                      />
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="form-group" id="email-form">
              <label> 이메일</label> <br />

              <input type="hidden" id="email" name="email" />
              <div class="form-row">
                <div class="col form-group" style="max-width: 220px">
                  <input
                    type="text"
                    class="form-control"
                    id="email-front"
                    value="${e1 }"
                  />
                </div>
                <span id="email-at">@</span>
                <div class="col form-group">
                  <input
                    type="text"
                    class="form-control"
                    id="email-back"
                    maxlength="14"
                    value="${e2 }"
                  />
                </div>
              </div>
            </div>

            <div class="form-group">
              <div class="form-row">
                <div class="col form-group" style="max-width: 100px">
                  <label>주소</label>

                  <input type="hidden" name="address" id="addressCombined" />

                  <input
                    type="text"
                    id="postal"
                    name="post"
                    class="form-control"
                    value="${loginUser.post }"
                    placeholder="우편번호"
                  />
                </div>

                <div
                  class="col form-group"
                  style="align-self: end; max-width: 62px"
                >
                  <input
                    type="button"
                    class="btn btn-outline-primary"
                    id="postal-search"
                    value="검색"
                  />
                </div>
                <div class="col form-group" style="align-self: end">
                  <input
                    type="text"
                    id="address"
                    class="form-control"
                    placeholder="주소"
                    value="${a1 }"
                  />
                </div>
              </div>
            </div>
            <div class="form-group">
              <input
                type="text"
                id="detail-address"
                class="form-control"
                placeholder="상세 주소"
                value="${a2 }"
              />
            </div>

            <br />
            <div class="mypage-btns">
              <button
                type="submit"
                class="btn btn-primary btn-sm"
                id="submit"
                onclick="return update()"
              >
                업데이트
              </button>
              <button
                type="button"
                class="btn btn-danger btn-sm"
                onclick="history.back()"
              >
                뒤로가기
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
      function update() {
        //phone 합친값 -> controller
        $("#phone").val(
          $("#phone-front").val() +
            $("#phone-mid").val() +
            $("#phone-back").val()
        );

        //email 합친값 -> controller
        $("#email").val($("#email-front").val() + "@" + $("#email-back").val());

        //address 합친값 -> controller
        $("#addressCombined").val(
          $("#address").val() + $("#detail-address").val()
        );

        console.log($("#phone").val());
        console.log($("#email").val());
        console.log($("#addressCombined").val());

        return true;
      }

      $(function () {
        $("#email").val($("#email-front").val() + $("#email-back").val());
        console.log("phoneback ", $("#phone-back").val());
        console.log($("#phone").val());
        console.log($("#email-front").val());
        console.log($("#email-back").val());
        var selectedPhone = "${p1}";
        $("#phone-front option").each(function () {
          if ($(this).val() == selectedPhone) {
            $(this).attr("selected", true);
          }
        });
      });
      
      /* ---------- 주소 api ---------- */

      document
        .getElementById("postal-search")
        .addEventListener("click", function () {
          console.log("click!");
          new daum.Postcode({
            oncomplete: function (data) {
              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

              // 각 주소의 노출 규칙에 따라 주소를 조합한다.
              // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
              var addr = ""; // 주소 변수
              var extraAddr = ""; // 참고항목 변수

              //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
              if (data.userSelectedType === "R") {
                // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
              } else {
                // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
              }

              // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
              if (data.userSelectedType === "R") {
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
                  extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== "" && data.apartment === "Y") {
                  extraAddr +=
                    extraAddr !== ""
                      ? ", " + data.buildingName
                      : data.buildingName;
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if (extraAddr !== "") {
                  extraAddr = " (" + extraAddr + ")";
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                // document.getElementById("sample6_extraAddress").value = extraAddr;
              } else {
                // document.getElementById("sample6_extraAddress").value = "";
              }

              // 우편번호와 주소 정보를 해당 필드에 넣는다.
              document.getElementById("postal").value = data.zonecode;
              document.getElementById("address").value = addr;
              // 커서를 상세주소 필드로 이동한다.
              document.getElementById("detail-address").focus();
            },
          }).open();
        });
    </script>
  </body>
</html>
