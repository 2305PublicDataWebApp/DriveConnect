<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>차량 정보 수정</h1>
	<form action="/subs/admin_s_modify" method="post" enctype="multipart/form-data">
	<input type="hidden" name="userId" value="${sessionScope.userId }">
	
	<!-- 		수정할 때 리다이렉트 될 때 사용	 -->
		<input type="hidden" name="scNo" value="${subs.scNo }">
<!-- 		기존 업로드 파일 체크할 때 사용 -->
		<input type="hidden" name="Filename" value="${subs.subsFiles.fileName }">
		<input type="hidden" name="FileRename" value="${subs.subsFiles.fileRename }">
		<input type="hidden" name="Filepath" value="${subs.subsFiles.filePath }">
		<input type="hidden" name="Filelength" value="${subs.subsFiles.fileLength }">
		<ul>
			<li>
				<label>작성자</label>
				<span>${userName }</span>
			</li>
			<li>
				<label>차량명</label>
				<input type="text" name="scName" value="${subs.scName }">
			</li>
			<li>
				<label>차량브랜드</label>
				<input type="text" name="scBrand" value="${subs.scBrand }">
			</li>
			<li>
				<label>차량색</label>
				<input type="text" name="scColor" value="${subs.scColor }">
			</li>
			<li>
				<label>내용</label>
<%-- 				<textarea rows="4" cols="50" name="scSpec" value="${subs.scSpec }"></textarea> --%>
				<textarea rows="4" cols="50" name="scSpec">${subs.scSpec }</textarea>
			</li>
			<li>
				<label>첨부파일</label>
<!-- 				첨부파일은 String으로 받을 수 없어서 변환작업(파싱)이 필요함  -->
				<a href="../resources/nuploadFiles/${subs.subsFiles.fileName }" download>${subs.subsFiles.fileName }</a>
				<input type="file" name="uploadFile">
			</li>
		</ul>
		<div>
		<input type="submit" value="수정완료">
				<button type="button" onclick="showSubsList();">목록으로</button>			
		<button type="button" onclick="javascript:history.go(-1);">뒤로가기</button>			
		</div>
			<script>
			function showSubsList() {
				location.href="/subs/subslist";
			}
			</script>
	</form>
</body>
</html>