<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>메인 페이지</title>
    <%@ include file="/common.jsp"%>
    <style>
        .intro p {text-indent: 2em; line-height: 2em; display:inline-block; word-break: keep-all;}
        .intro_tit {margin-top: 20px; display:inline-block;}
        .intro li {line-height: 2em;}
    </style>
</head>

<body>
<%@ include file="/header.jsp"%>

<div class="container contents text-center">
    <h2 class="page_title text-center">쌤쌤 소개</h2>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb justify-content-end">
            <li class="breadcrumb-item"><a href="${rootPath }">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">소개</li>
        </ol>
    </nav>
    <%--  브래드크럼 END  --%>

    <div class="intro text-start" style="margin-top: 20px;">
        <h3 class="intro_tit">함께, 똑같이 나아가는 교육, 쌤쌤</h3>
        <div class="row" style="align-items: center;">
            <div class="col-7"><p>쌤쌤은 교육의 혁신과 미래를 모색하는 교육 브랜드로서, 학습자들이 풍부한 지식과 창의력을 발전시키며 더 나은 미래를 준비할 수 있도록 돕고 있습니다. 우리는 교육 분야에서 지속적인 혁신과 도전을 통해 학습 경험을 혁신하고, 학생 한 명 한 명의 잠재력을 최대한으로 끌어내는 데 최선을 다하고 있습니다.</p></div>
            <div class="col-5" style="display:flex; justify-content: center;">
                <img src="../images/logo-color-long.png" alt="logo" style="max-height: 200px;">
            </div>
        </div>
        <h4 class="intro_tit">쌤쌤의 가치</h4>
        <ol>
            <li>개인 맞춤 학습: 각 학생은 독특한 학습 요구와 속도를 가지고 있습니다. 우리는 학생 개개인의 특성을 고려하여 맞춤형 학습 계획을 제공하며, 최적의 학습 경로를 찾아갑니다.</li>
            <li>혁신적인 교육 방법: 쌤쌤은 전통적인 교육 방식에만 의존하지 않습니다. 우리는 최신 교육 기술과 혁신적인 학습 방법을 적극적으로 적용하여 학생들이 더욱 효과적으로 학습할 수 있는 환경을 만들어줍니다.</li>
            <li>전문 교사 팀: 우리의 선생님들은 각각의 전문 분야에서 경험과 전문성을 갖추고 있습니다. 학생들은 우수한 교사들로부터 지식과 영감을 받으며 성장할 수 있습니다.</li>
            <li>창의적인 미래 준비: 미래는 빠르게 변화하고 있습니다. 쌤쌤은 학생들이 문제 해결 능력과 창의력을 기르며 미래의 도전에 대비할 수 있도록 지원합니다.</li>
        </ol>
        <h4 class="intro_tit">쌤쌤의 서비스</h4>
        <ol>
            <li>학습 프로그램: 다양한 학습 분야와 레벨에 맞춰진 학습 프로그램을 제공합니다. 과목별로 커리큘럼을 구성하고, 개인의 학습 수준에 따라 최적의 내용을 제공합니다.</li>
            <li>온라인 플랫폼: 우리의 온라인 플랫폼을 통해 언제 어디서든 학습할 수 있는 환경을 제공합니다. 온라인 강의, 문제 은행, 학습 자료 등이 제공됩니다.</li>
            <li>진단 및 평가: 학생의 학습 상황을 정확히 파악하고 지속적으로 평가하여 개인 맞춤 학습을 지원합니다.</li>
        </ol>
    </div>
    <%--  인트로 END  --%>

</div>

<%@ include file="/footer.jsp" %>
</body>
</html>
