<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>교재 페이지</title>
    <%@ include file="../common.jsp"%>
</head>

<body>
<%@ include file="../header.jsp"%>

<div class="container contents text-center">
    <h2 class="page_title text-center">교과서 목록</h2>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb justify-content-end">
            <li class="breadcrumb-item"><a href="${rootPath }">Home</a></li>
            <li class="breadcrumb-item"><a href="#">상품</a></li>
            <li class="breadcrumb-item active" aria-current="page">교과서</li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-4">
            <img class="card-img-top" src="${rootPath}/storage/${product.thumbnail }" alt="${book.title }" width="100"/>
        </div>
        <div class="col-8">
            <form action="" method="post">
            <table class="table">
                <thead>
                <tr>
                    <td colspan="2"><h2>${book.title }</h2></td>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row">카테고리</th>
                    <td>${category.categoryName} </td>
                </tr>
                <tr>
                    <th scope="row">가격</th>
                    <td>${product.price}</td>
                </tr>
                <tr>
                    <td>
                        <label for="amount">수량</label>
                    </td>
                    <td>
                        <input id="amount" name="amount" type="number" class="form-control" value="1">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input class="btn btn-primary" type="submit" value="장바구니 추가" onclick="addCart()">
                    </td>
                    <td>
                        <input type="hidden" name="proNo" value="${product.proNo}">
                        <input class="btn btn-primary" type="submit" value="결제하기" onclick="payProduct()">
                    </td>
                </tr>
                </tbody>
            </table>
            </form>
        </div>
    </div>
    <div class="content">
        ${book.content}
    </div>
    <a class="btn btn-primary" href="${rootPath }/BookList.do?category=*" role="button">글 목록</a>
</div>

<%@ include file="../footer.jsp" %>
</body>
</html>

<script>
    function addCart(){
        $("form").attr("action", "${rootPath}/CartAdd.do");
    }
    function payProduct(){
        $("form").attr("action", "${rootPath}/PayProduct.do");
    }
</script>
