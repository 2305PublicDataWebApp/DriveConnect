<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시글 수정</title>
		<link rel="stylesheet" href="../resources/css/main.css">
	</head>
	<body>
		<h1>게시글 수정</h1>
		<form action="/qna/qnamodify" method="post" >
		<input type="hidden" name="qnaNo" value="${qna.qNo }" >
			<ul>
				<li>
					<label>제목</label>
					<input type="text" name="qSubject" value="${qna.qSubject }" >
				</li>
				<li>
					<label>작성날짜</label>
					<input type="text" name="qnaWriter" value="${qna.userId }">
				</li>
				<li>
					<label>내용</label>
					<textarea rows="4" cols="50" name="qContent">${qna.qContent}</textarea>
				</li>
			</ul>
			<div>
				<input type="submit" value="수정완료">
				<button type="button" onclick="showQnaList();">목록으로</button>
				<button type="button" onclick="javascript:history.go(-1);">뒤로가기</button>
			</div>
		</form>
		<script>
			function showQnaList() {
				location.href="/qna/qnalist";
			}
		</script>
	</body>
</html>