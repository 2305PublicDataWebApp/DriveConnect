<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문의 등록</title>
        <style>
		@import url('https://fonts.googleapis.com/css2?family=Kanit:wght@200&family=Noto+Sans+KR&family=Roboto&display=swap');
		
		.custom-main {
	    height: auto;
        text-align: center;
	    
	    }
	    </style>
    <link rel="stylesheet" href="/resources/css/board/qnawrite.css?after">
</head>
	<body>
		<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>	
	<main class="custom-main">
    <div class="container">
        <h1 class="title">문의 등록</h1>
        <form action="/qna/qnawrite" method="post" class="qna-form">
            <div class="form-group">
                <label for="userId">작성자</label>
                <input type="text" id="userId" name="userId" value="${userId}">
            </div>
            <div class="form-group">
                <label for="qSubject">제목</label>
                <input type="text" id="qSubject" name="qSubject" value="${qSubject}">
            </div>
            <div class="form-group">
                <label for="qContent">문의 내용</label>
                <textarea id="qContent" rows="4" cols="50" name="qContent">${qContent}</textarea>
            </div>
            <div class="form-group">
                <input type="submit" class="submit-button" value="제출하기">
            </div>
        </form>
    </div>
	</main>
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</body>
</html>
