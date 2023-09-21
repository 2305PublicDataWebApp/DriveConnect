<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 목록</title>
    <link rel="stylesheet" href="/resources/css/board/qnalist.css?after">
</head>
<body>
<h1><a href="/index.jsp">HOME</a></h1>
    <section class="notice">
        <div class="page-title">
            <div class="container">
                <h3>자주 묻는 질문</h3>
            </div>
        </div>
        <div id="often-list">
            <div class="container">
                <table class="often-table">
                    <colgroup>
                        <col width="10%">
                        <col width="60%">
                        <col width="20%">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col" class="th-num">번호</th>
                            <th scope="col" class="th-title">제목</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- 여기에 기존 데이터를 반복문으로 출력하는 코드 추가 -->
                        <!-- 예시: -->
                        <c:forEach var="often" items="${oList}" varStatus="i">
                            <tr>
                                <td>${i.count}</td>
                                <td>
                                    <c:url var="detailUrl" value="/often/ofdetail">
                                        <c:param name="oNo" value="${often.oNo}"></c:param>
                                    </c:url>
                                    <a href="${detailUrl}">${often.oSubject}</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="4">
<%--                                 <c:if test="${user.userId == khuser01}"> --%>
								<c:if test="${sessionScope.userId ne null && String.valueOf(sessionScope.adminYn) eq 'Y' }">
                                    <button type="button" onclick="showRegisterForm();">글쓰기</button>
                                </c:if>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </section>
    <script>
        const showRegisterForm = () => {
            location.href = "/often/ofinsert";
        }
    </script>
</body>
</html>
