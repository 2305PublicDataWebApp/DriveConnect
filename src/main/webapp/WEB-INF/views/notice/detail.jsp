<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 상세</title>
		<link rel="stylesheet" href="../resources/css/main.css">
	</head>
	<body>
		<h1>공지사항 상세</h1>
			<ul>
				<li>
					<label>제목</label>
					<input type="text" name="noticeSubject" value="${notice.nSubject }" readonly>
				</li>
				<li>
					<label>작성자</label>
					<input type="text" name="noticeWriter" value="${notice.noticeWriter }">
				</li>
				<li>
					<label>내용</label>
					<p>${notice.noticeContent }</p>
				</li>
				<li>
					<label>작성날짜</label>
					<td>
						<fmt:formatDate pattern="yyyy-MM-dd" value="${notice.nDate }"/>
					</td>
				</li>
			</ul>
			<div>
				<button type="button" onclick="showModifyPage();">수정하기</button>
				<button>삭제하기</button>
				<button type="button" onclick="showNoticeList();">목록으로</button>
			</div>
			<script>
				function showModifyPage() {
					const noticeNo = "${notice.nNo }";
					location.href="/notice/modify?nNo="+nNo;
				}
				function showNoticeList() {
					location.href="/notice/list";
				}
			</script>
	</body>
</html>