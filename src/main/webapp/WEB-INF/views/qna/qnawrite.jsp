<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>문의 등록</title>
	</head>
	<body>
		<h1>문의 등록</h1>
		<form action="/qna/qnawrite" method="post">
			<ul>
				<li>
					<label>작성자</label>
							<input type="text" name="qSubject" value="${userId }">
				</li>
				<li>
					<label>제목</label>
							<input type="text" name="qSubject" value="${qSubject }">
				</li>
				<li>
					<label>후기 내용</label>
					<textarea rows="4" cols="50" name="r_Content"></textarea>
				</li>
			</ul>
			<div>
				<input type="submit" value="제출하기">
			</div>
		</form>
	</body>
</html>