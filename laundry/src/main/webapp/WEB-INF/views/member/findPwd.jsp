<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../common/util.jsp" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>아이디/비번 찾기</title>
    <style>
      .find_container {
        padding: 2rem 2rem 5rem 2rem;
        width: 50%;
        margin: auto;
      }

      .find_menu {
        display: flex;
      }
      .find_menu div {
        padding: 0.5rem;
        margin-right: 0.1rem;
        width: 100px;
        text-align: center;
        font-weight: bold;
        cursor: pointer;
      }

      .find_id {
        background-color: #d3d3d370;

        border-radius: 2px;
      }
      .find_id:hover {
        background-color: #d3d3d3c9;
      }
      .find_pwd {
        color: white;
        background: #3a96f0;
      }
      .find_pwd:hover {
        background-color: #306fac;
      }
      .find_form_container {
        padding: 1.5rem 2.5rem 0rem 2.5rem;
        border: 1px solid #adb5bd;
        border-radius: 1px;
        padding: 2rem;
      }
      .find {
        padding: 0.3rem;
        text-align: left;
      }
      #auth_container {
        padding: 0.5rem;
        float: left;
        margin-top: 0.3rem;
      }

      #authCodeAlert {
        font-size: 0.8rem;
        font-weight: bold;
      }

      .find_btns {
        padding: 1rem;
        margin-top: 2rem;
      }
    </style>
  </head>
  <body>
    <%@ include file="../common/manubar.jsp" %>

    <div class="find_container">
      <div class="find_menu">
        <div
          class="find_id"
          onclick="location.href='${pageContext.request.contextPath}/member/findId.do'"
        >
          아이디
        </div>
        <div
          class="find_pwd"
          onclick="location.href='${pageContext.request.contextPath}/member/findPwd.do'"
        >
          비밀번호
        </div>
      </div>
      <div class="find_form_container" align="center">
        <div class="find" id="id-form">
          <label>* 아이디</label>
          <input
            type="text"
            class="form-control"
            id="userId"
            name="memId"
            style="max-width: 300px"
            required
          />
        </div>
        <div class="find" id="name-form">
          <label>* 이름</label>
          <input
            type="text"
            class="form-control"
            id="userName"
            name="memName"
            maxlength="6"
            style="max-width: 300px"
            required
          />
        </div>
        <div class="find" id="email-form">
          <label>* 이메일</label> <br />
          <div class="row" style="width: 100%">
            <input type="hidden" id="email" name="email" value="" />

            <!-- js 로 email-front + at + back 합쳐서 value에 담고 넘길 예정 -->
            <div class="col">
              <input
                type="text"
                class="form-control"
                size="14"
                id="email-front"
                required
              />
            </div>

            <span id="email-at">@</span>

            <div class="col">
              <input
                type="text"
                class="form-control"
                id="email-back"
                maxlength="14"
                disabled
                required
              />
            </div>

            <select class="form-select" id="email-select">
              <option value="X" selected>선택</option>
              <option value="gmail.com">gmail.com</option>
              <option value="naver.com">naver.com</option>
              <option value="daum.net">daum.net</option>
              <option value="1">직접 입력</option>
            </select>
          </div>
        </div>
        <div class="row find" id="auth_container">
          <div class="col" style="align-self: center">
            <button
              type="button"
              id="send_emailvali"
              class="btn btn-secondary btn-sm"
              style="padding: 0.5rem"
              disabled
            >
              인증번호 받기
            </button>
          </div>
          <div class="col">
            <input
              type="text"
              id="authCode"
              size="10"
              placeholder="코드번호"
              class="form-control"
              style="max-width: 300px"
              required
            />
          </div>
        </div>
        <br />
        <div id="authCodeAlert"></div>

        <div class="find_btns" align="center">
          <button
            class="btn btn-primary"
            id="btnFindPwd"
            disabled
            type="submit"
          >
            비밀번호 찾기
          </button>
        </div>
      </div>
    </div>

    <script>
      $(function () {
        var emailBack = "";
        var emailFront = "";
        //이메일 도메인 option 선택 및 직접입력
        $("#email-select").change(function () {
          if ($("#email-form option:selected").val() == 1) {
            //직접입력
            $("#email-back").attr("disabled", false); // input 칸 disabled 풀기
            $("#email-back").blur(function () {
              emailBack = $("#email-back").val();
              invokeAuth();
            });
          } else {
            //option값 넣기
            emailBack = $("#email-form option:selected").val();
            invokeAuth();
          }
        });
        // email font쪽 값 넣기
        $("#email-front").on("blur", function () {
          emailFront = $("#email-front").val();
          invokeAuth();
        });
        // email front 또는 email back 부분 값이 들어있다면 invoke invokeAuth()
        function invokeAuth() {
          if (emailBack.length > 0 && emailFront.length > 0) {
            $("#send_emailvali").attr("disabled", false);
          }
        }

        // 인증코드 보내는 ajax 실행
        var key;
        document
          .getElementById("send_emailvali")
          .addEventListener("click", function () {
            var $emailMerge = emailFront + "@" + emailBack;
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
          });
        // 유저가 받아온 인증코드와 key값과 비교
        $("#authCode").blur(function () {
          if ($("#authCode").val() >= 6) {
            // autCode 6글자 이상
            var authCode = $("#authCode").val();
            if (authCode == key) {
              $("#authCodeAlert").text("인증 성공!").css("color", "green");
              $("#send_emailvali").attr("disabled", true);
              $("#authCode").attr("disabled", true);
              $("#btnFindPwd").attr("disabled", false);
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

        // id 찾기 이메일로 전송
        var pwdInSearch;

        document
          .getElementById("btnFindPwd")
          .addEventListener("click", function () {
            var $emailMerge = emailFront + "@" + emailBack;
            if (
              $("#userName").val().length > 0 &&
              $("#userId").val().length > 0
            ) {
              // 이름도 입력했고, 아이디 이메일로 쏴주기
              $.ajax({
                url: "selectPwdByEmailAndName.do",
                data: { email: $emailMerge, name: $("#userName").val() },
                success: function (result) {
                  if (result != "N") {
                    pwdInSearch = result;

                    $.ajax({
                      url: "${ pageContext.request.contextPath }/validate/emailPwd.do",
                      type: "get",
                      data: { email: $emailMerge, pwd: pwdInSearch },
                      success: function (result) {
                        if (result == true) {
                          alert("회원님의 메일로 비밀번호를 보내드렸습니다.");
                        } else {
                          alert("메일 보내기에 실패하였습니다");
                        }
                      },
                      error: function () {
                        console.log("error!!");
                      },
                    });
                  } else {
                    alert("입력하신 이름과 이메일이 존재하지 않습니다");
                    $("#send_emailvali").attr("disabled", false);
                    $("#authCode").attr("disabled", false);
                  }
                },
                error: function () {
                  console.log("error!");
                },
              });
            } else {
              $("#authCodeAlert")
                .text("아이디와 이름을 다시 확인 해주세요")
                .css("color", "red");
            }
          });
      });
    </script>
  </body>
</html>
