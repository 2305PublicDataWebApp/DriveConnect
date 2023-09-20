<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>DriveConnect</title>
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Kanit:wght@200&family=Noto+Sans+KR&family=Roboto&display=swap');
	</style>
	<link rel="stylesheet" href="/resources/css/register.css?after">
	</head>
	<body>
		<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
	<main>
		<h1>Line:up - 구독차량 리스트</h1>
		<table>
			<colgroup>
				<col width="5%"></col>
				<col width="40%"></col>
				<col width="10%"></col>
				<col width="15%"></col>
				<col width="10%"></col>
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성날짜</th>
					<th>첨부파일</th>
				</tr>
			</thead>
			<tbody>
<!-- 				list데이터는 items에 넣었고 var에서 설정한 변수로  -->
<!-- 				list데이터에서 꺼낸 값을 사용하고 i의 값은 varStatus로 사용 -->
				<c:forEach var="subs" items="${sList }" varStatus="i">
				<tr>
					<td>${i.count }</td>
					<c:url var="detailUrl" value="/subs/subsdetail">
						<c:param name="scNo" value="${subs.scNo }"></c:param>
					</c:url>
					<td><a href="${detailUrl }">${subs.scName }</a></td>
						<td>
							<c:choose>
        						<c:when test="${sessionScope.userId != 'admin'}">
        						관리자
   						        </c:when>
   						        <c:otherwise>
            						${sessionScope.userName}
       	 						</c:otherwise>
							</c:choose>
						</td>
					<td>
						<fmt:formatDate pattern="yyyy-MM-dd" value="${subs.sCreateDate }"/>
					</td>
					<td>
						<c:if test="${!empty subs.subsFiles.fileName }">O</c:if>
						<c:if test="${empty subs.subsFiles.fileName }">X</c:if>
					</td>
				</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr align="center">
					<td colspan="5">	  <!-- 페이징 처리 하는 부분 -->
						<c:if test="${pInfo.startNavi != 1 }">
							<c:url var="prevUrl" value="/subs/subslist">
								<c:param name="page" value="${pInfo.startNavi - 1 }"></c:param>
							</c:url>
							<a href="${prevUrl }">[이전]</a>
						</c:if>
						<c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }" var="p">
							<c:url var="pageUrl" value="/subs/subslist">
								<c:param name="page" value="${p }"></c:param>
							</c:url>
							<a href="${pageUrl }">${p }</a>&nbsp;	
						</c:forEach>
						<c:if test="${pInfo.endNavi != pInfo.naviTotalCount }">
							<c:url var="nextUrl" value="/subs/subslist">
								<c:param name="page" value="${pInfo.endNavi + 1 }"></c:param>
							</c:url>
							<a href="${nextUrl }">[다음]</a>
						</c:if>
<%-- 						${pInfo } --%>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<form action="/subs/search" method="get">
							<select name="searchCondition">
								<option value="all">전체</option>
								<option value="writer">작성자</option>
								<option value="title">제목</option>
								<option value="content">내용</option>
							</select>
							<input type="text" name="searchKeyword" placeholder="검색어를 입력하세요">
							<input type="submit" value="검색">
						</form>
					</td>
					<td>
						<c:choose>
        					<c:when test="${sessionScope.userId eq 'admin'}">
           						 <button type="button" onclick="showWriteForm();">글쓰기</button>
					        </c:when>
					        <c:otherwise>
            					<!-- 관리자가 아닌 경우 버튼을 숨깁니다. -->
   	 						</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</tfoot>
		</table>
		<script>
			const showWriteForm = () => {
				location.href="/subs/admin_s_write;"
			}
		</script>
		</main>
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</body>
</html>