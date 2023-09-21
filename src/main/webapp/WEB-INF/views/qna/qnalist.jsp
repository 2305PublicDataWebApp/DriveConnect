<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문의 내역</title>
    <link rel="stylesheet" href="/resources/css/board/qnalist.css?after">
</head>
<body>
    <h1><a href="/index.jsp">HOME</a></h1>
    <h1>문의 내역</h1>
    <table>
        <colgroup>
            <col width="10%">
            <col width="60%">
            <col width="20%">
            <col width="20%">
        </colgroup>
        <thead>
            <tr>
                <th>글번호</th>
                <th>제목</th>
                <th>작성날짜</th>
                <th>답변여부</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="qna" items="${qList}" varStatus="i">
                <tr>
                <td>${i.count }</td>
					<c:url var="detailUrl" value="/qna/qnadetail">
						<c:param name="qNo" value="${qna.qNo }"></c:param>
					</c:url>
                    <td><a href="/qna/qnadetail?qNo=${qna.qNo}">${qna.qSubject}</a></td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd" value="${qna.qCreate }"/></td>
                    <td>${qna.rYn}</td>
                </tr>
            </c:forEach>
        </tbody>
        <tfoot>
            <tr>
                <td>
                    <button type="button" onclick="showRegisterForm();">문의하기</button>
                </td>
            </tr>
        </tfoot>
    </table>
    <script>
        const showRegisterForm = () => {
            location.href = "/qna/qnawrite";
        }
    </script>
</body>
</html>
