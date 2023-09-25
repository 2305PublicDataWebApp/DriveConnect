<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
        
	    
        /* 공통 스타일 */
	    
	            .detail-title {
            font-size: 24px;
            margin-top: 20px;
            margin-bottom: 20px;
        }
        
        .detail-list {
            list-style: none;
            padding: 0;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 10px; /* 버튼 사이 간격 조절 */
        }
        
        .detail-list li {
            flex: 0 0 calc(50% - 5px); /* 두 개의 항목을 한 줄에 표시하고 간격을 설정 */
            text-align: left;
            margin-bottom: 10px;
        }
        
        /* 버튼 스타일 */
        .detail-button {
            background-color: #000;
            color: #fff;
            cursor: pointer;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 14px;
            transition: background-color 0.3s;
        }
        
        .detail-button:hover {
            background-color: #333;
        }
        
/* 댓글 폼 스타일 */
.detail-list {
    list-style: none;
    padding: 0;
}

.detail-list li {
    margin-bottom: 15px;
}

.detail-label {
    font-weight: bold;
}

.detail-input {
    width: 80%; /* 원하는 너비로 조정하세요 */
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
}

.detail-content {
    font-size: 16px;
    margin-top: 5px;
}

.detail-date {
    font-size: 14px;
    color: #555;
    margin-top: 5px;
}

.detail-container {
    width: 80%; /* 원하는 틀의 너비로 조정 */
    margin: 0 auto; /* 가로 중앙 정렬을 위해 auto 사용 */
    padding: 20px; /* 내부 여백 설정 (원하는 여백 크기로 조정) */
    border: 2px double #b8b8b8; /* 틀의 테두리 설정 (원하는 스타일 및 색상으로 조정) */
    border-radius: 20px; /* 틀의 모서리를 둥글게 만들기 위한 설정 */
}

.detail-buttons {
    margin-top: 40px; /* 버튼과 항목들 사이의 여백 설정 (원하는 여백 크기로 조정) */
}
	    
	</style>
	<link rel="stylesheet" href="/resources/css/register.css?after">
<!--     <link rel="stylesheet" href="/resources/css/board/notice.css"> -->
</head>
	<body>
		<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>	
	<main class="custom-main">
	        <section class="text__wrap section center nexon">
	        <div class="container">
	            <span class="section__small">회원 관리</span>
	            <h2 class="section__h2 mb70">회원정보 상세 조회</h2>
        </section>

	<div class="detail-container">
    <ul class="detail-list">
        <li>
            <label class="detail-label">아이디</label>
            <input class="detail-input" type="text" name="userId" value="${user.userId}" readonly>
        </li>
        <li>
            <label class="detail-label">비밀번호</label>
			<input class="detail-input" type="password" name="userPw" value="${user.userPw}">
        </li>
        <li>
            <label class="detail-label">이름</label>
			<input class="detail-input" type="text" name="userName" value="${user.userName}">
        </li>
        <li>
            <label class="detail-label">이메일</label>
            <input class="detail-input" type="text" name="userEmail" value="${user.userEmail}">
        </li>
        <li>
            <label class="detail-label">전화번호</label>
            <input class="detail-input" type="text" name="userPhone" value="${user.userPhone}">
        </li>
        <li>
            <label class="detail-label">주소</label>
            <input class="detail-input" type="text" name="userAddress" value="${user.userAddress}">
        </li>
        <li>
            <label class="detail-label" type="text">운전면허번호</label>
            <input class="detail-input" type="text" name="dLicense" value="${user.dLicense}">
        </li>
        <li>
            <label class="detail-label" type="text">가입날짜</label>
            <input class="detail-input" type="text" name="uDate" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${user.uDate}" />'>
        </li>
    </ul>
    </div>
    <div class="detail-buttons">
<%--     <c:if test="${user.userId eq 'khuser01' || user.userId eq 'admin'}"> --%>
<%-- 	<c:if test="${user.userId eq 'admin'}"> --%>
<%-- <c:if test="${sessionScope.userId ne null && String.valueOf(sessionScope.adminYn) eq 'Y' }"> --%>
        <button class="detail-button" type="button" onclick="showModifyPage();">수정하기</button>
        <button class="detail-button" onclick="deleteUser();">삭제하기</button>
<%--     </c:if> --%>
        <button class="detail-button" type="button" onclick="showUserList();">목록으로</button>
    </div>
        <form id="deleteForm" action="/user/delete" method="post">
        <input type="hidden" name="userNo" value="${user.userNo}">
    </form>
    <script>
        function showModifyPage() {
            const userNo = "${user.userNo}";
            location.href = "/user/admin_modify?userNo=" + userNo;
        }
        
        function showUserList() {
            location.href = "/user/admin_m_list";
        }
        
        function deleteUser() {
            if (confirm("회원정보을 삭제하시겠습니까?")) {
                document.getElementById("deleteForm").submit();
            }
        }
    </script>
	</main>
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</body>
</html>
