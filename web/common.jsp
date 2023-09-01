<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="rootPath" value="<%=request.getContextPath() %>" />

<!-- 메타포, 오픈그래프, 파비콘, 폰트 등 각 종 자원 로딩 -->
<meta http-equiv="X-UA-Compatible" content="IE=dege"> <!-- 인터넷익스프로러로 접근시 엣지로 연결되게 함 -->
<meta http-equiv="Author" content="그로우앤조이북 콘텐츠 제작팀">
<meta http-equiv="Publisher" content="그로우앤조이북 콘텐츠 제작팀">
<meta http-equiv="Copyright" content="Copyright@grownjoyBook.co.kr">

<!-- 검색엔진 최적화(SEO) -->
<meta name="Subject" content="그로우앤조이북, 그로우앤조이북 IT">
<meta name="Keyword" content="그로우앤조이북, 그로우앤조이북 IT, 교재">
<meta name="Description" content="그로우앤조이북는 교육 교재 정보, 커뮤니티, 게시판">
<meta name="Robots" content="index, follow">

<!-- 오픈 그래프(Open graph)-->
<meta property="og:type" content="website">
<meta property="og:title" content="그로우앤조이북">
<meta property="og:description" content="모두와 함께하며 소통으로 함께하는 기업">
<meta property="og:image" content="https://github.com/chunjae-luigi/project2/image/icon.png">
<meta property="og:url" content="https://github.com/chunjae-luigi/project2">

<!-- 트위터 -->
<meta name="twitter:card" content="picture">
<meta name="twitter:title" content="그로우앤조이북">
<meta name="twitter:description" content="앞선 생각으로 더 큰 미래의 교육을 준비하는 기업">
<meta name="twitter:image" content="https://github.com/chunjae-luigi/project2/image/logo.png">

<!-- 파비콘 설정 -->
<!-- 16x16, 24x24, 32x32, 48x48, 64x64, 96x96, 114x114, 128x128, 256x256 등을 활용-->
<!-- 표준 파비콘 -->
<link rel="shortcut icon" href="${rootPath }/images/common/icon.ico">
<!-- 애플 계열 모바일 -->
<link rel="apple-touch-icon-precomposed" href="${rootPath }/images/common/icon_48.png">
<!-- IE 계열 브라우저 -->
<meta name="msapplication-TileColor" content="#FFFFFF">
<meta name="msapplication-TileImage" content="${rootPath }/images/common/icon_48.png">
<!-- 파이어폭스, 오페라, 또는 구형 크롬/사파리 -->
<link rel="icon" href="${rootPath }/images/common/icon_16.png" sizes="16x16">
<link rel="icon" href="${rootPath }/images/common/icon_36.png" sizes="36x36">
<link rel="icon" href="${rootPath }/images/common/icon_48.png" sizes="48x48">


<%--
<script src="${rootPath}/js/jquery-1.10.0.js"></script>
<script src="${rootPath}/js/nav.js"></script>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
--%>
<link rel="stylesheet" href="${rootPath}/css/common.css">
<!-- Themefisher Icon font -->
<link rel="stylesheet" href="${rootPath}/css/bootstrap/themefisher-font/style.css">
<!-- bootstrap.min css -->
<link rel="stylesheet" href="${rootPath}/css/bootstrap/bootstrap.min.css">

<!-- Animate css -->
<link rel="stylesheet" href="${rootPath}/css/bootstrap/animate.css">
<!-- Slick Carousel -->
<link rel="stylesheet" href="${rootPath}/css/bootstrap/slick.css">
<link rel="stylesheet" href="${rootPath}/css/bootstrap/slick-theme.css">

<!-- Main Stylesheet -->
<link rel="stylesheet" href="${rootPath}/css/bootstrap/style.css">

<script type="text/javascript" charset="UTF-8" src="${rootPath}/js/all.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/54/2/intl/ko_ALL/common.js"></script>
<script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/54/2/intl/ko_ALL/util.js"></script></head>


<script>

    <!-- 이미지 로딩 안 될 시 대체 이미지 띄우기 -->
    $(document).ready(function(){
        $("img").attr("onerror", "this.onerror=null; this.src='${rootPath}/images/noimage.jpg'");
    });

    <!-- 불펌 방지 -->
    document.oncontextmenu = function() { return false; }
    document.ondragstart = function() { return false; }
    document.onselectstart = function() { return false; }
