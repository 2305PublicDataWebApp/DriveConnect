<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        
        
        ul {
    list-style: none;
    padding: 0;
}

ul li {
    margin-bottom: 15px;
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
    background-color: #f9f9f9; /* 파일 업로드 영역의 배경색 설정 */
}

.write-container {
    max-width: 500px; /* 원하는 최대 너비로 조절 */
    margin: 0 auto; /* 가로 중앙 정렬 */
    padding: 20px; /* 좌우 여백 추가 (선택 사항) */
    border: 1px solid #ddd; /* 테두리 스타일 추가 (선택 사항) */
    border-radius: 5px; /* 테두리 모서리 둥글게 (선택 사항) */
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

.modify-submit:hover {
    background-color: #0056b3; /* 호버 시 배경색 변경 */
}

.modify-buttons {
    display: flex;
    gap: 10px;
    margin-top: 20px;
}
.modify-list li {
    display: flex;
    align-items: center;
    justify-content: flex-start;
    margin-bottom: 10px; 
}
	</style>
</head>
	<body>
		<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>	
	<main class="custom-main">
	    <section class="text__wrap section center nexon">
	        <div class="container">
	            <span class="section__small">차량 관리</span>
	            <h2 class="section__h2 mb70">차량 신규 등록</h2>
        </section>
	<form action="/subs/admin_s_write" method="post" enctype="multipart/form-data">
	<input type="hidden" name="userId" value="${sessionScope.userId }">
		<div class="write-container">
		<ul class="modify-list">
			<li>
				<label class="modify-label">작성자</label>
<%-- 				<input type="text" name="boardWriter" value="${sessionScope.memberId }" readonly> --%>
				<span>${userName }</span>
			</li>
			<li>
				<label>차량명</label>
				<input type="text" name="scName" value="${subs.scName }">
			</li>
			<li>
				<label>차량브랜드</label>
				<input type="text" name="scBrand" value="${subs.scBrand }">
			</li>
			<li>
				<label>차량색</label>
				<input type="text" name="scColor" value="${subs.scColor }">
			</li>
			<li>
				<label>내용</label>
<!-- 				내용은 긴~text 쓰는거니까 textarea사용! -->
				<textarea rows="4" cols="50" name="scSpec" value="${subs.scSpec }"></textarea>
			</li>
			<li>
				<label>첨부파일</label>
<!-- 				첨부파일은 String으로 받을 수 없어서 변환작업(파싱)이 필요함  -->
				<input type="file" name="uploadFile">
			</li>
		</ul> 
		</div>
		<div>
		<input class="modify-submit" type="submit" value="차량등록하기">			
		</div>
	</form>
	</main>
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</body>
</html>