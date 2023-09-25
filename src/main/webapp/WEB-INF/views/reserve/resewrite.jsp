<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시글 등록</title>
<!-- 		<link rel="stylesheet" href="/resources/css/board/rewrite.css"> -->
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
        		
        td {
            width: 50px;
            height: 50px;
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
.detail-label {
    text-align: left; /* 왼쪽 정렬로 변경 */
}
    </style>
	</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<main class="custom-main">
 		<section class="text__wrap section center nexon">
	        <div class="container">
	            <span class="section__small">차량 관리</span>
	            <h2 class="section__h2 mb70">차량 예약하기</h2>
        </section>
		<form action="/review/rewrite" method="post" enctype="multipart/form-data">
			<div>
			<div class="write-container">
			<ul>
				<li>
					<img alt="첨부파일"  src="../resources/buploadFiles/${sOne.subsFiles.fileRename }">
				</li>
				<li>
		            <label class="detail-label">차량명</label>
		           <input type="text" name=scName value="${sOne.scName }" style="width: 80%;" readonly>
		        </li>
				<li>
		            <label class="detail-label">브랜드</label>
		            <input type="text" name="scBrand" value="${sOne.scBrand }"  style="width: 80%;" readonly>
		        </li>
				<li>
		            <label class="detail-label">색상</label>
		            <input type="text" name="scColor" value="${sOne.scColor }"  style="width: 80%;" readonly>
		        </li>
				<li>
		            <label class="detail-label">차량 정보</label>
					<textarea rows="6" cols="40" name="scSpec"  style="width: 80%;" readonly>${sOne.scSpec }</textarea>
		        </li>
			</ul>
			<div>
				<ul>
				<li>
					 <label style="display: inline-block; width: 100px; text-align: left;">배송지 입력</label>
						<input type="text" id="sample6_postcode" placeholder="우편번호" style="width: 50%;" >
						<input type="button" class="modify-submit" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample6_address" placeholder="주소" style="width: 50%;" ><br>
						<input type="text" id="sample6_detailAddress" placeholder="상세주소" style="width: 50%;" ><br>
						<input type="text" id="sample6_extraAddress" placeholder="참고항목" style="width: 30%;" >
				</li>
				</ul>
			</div>

<!--         <table class="Calendar"> -->
<!--             <thead> -->
<!--                 <tr> -->
<!--                     <td onClick="prevCalendar();" style="cursor:pointer;">&#60;</td> -->
<!--                     <td colspan="5"> -->
<!--                         <span id="calYear"></span>년 -->
<!--                         <span id="calMonth"></span>월 -->
<!--                     </td> -->
<!--                     <td onClick="nextCalendar();" style="cursor:pointer;">&#62;</td> -->
<!--                 </tr> -->
<!--                 <tr> -->
<!--                     <td>일</td> -->
<!--                     <td>월</td> -->
<!--                     <td>화</td> -->
<!--                     <td>수</td> -->
<!--                     <td>목</td> -->
<!--                     <td>금</td> -->
<!--                     <td>토</td> -->
<!--                 </tr> -->
<!--             </thead> -->

<!--             <tbody> -->
<!--             </tbody> -->
<!--         </table> -->
			</div>
			<div>
<!-- 				<input type="submit" value="결제하기"> -->
				<button type="button" class="modify-submit1" onclick="location.href='/reserve/reserve2'">결제하러가기</button>
			</div>
		</form>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>		
	<script>
function previewImage() {
    const uploadFile = document.getElementById('uploadFile');
    const imagePreview = document.getElementById('imagePreview');
    if (uploadFile.files && uploadFile.files[0]) {
        const reader = new FileReader();
        reader.onload = function (e) {
            imagePreview.src = e.target.result;
            imagePreview.style.display = 'block';
        }
        reader.readAsDataURL(uploadFile.files[0]);
    }
    
}
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
</script>
	</main>
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</body>
</html>