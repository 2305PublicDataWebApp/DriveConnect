<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DriveConnect</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Kanit:wght@200&family=Noto+Sans+KR&family=Roboto&display=swap');
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
  
  .sub-title {
    text-align: left; /* 텍스트를 왼쪽으로 정렬 */
}
	</style>
	<link rel="stylesheet" href="/resources/css/register.css?after">
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
	<c:set var="root" value="<%=request.getContextPath()%>"/>
<main>
        <div class="title">
            <h1>로그인</h1>
        </div>
        <div>
        	<form method="post" action="/user/login" name="form1" id="form1">
	                <div class="row">
	                    <div class="sub-title-box">
	                        <div class="sub-title">
	                            로그인
	                        </div>
	                    </div>
	                    <div>
	                        <input type="text" name="userId" id="userId" placeholder="아이디*" required>
	                    </div>
	                    <div>
                        	<input type="Password" name="userPw" id="userPw" placeholder="비밀번호*" required>
                   		</div>
	                    <div>
	                    	<button class="c-btn c-btn-black c-btn-bold" type="submit" id="login_btn">로그인</button>
	                    </div>
	                    <br>
	                    <br>
                        <c:if test="${msg == 'failure'}">
							<span class="uk-label uk-label-danger loginFail_span"  style="color: red;">로그인에 실패했습니다. 다시 로그인해주세요.</span>
						</c:if>
                </div>
        	</form>
        </div>


</main>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
	
// 	$("footer_wrapper").attr("style","display:none !important");
	
	$("#login_btn").click(function(){
        var id = $("#userId").val();
        var pass = $("#userPw").val();
        if(id == ""){
            alert("아이디를 입력해주세요");
            $("#userId").focus();
            return;
        }
        if(pass == ""){
            alert("비밀번호를 입력하세요");
            $("#userPw").focus();
            return;
        }
        document.form1.action="/user/login";
        document.form1.submit();
	});
});
</script>	
</body>
</html>