</script>

<link rel="stylesheet" href="${rootPath}/css/jquery.dataTables.css">
<script src="${rootPath}/js/jquery.dataTables.js"></script>

<%--

<style>
    @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 600;
        font-style: normal;
    }
</style>

<style>
    html{scrollbar-width:none;}
    html * {font-family: 'Pretendard-Regular', "monospace", "sans-serif";}
    body::-webkit-scrollbar, html::-webkit-scrollbar { display:none; }
    /*스크롤 숨기기*/

    .contents {min-height: 90vh;}
    /* 한 페이지의 주요 내용을 차지하는 바닥은 적어도 80은 차지해야 header와 footer 사이의 간격을 확보할 수 있다.  */

    .page_title {margin-top: 20px; display: inline-block;}
    /* 일반 페이지는 타이틀로 시작. 따라서 타이틀을 헤더에서 조금 떨어트림 */

    a {color: #435334; text-decoration: none;}
    a:hover {text-decoration: 1px underline #435334;}
    /* 브래드크럼 스타일 지정 */

    nav[aria-label="breadcrumb"] {border-bottom:2px solid #435334;}
    /* 타이틀, 브래드크럼 영역과 콘텐츠 영역 분리 선 */

    a:hover {font-weight: bold;}
    /* 이동가능한 링크는 두껍게 표시 */

    .form_row .row {margin: 20px auto;}

    .card img{max-height: 300px;}


    #tb1 { width:960px; margin:40px auto; }
    #tb1 th { background-color: #111; color:#fff; }
    .item1 { width:10%; }
    .item2 { width:60%; }
    .item3 { width:20%; }
    .item4 { width:10%; }
    #page-nation1 { width: 960px; margin:20px auto; }
    .list li { margin-top: 24px; }

    .dropdown-toggle::after { transition: transform 0.15s linear;}
    .show.dropdown .dropdown-toggle::after {transform: translateY(3px);}
    .dropdown-menu {margin-top: 0;}

    .frm { clear:both; width:1200px; margin:0 auto; padding-top: 80px; }

    .tb1 { width:500px; margin:50px auto; }
    .tb1 th { width:180px; line-height:32px; padding-top:8px; padding-bottom:8px;
        border-top:1px solid #333; border-bottom:1px solid #333;
        background-color:deepskyblue; color:#fff; }
    .tb1 td { width:310px; line-height:32px; padding-top:8px; padding-bottom:8px;
        border-bottom:1px solid #333;
        padding-left: 14px; border-top:1px solid #333; }

    .indata { display:inline-block; width: 500px; height: 48px; line-height: 48px;
        text-indent:14px; font-size:18px; }
    .inbtn { display:block;  border-radius:100px;
        min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;
        line-height: 48px; background-color: #333; color:#fff; font-size: 18px; }
    .inbtn:first-child { float:left; }
    .inbtn:last-child { float:right; }

    .agree_fr { width: 900px; margin: 20px auto; border:1px solid #eee;
        padding: 20px; overflow-y: auto;
        height: 250px; white-space: pre-wrap; }
    .btn_fr{text-align:center;}

</style>

<style>
    .term input[type="checkbox"]{border: 0; clip: rect(0 0 0 0); height: 1px; margin: -1px; overflow: hidden; padding: 0; position: absolute; width: 1px;}
    .term input[type="checkbox"] + label{display:inline-block; position:relative; vertical-align:middle; padding-left:40px; line-height:28px; font-size:18px;}
    .term input[type="checkbox"] + label:after{content:""; display:block; position:absolute; top:0; left:0; width:31px; height:31px; background:url(../image/join/chk_ico.png) 0 0 no-repeat;}
    .term input[type="checkbox"]:checked + label:after{background-position:0 -31px;}

    .term {width:800px;margin:0 auto}
    .term ul li{display:flex; align-items:center; justify-content:space-between; padding:14px 0;}
    .term ul li p .essential{color:#ed3535;}
    .term ul li a{position:relative; font-size:14px; color:#97999b;}
    .term ul li a:before{content:""; display:inline-block; position:absolute; bottom:-1px; left:0; width:100%; border-bottom:1px solid #97999b;}

    .inBtn.center{display:block;margin:10px auto 0;width:80%;background-color:var(--third-color);}
</style>--%>
