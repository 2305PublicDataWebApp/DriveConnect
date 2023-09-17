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
		<form action="/reply/modify" method="post" enctype="multipart/form-data">
<!-- 		수정할 때, 리다이렉트 될 때 사용 -->
		<input type="hidden" name="rNo" value="${reply.rNo }" >
<!-- 		기존 업로드 파일 체크할 때 사용 -->
		<input type="hidden" name="fileName" value="${reply.fileName }" >
		<input type="hidden" name="fileRename" value="${reply.fileRename }" >
		<input type="hidden" name="filePath" value="${reply.filePath }" >
		<input type="hidden" name="fileLength" value="${reply.fileLength }" >
			<ul>
				<li>
					<label>작성자</label>
					<input type="text" name="userId" value="${reply.userId }">
				</li>
				<li>
					<label>차량명</label>
					<input type="text" name="sc_Name" value="${reply.scName }" >
				</li>
				<li>
					<label>제목</label>
					<input type="text" name="rSubject" value="${reply.rSubject }" >
				</li>
				<li>
					<label>내용</label>
					<textarea rows="4" cols="50" name="rContent">${reply.rContent}</textarea>
				</li>
				<li>
					<label>첨부파일</label>
						<img alt="첨부파일" src="${rFilepath }">
				</li>
			</ul>
			<div>
				<input type="submit" value="수정완료">
				<button type="button" onclick="showreplyList();">목록으로</button>
				<button type="button" onclick="javascript:history.go(-1);">뒤로가기</button>
			</div>
		</form>
		<script>
			function showreplyList() {
				location.href="/reply/list";
			}
		</script>
	</body>
</html>