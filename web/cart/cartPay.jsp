<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니 결제</title>
    <%@ include file="../common.jsp"%>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
</head>

<body>
<%@ include file="../header.jsp"%>
<div class="container contents">
    <h2 class="page_title text-center">장바구니 결제</h2>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb justify-content-end">
            <li class="breadcrumb-item"><a href="${rootPath }">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">장바구니 결제</li>
        </ol>
    </nav>

    <div class="container">
        <div class="box_wrap">

            <table class="table" id="tb1">
                <thead>
                <tr>
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
                    <td><input type="checkbox" name="cartCheck" value="${cartVO.cart.cart_no}"></td>
                    <td>${cartVO.product.title}</td>
                    <td>${cartVO.product.price}</td>
                    <td>${cartVO.cart.amount}</td>
                    <td class="product_price">${cartVO.product.price*cartVO.cart.amount}</td>
                </tr>
                </c:forEach>
                </tbody>
                <tfoot>
                    <tr>
                        <td>총계</td>
                        <td colspan="4" id="total"></td>
                    </tr>
                </tfoot>
            </table>

            <nav aria-label="Page navigation example" id="page-nation1">
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>



<script>
    $(document).ready(function(){
        let total = 0;
        $(".product_price").each(function(){
            total = total + parseInt($(this).text());
        })
        $("#total").text(total+" 원");
    })
</script>