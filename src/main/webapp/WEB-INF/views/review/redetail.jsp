<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>후기 상세</title>
		<link rel="stylesheet" href="../resources/css/main.css">
	</head>
	<body>
		<h1>후기 상세</h1>
			<ul>
				<li>
					<label>글 번호</label>
					<input type="number" name="rNo" value="${review.rNo }">
				</li>
				<li>
					<label>작성날짜</label>
					<input type="datetime" name="rCreate" value="${review.rCreate }">
				</li>
				<li>
					<label>작성자</label>
					<input type="text" name="userId" value="${review.userId }">
				</li>
				<li>
					<label>차량명</label>
					<input type="text" name="scName" value="${review.scName }" readonly>
				</li>
				<li>
					<label>제목</label>
					<input type="text" name="rSubject" value="${review.rSubject }" readonly>
				</li>
				<li>
					<label>내용</label>
					<p>${review.rContent }</p>
				</li>
				<li>
					<label>첨부파일</label>
						<img alt="첨부파일" src="${rFilepath }">
				</li>
			</ul>
			<c:url var="reviewDelUrl" value="/review/delete">
				<c:param name="rNo" value="${review.rNo }"></c:param>
				<c:param name="writeuserId" value="${review.userId }"></c:param>
			</c:url>
			<c:url var="modifyUrl" value="/review/remodify">
				<c:param name="rNo" value="${review.rNo }"></c:param>
				<c:param name="writeuserId" value="${review.userId }"></c:param>
			</c:url>
			<div>
				<c:if test="${review.userId eq userId }">
					<button type="button" onclick="showModifyPage('${modifyUrl}');">수정하기</button>
					<button type="button" onclick="deleteReview('${reviewDelUrl}');">삭제하기</button>
				</c:if>
				<button type="button" onclick="showReviewList();">목록으로</button>
				<button type="button" onclick="javascript:history.go(-1);">뒤로가기</button>
			</div>
			<hr>
<!-- 			댓글 등록 -->
				<form action="/rereply/readd" method="post">
					<input type="hidden" name="rreplyNo" value="${review.rNo }">
					<table width="500" border="1">
						<tr>
							<td>
								<textarea rows="3" cols="55" name="rreplyContent"></textarea>
							</td>
							<td>
								<input type="submit" value="완료">
							</td>
						</tr>
					</table>
				</form>
<!-- 			댓글 등록 -->
				<table width="600" border="1">
				<c:forEach var="reply" items="${rList }">
					<tr>
						<td>${reply.userId }</td>
						<td>${reply.rrContent }</td>
						<td>
							<a href="javascript:void(0);" onclick="showModifyForm(this, '${reply.rrContent }');">수정하기</a>
							<c:url var="delUrl" value="/rereply/delete">
								<c:param name="rreplyNo" value="${rereply.rrNo }"></c:param>
<!-- 								작성자만 작성글을 지울 수 있도록 설정 -->
								<c:param name="replyWriter" value="${reply.userId }"></c:param>
<!-- 								성공하면 디테일로 가기 위한 boardNo 셋팅 -->
								<c:param name="rNo" value="${reply.rNo }"></c:param>
							</c:url>
							<a href="javascript:void(0);" onclick="deleteReply('${delUrl}');">삭제하기</a>
						</td>
					</tr>
				<tr id="replyModifyForm" style="display:none;">
					<td colspan="3"><input id="rrContent" type="text" size="55" name="rrContent" value="${reply.rrContent }"></td>
					<td><input type="button" onclick="replyModify(this, '${reply.rNo }','${reply.rNo }');" value="완료"></td>
				</tr>
				</c:forEach>
				</table>
			<script>
			
				const deleteReview = (ReviewUrl) => {
					location.href = ReviewUrl;
				}
			
				function deleteReReply(url) {
					location.href = url;
				}
			
				function showModifyPage(modifyUrl) {
					location.href=modifyUrl;
				}
				function showReviewList() {
					location.href="/Review/relist";
				}
				function replyModify(obj, rrNo, rNo) {
// 					DOM 프로그래밍을 이용하는 방법
					const form = document.createElement("form");
					form.action = "/rereply/update";
					form.method = "post";
					const input = document.createElement("input");
					input.type = "hidden";
					input.value = rrNo;
					input.name = "rrNo";
					const input2 = document.createElement("input");
					input2.type = "hidden";
					input2.value = rNo;
					input2.name = "rNo";
					const input3 = document.createElement("input");
					input3.type = "text";
					// this를 이용해서 내가 원하는 노드 찾기
					input3.value = obj.parentElement.previousElementSibling.childNodes[0].value;
					input3.name = "rrContent";
					form.appendChild(input);
					form.appendChild(input2);
					form.appendChild(input3);
					
					document.body.appendChild(form);
					form.submit();
				}
				function showModifyForm(obj, rrContent) {
					obj.parentElement.parentElement.nextElementSibling.style.display="";
				}
			</script>
	</body>
</html>