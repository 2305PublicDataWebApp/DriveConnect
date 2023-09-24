<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>자주묻는 질문 상세</title>
                <style>
		@import url('https://fonts.googleapis.com/css2?family=Kanit:wght@200&family=Noto+Sans+KR&family=Roboto&display=swap');
		
		.custom-main {
	    height: auto;
        text-align: center;
	    
	    }
	    	    		 /* common */
        .container {
            width: 1160px;
            margin: 0 auto;
            padding: 0 20px;
            /* background-color: rgba(0, 0, 0, 0.1); */
        }
        .nexon {
            font-family: 'NexonLv1Gothic';
            font-weight: 400;
        }
        .section {
            padding: 30px 0;
        }
        .section.center {
            text-align: center;
        }
        .section__small {
            font-size: 14px;
            border-radius: 50px;
            background-color: #0083FD;
            color: #fff;
            padding: 1px 23px;
            text-transform: uppercase;
            margin-bottom: 20px;
            display: inline-block;
        }
        .section__h2 {
            font-size: 50px;
            font-weight: 400;
            margin-bottom: 30px;
            line-height: 1;
        }
        .section__desc {
            font-size: 22px;
            color: #666;
            margin-bottom: 70px;
            font-weight: 300;
            line-height: 1.5;
        }	    
        .detail-button {
    background-color: #000;
    color: #fff;
    border: none;
    padding: 5px 10px;
    cursor: pointer;
    margin-top: 10px;
    border-radius: 5px;
}
	            .container2 {
            width: 700px; /* 적절한 너비 설정 */
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
        }
	    </style>
    <link rel="stylesheet" href="/resources/css/board/notice.css">
</head>
<body>
		<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>	
	<main class="custom-main">
	    <section class="text__wrap section center nexon">
	        <div class="container">
	            <span class="section__small">Customer Center</span>
	            <h2 class="section__h2 mb70">자주 묻는 질문 상세조회</h2>
	        </div>
        </section>
     <div class="container2">
    <ul class="detail-list">
        <li>
            <label class="detail-label">제목</label>
            <input class="detail-input" type="text" name="oSubject" value="${often.oSubject}"  style="text-align: center;" readonly>
        </li>
<!--         <li> -->
<!--             <label class="detail-label">작성자</label> -->
<%--             <p class="detail-userId">${often.userId}</p> --%>
<!--         </li> -->
        <li>
            <label class="detail-label">내용</label>
            <p class="detail-content">${often.oContent}</p>
        </li>
    </ul>
    <div class="detail-buttons">
<%--     <c:if test="${user.userId == khuser01}"> --%>
<c:if test="${sessionScope.userId ne null && String.valueOf(sessionScope.adminYn) eq 'Y' }">
        <button class="detail-button" type="button" onclick="showModifyPage();">수정하기</button>
        <button class="detail-button" onclick="deleteOften();">삭제하기</button>
    </c:if>
        <button class="detail-button" type="button" onclick="showOftenList();">목록으로</button>
    </div>
        <form id="deleteForm" action="/often/delete" method="post">
        <input type="hidden" name="oNo" value="${often.oNo}">
    </form>
    </div>
    <script>
        function showModifyPage() {
            const oNo = "${often.oNo}";
            location.href = "/often/ofmodify?oNo=" + oNo;
        }
        
        function showOftenList() {
            location.href = "/often/oflist";
        }
        
        function deleteOften() {
            if (confirm("자주묻는 질문을 삭제하시겠습니까?")) {
                document.getElementById("deleteForm").submit();
            }
        }
    </script>
	</main>
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</body>
	</html>
