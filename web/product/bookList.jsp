<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>교재 목록</title>
    <%@ include file="../common.jsp"%>
    <style>
        .dropdown-toggle::after { transition: transform 0.15s linear;}
        .show.dropdown .dropdown-toggle::after {transform: translateY(3px);}
        .dropdown-menu {margin-top: 0;}
        .page-header .breadcrumb li {position:relative;}
        .product-item {height:400px;margin-bottom:100px;}
        .drop-container {
            &:hover .drop {
                display: block;
            }
            .drop {
                display: none;
                position: absolute;
                top: 14px;
                left: 4px;
                padding:5px;
                background-color:#f5f5f5;
                .dropSub {
                    display: block;
                    width:56px;
                    padding: 8px 16px;
                    box-sizing:border-box;
                    &:hover {
                        text-decoration:underline;
                    }
                }
            }
        }
    </style>
</head>

<body id="body">
    <%@ include file="../header.jsp"%>
    <section class="page-header" style="margin-top:0!important;">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="content">
                        <h1 class="page-name">도서 목록</h1>
                        <ol class="breadcrumb">
                            <li><a href="${rootPath }/">Home</a></li>
                            <li class="active relative drop-container">
                                <span href="#">도서 목록 <i class="fas fa-sort-down" style="vertical-align: 0.125em!important;"></i></span>
                                <div class="drop">
                                    <ul class="list pl0">
                                        <li><a class="dropSub" href="${rootPath }/CateList.do?category=*">전체</a></li>
                                        <li><a class="dropSub" href="${rootPath }/CateList.do?category=A">초등</a></li>
                                        <li><a class="dropSub" href="${rootPath }/CateList.do?category=B">중등</a></li>
                                        <li><a class="dropSub" href="${rootPath }/CateList.do?category=C">고등</a></li>
                                    </ul>
                                </div>
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="products section bg-gray">
        <div class="container">
            <div class="row">
                <c:forEach var="book" items="${bookList }" varStatus="status">
                <a href="${rootPath }/BookGet.do?proNo=${book.proNo }">
                    <div class="col-md-3">
                        <div class="product-item">
                            <div class="product-thumb">
                                <img class="img-responsive" src="${rootPath }/storage/${book.img }" alt="${book.title }" />
                            </div>
                            <div class="product-content">
                                <h4><a href="product-single.html">${book.title }</a></h4>
                                <p class="price">${book.price } 원</p>
                            </div>
                        </div>
                    </div>
                </a>
                </c:forEach>
                <c:if test="${empty bookList }">
                    <p class="text-center">등록된 상품이 없습니다.</p>
                </c:if>
            </div>
        </div>
    </section>
    <%--
    <div class="container contents text-center">
        <div class="d-flex align-content-start flex-wrap">
        <c:forEach var="book" items="${bookList}" varStatus="status">
            <div class="card" style="width: 18rem; margin: 10px;">
                <a href="${rootPath}/BookGet.do?proNo=${book.proNo }">
                <img class="card-img-top" src="${rootPath}/storage/${book.img }" alt="${book.title }" width="100"/>
                </a>
                <div class="card-body">
                    <h5 class="card-title">${book.title}</h5>
                    <p class="card-text">${book.price} 원</p>
                </div>
            </div>
        </c:forEach>
        </div>
        <ul class="pagination">
            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
        </ul>
    </div>--%>
    <%@ include file="../footer.jsp" %>
    <%@ include file="../commonsub.jsp" %>
</body>
</html>

<script>
    $(document).ready(function(){
        if($(".card").length===0){
            $(".d-flex.align-content-start.flex-wrap").append("<div class='text-center align-center' style='margin-top: 50px; height: 30vh;'>해당 목록이 존재하지 않습니다.</div>");
        }
    })
</script>

