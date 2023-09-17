<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DriveConnect</title>
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Kanit:wght@200&family=Noto+Sans+KR&family=Roboto&display=swap');
	</style>
	<link rel="stylesheet" href="/resources/css/register.css?after">
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<main>
        <div class="title">
            <h1>회원가입</h1>
        </div>
        <div>
        	<form method="post" action="/user/register">
	                <div class="row">
	                    <div class="sub-title-box">
	                        <div class="sub-title">
	                            회원 정보
	                        </div>
	                    </div>
	                    <div>
	                        <input type="text" name="userId" placeholder="아이디*" required>
	                    </div>
	                    <div>
                        	<input type="Password" name="userPw" placeholder="비밀번호*" required>
                   		</div>
                   		<div>
	                        <input type="text" name="userName" placeholder="이름*" required>
	                    </div>
	                    <div>
	                        <input type="email" name="userEmail" placeholder="이메일">
	                    </div>
       	                <div>
	                        <input type="tel" name="userPhone" maxlength="11" placeholder="전화번호">
	                    </div>
	                    <div>
	                    	<input type="text" name="dLicense" placeholder="운전면허번호" required>
	                    </div>
	                    <div>
	                    	<button class="c-btn c-btn-black c-btn-bold" type="submit">회원가입</button>
	                    </div>
                </div>
        	</form>
        </div>


</main>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>