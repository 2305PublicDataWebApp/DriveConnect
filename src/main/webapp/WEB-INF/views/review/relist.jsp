<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>후기 목록</title>
	</head>
	<body>
		<h1>후기 목록</h1>
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
					<th>글 번호</th>
					<th>차량명</th>
					<th>제목</th>
					<th>아이디</th>
					<th>작성날짜</th>
				</tr>
			</thead>
			<tbody>
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
							<option value="writer" <c:if test="${searchCondition == 'writer' }">selected</c:if>>작성자</option>
							<option value="title" <c:if test="${searchCondition == 'title' }">selected</c:if>>제목</option>
							<option value="content" <c:if test="${searchCondition == 'content' }">selected</c:if>>내용</option>
						</select>
						<input type="text" name="searchKeyword" placeholder="검색어를 입력하세요">
						<input type="submit" value="검색">
					</form>
					</td>
					<td>
						<button type="button" onclick="showRegisterForm();">글쓰기</button>
					</td>
				</tr>
			</tfoot>
		</table>
		<script>
			const showRegisterForm = () => {
				location.href = "/review/insert";
			}
		</script>
	</body>
</html>