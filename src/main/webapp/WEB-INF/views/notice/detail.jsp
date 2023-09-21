<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 상세</title>
    <link rel="stylesheet" href="/resources/css/board/notice.css">
</head>
<body>
    <h1 class="detail-title">공지사항 상세</h1>
    <ul class="detail-list">
        <li>
            <label class="detail-label">제목</label>
            <input class="detail-input" type="text" name="nSubject" value="${notice.nSubject}" readonly>
        </li>
        <li>
            <label class="detail-label">내용</label>
            <p class="detail-content">${notice.nContent}</p>
        </li>
        <li>
            <label class="detail-label">작성날짜</label>
            <p class="detail-date">
                <fmt:formatDate pattern="yyyy-MM-dd" value="${notice.nDate}" />
            </p>
        </li>
    </ul>
    <div class="detail-buttons">
<%--     <c:if test="${user.userId eq 'khuser01' || user.userId eq 'admin'}"> --%>
<%-- 	<c:if test="${user.userId eq 'admin'}"> --%>
<c:if test="${sessionScope.userId ne null && String.valueOf(sessionScope.adminYn) eq 'Y' }">
        <button class="detail-button" type="button" onclick="showModifyPage();">수정하기</button>
        <button class="detail-button" onclick="deleteNotice();">삭제하기</button>
    </c:if>
        <button class="detail-button" type="button" onclick="showNoticeList();">목록으로</button>
    </div>
        <form id="deleteForm" action="/notice/delete" method="post">
        <input type="hidden" name="nNo" value="${notice.nNo}">
    </form>
    <script>
        function showModifyPage() {
            const nNo = "${notice.nNo}";
            location.href = "/notice/modify?nNo=" + nNo;
        }
        
        function showNoticeList() {
            location.href = "/notice/list";
        }
        
        function deleteNotice() {
            if (confirm("공지사항을 삭제하시겠습니까?")) {
                document.getElementById("deleteForm").submit();
            }
        }
    </script>
</body>
</html>
