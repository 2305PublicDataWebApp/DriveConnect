<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>문의 내역</title>
	</head>
	<body>
		<h1><a href="/index.jsp">HOME</a></h1>
		<h1>문의 내역</h1>
		<table>
			<colgroup>
				<col width="60%"></col>
				<col width="10%"></col>
				<col width="5%"></col>
			</colgroup>
			<thead>
				<tr>
					<th>제목</th>
					<th>작성날짜</th>
					<th>답변여부</th>
				</tr>
			</thead>
			<tbody>
				<tr>
				<c:url var="listlUrl" value="/qna/qnalist">
					<td><a href="${detailUrl }">${qna.qSubject }</a></td>
					<td>${qna.userId }</td>
					<td>
						<fmt:formatDate pattern="yyyy-MM-dd" value="${qna.qCreate }"/>
					</td>
					<td>${qna.rYn }</td>
					</c:url>
				</tr>
			</tbody>
			<tfoot>
						
				<tr>
					<td>
						<button type="button" onclick="showRegisterForm();">글쓰기</button>
					</td>
				</tr>
			</tfoot>
		</table>
		<script>
			const showRegisterForm = () => {
				location.href = "/qna/insert";
			}
		</script>
	</body>
</html>