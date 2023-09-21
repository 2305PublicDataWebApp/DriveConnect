<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 조회 페이지</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<main>
        <h1>회원 조회 페이지</h1>
        <c:if test="${empty memberList}">
            <p>조회된 회원 정보가 없습니다.</p>
        </c:if>
        <c:if test="${not empty memberList}">
            <table>
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>아이디</th>
                        <th>이름</th>
                        <th>전화번호</th>
                        <th>운전면허번호</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${memberList}" var="user" varStatus="loop">
                        <tr>
                            <td>${loop.index + 1}</td>
                            <td>${user.userId}</td>
                            <td>${user.userName}</td>
                            <td>${user.userPhone}</td>
                            <td>${user.dLicense}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
</main>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>