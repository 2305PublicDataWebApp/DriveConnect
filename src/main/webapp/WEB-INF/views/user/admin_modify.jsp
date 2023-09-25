<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>DriveConnect</title>
    <style>
    		@import url('https://fonts.googleapis.com/css2?family=Kanit:wght@200&family=Noto+Sans+KR&family=Roboto&display=swap');
		
		.custom-main {
	    height: auto;
        text-align: center;
	    
	    }
	    
	    		 /* common */
        .container {
            width: 1160px;
            margin: 0 auto;
            padding: 0 20px;
            /* background-color: rgba(0, 0, 0, 0.1); */
        }
        .nexon {
            font-family: 'NexonLv1Gothic';
            font-weight: 400;
        }
        .section {
            padding: 30px 0;
        }
        .section.center {
            text-align: center;
        }
        .section__small {
            font-size: 14px;
            border-radius: 50px;
            background-color: #0083FD;
            color: #fff;
            padding: 1px 23px;
            text-transform: uppercase;
            margin-bottom: 20px;
            display: inline-block;
        }
        .section__h2 {
            font-size: 50px;
            font-weight: 400;
            margin-bottom: 30px;
            line-height: 1;
        }
        .section__desc {
            font-size: 22px;
            color: #666;
            margin-bottom: 70px;
            font-weight: 300;
            line-height: 1.5;
        }
        
/* 추가 스타일링 */
        .modify-container {
            max-width: 400px; /* 원하는 최대 너비 설정 */
            margin: 0 auto; /* 가운데 정렬 */
        }

        /* 공통 스타일 */
        .modify-list {
            list-style: none;
            padding: 0;
        }

        .modify-item {
            margin-bottom: 20px;
        }

        .modify-label {
            font-weight: bold;
        }

        .modify-input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .modify-buttons {
            margin-top: 20px;
        }

        .modify-submit,
        .modify-list-button {
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        .modify-submit:hover,
        .modify-list-button:hover {
            background-color: #0056b3;
        }
        
/* 버튼 스타일 */
.modify-submit,
.modify-list-button {
    display: inline-block; /* inline-block으로 수정 */
    padding: 5px 10px;
    background-color: #000000; /* 원하는 배경색으로 변경 */
    color: #fff; /* 텍스트 색상 */
    text-decoration: none; /* 밑줄 제거 */
    border: none; /* 테두리 제거 */
    cursor: pointer;
    border-radius: 5px; /* 둥근 모서리 */
    font-size: 13px;
    margin: 0 5px; /* 좌우 여백을 5px로 설정 */
    text-align: center; /* 텍스트 가로 중앙 정렬 */
    width: 150px; /* 버튼의 너비 지정 (원하는 크기로 조절) */
}


/* 버튼 호버 효과 (선택 사항)  */
.modify-submit:hover,
.modify-list-button:hover {
    background-color: #0056b3; /* 호버 시 배경색 변경 */
}

.modify-buttons {
    display: inline-block;
    text-align: center;
    margin-top: 20px;
}

.modify-container {
    max-width: 500px; /* 원하는 최대 너비로 조절 */
    margin: 0 auto; /* 가로 중앙 정렬 */
    padding: 40px; /* 좌우 여백 추가 (선택 사항) */
    border: 1px solid #ddd; /* 테두리 스타일 추가 (선택 사항) */
    border-radius: 5px; /* 테두리 모서리 둥글게 (선택 사항) */
}

.modify-list li {
    display: flex;
    align-items: center;
    justify-content: flex-start;
    margin-bottom: 10px; 
}
        </style>
<!--     <link rel="stylesheet" href="/resources/css/board/admin_modify.css?after"> -->
</head>
	<body>
		<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>	
			<main class="custom-main">
	        <section class="text__wrap section center nexon">
	        <div class="container">
	            <span class="section__small">회원 관리</span>
	            <h2 class="section__h2 mb70">회원정보 수정</h2>
        </section>
    <form action="/user/admin_modify" method="post" enctype="multipart/form-data">
        <!-- 수정할 때, 리다이렉트 될 때 사용 -->
        <input type="hidden" name="userNo" value="${user.userNo}">
       	
       	<div class="modify-container">
        <ul class="modify-list">
    <li>
        <label class="modify-label"style="display: inline-block; width: 100px;">아이디</label>
        <input class="modify-input" type="text" name="userId" value="${user.userId}" style="text-align: center; background-color: #f0f0f0;" readonly>
    </li>
    <li>
        <label class="modify-label"style="display: inline-block; width: 100px;">비밀번호</label>
        <input class="modify-input" type="text" name="userPw" value="${user.userPw}" style="text-align: center; background-color: #f0f0f0;" readonly>
    </li>
    <li class="modify-item">
        <label class="modify-label"style="display: inline-block; width: 100px;">이름<span style="color: red;">*</span></label>
        <input class="modify-input" type="text" name="userName" value="${user.userName}" style="text-align: center; background-color: #fcfcfc;">
    </li>
    <li>
        <label class="modify-label"style="display: inline-block; width: 100px;">이메일</label>
        <input class="modify-input" type="text" name="userEmail" value="${user.userEmail}" style="text-align: center; background-color: #f0f0f0;" readonly>
    </li>
    <li>
        <label class="modify-label"style="display: inline-block; width: 100px;">전화번호</label>
        <input class="modify-input" type="text" name="userPhone" value="${user.userPhone}" style="text-align: center; background-color: #f0f0f0;" readonly>
    </li>
    <li class="modify-item">
        <label class="modify-label"style="display: inline-block; width: 100px;">주소<span style="color: red;">*</span></label>
        <input class="modify-input" type="text" name="userAddress" value="${user.userAddress}" style="text-align: center; background-color: #fcfcfc;">
    </li>
    <li class="modify-item">
        <label class="modify-label"style="display: inline-block; width: 140px;">운전면허번호<span style="color: red;">*</span></label>
        <input class="modify-input" type="text" name="dLicense" value="${user.dLicense}" style="text-align: center; background-color: #fcfcfc;">
    </li>
</ul>
        </div>
        <div class="modify-buttons">
            <input class="modify-submit" type="submit" value="수정완료">
            <button class="modify-list-button" type="button" onclick="showUserList();">목록으로</button>
        </div>
    </form>
    <script>
        function showUserList() {
            location.href="/user/admin_m_list";
        }
    </script>
	</main>
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</body>
</html>
