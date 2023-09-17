<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 등록</title>
		<link rel="stylesheet" href="../resources/css/main.css">
	</head>
	<body>
		<h1>공지 등록</h1>
		<form action="/notice/modify" method="post" enctype="multipart/form-data">
<!-- 		수정할 때, 리다이렉트 될 때 사용 -->
		<input type="hidden" name="nNo" value="${notice.nNo }" >
			<ul>
				<li>
					<label>제목</label>
					<input type="text" name="nSubject" value="${notice.nSubject }" >
				</li>
				<li>
					<label>작성자</label>
					<input type="text" name="noticeWriter" value="${notice.userId }">
				</li>
				<li>
					<label>내용</label>
					<textarea rows="4" cols="50" name="nContent">${notice.nContent}</textarea>
				</li>
				<li>
					<label>작성날짜</label>
				<td>
						<fmt:formatDate pattern="yyyy-MM-dd" value="${review.rDate }"/>
				</td>
				</li>
			</ul>
			<div>
				<input type="submit" value="수정완료">
				<button type="button" onclick="showNoticeList();">목록으로</button>
			</div>
		</form>
		<script>
			function showNoticeList() {
				location.href="/notice/list";
			}
		</script>
	</body>
</html>