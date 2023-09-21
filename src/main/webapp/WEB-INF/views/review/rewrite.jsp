<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시글 등록</title>
		<link rel="stylesheet" href="/resources/css/board/rewrite.css">
	</head>
	<body>
		<h1>게시글 등록</h1>
		<form action="/review/rewrite" method="post" enctype="multipart/form-data">
			<ul>
				<li>
					<label>작성자</label>
<%-- 						<span>${userId }</span> --%>
							<input type="text" name="writeuserId" value="${userId }">
				</li>
				<li>
					<label>차량명</label>
							<input type="text" name="scName" >
				</li>
				<li>
					<label>후기 제목</label>
					<input type="text" name="rSubject" >
				</li>
				<li>
					<label>후기 내용</label>
					<textarea rows="4" cols="50" name="rContent" ></textarea>
				</li>
				<li>
					<label>첨부파일</label>
					<input type="file" id="uploadFile" name="uploadFile" accept="image/*" onchange="previewImage()">
					<label for="uploadFile" class="file-upload-label">파일 선택</label>
					<img id="imagePreview" src="" alt="미리보기" style="max-width: 300px; display: none;">
				</li>
			</ul>
			<div>
				<input type="submit" value="등록">
			</div>
		</form>
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
</script>
	</body>
</html>