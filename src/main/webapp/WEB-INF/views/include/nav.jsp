<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <link rel="stylesheet" href="/resources/css/header.css?after">
    <link rel="stylesheet" href="/resources/css/nav.css?after">
    <header id="header" style="background: rgb(255, 255, 255)";>
        <div class="header-inner">
            <div class="top">
                <div class="logo">
                    <a href="/" class="logo__inner">
					DriveConnect
                    </a>
                </div>
            </div>
        <div class="list left">
            <nav role="navigation" class="list">
            </nav>
            <div class="list right">
                <c:if test="${sessionScope.userId eq null }">         
                <div class="list__item">
                    <a href="/subs/subslist">Line:up</a>
                </div>
                <div class="list__item" id="search">
                    <a href="/user/register">회원가입</a>
                </div>
                <div class="list__item">
                    <a href="/user/login">로그인</a>
                </div>
                <div class="list__item">
                    <a href="/company/company">커넥트드라이브란?</a>
                </div>
                <div class="list__item">
                    <a href="">이용후기</a>
                </div>
                <div class="list__item">
                    <a href="">고객센터</a>
                </div>                
                </c:if>
                <c:if test="${sessionScope.userId ne null && String.valueOf(sessionScope.adminYn) eq 'N'}">
                <div class="list__item">
                    <a href="/subs/subslist">Line:up</a>
                </div>
                <div class="list__item">
                    <a href="/company/company">커넥트드라이브란?</a>
                </div>
                <div class="list__item">
                    <a href="">이용후기</a>
                </div>
                <div class="list__item">
                    <a href="">고객센터</a>
                </div>
                <div class="list__item">
                    <a href=""></a>
                </div>
				</c:if>
                	<li id="dropdown">
                <c:if test="${sessionScope.userId ne null && String.valueOf(sessionScope.adminYn) eq 'N'}">
                <div class="list__item">
                    <a href="">${sessionScope.userName } 님</a>
                </div>
                	<ul class="submenu" id="dropdown-content">
		                <div class="list__item" id="search">
		                    <a href="/user/mypage">마이페이지</a>
		                </div>
		                <div class="list__item">
		                    <a href="/user/logout">로그아웃</a>
		                </div>
	                </ul>
                </c:if>
                	</li>
                	
                <c:if test="${sessionScope.userId ne null && String.valueOf(sessionScope.adminYn) eq 'Y'}">	                	
                <div class="list__item">
                    <a href="">회원 관리</a>
                </div>
                <div class="list__item">
                    <a href="/subs/subslist">차량 관리</a>
                </div>
                <div class="list__item">
                    <a href="">구독 관리</a>
                </div>                	
               	<li id="dropdown">
	               	<div class="list__item">
	                    <a href="">게시판 관리</a>
	               	</div>
	                	<ul class="submenu" id="dropdown-content">
			                <div class="list__item" id="search">
			                    <a href="">공지 관리</a>
			                </div>
			                <div class="list__item" id="search">
			                    <a href="">문의 관리</a>
			                </div>
			                <div class="list__item" id="search">
			                    <a href="">후기 관리</a>
			                </div>
			                <div class="list__item" id="search">
			                    <a href="">자주 묻는 질문 관리</a>
			                </div>
		                </ul>
               	</li>
				<div class="list__item">
                    <a href=""></a>
                </div>  
				</c:if>
                	<li id="dropdown">
                <c:if test="${sessionScope.userId ne null && String.valueOf(sessionScope.adminYn) eq 'Y'}">
                <div class="list__item">
                    <a href="">${sessionScope.userName } 님</a>
                </div>
                	<ul class="submenu" id="dropdown-content">
		                <div class="list__item">
		                    <a href="/user/logout">로그아웃</a>
		                </div>
	                </ul>
                </c:if>
                	</li>

            </div>
        </div>
       </div>
   </header>