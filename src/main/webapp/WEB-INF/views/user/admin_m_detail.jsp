<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 상세페이지</title>
    <link rel="stylesheet" href="/resources/css/board/notice.css">
</head>
<body>
    <h1 class="detail-title">회원 상세</h1>
    <ul class="detail-list">
        <li>
            <label class="detail-label">아이디</label>
            <input class="detail-input" type="text" name="userId" value="${user.userId}" readonly>
        </li>
        <li>
            <label class="detail-label">비밀번호</label>
            <p class="detail-content">${user.userPw}</p>
        </li>
        <li>
            <label class="detail-label">이름</label>
            <p class="detail-content">${user.userName}</p>
        </li>
        <li>
            <label class="detail-label">이메일</label>
            <p class="detail-content">${user.userEmail}</p>
        </li>
        <li>
            <label class="detail-label">전화번호</label>
            <p class="detail-content">${user.userPhone}</p>
        </li>
        <li>
            <label class="detail-label">주소</label>
            <p class="detail-content">${user.userAddress}</p>
        </li>
        <li>
            <label class="detail-label">운전면허번호</label>
            <p class="detail-content">${user.dLicense}</p>
        </li>
        <li>
            <label class="detail-label">가입날짜</label>
            <p class="detail-date">
                <fmt:formatDate pattern="yyyy-MM-dd" value="${user.uDate}" />
            </p>
        </li>
    </ul>
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
</body>
</html>
