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
        .product-item .product-thumb .preview-meta li a {
            content: "";
            background-color:#fff!important;
            background-repeat:no-repeat!important;
            background-position:center center!important;
            width:50px;
            height:50px;
            border-radius:5px;
        }
        .product-item .product-thumb .preview-meta li a.list_cart {
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
                    <p data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".1">베스트셀러</p>
                    <h1 data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".5">탑쓰리를 <br> 확인하세용</h1>
                    <a data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".8" class="btn" href="${rootPath }/BookList.do?category=*">Shop Now</a>
                </div>
            </div>
        </div>
    </div>
    <div class="slider-item th-fullpage hero-area" style="background-image: url('${rootPath }/images/002.jpg');">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 text-left">
                    <p data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".1">스테디셀러</p>
                    <h1 data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".5">다양한 도서들을 <br>확인해보세요</h1>
                    <a data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".8" class="btn" href="${rootPath }/BookList.do?category=*">Shop Now</a>
                </div>
            </div>
        </div>
    </div>
    <div class="slider-item th-fullpage hero-area" style="background-image: url('${rootPath }/images/003.jpg');">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 text-right">
                    <p data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".1">상품들</p>
                    <h1 data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".5">다양한 도서들을 <br>확인해보세요</h1>
                    <a data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".8" class="btn" href="${rootPath }/BookList.do?category=*">Shop Now</a>
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
                    <a href="#!">
                        <img src="${rootPath }/images/main/category-1.jpg" alt="" />
                        <div class="content">
                            <h3>Clothes Sales</h3>
                            <p>Shop New Season Clothing</p>
                        </div>
                    </a>
                </div>
                <div class="category-box">
                    <a href="#!">
                        <img src="${rootPath }/images/main/category-2.jpg" alt="" />
                        <div class="content">
                            <h3>Smart Casuals</h3>
                            <p>Get Wide Range Selection</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-md-6">
                <div class="category-box category-box-2">
                    <a href="#!">
                        <img src="${rootPath }/images/main/category-3.jpg" alt="" />
                        <div class="content">
                            <h3>Jewellery</h3>
                            <p>Special Design Comes First</p>
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
            <div class="col-md-4">
                <div class="product-item">
                    <div class="product-thumb">
                        <img class="img-responsive" src="${rootPath}/images/main/product-7.jpg" alt="product-img" />
                        <div class="preview-meta">
                            <ul>
                                <li><a href="#!" class="list_search"></a></li>
                                <li><a href="#!" class="list_cart"></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="product-content">
                        <h4><a href="product-single.html">Rainbow Shoes</a></h4>
                        <p class="price">$200</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="product-item">
                    <div class="product-thumb">
                        <img class="img-responsive" src="${rootPath}/images/main/product-7.jpg" alt="product-img" />
                        <div class="preview-meta">
                            <ul>
                                <li><a href="#!" class="list_search"></a></li>
                                <li><a href="#!" class="list_cart"></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="product-content">
                        <h4><a href="product-single.html">Rainbow Shoes</a></h4>
                        <p class="price">$200</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="product-item">
                    <div class="product-thumb">
                        <img class="img-responsive" src="${rootPath}/images/main/product-7.jpg" alt="product-img" />
                        <div class="preview-meta">
                            <ul>
                                <li><a href="#!" class="list_search"></a></li>
                                <li><a href="#!" class="list_cart"></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="product-content">
                        <h4><a href="product-single.html">Rainbow Shoes</a></h4>
                        <p class="price">$200</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="product-item">
                    <div class="product-thumb">
                        <img class="img-responsive" src="${rootPath}/images/main/product-7.jpg" alt="product-img" />
                        <div class="preview-meta">
                            <ul>
                                <li><a href="#!" class="list_search"></a></li>
                                <li><a href="#!" class="list_cart"></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="product-content">
                        <h4><a href="product-single.html">Rainbow Shoes</a></h4>
                        <p class="price">$200</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="product-item">
                    <div class="product-thumb">
                        <img class="img-responsive" src="${rootPath}/images/main/product-7.jpg" alt="product-img" />
                        <div class="preview-meta">
                            <ul>
                                <li><a href="#!" class="list_search"></a></li>
                                <li><a href="#!" class="list_cart"></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="product-content">
                        <h4><a href="product-single.html">Rainbow Shoes</a></h4>
                        <p class="price">$200</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="product-item">
                    <div class="product-thumb">
                        <img class="img-responsive" src="${rootPath}/images/main/product-7.jpg" alt="product-img" />
                        <div class="preview-meta">
                            <ul>
                                <li><a href="#!" class="list_search"></a></li>
                                <li><a href="#!" class="list_cart"></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="product-content">
                        <h4><a href="product-single.html">Rainbow Shoes</a></h4>
                        <p class="price">$200</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="product-item">
                    <div class="product-thumb">
                        <img class="img-responsive" src="${rootPath}/images/main/product-7.jpg" alt="product-img" />
                        <div class="preview-meta">
                            <ul>
                                <li><a href="#!" class="list_search"></a></li>
                                <li><a href="#!" class="list_cart"></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="product-content">
                        <h4><a href="product-single.html">Rainbow Shoes</a></h4>
                        <p class="price">$200</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="product-item">
                    <div class="product-thumb">
                        <img class="img-responsive" src="${rootPath}/images/main/product-7.jpg" alt="product-img" />
                        <div class="preview-meta">
                            <ul>
                                <li><a href="#!" class="list_search"></a></li>
                                <li><a href="#!" class="list_cart"></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="product-content">
                        <h4><a href="product-single.html">Rainbow Shoes</a></h4>
                        <p class="price">$200</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="product-item">
                    <div class="product-thumb">
                        <img class="img-responsive" src="${rootPath}/images/main/product-7.jpg" alt="product-img" />
                        <div class="preview-meta">
                            <ul>
                                <li><a href="#!" class="list_search"></a></li>
                                <li><a href="#!" class="list_cart"></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="product-content">
                        <h4><a href="product-single.html">Rainbow Shoes</a></h4>
                        <p class="price">$200</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="/footer.jsp" %>
<%@ include file="/commonsub.jsp"%>
</body>
</html>
