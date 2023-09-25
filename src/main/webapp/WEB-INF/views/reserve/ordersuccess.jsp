<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DriveConnect</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Kanit:wght@200&family=Noto+Sans+KR&family=Roboto&display=swap');
		
	.custom-main { 
   	  height: 55vh;; 
      text-align: center; 
   
    } 
  .title {
    text-align: center;
    margin-top: 20px;
  }

  .title h1 {
    font-size: 36px;
    color: #333;
  }
  
    button[type="button"] {
    background-color: #333;
    color: #fff;
    padding: 5px 20px;
    font-size: 18px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    align-items: center;
    position: absolute;
    left: 50%;
    top: 33%;
    transform: translate(-50%, -50%);
  }

  button[type="button"]:hover {
    background-color: #555;
  }
  
</style>
</head>
	<body>
		<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>	
			<main class="custom-main">
<div class="orderSuccess_wrapper uk-card uk-card-default uk-card-body uk-width-1-2@m">
	<h1>
	<p class="orderMsg">구독 및 결제가 완료되었습니다!</p>
	</h1>
	<c:set var="root" value="<%=request.getContextPath() %>" />
	<button type="button" class="orderSuccess_Atag" onclick="window.location.href='/index.jsp';">메인페이지로→</button>
</div>
	</main>
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</body>
</html>