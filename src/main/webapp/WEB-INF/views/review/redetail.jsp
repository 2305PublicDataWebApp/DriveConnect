<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>후기 상세</title>
    <link rel="stylesheet" href="/resources/css/board/redetail.css">
</head>
<body>
    <div class="container">
        <h1>후기 상세</h1>
        <div class="review-details">
            <ul>
                <li>
					<label>글 번호</label>
					<input type="number" name="rNo" value="${review.rNo }" readonly>
				</li>
				<li>
					<label>작성날짜</label>
					<input type="datetime" name="rCreate" value="${review.rCreate }" readonly>
				</li>
				<li>
					<label>작성자</label>
					<input type="text" name="userId" value="${review.userId }" readonly>
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
					<input type="text" name="rContent" value="${review.rContent }" readonly>
				</li>
				<li>
<!-- 					<label>첨부파일</label> -->
					    <img alt="첨부파일"  src="../resources/ruploadFiles/${review.fileRename }">
				</li>
            </ul>
            <c:url var="reviewDelUrl" value="/review/delete">
				<c:param name="rNo" value="${review.rNo }"></c:param>
				<c:param name="userId" value="${review.userId }"></c:param>
			</c:url>
			<c:url var="modifyUrl" value="/review/remodify">
				<c:param name="rNo" value="${review.rNo }"></c:param>
				<c:param name="userId" value="${review.userId }"></c:param>
			</c:url>
        </div>
        <div class="buttons">
            <c:if test="${review.userId eq userId }">
					<button type="button" onclick="showModifyPage('${modifyUrl}');">수정하기</button>
					<button type="button" onclick="deleteReview('${reviewDelUrl}');">삭제하기</button>
				</c:if>
				<button type="button" onclick="showReviewList();">목록으로</button>
				<button type="button" onclick="javascript:history.go(-1);">뒤로가기</button>
        </div>
        <hr>
<!-- 			댓글 등록 -->
       		<form action="/rreply/readd" method="post">
				<input type="hidden" name="rrNo" value="0">
				<input type="hidden" name="rNo" value="${review.rNo }">
				<table width="500" border="1">
					<tr>
						<td>
							<textarea rows="3" cols="55" name="rrContent"></textarea>
						</td>
						<td>
							<input type="submit" value="완료">
						</td>
					</tr>
				</table>
			</form>
			<table width="600" border="1">
				<tr>
	        		<th>작성자</th>
	        		<th>내용</th>
	        		<th>수정/삭제</th>
	        	</tr>
				<c:forEach var="rreply" items="${rrList }">
					<tr>
						<td>${rreply.userId }</td>
						<td>${rreply.rrContent }</td>
						<td>
							<a href="javascript:void(0);" onclick="showReplyModifyForm(this);">수정하기</a>
							<c:url var="delUrl" value="/rreply/delete">
								<c:param name="rrNo" value="${rreply.rrNo }"></c:param>
<!-- 								작성자만 작성글을 지울 수 있도록 설정 -->
								<c:param name="userId" value="${rreply.userId }"></c:param>
<!-- 								성공하면 디테일로 가기 위한 boardNo 셋팅 -->
								<c:param name="rNo" value="${review.rNo }"></c:param>
							</c:url>
							<a href="javascript:void(0);" onclick="deleteReply('${delUrl}');">삭제하기</a>
						</td>
					</tr>
				<tr id="replyModifyForm" style="display:none;">
					<td colspan="3"><input id="rrContent" type="text" size="55" name="rrContent" value="${rreply.rrContent }"></td>
					<td><input type="button" onclick="replyModify(this, '${review.rNo }','${rreply.rrNo }');" value="완료"></td>
				</tr>
				</c:forEach>
				</table>
    </div>

<!--     추가된 이미지 미리보기 -->
<!--     <div class="image-preview"> -->
<!--         <img id="imagePreview" src="#" alt="이미지 미리보기"> -->
<!--     </div> -->

    <script>
        const imageUpload = document.getElementById("imageUpload");

			    const imagePreview = document.getElementById("imagePreview");
			    imageUpload.addEventListener("change", function () {
			        const file = this.files[0];

			        if (file) {
			            const reader = new FileReader();
			            reader.onload = function (e) {
			                imagePreview.src = e.target.result;
			            };
			            reader.readAsDataURL(file);
			        } else {
			            imagePreview.src = "#";
			        }
			    });
			
			
			    function deleteReview(url){
					location.href=url;
				}
				
				function deleteReply(url){
					location.href=url;
				}
			
				function showModifyPage(modifyUrl) {
					location.href=modifyUrl;
				}
				function showReviewList() {
					location.href="/review/relist";
				}
				function replyModify(obj, rNo, rrNo) {
// 					DOM 프로그래밍을 이용하는 방법
					const form = document.createElement("form");
					form.action = "/rreply/update";
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
					input3.value = obj.parentElement.previousElementSibling.firstChild.value;
					input3.name = "rrContent";
					form.appendChild(input);
					form.appendChild(input2);
					form.appendChild(input3);
					
					document.body.appendChild(form);
					form.submit();
				}
				function showReplyModifyForm(obj) {
					if(obj.parentElement.parentElement.nextElementSibling.style.display=="none"){
						obj.parentElement.parentElement.nextElementSibling.style.display="";
						obj.innerText = "수정취소";
					} else{
						obj.parentElement.parentElement.nextElementSibling.style.display="none";
						obj.innerText = "수정하기";
					}
				}
    </script>
</body>
</html>
