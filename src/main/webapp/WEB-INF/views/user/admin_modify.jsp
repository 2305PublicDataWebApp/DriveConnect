<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원정보 수정</title>
    <link rel="stylesheet" href="/resources/css/board/admin_modify.css?after">
</head>
<body>
    <h1 class="modify-title">회원정보 수정</h1>
    <form action="/user/admin_modify" method="post" enctype="multipart/form-data">
        <!-- 수정할 때, 리다이렉트 될 때 사용 -->
        <input type="hidden" name="userNo" value="${user.userNo}">
        <ul class="modify-list">
		<li>
            <label class="detail-label">아이디</label>
            <p class="detail-content">${user.userId}</p>
        </li>
		<li>
            <label class="detail-label">비밀번호</label>
            <p class="detail-content">${user.userPw}</p>
        </li>
            <li class="modify-item">
                <label class="modify-label">이름</label>
                <input class="modify-input" type="text" name="userName" value="${user.userName}">
            </li>
		<li>
            <label class="detail-label">이메일</label>
            <p class="detail-content">${user.userEmail}</p>
        </li>
		<li>
            <label class="detail-label">전화번호</label>
            <p class="detail-content">${user.userPhone}</p>
        </li>
            <li class="modify-item">
                <label class="modify-label">주소</label>
                <input class="modify-input" type="text" name="userAddress" value="${user.userAddress}">
            </li>
            <li class="modify-item">
                <label class="modify-label">운전면허번호</label>
                <input class="modify-input" type="text" name="dLicense" value="${user.dLicense}">
            </li>
        </ul>
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
</body>
</html>
