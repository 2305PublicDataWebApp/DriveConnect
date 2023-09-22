<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DriveConnect</title>
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
        
    img {
        max-width: 800%;
        max-height: 800%;
    }
    
    .modify-list li {
    display: flex;
    align-items: center;
    justify-content: flex-start;
    margin-bottom: 10px; 
}
.modify-submit {
    display: block;
    padding: 5px 10px;
    background-color: #000000; /* 원하는 배경색으로 변경 */
    color: #fff; 
    text-decoration: none; 
    border: none; 
    cursor: pointer;
    border-radius: 5px; 
    font-size: 13px;
    margin: 0 auto; 
    text-align: center; 
    width: 200px;
    margin-top: 30px;
}
.modify-submit1 {
    display: block;
    padding: 5px 10px;
    background-color: #ff6969; 
    color: #fff; 
    text-decoration: none; 
    border: none; 
    cursor: pointer;
    border-radius: 5px; 
    font-size: 13px;
    margin: 0 auto; 
    text-align: center; 
    width: 200px;
    margin-top: 30px;
}

.modify-submit:hover {
    background-color: #0056b3; /* 호버 시 배경색 변경 */
}

.modify-buttons {
    display: flex;
    gap: 10px;
    margin-top: 20px;
}

.modify-buttons br {
    display: none; /* <br> 태그 숨김 */
}

.write-container {
    max-width: 500px; /* 원하는 최대 너비로 조절 */
    margin: 0 auto; /* 가로 중앙 정렬 */
    padding: 20px; /* 좌우 여백 추가 (선택 사항) */
    border: 1px solid #ddd; /* 테두리 스타일 추가 (선택 사항) */
    border-radius: 5px; /* 테두리 모서리 둥글게 (선택 사항) */
}        

ul {
    list-style: none;
    padding: 0;
}


label {
    display: inline-block;
    width: 150px; 
    font-weight: bold;
}

input[type="text"],
textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

input[type="file"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f9f9f9; 
}
.modify-list li {
    display: flex;
    align-items: center;
    justify-content: flex-start;
    margin-bottom: 10px; 
}
a {
    color: inherit; 
    text-decoration: none; 
}
img {
    display: block;
    margin: 0 auto;
}
	</style>
	<link rel="stylesheet" href="/resources/css/register.css?after">
</head>
	<body>
		<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>	
	<main class="custom-main">
		    <section class="text__wrap section center nexon">
	        <div class="container">
	            <span class="section__small">차량 관리</span>
	            <h2 class="section__h2 mb70">차량 상세 조회</h2>
        </section>
<!-- 	<link rel="stylesheet" href="../resources/css/main.css"> -->
		<div class="write-container">
		<ul class="modify-list">
			<li>
				<img art="첨부파일" src="../resources/buploadFiles/${subs.subsFiles.fileRename }">
			</li>
			<li>
				<label>작성자 :</label>
				<span>
					<c:choose>
      						<c:when test="${sessionScope.userId != 'admin'}">
      							관리자
					        </c:when>
					        <c:otherwise>
          						${sessionScope.userName}
   	 						</c:otherwise>
					</c:choose>
				</span>
			</li>
			<li>
				<label>차량명</label>
				<input type="text" name="scName" value="${subs.scName }">
			</li>
			<li>
				<label>브랜드</label>
				<input type="text" name="scBrand" value="${subs.scBrand }">
			</li>
			<li>
				<label>차량색</label>
				<input type="text" name="scColor" value="${subs.scColor }">
			</li>
			<li>
				<label>내용</label>
				<textarea rows="7" cols="50" name="scSpec">${subs.scSpec }</textarea>
			</li>
			<li>
				<lable>첨부파일</lable>
				<!-- spring으로 받을 수 없고 변환작업이 필요함 -->
				<a href="../resources/nuploadFiles/${subs.subsFiles.fileRename }" download>${subs.subsFiles.fileName }</a>
				<c:if test="${not empty subs.subsFiles.fileName }">
				<a href="#">삭제하기</a>
				</c:if>
			</li>
		</ul>
		</div>
		<br><br>
		<c:url var="boardDelUrl" value="/subs/delete">
			<c:param name="scNo" value="${subs.scNo }"></c:param>
		</c:url>
		<c:url var="modifyUrl" value="/subs/admin_s_modify">
  			  <c:param name="scNo" value="${subs.scNo }"></c:param>
		</c:url>
		<div class="modify-buttons">
			<c:if test="${userId eq 'admin'}">
<%-- 			<button type="button" onclick="showModifyPage('${modifyUrl }');">수정하기</button> --%>
			<button class="modify-submit" type="button" onclick="window.location.href='${modifyUrl}';">차량 수정하기</button>
			<form action="/subs/delete" method="post">
			    <input type="hidden" name="_method" value="delete"> <!-- HTTP DELETE 메서드 설정 -->
			    <input type="hidden" name="scNo" value="${subs.scNo}">
			    <c:if test="${userId eq 'admin'}">
			        <button class="modify-submit" type="submit" onclick="return confirm('삭제하시겠습니까?')">차량 삭제하기</button>
			    </c:if>
			</form>
			</c:if>
			<div>
			<button class="modify-submit" type="button" onclick="showNoticeList();">목록으로</button>
			</div>
			<div>
			<button class="modify-submit" type="button" onclick="javascript:history.go(-1);">뒤로가기</button>
			</div>
			<div>
			<button class="modify-submit1" type="button" onclick="showReserveWrite();">차량 예약하기</button>
			</div>			
		</div>
		<script>
			function showNoticeList() {
				window.location.href = '/subs/subslist';
			}
			function showReserveWrite() {
				const scNo = "${subs.scNo}";
				window.location.href = '/reserve/resewrite?scNo='+scNo;
			}
		</script>

	</main>
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</body>
</html>