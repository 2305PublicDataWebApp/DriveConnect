<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 목록</title>
		<link rel="stylesheet" href="../resources/css/notice/notice.css">
	</head>
	<body>
		<h1>공지사항 목록</h1>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성날짜</th>
				</tr>
			</thead>
			<tbody>
<!-- 			list 데이터는 items에 넣었고 var에서 설정한 변수로 list 데이터에서  -->
<!-- 			꺼낸 값을 사용하고 값은 varStatus로 사용 -->
				<c:forEach var="notice" items="${nList }" varStatus="i">
				<tr>
					<td>${i.count }</td>
					<c:url var="detailUrl" value="/notice/detail">
						<c:param name="nNo" value="${notice.nNo }"></c:param>
					</c:url>
					<td><a href="${detailUrl }">${notice.nSubject }</a></td>
					<td>${notice.userNo }</td>
					<td>
						<fmt:formatDate pattern="yyyy-MM-dd" value="${notice.nDate }"/>
					</td>
				</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4">
						<button type="button" onclick="showRegisterForm();">글쓰기</button>
					</td>
				</tr>
			</tfoot>
		</table>
		<script>
			const showRegisterForm = () => {
				location.href = "/notice/insert";
			}
		</script>
	</body>
</html>