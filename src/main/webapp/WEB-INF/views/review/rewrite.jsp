<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시글 등록</title>
	</head>
	<body>
		<h1>게시글 등록</h1>
		<form action="/review/rewrite" method="post" enctype="multipart/form-data">
			<ul>
				<li>
					<label>작성자</label>
<%-- 						<span>${userId }</span> --%>
							<input type="text" name="r_Subject" value="${userId }">
				</li>
				<li>
					<label>차량명</label>
<%-- <%-- 						<span>${sc_Name }</span> --%> 
<%-- 							<input type="text" name="r_Subject" value="${sc_Name }"> --%>
						<select name="searchCondition">
							<option value="All"<c:if test="${searchCondition == 'All' }">브랜드 선택</c:if>></option>
							<option value="Tesla"<c:if test="${searchCondition == 'Tesla' }">테슬라</c:if>></option>
							<option value="kia" <c:if test="${searchCondition == 'kia' }">기아</c:if>></option>
							<option value="bents" <c:if test="${searchCondition == 'bents' }">벤츠</c:if>></option>
							<option value="BMW" <c:if test="${searchCondition == 'BMW' }">비엠떱</c:if>></option>
						</select>
						<select name="searchCondition">
							<option value="All"<c:if test="${searchCondition == 'All' }">차종 선택</c:if>></option>
							<option value="audi"<c:if test="${searchCondition == 'Tesla' }">아우디</c:if>></option>
							<option value="lambo" <c:if test="${searchCondition == 'kia' }">람보르기니</c:if>></option>
							<option value="bents" <c:if test="${searchCondition == 'bents' }">벤츠</c:if>></option>
							<option value="BMW" <c:if test="${searchCondition == 'BMW' }">비엠떱</c:if>></option>
						</select>
				</li>
				<li>
					<label>후기 제목</label>
					<input type="text" name="r_Subject">
				</li>
				<li>
					<label>후기 내용</label>
					<textarea rows="4" cols="50" name="r_Content"></textarea>
				</li>
				<li>
					<label>첨부파일</label>
<!-- 					String으로 받을 수 없고 변환작업이 필요함 -->
					<input type="file" name="uploadFile">
				</li>
			</ul>
			<div>
				<input type="submit" value="등록">
			</div>
		</form>
	</body>
</html>