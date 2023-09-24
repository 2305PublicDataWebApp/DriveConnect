<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>후기 목록</title>
<!--     <link rel="stylesheet" href="/resources/css/board/relist.css"> -->
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
</head>
	<body>
		<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>	
	<main class="custom-main">
	    <section class="text__wrap section center nexon">
	        <div class="container">
	            <span class="section__small">Review</span>
	            <h2 class="section__h2 mb70">후기 목록</h2>
	        </div>
        </section>
    <table class="review-table">
        <colgroup>
            <col width="5%"></col>
            <col width="5%"></col>
            <col width="40%"></col>
            <col width="15%"></col>
            <col width="10%"></col>
        </colgroup>
        <thead>
            <tr>
                <th>글 번호</th>
                <th>차량명</th>
                <th>제목</th>
                <th>아이디</th>
                <th>작성날짜</th>
<!--                 <th>사진</th> -->
            </tr>
        </thead>
        <tbody>
        <c:forEach var="review" items="${rList }" varStatus="i">
            <tr>
                <td>${i.count }</td>
                <c:url var="detailUrl" value="/review/redetail">
                    <c:param name="rNo" value="${review.rNo }"></c:param>
                </c:url>
                <td>${review.scName }</td>
                <td><a href="${detailUrl }">${review.rSubject }</a></td>
                <td>${review.userId }</td>
                <td>
                    <fmt:formatDate pattern="yyyy-MM-dd" value="${review.rCreate }"/>
                </td>
            </tr>
        </c:forEach>
        </tbody>
        <tfoot>
            <tr align="center">
                <td colspan="5">
                    <c:if test="${rpInfo.startNavi != 1 }">
                        <c:url var="prevUrl" value="/review/relist">
                            <c:param name="page" value="${rpInfo.startNavi - 1 }"></c:param>
                        </c:url>
                        <a href="${prevUrl }">[이전]</a>
                    </c:if>
                    <c:forEach begin="${rpInfo.startNavi }" end="${rpInfo.endNavi }" var="p">
                        <c:url var="pageUrl" value="/review/relist">
                            <c:param name="page" value="${p }"></c:param>
                        </c:url>
                        <a href="${pageUrl }">${p }</a>&nbsp;
                    </c:forEach>
                    <c:if test="${rpInfo.endNavi != rpInfo.naviTotalCount }">
                        <c:url var="nextUrl" value="/review/relist">
                            <c:param name="page" value="${rpInfo.endNavi + 1 }"></c:param>
                        </c:url>
                        <a href="${nextUrl }">[다음]</a>
                    </c:if>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <form action="/review/research" method="get">
                        <select name="searchCondition">
                            <option value="all"<c:if test="${searchCondition == 'all' }">selected</c:if>>전체</option>
                            <option value="userId" <c:if test="${searchCondition == 'userId' }">selected</c:if>>작성자</option>
                            <option value="rSubject" <c:if test="${searchCondition == 'rSubject' }">selected</c:if>>제목</option>
                            <option value="rContent" <c:if test="${searchCondition == 'rContent' }">selected</c:if>>내용</option>
                        </select>
                        <input type="text" name="searchKeyword" placeholder="검색어를 입력하세요">
                        <input type="submit" value="검색">
                    </form>
                </td>
                <td>
                    <button class="write-button" type="button" onclick="showRegisterForm();">글쓰기</button>
                </td>
            </tr>
        </tfoot>
    </table>
    <script>
//     const imageUpload = document.getElementById("imageUpload");

//     const imagePreview = document.getElementById("imagePreview");
//     imageUpload.addEventListener("change", function () {
//         const file = this.files[0];

//         if (file) {
//             const reader = new FileReader();
//             reader.onload = function (e) {
//                 imagePreview.src = e.target.result;
//             };
//             reader.readAsDataURL(file);
//         } else {
//             imagePreview.src = "#";
//         }
//     });
    
    
        const showRegisterForm = () => {
            location.href = "/review/rewrite";
        }
    </script>
	</main>
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</body>
</html>
