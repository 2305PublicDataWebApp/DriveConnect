<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                

              /* 공지사항, 문의하기, 자주 묻는 질문 테이블 스타일 */
    table {
        width: 100%;
        border-collapse: collapse;
        border: 1px solid #ccc; /* 테두리 추가 */
        margin-top: 20px; /* 상단 마진 추가 */
    }

    th, td {
        border: 1px solid #ccc; /* 테두리 추가 */
        padding: 8px;
        text-align: left;
    }

    th {
        background-color: #f2f2f2; /* 헤더 배경색 지정 */
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
        table tbody tr:hover {
        background-color: #f0f0f0; /* 호버 효과 배경색 설정 */
    }
        /* 테이블 내의 모든 텍스트를 검정색으로 설정 */
    table th, table td {
        color: #000;
    }
        </style>
    </head>
	<body>
		<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>	
	<main class="custom-main">
	    <section class="text__wrap section center nexon">
	        <div class="container">
	            <span class="section__small">Customer Center</span>
	            <h2 class="section__h2 mb70">고객센터</h2>
	        </div>
        </section>
                <header>
        </header>
        
        <div class="center-center">
<!--             <div class="customer-slide"> -->
<!--                 <h2>공지사항</h2> -->
<!--                 <div id="notice-list"> -->
<!--         <div class="container"> -->
<!--             <table class="notice-table"> -->
<!--                 <thead> -->
<!--                 <tr> -->
<!--                     <th scope="col" class="th-num">번호</th> -->
<!--                     <th scope="col" class="th-title">제목</th> -->
<!--                     <th scope="col" class="th-date">작성날짜</th> -->
<!--                 </tr> -->
<!--                 </thead> -->
<!--                 <tbody> -->
<%--                 <c:forEach var="notice" items="${nList}" varStatus="i"> --%>
<!--                 <tr> -->
<%-- 					<c:url var="detailUrl" value="/notice/detail"> --%>
<%-- 					</c:url> --%>
<%--                      <td><a href="${detailUrl }">${notice.nSubject }</a></td> --%>
<!-- 					</tr> -->
<%-- 					</c:forEach> --%>
<!--                 </tbody> -->
<!--             </table> -->
<!-- 					<button class="detail-button" type="button" onclick="showNoticeList();">전체보기</button> -->
<!--         </div> -->
<!--     </div> -->
<!--             </div> -->
            
            <div class="customer-slide">
                <h2>문의하기</h2>
                <div id="notice-list">
        <div class="container">
            <table class="qna-table">
                     <colgroup>
                        <col width="10%">
                        <col width="70%">
                        <col width="20%">
                    </colgroup>
                <thead>
                <tr>
                    <th scope="col" class="th-num">번호</th>
                    <th scope="col" class="th-title">제목</th>
                    <th scope="col" class="th-date">작성날짜</th>
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
<%--                     <td>${qna.rYn}</td> --%>
                </tr>
            </c:forEach>
                </tbody>
            </table>
             <button class="detail-button" type="button" onclick="showQnaList();">전체보기</button>
        </div>
    </div>
            </div>
        </div>
        
        <div class="faq-slide">
            <h2>자주 묻는 질문</h2>
             <div id="often-list">
            <div class="container">
                <table class="often-table">
                    <colgroup>
                        <col width="10%">
                        <col width="90%">
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
                    </table>
                    <button class="detail-button" type="button" onclick="showOftenList();">전체보기</button>
                    </div>
        </div>
        </div>
        <script>
        function showNoticeList() {
            location.href = "/notice/list";
        }
        function showQnaList() {
			location.href="/qna/qnalist";
		}
        function showOftenList() {
            location.href = "/often/oflist";
        }
        </script>
	</main>
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</body>
    </html>
    
    
    