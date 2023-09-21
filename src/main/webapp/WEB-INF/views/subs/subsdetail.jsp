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
    img {
        max-width: 800%;
        max-height: 800%;
    }
	</style>
	<link rel="stylesheet" href="/resources/css/register.css?after">
</head>
	<body>
		<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
		
	<main>
	<h1>차량 상세 조회 </h1>
	<link rel="stylesheet" href="../resources/css/main.css">
		<ul>
			<li>
				<img art="첨부파일" src="../resources/buploadFiles/${subs.subsFiles.fileRename }">
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
				<div>
				<label>차량명</label>
				<input type="text" name="scName" value="${subs.scName }">
				</div>
			</li>
			<li>
				<div>
				<label>브랜드</label>
				<input type="text" name="scBrand" value="${subs.scBrand }">
				</div>
			</li>
			<li>
				<div>
				<label>차량색</label>
				<input type="text" name="scColor" value="${subs.scColor }">
				</div>
			</li>
			<li>
				<div>
				<label>내용</label>
				<textarea rows="7" cols="50" name="scSpec">${subs.scSpec }</textarea>
				</div>
			</li>
			<li>
				<lable>첨부파일</lable>
				<!-- spring으로 받을 수 없고 변환작업이 필요함 -->
				<a href="../resources/nuploadFiles/${subs.subsFiles.fileRename }" download>${subs.subsFiles.fileName }</a>
				<c:if test="${not empty subs.subsFiles.fileName }">
				<a href="#">삭제하기</a>
				</c:if>
			</li>
		</ul>
		<br><br>
		<c:url var="boardDelUrl" value="/subs/delete">
			<c:param name="scNo" value="${subs.scNo }"></c:param>
		</c:url>
		<c:url var="modifyUrl" value="/subs/admin_s_modify">
  			  <c:param name="scNo" value="${subs.scNo }"></c:param>
		</c:url>
		<div>
			<c:if test="${userId eq 'admin'}">
<%-- 			<button type="button" onclick="showModifyPage('${modifyUrl }');">수정하기</button> --%>
			<button type="button" onclick="window.location.href='${modifyUrl}';">차량 수정하기</button>
			<form action="/subs/delete" method="post">
			    <input type="hidden" name="_method" value="delete"> <!-- HTTP DELETE 메서드 설정 -->
			    <input type="hidden" name="scNo" value="${subs.scNo}">
			    <c:if test="${userId eq 'admin'}">
			        <button type="submit" onclick="return confirm('삭제하시겠습니까?')">차량 삭제하기</button>
			    </c:if>
			</form>
			</c:if>
			<button type="button" onclick="showNoticeList();">목록으로</button>
			<button type="button" onclick="javascript:history.go(-1);">뒤로가기</button>
			<br>
			<button type="button" onclick="showReserveWrite();">차량 예약하기</button>			
		</div>
		<script>
			function showNoticeList() {
				window.location.href = '/subs/subslist';
			}
			function showReserveWrite() {
				const scNo = "${subs.scNo}";
				window.location.href = '/reserve/resewrite?scNo='+scNo;
			}
		</script>

	</main>
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</body>
</html>