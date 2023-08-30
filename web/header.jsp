<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
    header + * {margin-top: 66px;}
    /*헤더를 top에 고정시키므로 header 뒤에 오는 컨텐츠(뭐가 될진 몰라서 모든 것 * 선택)에는 헤더의 높이 만큼 margin을 적용시켜줘야 한다. */

    .navbar .nav-item > a {color:antiquewhite;}
    /*부트스트랩 navbar 위에 있는 아이템만 흰 글씨로. 안 그러면 토글해서 나오는 것도 흰 글씨가 되어 안 보인다.*/

    .navbar .nav-item {margin: auto 10px;}
    /*부트스트랩 navbar 색깔을 어두운색으로 변경했으므로 색깔을 달리해줘야 한다.*/

</style>

<section class="top-header">
    <div class="container">
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <a class="navbar-brand" href="${rootPath }">
                    <img src="${rootPath}/images/favicon-color.png" alt="SamSam" height="40">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="${rootPath}/product/introduce.jsp">쌤쌤 소개</a>
                        </li>
                        <li class="nav-item"><a href="${rootPath }/BookList.do?category=*" class="nav-link">전체 상품</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="${rootPath }/ProList.do" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                초등교재
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${rootPath}/BookList.do?category=A">초등교과서</a></li>
                                <li><a class="dropdown-item" href="${rootPath}/BookList.do?category=B">초등참고서</a></li>
                                <li><a class="dropdown-item" href="${rootPath}/BookList.do?category=C">초등문제집</a></li>
                            </ul>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                커뮤니티
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${rootPath }/NoticeList.do">공지사항</a></li>
                                <li><a class="dropdown-item" href="${rootPath }/">묻고답하기</a></li>
                                <li><a class="dropdown-item" href="${rootPath }/">학습후기</a></li>
                                <li><a class="dropdown-item" href="${rootPath }/FileboardList.do">학습자료실</a></li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="nav justify-content-end">
                    <c:choose>
                        <c:when test="${empty session_id}">
                            <li><a href="${rootPath }/member/login.jsp">로그인</a></li>
                            <li><a href="${rootPath }/member/term.jsp">회원가입</a></li>
                        </c:when>
                        <c:when test="${session_id eq 'admin'}">
                            <li><a href="${rootPath }/Logout.jsp">로그아웃</a></li>
                            <li><a href="${rootPath }/MemberListAdmin.jsp">관리자</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="${rootPath }/Logout.jsp">로그아웃</a></li>
                            <li><a href="${rootPath }/CartList.jsp">장바구니</a></li>
                            <li><a href="${rootPath }/PayList.jsp">결제 내역</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </div>
</section>
<section class="menu">
    <nav class="navbar navigation">
        <div class="container">
            <div id="navbar" class="navbar-collapse collapse text-center">
                <ul class="nav navbar-nav">
                    <li class="dropdown dropdown-slide">
                        <a href="#!" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350" role="button" aria-haspopup="true" aria-expanded="false">쌤쌤 소개 <i class="fas fa-sort-down" style="vertical-align: 0.125em!important;"></i></a>
                        <div class="dropdown-menu">
                            <div class="row">
                                <!-- Basic -->
                                <div class="col-lg-6 col-md-6 mb-sm-3">
                                    <ul>
                                        <li><a href="${rootPath}/product/introduce.jsp">회사소개</a></li>
                                        <li><a href="${rootPath}/product/introduce.jsp">회사소개</a></li>
                                        <li><a href="${rootPath}/product/introduce.jsp">회사소개</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="dropdown dropdown-slide">
                        <a href="${rootPath }/BookList.do?category=*" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350" role="button" aria-haspopup="true" aria-expanded="false">교과서 <i class="fas fa-sort-down" style="vertical-align: 0.125em!important;"></i></a>
                    </li>
                    <li class="dropdown dropdown-slide">
                        <a href="#!" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350" role="button" aria-haspopup="true" aria-expanded="false">커뮤니티 <i class="fas fa-sort-down" style="vertical-align: 0.125em!important;"></i></a>
                        <div class="dropdown-menu">
                            <div class="row">
                                <!-- Basic -->
                                <div class="col-lg-6 col-md-6 mb-sm-3">
                                    <ul>
                                        <li><a href="${rootPath}/NoticeList.jsp">공지사항</a></li>
                                        <li><a href="${rootPath}/">묻고답하기</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</section>
