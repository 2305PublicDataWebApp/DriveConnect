<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DriveConnect</title>
<style>
		@import url('https://fonts.googleapis.com/css2?family=Kanit:wght@200&family=Noto+Sans+KR&family=Roboto&display=swap');
	    /* 공통 스타일 */
    body {
        font-family: 'Kanit', 'Noto Sans KR', 'Roboto', sans-serif;
        background-color: #ffffff;
    }

    /* 제목 스타일 */
	.title {
	    background-color: #fff; /* 바탕색을 하얀색으로 변경 */
	    color: #000; /* 글자색을 검정색으로 변경 */
	    text-align: center;
	    padding: 10px 0; /* 크기를 줄임 */
	}
	
	.title h1 {
	    font-size: 28px; /* 크기를 조절 */
	}

    /* 내용 스타일 */
    .row {
	    background-color: #fff;
	    padding: 20px;
  		margin: -20px auto; /* 상하 10px, 좌우는 같게 유지하고 중앙 정렬 */
	    border-radius: 5px;
	    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	    max-width: 600px; /* 최대 가로 길이를 조절 (원하는 크기로 변경) */
    }

    /* 입력 필드 스타일 */
    input[type="text"],
    input[type="email"],
    input[type="Password"],
    input[type="tel"] {
    	width: 80%; /* 원하는 가로 너비로 조절 */
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
	
	/* 버튼 스타일 */
	.button-link {
	    display: block;
	    padding: 5px 10px;
	    background-color: #000000; /* 원하는 배경색으로 변경 */
	    color: #fff; /* 텍스트 색상 */
	    text-decoration: none; /* 밑줄 제거 */
	    border: none; /* 테두리 제거 */
	    cursor: pointer;
	    border-radius: 5px; /* 둥근 모서리 */
	    font-size: 13px;
	    margin: 0 auto; /* 가로 중앙 정렬 */
    	text-align: center; /* 텍스트 가로 중앙 정렬 */
    	width: 200px; /* 버튼의 너비 지정 (원하는 크기로 조절) */
	}
	
	/* 버튼 호버 효과 (선택 사항) */
	.button-link:hover {
	    background-color: #0056b3; /* 호버 시 배경색 변경 */
	}		
	
	/* 버튼 그룹 스타일 */
	.button-group {
	    display: flex;
	    justify-content: space-between;
	}
	
	.button-group a {
	    flex: 1;
	    margin-right: 10px; /* 버튼 사이의 간격을 조절합니다. */
	    text-align: center;
}		
	</style>
	<link rel="stylesheet" href="/resources/css/register.css?after">
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<main>
        <div class="title">
            <h1>회원 정보 수정</h1>
        </div>
        <div>
        	<form method="post" action="/user/modify">
	                <div class="row">
	                    <div class="sub-title-box">
	                        <div class="sub-title">
	                            회원 정보
	                        </div>
	                    </div>
	                    <div>
	                    	아이디<br>
	                        <input type="text" name="userId" value="${sessionScope.userId}" readonly>
	                    </div>
  	                    <div>
  	                    	비밀번호<br>
                        	<input type="Password" name="userPw" required>
                   		</div>
                   		<div>
                   			이름<br>
	                        <input type="text" name="userName" value="${sessionScope.userName}" readonly>
	                    </div>
	                    <div>
	                    	이메일<br>
	                        <input type="email" name="userEmail" value="${user.userEmail}">
	                    </div>
       	                <div>
       	                	전화번호<br>
	                        <input type="tel" name="userPhone" value="${user.userPhone}">
	                    </div>
	                    <div>
	                    	운전면허<br>
	                    	<input type="text" name="dLicense" value="${user.dLicense}">
	                    </div>
	                    <div>
          					<input type="submit" class="button-link" value="수정하기">	
	                    </div>
                </div>
        	</form>
        </div>


</main>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>