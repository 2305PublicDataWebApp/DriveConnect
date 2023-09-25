<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문의 상세</title>
            <style>
		@import url('https://fonts.googleapis.com/css2?family=Kanit:wght@200&family=Noto+Sans+KR&family=Roboto&display=swap');
		
		.custom-main {
	    height: auto;
        text-align: center;
	    }
	    
	            .container {
            width: 700px; /* 적절한 너비 설정 */
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
        }
	    </style>
    <link rel="stylesheet" href="/resources/css/board/detail.css?after">
</head>
</head>
	<body>
		<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>	
	<main class="custom-main">
	        <div class="container">
	<h1>문의 상세</h1>
    <ul>
        <li>
            <label>작성자</label>
            <input type="text" name="userId" value="${qna.userId}" readonly>
        </li>
        <li>
            <label>제목</label>
            <input type="text" name="qSubject" value="${qna.qSubject}" readonly>
        </li>
        <li>
            <label>내용</label>
            <p>${qna.qContent}</p>
        </li>
        <li>
            <label>작성날짜</label>
            <input type="datetime" name="qCreate" value="${qna.qCreate}" readonly>
        </li>
    </ul>
    <c:url var="qnaDelUrl" value="/qna/delete">
        <c:param name="qNo" value="${qna.qNo}"></c:param>
        <c:param name="userId" value="${qna.userId}"></c:param>
    </c:url>
    <c:url var="modifyUrl" value="/qna/qnamodify">
        <c:param name="qNo" value="${qna.qNo}"></c:param>
        <c:param name="userId" value="${qna.userId}"></c:param>
    </c:url>
    <div>
        <c:if test="${qna.userId eq userId}">
            <button type="button" onclick="showModifyPage('${modifyUrl}');">수정하기</button>
            <button type="button" onclick="deleteQna('${qnaDelUrl}');">삭제하기</button>
        </c:if>
        <button type="button" onclick="showQnaList();">목록으로</button>
        <button type="button" onclick="javascript:history.go(-1);">뒤로가기</button>
    </div>
    <hr>
    <!-- 댓글 등록 -->
    <form action="/qreply/qnaadd" method="post">
        <input type="hidden" name="qNo" value="${qna.qNo}">
        <table width="500" border="1">
            <tr>
                <td>
                    <textarea rows="3" cols="55" name="qnaReplyContent"></textarea>
                </td>
                <td>
                    <input type="submit" value="완료">
                </td>
            </tr>
        </table>
    </form>
    <!-- 댓글 목록 -->
    <table width="600" border="1">
        	<tr>
        		<th>작성자</th>
        		<th>내용</th>
        		<th>수정/삭제</th>
        	</tr>
        <c:forEach var="qreply" items="${qrList}">
            <tr>
                <td>${qreply.userId}</td>
                <td>${qreply.qnaReplyContent}</td>
                <td>
                    <a href="javascript:void(0);" onclick="showReplyModifyForm(this);">수정하기</a>
                    <c:url var="delUrl" value="/qreply/qnadelete">
                        <c:param name="qnaReplyNo" value="${qreply.qnaReplyNo}"></c:param>
                        <c:param name="userId" value="${qreply.userId}"></c:param>
                        <c:param name="qNo" value="${qna.qNo}"></c:param>
                    </c:url>
                    <a href="javascript:void(0);" onclick="deleteQReply('${delUrl}');">삭제하기</a>
                </td>
            </tr>
            <tr id="replyModifyForm" style="display:none;">
                <td colspan="3"><input id="qnaReplyContent" type="text" size="55" name="qnaReplyContent" value="${qreply.qnaReplyContent}"></td>
                <td><input type="button" onclick="replyModify(this,'${qna.qNo}', '${qreply.qnaReplyNo}')" value="완료"></td>
            </tr>
        </c:forEach>
    </table>
  </div>
    
    <script>
//         function showModifyPage(modifyUrl) {
//             location.href = modifyUrl;
//         }

//         function showqnaList() {
//             location.href = "/qna/qnalist";
//         }

//         function deleteqna(qnaDelUrl) {
//             if (confirm("게시물을 삭제하시겠습니까?")) {
//                 location.href = qnaDelUrl;
//             }
//         }

//         function showModifyForm(obj, rrContent) {
//             obj.parentElement.parentElement.nextElementSibling.style.display = "";
//         }

//         function deleteReply(delUrl) {
//             if (confirm("댓글을 삭제하시겠습니까?")) {
//                 location.href = delUrl;
//             }
//         }

//         function replyModify(btn, rNo, qNo) {
//             var rrContent = btn.parentElement.previousElementSibling.firstElementChild.value;
//             // 수정 로직 구현
//             // ...
//         }

const deleteQna = (url) => {
					location.href = url;
				}
			
				function deleteQReply(url) {
					location.href = url;
				}
			
				function showModifyPage(modifyUrl) {
					location.href=modifyUrl;
				}
				function showQnaList() {
					location.href="/qna/qnalist";
				}
				function replyModify(obj, qNo, qnaReplyNo) {
					const form = document.createElement("form");
					form.action = "/qreply/qnaupdate";
					form.method = "post";
					const input = document.createElement("input");
					input.type = "hidden";
					input.value = qnaReplyNo;
					input.name = "qnaReplyNo";
					const input2 = document.createElement("input");
					input2.type = "hidden";
					input2.value = qNo;
					input2.name = "qNo";
					const input3 = document.createElement("input");
					input3.type = "text";
					input3.value = obj.parentElement.previousElementSibling.firstChild.value;
					input3.name = "qnaReplyContent";
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
	</main>
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</body>
</html>
