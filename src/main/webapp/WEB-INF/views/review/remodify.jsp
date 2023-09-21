<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 수정</title>
    <link rel="stylesheet" href="/resources/css/board/remodify.css">
</head>
<body>
    <h1>게시글 수정</h1>
    <form action="/review/remodify" method="post" enctype="multipart/form-data">
        <!-- 수정할 때, 리다이렉트 될 때 사용 -->
        <input type="hidden" name="rNo" value="${review.rNo }">
        <!-- 기존 업로드 파일 체크할 때 사용 -->
        <input type="hidden" name="fileName" value="${review.fileName }">
        <input type="hidden" name="fileRename" value="${review.fileRename }">
        <input type="hidden" name="filePath" value="${review.filePath }">
        <input type="hidden" name="fileLength" value="${review.fileLength }">
        <ul>
            <li>
                <label>작성자</label>
                <input type="text" name="userId" value="${review.userId }" readonly>
            </li>
            <li>
                <label>차량명</label>
                <input type="text" name="sc_Name" value="${review.scName }">
            </li>
            <li>
                <label>제목</label>
                <input type="text" name="rSubject" value="${review.rSubject }">
            </li>
            <li>
                <label>내용</label>
                <textarea rows="4" cols="50" name="rContent">${review.rContent}</textarea>
            </li>
            <li>
                <label>첨부파일</label>
<!--                 <div class="file-upload"> -->
<%--                     <img alt="첨부파일" src="../resources/ruploadFiles/${review.fileRename}"> --%>
<!--                     <input type="file" id="uploadFile" name="uploadFile" accept="image/*" onchange="previewImage()"> -->
<!--                     <label for="uploadFile" class="file-upload-label">파일 선택</label> -->
<!--                     <img id="imagePreview" src="" alt="미리보기" style="max-width: 300px; display: none;"> -->
<!--                 </div> -->
<!-- 이미지 및 변경된 이미지 컨테이너 -->
<div class="img-container">
    <img alt="첨부파일" src="../resources/ruploadFiles/${review.fileRename}">
    <div class="file-upload">
        <label for="uploadFile" class="file-upload-label">파일 선택</label>
        <input type="file" id="uploadFile" name="uploadFile" accept="image/*" onchange="previewImage()">
        <img id="imagePreview" src="" alt="미리보기" style="max-width: 100%; display: none;">
        <label>변경된 사진</label>
    </div>
</div>

            </li>
        </ul>
        <div>
            <input type="submit" value="수정완료">
            <button type="button" onclick="showReplyList();">목록으로</button>
            <button type="button" onclick="javascript:history.go(-1);">뒤로가기</button>
        </div>
    </form>
    <script>
        function showReplyList() {
            location.href="/reply/list";
        }
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
