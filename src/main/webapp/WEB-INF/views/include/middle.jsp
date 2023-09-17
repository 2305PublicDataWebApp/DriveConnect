<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DriveConnect</title>
<style>
		body {
			margin: 8px;
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
        .blind {
            position:absolute;
            clip:rect(0 0 0 0);
            width:1px;
            height:1px;
            margin:-1px;
            overflow:hidden
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
            color: #000;
            margin-bottom: 70px;
            font-weight: 300;
            line-height: 1.5;
        }
        /* sild__wrap */

        .slider__inner .slider {
            height: 600px;
            background-image: url(../resources/img/index_1.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            position: relative;
            z-index: 1;
        }
        .slider__inner .slider::after {
            content: '';
            width: 100%;
            height: 100%;
            background-color:  rgba(224, 217, 88, 0.1);
            position: absolute;
            left: 0;
            top: 0;
            z-index: -1;
        }
        .slider__info {
            padding: 100px 0;
        }
        .slider__info .small {
            display: inline-block;
            padding: 1px 30px;
            background-color: #fff;
            color: #333;
            font-size: 16px;
            border-radius: 50px;
            text-transform: uppercase;
            margin-bottom: 10px;
        }
        .slider__info .title {
            font-size: 80px;
            color: #ffffff;
            margin-bottom: 40px;
            margin-left: -5px;
        }
        .slider__info .desc_0 {
            font-size: 26px;
            line-height: 20px;
            color: #ffffff;
            width: 50%;
            word-break: keep-all;
        }
        .slider__info .desc {
            font-size: 18px;
            line-height: 20px;
            color: #ffffff;
            width: 50%;
            word-break: keep-all;
        }
        .slider__info .btn {
            margin-top: 100px;
        }
        .slider__info .btn a {
            width: 180px;
            background: #333;
            color: #ffffff;
            font-size: 16px;
            display: inline-block;
            text-align: center;
            padding: 12px 0;
            margin-right: 4px;
        }
        .slider__info .btn a:last-child {
            background-color: #333;
            color: #fff;
        }
/*         .slider__arrow a { */
/*             position: absolute; */
/*             top: 50%; */
/*             background-image: url(../assets/img/icon_main.svg); */
/*             background-size: 500px; */
/*             width: 30px; */
/*             height: 56px; */
/*             display: block; */
/*             margin-top: -28px; */
/*         } */
/*         .slider__arrow a:first-child {    */
/*             left: 20px; */
/*         } */
/*         .slider__arrow a:last-child { */
/*             right: 20px; */
/*             background-position: -52px 0; */
/*         } */
/*         .slider__dot { */
/*             position: absolute; */
/*             left: 50%; */
/*             bottom: 20px; */
/*             transform: translateX(-50%); */
/*         } */
/*         .slider__dot a { */
/*            width: 16px; */
/*            height: 16px; */
/*            display: inline-block; */
/*            background-image: url(../assets/img/icon_main.svg); */
/*            background-size: 500px; */
/*            margin: 0 3px;    */
/*         } */
/*         .slider__dot a.dot { */
/*             background-position: -101px -1px; */
/*         } */
/*         .slider__dot a.active { */
/*             background-position: -121px -1px; */
/*         } */
/*         .slider__dot a.play { */
/*             background-position: -141px -1px; */
/*         } */
/*         .slider__dot a.stop { */
/*             background-position: -161px -1px; */
/*         } */
        @media only screen and (-webkit-min-device-pixel-ratio: 2),
            only screen and (min-device-pixel-ratio: 2),
            only screen and (min-resolution: 2dppx) {
                .slider__inner .slider {
                    background-image: url(../resources/img/index_1.jpg);
                }   
            }
    </style>
</head>
<body>
<section class="slider__wrap nexon">
        <h2 class="blind">메인 슬라이드 영역</h2>
        <div class="slider__inner">
            <div class="slider">
                <div class="slider__info container">
                    <span class="small">OPEN</span>
                    <h1 class="title">드라이브 커넥트</h1>
                    <p class="desc_0">새로운 맞춤형 모빌리티 체험의 시작</p>
                    <p class="desc">당신의 일상을 편리하게 만들어주는 차량구독 서비스</p>
                    <div class="btn">
                        <a href="/company/company">자세히 보기</a>
<!--                         <a href="#">상담 신청</a> -->
                    </div>
                </div>
<!--                 <div class="slider__arrow"> -->
<!--                     <a href="#"><span class="blind">이전 이미지</span></a> -->
<!--                     <a href="#"><span class="blind">다음 이미지</span></a> -->
<!--                 </div> -->
<!--                 <div class="slider__dot"> -->
<!--                     <a href="#" class="dot active"><span class="blind">첫번째 이미지</span></a> -->
<!--                     <a href="#" class="dot"><span class="blind">두번째 이미지</span></a> -->
<!--                     <a href="#" class="dot"><span class="blind">세번째 이미지</span></a> -->
<!--                     <a href="#" class="play"><span class="blind">플레이</span></a> -->
<!--                     <a href="#" class="stop"><span class="blind">정지</span></a> -->
<!--                 </div> -->
            </div>
        </div>
    </section>
</body>
</html>