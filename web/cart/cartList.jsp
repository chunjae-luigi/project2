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
    <!-- 부트스트랩 링크 추가 -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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
            <form action="${rootPath}/CartDelete.do" method="post">
                <table class="table table-bordered" id="tb1">
                    <thead class="thead-light">
                    <tr>
                        <th></th>
                        <th>번호</th>
                        <th>상품 이름</th>
                        <th>표지 사진</th>
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
                            <td><img src="${rootPath}/storage/${cartVO.cart.imgsrc1}" style="max-width: 50px; max-height: 50px;" alt="대표 이미지"></td>
                            <td>${cartVO.product.price}</td>
                            <td>${cartVO.cart.amount}</td>
                            <td>${cartVO.product.price*cartVO.cart.amount}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="btn-group">
                    <input class="btn btn-danger" value="장바구니 삭제" type="submit">
                </div>
            </form>
            <div class="btn-group">
                <button class="btn btn-primary" onclick="payButton()">장바구니 결제</button>
            </div>
        </div>
    </div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>

<script>
    $(document).ready(function() {
        // "장바구니 삭제" 폼 제출 시 기본 동작 막고 deleteButton() 함수 호출
        $("#cartForm").on("submit", function(event) {
            event.preventDefault(); // 폼 제출 기본 동작 막기
            deleteButton();
        });

        // "장바구니 결제" 버튼 클릭 시 payButton() 함수 호출
        $(".pay-button").on("click", function() {
            payButton();
        });
    });
    function deleteButton(){
        var rootPath = '<%= request.getContextPath() %>'
        $("form").attr("action", rootPath+"/CartDelete.do");
    }
    function payButton(){
        var rootPath = '<%= request.getContextPath() %>';
        var selectedCartNos = [];
        $("input[name='cartCheck']:checked").each(function() {
            selectedCartNos.push($(this).val());
        });

        if (selectedCartNos.length > 0) {
            var form = $("form");
            var action = form.attr("action");
            action = action.replace("CartDelete.do", "PayCart.do");
            form.attr("action", action);

            var hiddenInput = $("<input>")
                .attr("type", "hidden")
                .attr("name", "selectedCartNos")
                .val(selectedCartNos.join(","));

            form.append(hiddenInput);

            form.submit();
        }
    }
</script>