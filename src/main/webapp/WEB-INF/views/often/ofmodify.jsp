<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 수정</title>
    <link rel="stylesheet" href="/resources/css/board/modify.css?after">
</head>
<body>
    <h1 class="modify-title">공지 수정</h1>
    <form action="/often/ofmodify" method="post" >
        <!-- 수정할 때, 리다이렉트 될 때 사용 -->
        <input type="hidden" name="oNo" value="${often.oNo}">
        <ul class="modify-list">
            <li class="modify-item">
                <label class="modify-label">제목</label>
                <input class="modify-input" type="text" name="oSubject" value="${often.oSubject}">
            </li>
            <li class="modify-item">
                <label class="modify-label">내용</label>
                <textarea class="modify-textarea" rows="4" cols="50" name="oContent">${often.oContent}</textarea>
            </li>
        </ul>
        <div class="modify-buttons">
            <input class="modify-submit" type="submit" value="수정완료">
            <button class="modify-list-button" type="button" onclick="showOftenList();">목록으로</button>
        </div>
    </form>
    <script>
        function showOftenList() {
            location.href="/often/oflist";
        }
    </script>
</body>
</html>
