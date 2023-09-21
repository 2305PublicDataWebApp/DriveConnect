<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시글 등록</title>
		<link rel="stylesheet" href="/resources/css/board/rewrite.css">
    <link href="https://checkout.paystax.com/v1/checkout.css" rel="stylesheet">
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
					    <img alt="첨부파일"  src="../resources/ruploadFiles/${review.fileRename }">
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
					<input type="text" id="userAddress" name="userAddress"> 
						<input type="button" onclick="sample4_emecDaumPostcode();" value="우편번호 찾기">
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
<!--     <script src="https://checkout.paystax.com/v1/checkout.js"></script> -->
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
function sample4_emecDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			document.querySelector("#userAddress")
			.value = "("+data.zonecode +") "+data.autoJibunAddress+", "+data.buildingName;
		}
	}).open();
}

function leftPad(value) {
    if (value < 10) {
        value = "0" + value;
        return value;
    }
    return value;
}
</script>
	</body>
</html>