<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <link rel="stylesheet" href="/resources/css/header.css?after">
    <header id="header" style="background: rgb(255, 255, 255)";>
        <div class="header-inner">
            <div class="top">
                <div class="logo">
                    <a href="/" class="logo__inner">
					ConnectDrive
                    </a>
                </div>
            </div>
        <div class="list left">
            <nav role="navigation" class="list">
            </nav>
            <div class="list right">
                <div class="list__item">
                    <a href="">Line:up</a>
                </div>
            	<c:if test="${sessionScope.userId eq null }">
	                <div class="list__item" id="search">
	                    <a href="/user/register">회원가입</a>
	                </div>
	                <div class="list__item">
	                    <a href="">로그인</a>
	                </div>
                </c:if>
                <div class="list__item">
                    <a href="">커넥트드라이브란?</a>
                </div>
                <div class="list__item">
                    <a href="">이용후기</a>
                </div>
                <div class="list__item">
                    <a href="">고객센터</a>
                </div>
                <ul class="menu">
                	<li>
                <c:if test="${sessionScope.userId ne null }">
                <div class="list__item">
                    <a href="">사용자 님</a>
                </div>
                	<ul class="submenu">
		                <div class="list__item" id="search">
		                    <a href="">마이페이지</a>
		                </div>
		                <div class="list__item">
		                    <a href="">로그아웃</a>
		                </div>
	                </ul>
                </c:if>
                	</li>
                </ul>
            </div>
        </div>
        </div>
    </header>