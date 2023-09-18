<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DriveConnect</title>
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Kanit:wght@200&family=Noto+Sans+KR&family=Roboto&display=swap');
	/* 버튼 스타일 */
	.button-link {
	    display: inline-block;
	    padding: 5px 10px;
	    background-color: #000000; /* 원하는 배경색으로 변경 */
	    color: #fff; /* 텍스트 색상 */
	    text-decoration: none; /* 밑줄 제거 */
	    border: none; /* 테두리 제거 */
	    cursor: pointer;
	    border-radius: 5px; /* 둥근 모서리 */
	    font-size: 13px;
	}
	
	/* 버튼 호버 효과 (선택 사항) */
	.button-link:hover {
	    background-color: #0056b3; /* 호버 시 배경색 변경 */
	}		
	</style>
	<link rel="stylesheet" href="/resources/css/register.css?after">
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<main>
        <div class="title">
            <h1>마이페이지</h1>
        </div>
        <div>
        	<form method="post" action="/user/mypage">
	                <div class="row">
	                    <div class="sub-title-box">
	                        <div class="sub-title">
	                            회원 정보
	                        </div>
	                    </div>
	                    <div>
	                    	아이디
	                        <input type="text" name="userId" value="${sessionScope.userId}" readonly>
	                    </div>
                   		<div>
                   			이름
	                        <input type="text" name="userName" value="${sessionScope.userName}" readonly>
	                    </div>
	                    <div>
	                    	이메일
	                        <input type="email" name="userEmail" value="${user.userEmail}" readonly>
	                    </div>
       	                <div>
       	                	전화번호
	                        <input type="tel" name="userPhone" value="${user.userPhone}" readonly>
	                    </div>
	                    <div>
	                    	운전면허
	                    	<input type="text" name="dLicense" value="${user.dLicense}" readonly>
	                    </div>
	                    <div>
	                    	<a class="button-link" href="#">구독내역</a>
	                    </div>
	                    <div>
	                    	<a class="button-link" href="/user/modify?userId=${userId }">수정하기</a>
	                    </div>
	                    <div>
	                    	<a class="button-link" href="/user/delete?userId=${userId }">탈퇴하기</a>
	                    </div>
                </div>
        	</form>
        </div>


</main>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>