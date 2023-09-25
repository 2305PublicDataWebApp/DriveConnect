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
        
        .container .notice-table {
		    width: 80%; /* 테이블 크기 조정 (원하는 크기로 조정) */
		    margin: 0 auto; /* 가운데 정렬을 위한 마진 설정 */
		}
        
        
	            /* 테이블 스타일링 */
	    .container .notice-table {
	        width: 70%;
	        border-collapse: collapse;
	        margin-top: 20px;
	        
	    }
	
	    .container .notice-table th {
	        background-color: rgba(210, 217, 219, 1);
	        color: white;
	        text-align: center;
	        padding: 10px;
	        font-family: 'NexonLv1Gothic';    
	        border: 1px solid #ddd; /* 테두리 스타일 적용 */
	        
	    }
	    
	 .container .notice-table th, .container .notice-table td {
        padding: 8px; /* 셀 패딩 조정 */
        border: 1px solid #ddd; /* 테두리 스타일 적용 */
        text-align: center;
    }
	
	    .container .notice-table td {
	        border: 1px solid gray;
	        padding: 10px;
	        text-align: center;
	    }
	
	    /* 링크 스타일링 */
	    .container .notice-table a {
	        color: #333; /* 링크 색상 변경 */
	        text-decoration: none;
	        font-weight: bold; /* 링크 글꼴 굵게 */
	    }
	
		/* 해당 테이블 셀에 흐릿한 배경 적용 */
		.container .notice-table tbody tr:hover td {
		    position: relative;
		}
		
		.container .notice-table tbody tr:hover td::before {
		    content: "";
		    position: absolute;
		    top: 0;
		    left: 0;
		    width: 100%;
		    height: 100%;
		    background-color: rgba(210, 217, 219, 1); /* 흐릿한 배경 색상과 투명도 설정 */
		    z-index: -1; /* 가상 요소를 콘텐츠 아래로 위치시킴 */
		}


	</style>
	<link rel="stylesheet" href="/resources/css/register.css?after">
<!--     <link rel="stylesheet" href="/resources/css/board/qnalist.css?after"> -->
</head>
	<body>
		<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
		
	<main>
        <section class="text__wrap section center nexon">
	        <div class="container">
	            <span class="section__small">회원 관리</span>
	            <h2 class="section__h2 mb70">회원 정보</h2>
        </section>
        
        <div id="notice-list" class="ncontainer">
            <div class="container">
                <table class="notice-table">
                    <colgroup>
                        <col width="10%">
                        <col width="15%">
                        <col width="15%">
                        <col width="20%">
                        <col width="20%">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col" class="th-num">회원번호</th>
                            <th scope="col" class="th-title">아이디</th>
                            <th scope="col" class="th-date">이름</th>
                            <th scope="col" class="th-date">전화번호</th>
                            <th scope="col" class="th-date">운전면허번호</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${uList}" varStatus="i">
                            <tr>
                                <td>${i.count }</td>
                                <td>
                                    <c:url var="detailUrl" value="/user/admin_m_detail">
                                        <c:param name="userNo" value="${user.userNo }"></c:param>
                                    </c:url>
                                    <a href="${detailUrl }">${user.userId }</a>
                                </td>
                                <td>
                                	<a href="${detailUrl }">${user.userName }</a>
                                </td>
                                <td>${user.userPhone }</td>
                                <td>${user.dLicense }</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    <tfoot>
			</tfoot>
		</table>
            </div>
        </div>
    </section>
		<script>
// 			const showRegisterForm = () => {
// 				location.href = "/notice/insert";
// 			}
		</script>
	</main>
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</body>
</html>
