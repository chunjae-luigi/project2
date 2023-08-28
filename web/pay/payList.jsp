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
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="payvo" items="${payvoList}">
                <tr>
                    <td>${payvo.pay.payNo}</td>
                    <td>${payvo.pro.title}</td>
                    <td>${payvo.pay.payPrice}</td>
                    <td>${payvo.pay.amount}</td>
                    <td>${payvo.pay.method}</td>
                    <td class="del_state">${payvo.del.state}</td>
                    <td class="refund"></td>
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
    $(document).ready(function(){
        $(".del_state").each(function(){
            console.log($(this).text())
            if($(this).text()==="0"){
                $(this).text("배송 전");
                $(this).next("td").html("<a class='btn btn-primary' href='${rootPath}/PayDelete.do?payNo=${payvo.pay.payNo}'>결제취소</a>");
            } else if($(this).text()==="1"){
                $(this).text("배송 중");
                $(this).next("td").html("<a class='btn btn-primary' href='${rootPath}/Refund.do?payNo=${payvo.pay.payNo}'>반품신청</a>");
            } else if($(this).text()==="2"){
                $(this).text("도착");
                $(this).next("td").html("<a class='btn btn-primary' href='${rootPath}/Refund.do?payNo=${payvo.pay.payNo}'>반품신청</a>");
            } else{
                $(this).text("구매 결정");
            }
        })
    })
</script>