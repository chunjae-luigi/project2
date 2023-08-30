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
        .product-item .product-thumb .preview-meta li input  {
            background: #fff;
            padding: 10px 0px;
            cursor: pointer;
            display: inline-block;
            font-size: 20px;
            transition: 0.2s all;
            width: 50px;
            border:none;
        }
        .product-item .product-thumb .preview-meta li a, .product-item .product-thumb .preview-meta li input {
            content: "";
            background-color:#fff!important;
            background-repeat:no-repeat!important;
            background-position:center center!important;
            width:50px;
            height:50px;
            border-radius:5px;
        }
        .product-item .product-thumb .preview-meta li input.list_cart {
            background-image:url("${rootPath}/images/ico_cart.png");
            background-size:20px!important;
        }
        .product-item .product-thumb .preview-meta li a.list_search {
            background-image:url("${rootPath}/images/ico_search.png");
            background-size:35px!important;
        }
    </style>
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
                        <img src="${rootPath }/images/main/category-1.jpg" alt="" />
                        <div class="content">
                            <h3>초등 서적</h3>
                            <p>초등학생을 위한 최적의 서적</p>
                        </div>
                    </a>
                </div>
                <div class="category-box">
                    <a href="${rootPath }/BookList.do?category=B">
                        <img src="${rootPath }/images/main/category-2.jpg" alt="" />
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
                        <img src="${rootPath }/images/main/category-3.jpg" alt="" />
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
                <div class="col-md-4">
                    <form action="" method="post">
                        <div class="product-item">
                            <div class="product-thumb">
                                <img class="img-responsive" src="${rootPath }/storage/${pro.img }" alt="${pro.title }" />
                                <div class="preview-meta">
                                    <ul>
                                        <li><a href="${rootPath }/BookGet.do?proNo=${pro.proNo }" class="list_search"></a></li>
                                        <li><input type="submit" value="" class="list_cart" onclick="addCart(${pro.proNo }, ${pro.img }, ${pro.price })"></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="product-content">
                                <h4><a href="product-single.html">${pro.title }</a></h4>
                                <p class="price">${pro.price } 원</p>
                            </div>
                        </div>
                    </form>
                </div>
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

<script>
    function addCart(proNo, img, price){
        $("form").attr("action", "${rootPath}/CartAdd.do?pno=" + proNo + "&imgsrc1=" + img + "&price=" + price + "");
    }
</script>