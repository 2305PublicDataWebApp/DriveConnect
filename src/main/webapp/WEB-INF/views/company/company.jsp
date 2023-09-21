<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DriveConnect</title>
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Kanit:wght@200&family=Noto+Sans+KR&family=Roboto&display=swap');
  body {
    font-family: 'Noto Sans KR', sans-serif;
    background-color: #ffffff;
  }

  .title {
    text-align: center;
    margin-top: 20px;
  }

  .title h1 {
    font-size: 36px;
    color: #333;
  }

  h3 {
    font-size: 24px;
    color: #333;
    margin-top: 20px;
  }

  p {
    font-size: 18px;
    color: #666;
    margin-top: 10px;
  }
  
  main {
  background-image: url('/resources/img/company.jpg');
  background-size: cover; /* 배경 이미지를 화면에 꽉 차도록 조절 */
  background-repeat: no-repeat; /* 배경 이미지 반복 없음 */
  background-position: center center; /* 배경 이미지를 중앙에 위치 */
  /* 다른 스타일 속성도 추가 가능 */
  }
  		
	</style>
	<link rel="stylesheet" href="/resources/css/register.css?after">
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<main>
        <div class="title">
            <h1>회사 소개</h1>
        </div>
        <div>
        	<h3>자동차 구독 서비스의 혁신을 선도하는 DriveConnect에 오신걸 환영합니다!</h3>
        	<p>우리는 고객들에게 유연하고 편리한 이동 수단을 제공하는 것을 사명으로 하고 있습니다. </p>
        	<p>저희 회사는 다양한 자동차 브랜드와 모델을 품고 있어서 고객들에게 선택의 자유를 줍니다.</p> 
			<p>더 이상 자동차 구매의 번거로움과 유지 관리에 신경 쓸 필요가 없습니다.</p>
			<p>저렴한 가격에 원하는 자동차를 선택하고, 필요한 때에 구독하고 반환하세요.</p>
        </div>


</main>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>