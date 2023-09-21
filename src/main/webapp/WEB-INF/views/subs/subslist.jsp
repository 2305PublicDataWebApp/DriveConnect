<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>DriveConnect</title>
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Kanit:wght@200&family=Noto+Sans+KR&family=Roboto&display=swap');
		
		.custom-main {
		    height: auto;
		}
        a {
            text-decoration: none;
            color: #000;
        }
        h1,h2,h3,h4,h5,h6 {
            font-weight: normal;
        }
        img {
            vertical-align: top;
            width: 100%;
        }
        .mt10 {margin-top: 10px !important;}
        .mt20 {margin-top: 20px !important;}
        .mt30 {margin-top: 30px !important;}
        .mt40 {margin-top: 40px !important;}
        .mt50 {margin-top: 50px !important;}
        .mt60 {margin-top: 60px !important;}
        .mt70 {margin-top: 70px !important;}
        
        .mb10 {margin-bottom: 10px !important;}
        .mb20 {margin-bottom: 20px !important;}
        .mb30 {margin-bottom: 30px !important;}
        .mb40 {margin-bottom: 40px !important;}
        .mb50 {margin-bottom: 50px !important;}
        .mb60 {margin-bottom: 60px !important;}
        .mb70 {margin-bottom: 70px !important;}
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
            padding: 120px 0;
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
        /* text__wrap */
        
        .text__inner {
            text-align: left;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        .text__inner .text {
            width: 32.33333%;
            border: 1px solid #f5f5f5;
            border-radius: 10px;
            padding: 90px 20px 20px 20px;
            box-sizing: border-box;
            margin-bottom: 20px;
            transition: all 0.3s;
            cursor: pointer;
            position: relative;        
        }
        .text__inner .text:hover {
            background-color: #f5f5f5;
        }
/*         .text__inner .text::before { */
/*             content: ''; */
/*             width: 60px; */
/*             height: 60px; */
/*             background-repeat: no-repeat; */
/*             background-position: center; */
/*             position: absolute; */
/*             left: 20px; */
/*             top: 20px; */
/*             border-radius: 50%; */
/*         } */
/*         .text__inner .text.t1::before { */
/*             background-color: #B9D1FF; */
/*             background-image: url(../assets/img/textType01_01.svg); */
/*         } */
        .text__inner .text.t2::before {
            background-color: #B9EEFF;
            background-image: url(../assets/img/textType01_02.svg);
        }
        .text__inner .text.t3::before {
            background-color: #FFB9CA;
            background-image: url(../assets/img/textType01_03.svg);
        }
        .text__inner .text.t4::before {
            background-color: #F5FFB9;
            background-image: url(../assets/img/textType01_04.svg);
        }
        .text__inner .text.t5::before {
            background-color: #CBFFB9;
            background-image: url(../assets/img/textType01_05.svg);
        }
        .text__inner .text.t6::before {
            background-color: #F5B9FF;
            background-image: url(../assets/img/textType01_06.svg);
        }
        .text__title {
            font-size: 24px;
            margin-bottom: 10px;
        }
        .text__desc {
            font-size: 16px;
            color: #666;
            margin-bottom: 15px;
            line-height: 1.5;
        }
        .text__btn {
            float: right;
            position: relative;
            padding-right: 20px;
        }
        .text__btn::before {
            content: '';
            position: absolute;
            right: 0;
            top: 0;
            width: 15px;
            height: 15px;
            background-image: url(../assets/img/icon_plus.svg);
            transition: all 0.3s;
        }
        .text__btn:hover::before {
            transform: rotate(360deg);
        }
        
        /* 이미지의 최대 너비와 높이를 지정 */
		img.thumbnail {
		    max-width: 300px; /* 썸네일의 최대 너비 */
		    max-height: 300px; /* 썸네일의 최대 높이 */
		}
	</style>
	<link rel="stylesheet" href="/resources/css/register.css?after">
    
	</head>
	<body>
		<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
	<main class="custom-main">

			<table>
			    <colgroup>
			        <col width="5%"></col>
			        <col width="40%"></col>
			        <col width="10%"></col>
			        <col width="15%"></col>
			        <col width="10%"></col>
			    </colgroup>
			    <thead>
			        <tr>
<!-- 			            <th>번호</th> -->
<!-- 			            <th>제목</th> -->
<!-- 			            <th>작성자</th> -->
<!-- 			            <th>작성날짜</th> -->
<!-- 			            <th>사진</th> -->
			        </tr>
			    </thead>
			    <tbody>
			        <tr>
			            <td colspan="5">
			                <section class="text__wrap section center nexon">
			                    <div class="container">
			                        <span class="section__small">구독차량 리스트</span>
			                        <h2 class="section__h2 mb70">Line:up</h2>
			                        <div class="text__inner">
			                        <c:forEach var="subs" items="${sList }" varStatus="i">
			                        <c:url var="detailUrl" value="/subs/subsdetail">
										<c:param name="scNo" value="${subs.scNo }"></c:param>
									</c:url>
			                            <div class="text t1" style="display: inline-block;">
			                                <a href="${detailUrl }"><img alt="첨부파일"  src="../resources/buploadFiles/${subs.subsFiles.fileRename }" class="thumbnail">
			                                <p>No. ${i.count }</p></a>
			                                <h3 class="text__title"><a href="${detailUrl }">${subs.scName }</a></h3>
			                                <p class="text__desc"></p>
			                                <a href="#" class="text__btn"></a>
			                            </div>
		                            </c:forEach>
			                        </div>
			                    </div>
			                </section>
			            </td>
			        </tr>
<%-- 			        </c:forEach> --%>
			    </tbody>
			    <tfoot>
			        <tr align="center">
			            <td colspan="5"> <!-- 페이징 처리 하는 부분 -->
			                <c:if test="${pInfo.startNavi != 1 }">
			                    <c:url var="prevUrl" value="/subs/subslist">
			                        <c:param name="page" value="${pInfo.startNavi - 1 }"></c:param>
			                    </c:url>
			                    <a href="${prevUrl }">[이전]</a>
			                </c:if>
			                <c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }" var="p">
			                    <c:url var="pageUrl" value="/subs/subslist">
			                        <c:param name="page" value="${p }"></c:param>
			                    </c:url>
			                    <a href="${pageUrl }">${p }</a>&nbsp;	
			                </c:forEach>
			                <c:if test="${pInfo.endNavi != pInfo.naviTotalCount }">
			                    <c:url var="nextUrl" value="/subs/subslist">
			                        <c:param name="page" value="${pInfo.endNavi + 1 }"></c:param>
			                    </c:url>
			                    <a href="${nextUrl }">[다음]</a>
			                </c:if>
			            </td>
			        </tr>
			        <tr>
			            <td colspan="4">
			                <form action="/subs/search" method="get">
			                    <select name="searchCondition">
			                        <option value="all">전체</option>
			                        <option value="writer">작성자</option>
			                        <option value="title">제목</option>
			                        <option value="content">내용</option>
			                    </select>
			                    <input type="text" name="searchKeyword" placeholder="검색어를 입력하세요">
			                    <input type="submit" value="검색">
			                </form>
			            </td>
			            <td>
			                <c:choose>
			                    <c:when test="${sessionScope.userId eq 'admin'}">
			                        <button type="button" onclick="showWriteForm();">글쓰기</button>
			                    </c:when>
			                    <c:otherwise>
			                        <!--관리자가 아닌 경우 버튼을 숨깁니다.  -->
			                    </c:otherwise>
			                </c:choose>
			            </td>
			        </tr>
			    </tfoot>
			</table>
			<script>
			    const showWriteForm = () => {
			        location.href="/subs/admin_s_write";
			    }
			    
			    const imageUpload = document.getElementById("imageUpload");
			    const imagePreview = document.getElementById("imagePreview");
			    imageUpload.addEventListener("change", function () {
			        const file = this.files[0];
			        if (file) {
			            const reader = new FileReader();
			            reader.onload = function (e) {
			                imagePreview.src = e.target.result;
			            };
			            reader.readAsDataURL(file);
			        } else {
			            imagePreview.src = "#";
			        }
			    });
			</script>


		</main>

			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</body>
</html>