<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DriveConnect</title>
</head>
<body>
	<h1>차량 신규 등록</h1>
	<form action="/subs/admin_s_write" method="post" enctype="multipart/form-data">
	<input type="hidden" name="userId" value="${sessionScope.userId }">
		<ul>
			<li>
				<label>차량명</label>
				<input type="text" name="scName" value="${subs.scName }">
			</li>
			<li>
				<label>작성자</label>
<%-- 				<input type="text" name="boardWriter" value="${sessionScope.memberId }" readonly> --%>
				<span>${userName }</span>
			</li>
			<li>
				<label>내용</label>
<!-- 				내용은 긴~text 쓰는거니까 textarea사용! -->
				<textarea rows="4" cols="50" name="scSpec" value="${subs.scSpec }"></textarea>
			</li>
			<li>
				<label>첨부파일</label>
<!-- 				첨부파일은 String으로 받을 수 없어서 변환작업(파싱)이 필요함  -->
				<input type="file" name="uploadFile">
			</li>
		</ul>
		<div>
		<input type="submit" value="등록하기">			
		</div>
	</form>
</body>
</html>