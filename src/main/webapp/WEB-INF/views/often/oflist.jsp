<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 목록</title>
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
	    </style>
    <link rel="stylesheet" href="/resources/css/board/qnalist.css?after">
</head>
	<body>
		<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>	
	<main class="custom-main">
	    <section class="text__wrap section center nexon">
	        <div class="container">
	            <span class="section__small">Customer Center</span>
	            <h2 class="section__h2 mb70">자주 묻는 질문</h2>
	        </div>
        </section>
    <section class="notice">
        <div class="page-title">
            <div class="container">
            </div>
        </div>
        <div id="often-list">
            <div class="container">
                <table class="often-table">
                    <colgroup>
                        <col width="10%">
                        <col width="60%">
                        <col width="20%">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col" class="th-num">번호</th>
                            <th scope="col" class="th-title">제목</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- 여기에 기존 데이터를 반복문으로 출력하는 코드 추가 -->
                        <!-- 예시: -->
                        <c:forEach var="often" items="${oList}" varStatus="i">
                            <tr>
                                <td>${i.count}</td>
                                <td>
                                    <c:url var="detailUrl" value="/often/ofdetail">
                                        <c:param name="oNo" value="${often.oNo}"></c:param>
                                    </c:url>
                                    <a href="${detailUrl}">${often.oSubject}</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="4">
<%--                                 <c:if test="${user.userId == khuser01}"> --%>
								<c:if test="${sessionScope.userId ne null && String.valueOf(sessionScope.adminYn) eq 'Y' }">
                                    <button type="button" onclick="showRegisterForm();">글쓰기</button>
                                </c:if>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </section>
    <script>
        const showRegisterForm = () => {
            location.href = "/often/ofinsert";
        }
    </script>
	</main>
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</body>
</html>
