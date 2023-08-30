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
    </style>
</head>

<body id="body">
<%@ include file="../header.jsp"%>
<section class="page-header" style="margin-top:0!important;">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="content">
                    <h1 class="page-name">교과서 목록</h1>
                    <ol class="breadcrumb">
                        <li><a href="${rootPath }/">Home</a></li>
                        <li class="active">상품</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="container contents text-center">
    <nav aria-label="breadcrumb">
        <ui class="category" style="float: left;">
                <a class="nav-link dropdown-toggle" href="${rootPath }/BookList.do" role="button" data-bs-toggle="dropdown" aria-expanded="false">카테고리</a>
                 <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="${rootPath }/CateList.do?category=A">초등 교과서</a></li>
                    <li><a class="dropdown-item" href="${rootPath }/CateList.do?category=B">중등 교과서</a></li>
                    <li><a class="dropdown-item" href="${rootPath }/CateList.do?category=C">고등 교과서</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="${rootPath }/BookList.do?category=*">전체</a></li>
                </ul>
        </ui>
    </nav>
    <div class="d-flex align-content-start flex-wrap">
    <c:forEach var="book" items="${bookList}" varStatus="status">
        <div class="card" style="width: 300px; height: 400px; margin: 10px;">
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
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>
