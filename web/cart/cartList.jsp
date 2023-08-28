<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니 목록</title>
    <%@ include file="../common.jsp"%>
</head>

<body>
<%@ include file="../header.jsp"%>
<div class="container contents">
    <h2 class="page_title text-center">장바구니</h2>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb justify-content-end">
            <li class="breadcrumb-item"><a href="${rootPath }">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">장바구니</li>
        </ol>
    </nav>

    <div class="container">
        <div class="box_wrap">
            <form action="" method="post">
            <table class="table" id="tb1">
                <thead>
                <tr>
                    <th></th>
                    <th>번호</th>
                    <th>상품 이름</th>
                    <th>상품 가격</th>
                    <th>개수</th>
                    <th>총계</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="cartVO" items="${cartVOList}" varStatus="status">
                <tr>
                    <td><input type="checkbox" name="cartCheck" value="${cartVO.cart.cartNo}"></td>
                    <td>${status.count}</td>
                    <td>${cartVO.product.title}</td>
                    <td>${cartVO.product.price}</td>
                    <td>${cartVO.cart.amount}</td>
                    <td>${cartVO.product.price*cartVO.cart.amount}</td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
                <input class="btn btn-primary" type="submit" value="장바구니 삭제" onclick="deleteButton()">
                <input class="btn btn-primary" type="submit" value="장바구니 결제" onclick="payButton()">
            </form>
        </div>
    </div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>

<script>
    function deleteButton(){
        $("form").attr("action", "${rootPath}/CartDelete.do");
    }
    function payButton(){
        $("form").attr("action", "${rootPath}/PayCart.do");
    }
</script>