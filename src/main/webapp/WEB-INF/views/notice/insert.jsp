<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 등록</title>
    <link rel="stylesheet" href="/resources/css/board/insert.css?after">
</head>
<body>
    <h1 class="register-title">공지 등록</h1>
    <form action="/notice/insert" method="post">
        <ul class="register-list">
            <li class="register-item">
                <label class="register-label">제목</label>
                <input class="register-input" type="text" name="nSubject">
            </li>
            <li class="register-item">
                <label class="register-label">작성자</label>
                <input class="register-input" type="text" name="userId" value="${userId}">
            </li>
            <li class="register-item">
                <label class="register-label">내용</label>
                <textarea class="register-textarea" rows="4" cols="50" name="nContent"></textarea>
            </li>
        </ul>
        <div class="register-buttons">
            <input class="register-submit" type="submit" value="등록">
        </div>
    </form>
</body>
</html>
