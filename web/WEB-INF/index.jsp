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
</head>

<body id="body">
<%@ include file="/header.jsp"%>
<div class="hero-slider">
    <div class="slider-item th-fullpage hero-area" style="background-image: url('${rootPath }/images/001.jpg');">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 text-center">
                    <p data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".1">도서들</p>
                    <h1 data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".5">다양한 도서들을 <br> 확인하세요.</h1>
                    <a data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".8" class="btn" href="${rootPath }/BookList.do?category=*">바로가기</a>
                </div>
            </div>
        </div>
    </div>
    <div class="slider-item th-fullpage hero-area" style="background-image: url('${rootPath }/images/003.jpg');">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 text-right">
                    <p data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".1">학습자료실</p>
                    <h1 data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".5">다양한 자료를 <br>확인해보세요.</h1>
                    <a data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".8" class="btn" href="${rootPath }/FileboardList.do">바로가기</a>
                </div>
            </div>
        </div>
    </div>
</div>

<section class="product-category section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="title text-center">
                    <h2>Product Category</h2>
                </div>
            </div>
            <div class="col-md-6">
                <div class="category-box">
                    <a href="${rootPath }/BookList.do?category=A">
                        <img src="${rootPath }/images/main/elebook.png" alt="" />
                        <div class="content">
                            <h3>초등 서적</h3>
                            <p>초등학생을 위한 최적의 서적</p>
                        </div>
                    </a>
                </div>
                <div class="category-box">
                    <a href="${rootPath }/BookList.do?category=B">
                        <img src="${rootPath }/images/main/midbook.png" alt="" />
                        <div class="content">
                            <h3>중등 서적</h3>
                            <p>중학생을 위한 최적의 서적</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-md-6">
                <div class="category-box category-box-2">
                    <a href="${rootPath }/BookList.do?category=C">
                        <img src="${rootPath }/images/main/highbook.png" alt="" />
                        <div class="content">
                            <h3>고등 서적</h3>
                            <p>고등학생을 위한 최적의 서적</p>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="products section bg-gray">
    <div class="container">
        <div class="row">
            <div class="title text-center">
                <h2>Trendy Products</h2>
            </div>
        </div>
        <div class="row">
            <c:forEach var="pro" items="${proList }" varStatus="status">
                <a href="${rootPath }/BookGet.do?proNo=${pro.proNo }" class="list_search">
                    <div class="col-md-3">
                        <div class="product-item">
                            <div class="product-thumb">
                                <img class="img-responsive" src="${pro.img }" alt="${pro.title }" />
                            </div>
                            <div class="product-content">
                                <h4>${pro.title }</h4>
                                <p class="price">${pro.price } 원</p>
                            </div>
                        </div>
                    </div>
                </a>
            </c:forEach>
            <c:if test="${empty proList }">
                <p class="text-center">등록된 상품이 없습니다.</p>
            </c:if>
        </div>
    </div>
</section>

<%@ include file="/footer.jsp" %>
<%@ include file="/commonsub.jsp"%>
</body>
</html>