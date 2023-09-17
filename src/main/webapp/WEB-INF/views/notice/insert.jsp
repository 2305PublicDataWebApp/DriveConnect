<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 등록</title>
		<link rel="stylesheet" href="../resources/css/main.css">
	</head>
	<body>
		<h1>공지 등록</h1>
		<form action="/notice/insert" method="post">
			<ul>
				<li>
					<label>제목</label>
					<input type="text" name="nubject">
				</li>
				<li>
					<label>작성자</label>
					<input type="text" name="noticeWriter">
				</li>
				<li>
					<label>내용</label>
					<textarea rows="4" cols="50" name="nContent"></textarea>
				</li>
			</ul>
			<div>
				<input type="submit" value="등록">
			</div>
		</form>
	</body>
</html>