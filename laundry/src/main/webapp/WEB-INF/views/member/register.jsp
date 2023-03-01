<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../common/util.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <title>회원가입</title>
    <style>
      #register_title {
        width: 100%;
        text-align: center;
        padding: 2rem;
        font-weight: bold;
        margin-top: 3rem;
      }
      #userIdAlert,
      #userPwdAlert {
        padding: 0.7rem;
      }
      #userIdAlert,
      #userPwdAlert,
      #emailAlert,
      #authCodeAlert,
      #phoneAlert,
      #refIdAlert {
        font-size: 0.7rem;
        font-weight: bold;
      }

      #register_form {
        margin-bottom: 5rem;
        width: 45%;
      }
    </style>
  </head>

  <body>
    <%@ include file="../common/manubar.jsp" %>

    <div
      class="row justify-content-center"
      style="background-color: rgb(248, 250, 255)"
    >
      <h2 id="register_title">회원가입</h2>
      <br /><br />
      <form
        action="${pageContext.request.contextPath }/member/insert.do"
        method="post"
        id="register_form"
      >
        <div class="form-group">
          <label>* 이름</label>
          <input
            type="text"
            class="form-control"
            id="userName"
            name="memName"
            maxlength="6"
            required
          />
        </div>
        <div class="form-row" id="id-form">
          <div class="col form-group">
            <label>* 아이디</label>
            <input
              type="text"
              class="form-control"
              id="userId"
              name="memId"
              required
            />
            <div id="userIdAlert"></div>
          </div>
        </div>

        <div class="form-row" id="pwd-form">
          <div class="col form-group">
            <label>* 비밀번호 </label>
            <input
              type="password"
              class="form-control"
              id="userPwd"
              name="memPwd"
              required
            />
            <div id="userPwdAlert"></div>
          </div>
          <div class="col form-group">
            <label>* 비밀번호 확인</label>
            <input
              type="password"
              class="form-control"
              id="pwdCheck"
              required
            />
          </div>
        </div>

        <div class="form-group" id="email-form">
          <label>* 이메일</label> <br />
          <input type="hidden" id="email" name="email" value="" />
          <div class="form-row">
            <div class="col form-group">
              <input
                type="text"
                class="form-control"
                id="email-front"
                required
              />
            </div>
            <span id="email-at">@</span>
            <div class="col form-group">
              <input
                type="text"
                class="form-control"
                id="email-back"
                maxlength="14"
                disabled
                required
              />
            </div>
            <div class="col form-group">
              <select class="form-control" id="email-select">
                <option value="X" selected>선택</option>
                <option value="gmail.com">gmail.com</option>
                <option value="naver.com">naver.com</option>
                <option value="daum.net">daum.net</option>
                <option value="1">직접 입력</option>
              </select>
            </div>
          </div>
          <div class="col form-group" id="emailAlert"></div>

          <div class="form-row">
            <div class="col form-group" style="max-width: 145px">
              <input
                type="button"
                class="btn btn-outline-primary"
                id="send_emailvali"
                value="인증번호 받기"
                onclick="emailValidate()"
                disabled
              />
            </div>
            <div class="col form-group" style="align-self: center">
              <input
                type="text"
                id="authCode"
                class="form-control"
                placeholder="코드번호"
                required
              />
            </div>
            <div
              class="col form-group"
              style="align-self: center"
              id="authCodeAlert"
            ></div>
          </div>
        </div>
        <div class="form-group" id="phone-form">
          <label>* 휴대폰번호</label> <br />

          <div class="form-row">
            <input type="hidden" id="phone" name="phone" value="" />
            <!-- js 로 phone-front + mid + back 합쳐서 value에 담고 넘길 예정 -->

            <div class="col form-group">
              <select class="form-control" id="phone-front" required>
                <option value="N" selected>선택</option>
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
                maxlength="4"
                required
              />
            </div>
            <label class="phone-dash">-</label>
            <div class="col form-group">
              <input
                type="text"
                class="form-control"
                id="phone-back"
                maxlength="4"
                required
              />
            </div>
          </div>
          <div id="phoneAlert"></div>
        </div>

        <div class="form-row">
          <div class="col form-group" id="address-form">
            <input type="hidden" id="combinedAddress" name="address" value="" />
            <label>*주소</label> <br />

            <div class="form-row" style="height: 29px">
              <div class="col form-group" style="max-width: 117px">
                <input
                  type="text"
                  id="postal"
                  name="post"
                  class="form-control"
                  style="width: 100px"
                  placeholder="우편번호"
                  required
                />
              </div>
              <div class="col form-group" style="align-self: center">
                <input
                  type="button"
                  class="btn btn-outline-primary"
                  id="postal-search"
                  value="검색"
                />
              </div>
            </div>
          </div>

          <input
            type="text"
            id="address"
            class="form-control"
            placeholder="주소"
            style="margin: 0.3rem"
            required
          />

          <input
            type="text"
            id="detail-address"
            class="form-control"
            placeholder="상세 주소"
            style="margin: 0.3rem"
            required
          />
        </div>

        <div class="form-group" id="recommand-form" style="margin-top: 1rem">
          <label>친구 추천 아이디</label> <br />
          <div class="form-row">
            <div class="col form-group">
              <input
                type="text"
                class="form-control"
                style="width: 200px"
                name="refId"
                id="refId"
                placeholder="친구아이디"
              />
            </div>
            <div id="refIdAlert" style="line-height: 37px"></div>
            <div class="col form-group"></div>
          </div>
        </div>

        <br />
        <div class="form-group">
          <button
            type="submit"
            class="btn btn-primary btn-block"
            id="submit"
            onclick="return totalValidate()"
          >
            가입하기
          </button>
        </div>
      </form>
      <br />
      <br />
    </div>

    <!-- row.//-->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
      // 회원가입 폼 유효성 검사 정규표현식
      var nameReg = /^[가-힣]{2,6}$/; // 한글 단어만 2글자 ~ 6글자
      var idReg = /^[a-z]+[a-z0-9]{5,19}$/; // 앞글자는 영소문자, 영소문자와 숫자만 6 ~ 20자
      var pwdReg = /[0-9]*/; // for developing phase;
      ///^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/; // 비밀번호 8 ~ 20 자, 최소 하나의 문자, 하나의 숫자 및 하나의 특수 문자
      var emailReg =
        /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; // 앞부분은 영문자, 영문자와 숫자만 6 ~ 15자 / 뒷부분은 14자까지 도메인 형식으로
      var phoneReg = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/; // 숫자만

      var iCnt = 0; // id validation
      var pCnt = 0; // password validation
      var eCnt = 0; // email validation
      var aCnt = 0; //authCode must be validated
      var refCnt = 1; // 친구아이디

      /* ---------- 실시간 아이디 중복 체크 ---------- */
      $("#id-form #userId").on(
        "propertychange change keyup paste input",
        function () {
          // 아이디 input 태그 변경 감지
          if (!idReg.test($("#userId").val())) {
            // 정규식에 맞지 않을 때

            $("#id-form #userIdAlert")
              .text(
                "아이디는 영문자로 시작하는 5~20자 영문자 또는 숫자이어야 합니다."
              )
              .css("color", "red");
            iCnt = 0;
          } else {
            // 정규식에 맞다면, ajax로 DB 값과 비교

            var $userId = $("#id-form #userId");
            var $idAlert = $("#id-form #userIdAlert");

            $.ajax({
              url: "idCheck.do",
              data: { checkId: $userId.val() },
              success: function (result) {
                if (result == "NNNNN") {
                  // 중복된 아이디 == 사용불가
                  $idAlert
                    .text("이미 존재하거나 탈퇴한 회원의 아이디입니다.")
                    .css("color", "red");
                  iCnt = 0;
                } else {
                  // 중복되지 않은 아이디 == 사용가능

                  $idAlert
                    .text("사용 가능한 아이디 입니다.")
                    .css("color", "blue");
                  iCnt = 1;
                }
              },
              error: function () {
                console.log("ajax ID 체크 실패");
              },
            });
          }
        }
      );
      /* ---------------------------------------- */

      /* ---------- 비밀번호 같은지 체크 ---------- */
      $("#pwd-form #userPwd").on(
        "propertychange change keyup paste input",
        function () {
          // 비밀번호 input 태그 변경 감지
          var $pwdAlert = $("#pwd-form #userPwdAlert");
          if (!pwdReg.test($("#userPwd").val())) {
            // 정규식에 맞지 않을 때
            $pwdAlert
              .text(
                "비밀번호는 8 ~ 20 자, 최소 하나의 문자, 하나의 숫자 및 하나의 특수 문자를 포함해야 합니다."
              )
              .css("color", "red");
            pCnt = 0;
          } else {
            // 정규식에 맞을 때
            if ($("#userPwd").val() != $("#pwdCheck").val()) {
              // 비밀번호와 비밀번호 확인이 서로 일치하지 않을 때
              $pwdAlert
                .text("입력한 비밀번호가 일치하지 않습니다.")
                .css("color", "red");
              pCnt = 0;
            } else {
              // 비밀번호와 비밀번호 확인이 서로 일치할 때
              $pwdAlert
                .text("사용 가능한 비밀번호 입니다.")
                .css("color", "blue");
              pCnt = 1;
            }
          }
        }
      );

      $("#pwd-form #pwdCheck").on(
        "propertychange change keyup paste input",
        function () {
          // 비밀번호 확인 input 태그 변경 감지
          var $pwdAlert = $("#pwd-form #userPwdAlert");
          if (!pwdReg.test($("#userPwd").val())) {
            // 정규식에 맞지 않을 때
            $pwdAlert
              .text(
                "비밀번호는 8 ~ 20 자, 최소 하나의 문자, 하나의 숫자 및 하나의 특수 문자를 포함해야 합니다."
              )
              .css("color", "red");
            pCnt = 0;
          } else {
            // 정규식에 맞을 때
            if ($("#userPwd").val() != $("#pwdCheck").val()) {
              // 비밀번호와 비밀번호 확인이 서로 일치하지 않을 때
              $pwdAlert
                .text("입력한 비밀번호가 일치하지 않습니다.")
                .css("color", "red");
              pCnt = 0;
            } else {
              // 비밀번호와 비밀번호 확인이 서로 일치할 때
              $pwdAlert
                .text("사용 가능한 비밀번호 입니다.")
                .css("color", "blue");
              pCnt = 1;
            }
          }
        }
      );
      /* ---------------------------------------- */

      /* ---------- 실시간 이메일 중복 체크 ---------- */
      $("#email-form #email-front").on(
        "propertychange change keyup paste input",
        function () {
          // 이메일 input 태그 변경 감지
          var $emailMerge =
            $("#email-front").val() + "@" + $("#email-back").val();

          if (!emailReg.test($emailMerge)) {
            // 정규식에 맞지 않을 때

            $("#email-form #emailAlert")
              .text(
                "이메일은 영문자로 시작하며, 최대 15자의 영문자 또는 숫자이어야 합니다."
              )
              .css("color", "red");
            eCnt = 0;
          } else {
            // 정규식에 맞다면, ajax로 DB 값과 비교

            var $emailAlert = $("#email-form #emailAlert");

            $.ajax({
              url: "emailCheck.do",
              data: { checkEmail: $emailMerge },
              success: function (result) {
                if (result == "NNNNN") {
                  // 중복된 아이디 == 사용불가
                  $emailAlert
                    .text("이미 존재하거나 탈퇴한 회원의 이메일입니다.")
                    .css("color", "red");
                  eCnt = 0;
                } else {
                  // 중복되지 않은 아이디 == 사용가능

                  $emailAlert
                    .text("사용 가능한 이메일 입니다.")
                    .css("color", "blue");
                  eCnt = 1;
                  $("#send_emailvali").attr("disabled", false);
                }
              },
              error: function () {
                console.log("ajax EMAIL 체크 실패");
              },
            });
          }
        }
      );

      $("#email-form #email-select").on("change", function () {
        // 이메일 input 태그 변경 감지
        $("#email-select option:selected").each(function () {
          if ($(this).val() == "1") {
            //직접입력일 경우

            $("#email-back").val(""); //값 초기화
            $("#emailAlert").text("");
            $("#email-back").attr("disabled", false); //활성화

            $("#email-form #email-back").on(
              "propertychange change keyup paste input",
              function () {
                // 직접입력 시, input 태그 변경 감지
                var $emailMerge =
                  $("#email-front").val() + "@" + $("#email-back").val();

                if (!emailReg.test($emailMerge)) {
                  // 정규식에 맞지 않을 때

                  $("#email-form #emailAlert")
                    .text(
                      "이메일은 영문자로 시작하며, 최대 15자의 영문자 또는 숫자이어야 합니다."
                    )
                    .css("color", "red");
                  eCnt = 0;
                } else {
                  var $emailAlert = $("#email-form #emailAlert");

                  $.ajax({
                    url: "emailCheck.do",
                    data: { checkEmail: $emailMerge },
                    success: function (result) {
                      if (result == "NNNNN") {
                        // 중복된 아이디 == 사용불가
                        $emailAlert
                          .text("이미 존재하거나 탈퇴한 회원의 이메일입니다.")
                          .css("color", "red");
                        eCnt = 0;
                      } else {
                        // 중복되지 않은 아이디 == 사용가능

                        $emailAlert
                          .text("사용 가능한 이메일 입니다.")
                          .css("color", "blue");
                        eCnt = 1;
                        $("#send_emailvali").attr("disabled", false);
                      }
                    },
                    error: function () {
                      console.log("ajax EMAIL 체크 실패");
                    },
                  });
                }
              }
            );
          } else {
            // 직접입력이 아닐경우

            $("#email-back").val($(this).text()); //선택값 입력
            $("#email-back").attr("disabled", true); //비활성화

            var $emailMerge =
              $("#email-front").val() + "@" + $("#email-back").val();

            if (!emailReg.test($emailMerge)) {
              // 정규식에 맞지 않을 때

              $("#email-form #emailAlert")
                .text(
                  "이메일은 영문자로 시작하며, 최대 15자의 영문자 또는 숫자이어야 합니다."
                )
                .css("color", "red");
              eCnt = 0;
            } else {
              // 정규식에 맞다면, ajax로 DB 값과 비교

              var $emailAlert = $("#email-form #emailAlert");

              $.ajax({
                url: "emailCheck.do",
                data: { checkEmail: $emailMerge },
                success: function (result) {
                  if (result == "NNNNN") {
                    // 중복된 아이디 == 사용불가
                    $emailAlert
                      .text("이미 존재하거나 탈퇴한 회원의 이메일입니다.")
                      .css("color", "red");
                    eCnt = 0;
                  } else {
                    // 중복되지 않은 아이디 == 사용가능

                    $emailAlert
                      .text("사용 가능한 이메일 입니다.")
                      .css("color", "blue");
                    eCnt = 1;
                    $("#send_emailvali").attr("disabled", false);
                  }
                },
                error: function () {
                  console.log("ajax EMAIL 체크 실패");
                },
              });
            }
          }
        });
      });
      /* ----------------이메일 유효 검사------------------------ */
      var key;
      function emailValidate() {
        console.log("clicekc!!!!");

        var $emailMerge =
          $("#email-front").val() + "@" + $("#email-back").val();
        console.log("emailmerged:", $emailMerge);

        $.ajax({
          url: "${ pageContext.request.contextPath }/validate/email.do",
          type: "get",
          data: { email: $emailMerge },
          success: function (result) {
            console.log("result: ", result);
            key = result;
          },
          error: function () {
            console.log("error!!");
          },
        });
      }

      $("#authCode").blur(function () {
        if ($("#authCode").val() >= 6) {
          // autCode 6글자 이상
          var authCode = $("#authCode").val();
          if (authCode == key) {
            $("#authCodeAlert").text("인증 성공!").css("color", "green");
            $("#send_emailvali").attr("disabled", true);
            $("authCode").attr("disabled", true);
            aCnt = 1;
          } else {
            $("#authCodeAlert")
              .text("인증에 실패하셨습니다.")
              .css("color", "red");
          }
        } else {
          // authCode 6글자 이하
          $("#authCodeAlert")
            .text("잘못된 인증번호 입니다.")
            .css("color", "red");
        }
      });

      /* ---------- 실시간 친구아이디 중복 체크 ---------- */

      $("#recommand-form #refId").on(
        "propertychange change keyup paste input",
        function () {
          // 아이디 input 태그 변경 감지
          if (!idReg.test($("#refId").val())) {
            // 정규식에 맞지 않을 때

            $("#recommand-form #refIdAlert")
              .text(
                "아이디는 영문자로 시작하는 5~20자 영문자 또는 숫자이어야 합니다."
              )
              .css("color", "red");
          } else {
            $.ajax({
              url: "refIdCheck.do",
              data: { userId: $("#refId").val() },
              success: function (result) {
                if (result == "NNNNN") {
                  // 친구 아이디 있음
                  $("#recommand-form #refIdAlert")
                    .text("친구 아이디가 확인 되었어요!")
                    .css("color", "blue");
                  refCnt = 1;
                } else {
                  // 중복되지 않은 아이디

                  $("#recommand-form #refIdAlert")
                    .text("가입되지 않은 아이디입니다.")
                    .css("color", "red");
                  refCnt = 0;
                }
              },
              error: function () {
                console.log("ajax 친구아이디 체크 실패");
              },
            });
          }
        }
      );
      /* ---------- 모든 값이 유효한지 최종 검사 ---------- */

      function totalValidate() {
        $("#email").val($("#email-front").val() + "@" + $("#email-back").val()); // Servlet으로 넘길 값
        $("#phone").val(
          $("#phone-front").val() +
            $("#phone-mid").val() +
            $("#phone-back").val()
        );
        $("#combinedAddress").val(
          $("#address").val() + " " + $("#detail-address").val()
        );

        // Servlet으로 넘길 값
        console.log("combiledaddress: ", $("#combinedAddress").val());
        var userName = $("#userName").val();
        var phone = $("#phone").val();
        console.log("phone.length: ", phone.length);
        var phoneCheck = phone.indexOf("N");
        var isValidated = false;
        var postal = $("#postal").val();
        var address = $("#address").val();
        var detailAddress = $("#detail-address").val();
        var count = iCnt + pCnt + eCnt + aCnt + refCnt;

        console.log("iCnt: ", iCnt);
        console.log("pCnt: ", pCnt);
        console.log("eCnt: ", eCnt);
        console.log("aCnt: ", aCnt);
        console.log("count: ", count);

        if (
          userName != "" &&
          phone != "" &&
          phoneCheck == -1 &&
          phone.length >= 10 &&
          postal != "" &&
          address != "" &&
          detailAddress != ""
        ) {
          if (nameReg.test(userName)) {
            if (phoneReg.test(phone)) {
              if (count == 5) {
                isValidated = true;
              } else {
                alert("모든 정보가 올바르게 입력되어야 합니다.");
              }
            } else {
              alert("전화번호가 올바르지 않습니다. 숫자만 입력해주세요.");
            }
          } else {
            alert(
              "이름이 올바르지 않습니다. 이름 형식에 맞게 2글자 이상 입력해주세요."
            );
          }
        } else {
          alert("모든 정보를 입력해주세요.");
        }

        return isValidated;
      } // --end totalValidate()

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
