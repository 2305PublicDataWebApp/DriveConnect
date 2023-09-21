<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시글 등록</title>
		<link rel="stylesheet" href="/resources/css/board/rewrite.css">
		<style>
        td {
            width: 50px;
            height: 50px;
        }
        .Calendar { 
            text-align: center;
            margin: 0 auto; 
        }
        .Calendar>thead>tr:first-child>td { font-weight: bold; }
        .Calendar>thead>tr:last-child>td {
            background-color: gray;
            color: white;
        }        
        .pastDay{ background-color: lightgray; }
        .today{            
            background-color: #FFCA64;            
            cursor: pointer;
        }
        .futureDay{            
            background-color: #FFFFFF;
            cursor: pointer;
        }
        .futureDay.choiceDay, .today.choiceDay{            
            background-color: #3E85EF;            
            color: #fff;
            cursor: pointer;
        }
    </style>
	</head>
	<body>
		<h1>구독 등록</h1>
		<form action="/review/rewrite" method="post" enctype="multipart/form-data">
			<div>
			<ul>
				<li>
					    <img alt="첨부파일"  src="../resources/buploadFiles/${sOne.subsFiles.fileRename }">
				</li>
				<li>
		            <label class="detail-label">차량명</label>
		           <input type="text" name=scName value="${sOne.scName }" readonly>
		        </li>
				<li>
		            <label class="detail-label">브랜드</label>
		            <input type="text" name="scBrand" value="${sOne.scBrand }" readonly>
		        </li>
				<li>
		            <label class="detail-label">색상</label>
		            <input type="text" name="scColor" value="${sOne.scColor }" readonly>
		        </li>
				<li>
		            <label class="detail-label">차량 정보</label>
		            <input type="text" name="scSpec" value="${sOne.scSpec }" readonly>
		        </li>
			</ul>
			</div>
			<div>
				<ul>
				<li>
					<label>배송지 입력</label>
						<input type="text" id="sample6_postcode" placeholder="우편번호">
						<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample6_address" placeholder="주소"><br>
						<input type="text" id="sample6_detailAddress" placeholder="상세주소">
						<input type="text" id="sample6_extraAddress" placeholder="참고항목">
				</li>
				</ul>

        <table class="Calendar">
            <thead>
                <tr>
                    <td onClick="prevCalendar();" style="cursor:pointer;">&#60;</td>
                    <td colspan="5">
                        <span id="calYear"></span>년
                        <span id="calMonth"></span>월
                    </td>
                    <td onClick="nextCalendar();" style="cursor:pointer;">&#62;</td>
                </tr>
                <tr>
                    <td>일</td>
                    <td>월</td>
                    <td>화</td>
                    <td>수</td>
                    <td>목</td>
                    <td>금</td>
                    <td>토</td>
                </tr>
            </thead>

            <tbody>
            </tbody>
        </table>
			</div>
			<div>
				<input type="submit" value="등록">
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
// function leftPad(value) {
//     if (value < 10) {
//         value = "0" + value;
//         return value;
//     }
//     return value;
// }
</script>
	</body>
</html>