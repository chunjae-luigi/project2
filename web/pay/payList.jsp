<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제내역</title>
    <%@ include file="../common.jsp"%>
</head>

<body>
<%@ include file="../header.jsp"%>
<div class="container contents">
    <h2 class="page_title text-center">결제내역</h2>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb justify-content-end">
            <li class="breadcrumb-item"><a href="${rootPath }">Home</a></li>
            <li class="breadcrumb-item"><a href="${rootPath}/CartList.do">장바구니</a></li>
            <li class="breadcrumb-item active" aria-current="page">결제내역</li>
        </ol>
    </nav>

    <div class="container">
        <div class="box_wrap">
            <form action="" method="post">
            <table class="table" id="tb1">
                <thead>
                <tr>
                    <th>결제 번호</th>
                    <th>상품 이름</th>
                    <th>상품 가격</th>
                    <th>상품 개수</th>
                    <th>결제 방법</th>
                    <th>배송 상태</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="payvo" items="${payvoList}">
                <tr>
                    <td>${payvo.pay.pay_no}</td>
                    <td>${payvo.pro.title}</td>
                    <td>${payvo.pay.pay_price}</td>
                    <td>${payvo.pay.amount}</td>
                    <td>${payvo.pay.method}</td>
                    <td class="del_state">${payvo.del.state}</td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
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
        $("form").attr("action", "${rootPath}/CartPay.do");
    }
</script>