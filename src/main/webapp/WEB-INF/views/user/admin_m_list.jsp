<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원정보 내역</title>
    <link rel="stylesheet" href="/resources/css/board/qnalist.css?after">
</head>
<body>
<h1><a href="/index.jsp">HOME</a></h1>
    <section class="notice">
        <div class="page-title">
            <div class="container">
                <h3>회원정보</h3>
            </div>
        </div>
        <div id="notice-list">
            <div class="container">
                <table class="notice-table">
                    <colgroup>
                        <col width="5%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col" class="th-num">회원번호</th>
                            <th scope="col" class="th-title">아이디</th>
                            <th scope="col" class="th-date">이름</th>
                            <th scope="col" class="th-date">전화번호</th>
                            <th scope="col" class="th-date">운전면허번호</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${uList}" varStatus="i">
                            <tr>
                                <td>${i.count }</td>
                                <td>
                                    <c:url var="detailUrl" value="/user/admin_m_detail">
                                        <c:param name="userNo" value="${user.userNo }"></c:param>
                                    </c:url>
                                    <a href="${detailUrl }">${user.userId }</a>
                                </td>
                                <td>
                                	<a href="${detailUrl }">${user.userName }</a>
                                </td>
                                <td>${user.userPhone }</td>
                                <td>${user.dLicense }</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    <tfoot>
<!-- 				<tr> -->
<!-- 					<td colspan="4"> -->
<%-- <%-- 					<c:if test="${user.userId == khuser01}"> --%> 
<%-- 					<c:if test="${sessionScope.userId ne null && String.valueOf(sessionScope.adminYn) eq 'Y' }"> --%>
<!-- 						<button type="button" onclick="showRegisterForm();">글쓰기</button> -->
<%-- 					</c:if> --%>
<!-- 					</td> -->
<!-- 				</tr> -->
			</tfoot>
		</table>
            </div>
        </div>
    </section>
		<script>
// 			const showRegisterForm = () => {
// 				location.href = "/notice/insert";
// 			}
		</script>
</body>
</html>
