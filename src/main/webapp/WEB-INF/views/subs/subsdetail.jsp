<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DriveConnect</title>
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Kanit:wght@200&family=Noto+Sans+KR&family=Roboto&display=swap');
	</style>
	<link rel="stylesheet" href="/resources/css/register.css?after">
</head>
	<body>
		<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
		
	<main>
	<h1>게시글 상세 </h1>
	<link rel="stylesheet" href="../resources/css/main.css">
		<ul>
			<li>
				<label>제목</label>
				<span>${subs.scName }</span>
			</li>
			<li>
				<label>작성자</label>
				<span>
					<c:choose>
      						<c:when test="${sessionScope.userId != 'admin'}">
      							관리자
					        </c:when>
					        <c:otherwise>
          						${sessionScope.userName}
   	 						</c:otherwise>
					</c:choose>
				</span>
			</li>
			<li>
				<label>내용</label>
				<p>${subs.scSpec }</p>
			</li>
			<li>
				<lable>첨부파일</lable>
				<!-- spring으로 받을 수 없고 변환작업이 필요함 -->
<%-- 				<img art="첨부파일" src="../resources/nuploadFiles/${board.boardFileRename }"> --%>
				<a href="../resources/nuploadFiles/${subsFiles.fileRename }" download>${subsFiles.fileName }</a>
				<c:if test="${not empty subsFiles.fileName }">
				<a href="#">삭제하기</a>
				</c:if>
			</li>
		</ul>
		<br><br>
		<c:url var="boardDelUrl" value="/subs/delete">
			<c:param name="scNo" value="${subs.scNo }"></c:param>
		</c:url>
		<c:url var="modifyUrl" value="/board/modify.kh">
  			  <c:param name="scNo" value="${subs.scNo }"></c:param>
		</c:url>
		<div>
			<c:if test="${userId eq 'admin'}">
			<button type="button" onclick="showModifyPage('${modifyUrl }');">수정하기</button>
			<form action="/subs/delete" method="post">
			    <input type="hidden" name="_method" value="delete"> <!-- HTTP DELETE 메서드 설정 -->
			    <input type="hidden" name="scNo" value="${subs.scNo}">
			    <c:if test="${userId eq 'admin'}">
			        <button type="submit" onclick="return confirm('삭제하시겠습니까?')">삭제하기</button>
			    </c:if>
			</form>
			</c:if>
			<button type="button" onclick="showNoticeList();">목록으로</button>
			<button type="button" onclick="javascript:history.go(-1);">뒤로가기</button>			
		</div>

	</main>
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</body>
</html>