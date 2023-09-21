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
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }
    
            header {
                background-color: #333;
                color: #fff;
                padding: 20px;
                text-align: center;
            }
    
            .customer-center {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
            }
    
            .customer-slide {
                flex-basis: calc(50% - 20px); /* 2개의 슬라이드, 여백 제외 */
                margin: 10px;
                background-color: #f4f4f4;
                padding: 20px;
            }
    
            .faq-slide {
                background-color: #f4f4f4;
                padding: 20px;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <header>
            <h1>고객센터</h1>
        </header>
        
        <div class="center-center">
            <div class="customer-slide">
                <h2>공지사항</h2>
                <div id="notice-list">
        <div class="container">
            <table class="notice-table">
                <thead>
                <tr>
                    <th scope="col" class="th-num">번호</th>
                    <th scope="col" class="th-title">제목</th>
                    <th scope="col" class="th-date">작성날짜</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="notice" items="${nList}" varStatus="i">
                <tr>
					<c:url var="detailUrl" value="/notice/detail">
					</c:url>
                     <td><a href="${detailUrl }">${notice.nSubject }</a></td>
					</tr>
					</c:forEach>
                </tbody>
            </table>
					<button class="detail-button" type="button" onclick="showNoticeList();">전체보기</button>
        </div>
    </div>
            </div>
            
            <div class="customer-slide">
                <h2>문의하기</h2>
                <div id="notice-list">
        <div class="container">
            <table class="qna-table">
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
                    <td>${qna.rYn}</td>
                </tr>
            </c:forEach>
                </tbody>
            </table>
            <button type="button" onclick="showQnaList();">전체보기</button>
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
    </body>
    </html>
    
    
    