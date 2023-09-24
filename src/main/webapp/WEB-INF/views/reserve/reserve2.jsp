<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<c:set var="root" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DriveConnect</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
// $(function() {   
//    $(document).on("change","select[name='sarea']",function(){
// 		 var sarea = $(this).val();
// 		 console.log(sarea);
// 		 $.ajax({
// 			type:'get',
// 			url:'/reserve/getRname',
// 			data:{'sarea':sarea},
// 			dataType:"json",
// 			success : function(data){
// 				$("select[name='snum']").html("<option value=''>지점 선택</option>");
// 				for(var i=0; i<data.result.length; i++){
// 					$("select[name='snum']").append("<option value='"+data.result[i].num+"'>"+data.result[i].name+"</option>");
// 				}
// 			},
// 			error:function(request,status,error){
// 		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
// 		    }
// 		});
//   });
// });
</script>
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
    justify-content: center;
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
    justify-content: center;
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
input[type="password"],
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
    justify-content: center;
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
select.uk-select {
    width: 50%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}
/* input[type="datetime-local"] 요소에 스타일 적용 */
input[type="datetime-local"].uk-input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}
	</style>
<link rel="stylesheet" href="/resources/css/reserve2.css?after">
</head>
	<body>
		<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>	
	<main class="custom-main">
		    <section class="text__wrap section center nexon">
	        <div class="container">
	            <span class="section__small">차량 관리</span>
	            <h2 class="section__h2 mb70">구독 등록 및 결제</h2>
        </section>
		<div class="write-container">
		<ul class="modify-list">
			<li>
    <div class="container1">
        <div class="orderInfo_div uk-card uk-card-default uk-card-hover uk-card-body">
            <h3 class="uk-card-title">주문 정보</h3>
            <div class="orderForm_div">
                <ul uk-tab>
<!--                     <li class="orderForm_li"><a href="#">예약 주문</a></li> -->
                </ul>
                <ul class="uk-switcher uk-margin">
                    <li>
                        <form class="uk-form-stacked" action="ordersuccess.do" method="post">
                            <div class="uk-margin fk-49">
                                <label class="uk-form-label" for="form-stacked-select">신청 지역</label>
                                <div class="uk-form-controls">
                                    <select class="uk-select" name="sarea" required>
                                        <option value="">지역 선택</option>
       									<option value="서울">서울</option>    									
                                        <!-- 여기에 지역 옵션들 추가 -->
                                    </select>
                                </div>
                            </div>
                            <div class="uk-margin fk-49">
                                <label class="uk-form-label" for="form-stacked-select">신청 지점</label>
                                <div class="uk-form-controls">
                                    <select class="uk-select" name="snum" required>
                                        <option value="">지점 선택</option>
										<option value="강남">강남</option>  
										<option value="강북">강북</option>  
                                    </select>
                                </div>
                            </div>
                            <div class="uk-margin">
                                <label class="uk-form-label" for="form-stacked-text">방문 예정 일시</label>
                                <div class="uk-form-controls">
                                    <input class="uk-input" type="datetime-local" required>
                                </div>
                            </div>
                        </form>
                    </li>
                </ul>
            </div>
        </div>
    </div>	
			</li>
			<li>
    <div class="container2">
        <div class="orderInfo_div uk-card uk-card-default uk-card-hover uk-card-body">
            <h3 class="uk-card-title">결제 정보</h3>
            <form class="uk-form-stacked">
                <div class="uk-margin fk-20">
                    <label class="uk-form-label" for="form-stacked-text">카드 선택</label>
                    <div class="uk-form-controls">
                        <select class="uk-select" required>
                            <option value="">카드 선택</option>
								<option value="KB카드">KB카드</option>
								<option value="BC카드">BC카드</option>
								<option value="삼성카드">삼성카드</option>
								<option value="신한카드">신한카드</option>
								<option value="외환카드">외환카드</option>
								<option value="하나카드">하나카드</option>
								<option value="롯데카드">롯데카드</option>
								<option value="씨티카드">씨티카드</option>
								<option value="NH카드">NH카드</option>
								<option value="현대카드">현대카드</option>
								<option value="우리카드">우리카드</option>                            
                            <!-- 여기에 카드 옵션들 추가 -->
                        </select>
                    </div>
                </div>
                &nbsp;&nbsp;
                <div class="uk-margin fk-49">
                    <label class="uk-form-label" for="form-stacked-text">카드 번호</label>
                    <div class="uk-form-controls">
                        <input class="uk-input fk-form-width-63" type="text" style="width: 15%;" required>
                        -
                        <input class="uk-input fk-form-width-63" type="text" style="width: 15%;" required>
                        -
                        <input class="uk-input fk-form-width-63" type="text" style="width: 15%;" required>
                        -
                        <input class="uk-input fk-form-width-63" type="text" style="width: 15%;" required>
                    </div>
                </div>
                <div class="uk-margin fk-49">
                    <label class="uk-form-label" for="form-stacked-text">CVC 번호</label>
                    <div class="uk-form-controls">
                        <input class="uk-input" type="text" placeholder="카드 뒷면 숫자 3자리"  style="width: 25%;" required>
                    </div>
                </div>
                <div class="uk-margin fk-49">
                    <label class="uk-form-label" for="form-stacked-text">카드 비밀번호</label>
                    <div class="uk-form-controls">
                        <input class="uk-input" type="password" placeholder="카드 비밀번호 앞 2자리" style="width: 30%;"  required>
                    </div>
                </div>
            </form>
<!--    				 <button type="submit" class="order-submit-button">결제 완료하기</button> -->
        </div>
    </div>	
			</li>
		</ul>
		</div>
		<br><br>
		<c:url var="boardDelUrl" value="/subs/delete">
			<c:param name="scNo" value="${sOne.scNo }"></c:param>
		</c:url>
		<c:url var="modifyUrl" value="/subs/admin_s_modify">
  			  <c:param name="scNo" value="${sOne.scNo }"></c:param>
		</c:url>
		<div class="modify-buttons" style="text-align: center;">
			<c:if test="${userId eq 'admin'}">
<%-- 			<button type="button" onclick="showModifyPage('${modifyUrl }');">수정하기</button> --%>
			<button class="modify-submit" type="button" onclick="window.location.href='${modifyUrl}';">차량 수정하기</button>
			<form action="/subs/delete" method="post">
			    <input type="hidden" name="_method" value="delete"> <!-- HTTP DELETE 메서드 설정 -->
			    <input type="hidden" name="scNo" value="${sOne.scNo}">
			    <c:if test="${userId eq 'admin'}">
			        <button class="modify-submit" type="submit" onclick="return confirm('삭제하시겠습니까?')">차량 삭제하기</button>
			    </c:if>
			</form>
			</c:if>
<!-- 			<div> -->
<!-- 			<button class="modify-submit" type="button" onclick="showNoticeList();">목록으로</button> -->
<!-- 			</div> -->
			<div>
			<button class="modify-submit" type="button" onclick="javascript:history.go(-1);" style="text-align: center;">뒤로가기</button>
			</div>
			<div>
			<button class="modify-submit1" type="button" onclick="showReserveWrite();" style="text-align: center;">결제 완료하기</button>
			</div>			
		</div>
		<script>
			function showNoticeList() {
				window.location.href = '/subs/subslist';
			}
			function showReserveWrite() {
				window.location.href = '/reserve/ordersuccess';
			}
		</script>

	</main>
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</body>
</html>