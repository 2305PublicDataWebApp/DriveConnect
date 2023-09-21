<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>자주묻는 질문 상세</title>
    <link rel="stylesheet" href="/resources/css/board/notice.css">
</head>
<body>
    <h1 class="detail-title">자주묻는 질문 상세</h1>
    <ul class="detail-list">
        <li>
            <label class="detail-label">제목</label>
            <input class="detail-input" type="text" name="oSubject" value="${often.oSubject}" readonly>
        </li>
        <li>
            <label class="detail-label">작성자</label>
            <p class="detail-userId">${often.userId}</p>
        </li>
        <li>
            <label class="detail-label">내용</label>
            <p class="detail-content">${often.oContent}</p>
        </li>
    </ul>
    <div class="detail-buttons">
<%--     <c:if test="${user.userId == khuser01}"> --%>
<c:if test="${sessionScope.userId ne null && String.valueOf(sessionScope.adminYn) eq 'Y' }">
        <button class="detail-button" type="button" onclick="showModifyPage();">수정하기</button>
        <button class="detail-button" onclick="deleteOften();">삭제하기</button>
    </c:if>
        <button class="detail-button" type="button" onclick="showOftenList();">목록으로</button>
    </div>
        <form id="deleteForm" action="/often/delete" method="post">
        <input type="hidden" name="oNo" value="${often.oNo}">
    </form>
    <script>
        function showModifyPage() {
            const oNo = "${often.oNo}";
            location.href = "/often/ofmodify?oNo=" + oNo;
        }
        
        function showOftenList() {
            location.href = "/often/oflist";
        }
        
        function deleteOften() {
            if (confirm("자주묻는 질문을 삭제하시겠습니까?")) {
                document.getElementById("deleteForm").submit();
            }
        }
    </script>
</body>
</html>
