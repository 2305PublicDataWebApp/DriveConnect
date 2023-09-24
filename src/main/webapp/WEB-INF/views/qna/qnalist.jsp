<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문의 내역</title>
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
        </style>
    <link rel="stylesheet" href="/resources/css/board/qnalist.css?after">
</head>
	<body>
		<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>	
	<main class="custom-main">
	    <section class="text__wrap section center nexon">
	        <div class="container">
	            <span class="section__small">Customer Center</span>
	            <h2 class="section__h2 mb70">문의내역</h2>
	        </div>
        </section>
    <table>
        <colgroup>
            <col width="10%">
            <col width="60%">
            <col width="20%">
            <col width="20%">
        </colgroup>
        <thead>
            <tr>
                <th>글번호</th>
                <th>제목</th>
                <th>작성날짜</th>
                <th>답변여부</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="qna" items="${qList}" varStatus="i">
                <tr>
                <td>${i.count }</td>
					<c:url var="detailUrl" value="/qna/qnadetail">
						<c:param name="qNo" value="${qna.qNo }"></c:param>
					</c:url>
                    <td><a href="/qna/qnadetail?qNo=${qna.qNo}">${qna.qSubject}</a></td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd" value="${qna.qCreate }"/></td>
                    <td>${qna.rYn}</td>
                </tr>
            </c:forEach>
        </tbody>
        <tfoot>
            <tr>
                <td>
                    <button class="detail-button" type="button" onclick="showRegisterForm();">문의하기</button>
                </td>
            </tr>
        </tfoot>
    </table>
    <script>
        const showRegisterForm = () => {
            location.href = "/qna/qnawrite";
        }
    </script>
	</main>
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</body>
</html>
