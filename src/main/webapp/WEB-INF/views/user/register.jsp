<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DriveConnect</title>
 <script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
        // jQuery를 이용한 스크립트입니다.
        $(function () {
            $("#idchk_btnU").click(function () {
                var id = $("#id").val();
                var pass = $("#pass").val();
                if ($("#id").val().length < 4) {
                    alert("아이디는 4자 이상으로 입력해주세요");
                } else {
                    var userid = $("#id").val();
                    $.ajax({
                        type: 'get',
                        url: 'idCheck',
                        data: { 'userId': userid },
                        dataType: "text",
                        success: function (data) {
                            var result = JSON.parse(data);
                            if (result.exist == 1) { // 이미 아이디 존재
                                $("#check_span").text("사용불가");
                                $("#check_span").css("color", "red");
                                $("#signup_btn").attr("disabled", "disabled");
                                alert("이미 존재하는 아이디입니다.");
                            } else if (result.exist == 0) { // 아직 아이디 없음
                                $("#check_span").text("사용가능");
                                $("#check_span").css("color", "blue");
                                $("#signup_btn").removeAttr("disabled");
                                alert("사용이 가능한 아이디입니다.");
                            }
                        },
                        error: function (request, status, error) {
                            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                        }
                    });
                }
                
                // 비밀번호 확인
                $("#pass2").keyup(function () {
                    var pass = $("#pass").val();
                    var pass2 = $("#pass2").val();
                    var span = $("#pwchk_span");
                    
                    if (pass != pass2) {
                        span.css("color", "red");
                        span.text("동일한 암호를 입력하세요.");
                        $("#signup_btn").attr("disabled", "disabled");
                    } else {
                        span.css("color", "blue");
                        span.text("암호가 확인 되었습니다.");
                        $("#signup_btn").removeAttr("disabled");
                    }
                });
            });

            // 비밀번호 체크 함수 (비밀번호 입력(첫 번째 비밀번호) 칸에 대한 것)
            function check() {
                var pass = document.getElementById('pass').value;
                var pass2 = document.getElementById('pass2').value;
                var span = document.getElementById('pwchk_span');
                if (pass != pass2) {
                    span.style.color = "red";
                    span.innerHTML = "동일한 암호를 입력하세요.";
                    $("#signup_btn").attr("disabled", "disabled");
                } else {
                    span.style.color = "blue";
                    span.innerHTML = "암호가 확인 되었습니다.";
                    $("#signup_btn").removeAttr("disabled");
                }
            }

            // 비밀번호 체크 함수 (비밀번호 입력 '확인' 칸 대한 것)
            function check1() {
                var pass = document.getElementById('pass').value;
                var pass2 = document.getElementById('pass2').value;
                var span = document.getElementById('pwchk_span');
                if (pass != pass2) {
                    span.style.color = "red";
                    span.innerHTML = "동일한 암호를 입력하세요.";
                    $("#signup_btn").attr("disabled", "disabled");
                } else {
                    span.style.color = "blue";
                    span.innerHTML = "암호가 확인 되었습니다.";
                    $("#signup_btn").removeAttr("disabled");
                }
            }
        });
    </script>
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Kanit:wght@200&family=Noto+Sans+KR&family=Roboto&display=swap');
		
		.custom-main {
	    height: auto;
        text-align: center;
	    
	    }
	    
  	body {
    font-family: 'Noto Sans KR', sans-serif;
    background-color: #ffffff;
  }

  .title {
    text-align: center;
    margin-top: 20px;
  }

  .title h1 {
    font-size: 36px;
    color: #333;
  }

  .row {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 20px;
  }

  input[type="text"],
  input[type="password"],
  input[type="email"],
  input[type="tel"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    outline: none;
  }

  input[type="text"]:required,
  input[type="password"]:required,
  input[type="email"]:required,
  input[type="tel"]:required {
    border: 1px solid #333;
  }

  button[type="submit"] {
    background-color: #333;
    color: #fff;
    padding: 10px 20px;
    font-size: 18px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
  }

  button[type="submit"]:hover {
    background-color: #555;
  }
/* 중복확인 버튼 스타일링 */
#idchk_btnU {
    background-color: #333; /* 배경 색상 */
    color: white; /* 텍스트 색상 */
    border: none; /* 테두리 제거 */
    padding: 5px 10px; /* 내부 여백 설정 */
    cursor: pointer; /* 커서 스타일 변경 */
}

#idchk_btnU:hover {
    background-color: #0056b3; /* 마우스 호버 시 배경 색상 변경 */
}  
.signup_smallDiv {
    text-align: left; /* 텍스트를 왼쪽으로 정렬 */
}

	</style>
	<link rel="stylesheet" href="/resources/css/register.css?after">
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<main class="custom-main">
 <c:set var="root" value="<%=request.getContextPath() %>" />
    <div class="signupform-big uk-flex uk-flex-wrap uk-flex-wrap-around uk-background-muted uk-height-medium">
        <div class="signupform uk-card uk-card-default uk-card-body">
		        <div class="title">
		            <h1>회원가입</h1>
		        </div>
            <form method="post" action="/user/register" onsubmit="return check()" name="frm">
                <div class="signup_wrapper">
                  <div class="signup_smallDiv">
                        아이디
                        <input type="text" name="userId" id="id" required="required" class="uk-input uk-form-width-medium signupId-input" placeholder="4자이상 입력">
                        <button type="button" id="idchk_btnU" class="uk-button uk-button-default uk-width-1-1 uk-margin-small-bottom">중복확인</button>
                        <span id="check_span"></span>
                   </div>
                    <div class="signup_smallDiv">
                        이름<br>
                        <input type="text" name="userName" required="required" class="uk-input uk-form-width-medium signup-input" placeholder="이름 혹은 닉네임">
                    </div>
                    <div class="signup_smallDiv">
                        비밀번호<br>
                        <input type="password" name="userPw" required="required" id="pass" class="uk-input uk-form-width-medium signup-input" placeholder="비밀번호">
                    </div>
                    <div class="signup_smallDiv">
                        비밀번호확인<br>
                        <input type="password" name="userPw2" required="required" id="pass2" class="uk-input uk-form-width-medium signup-input" placeholder="비밀번호확인">
                        <br><span id="pwchk_span"></span>
                    </div>
                    <div class="signup_smallDiv">
                        이메일<br>
                        <input type="email" name="userEmail" placeholder="이메일">
                    </div>
                    <div class="signup_smallDiv">
                        전화번호( - 빼고 입력)<br>
                        <input type="tel" name="userPhone" maxlength="11" placeholder="'-' 제외하고 입력">
                    </div>
                    <div class="signup_smallDiv">
                        운전면허번호<br>
                        <input type="text" name="dLicense" required="required" placeholder="운전면허번호">
                    </div><br>
                    <button type="submit" id="signup_btn" disabled="disabled" class="uk-button uk-button-default uk-width-1-1 uk-margin-small-bottom">회원가입</button>
                </div>
            </form>
        </div>
    </div>


</main>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>