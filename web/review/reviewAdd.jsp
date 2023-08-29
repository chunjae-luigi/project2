<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 페이지</title>
    <%@ include file="../common.jsp"%>
</head>

<body>
<%@ include file="../header.jsp"%>

<div class="container contents text-center">
    <h2 class="page_title text-center">리뷰 페이지</h2>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb justify-content-end">
            <li class="breadcrumb-item"><a href="${rootPath }">Home</a></li>
            <li class="breadcrumb-item"><a href="#">상품</a></li>
            <li class="breadcrumb-item active" aria-current="page">교과서</li>
        </ol>
    </nav>
    <form action="${rootPath }/ReviewAddPro.do" method="post">
        <input type="hidden" value="${proNo}" id="proNo" name="proNo" >
        <table class="table">
            <thead>
            <tr>
                <td colspan="2"><h2>${product.title } 관련 리뷰</h2></td>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row"><label for="star" class="form-label">별점</label></th>
                <td><input type="number" class="form-control" id="star" name="star" max="5"></td>
            </tr>
            <tr>
                <th scope="row"><label for="content" class="form-label">리뷰내용</label></th>
                <td><textarea class="form-control" id="content" name="content" rows="5"></textarea></td>
            </tr>
            </tbody>
        </table>
        <button type="submit">리뷰등록</button>
    </form>
    <a class="btn btn-primary" href="${rootPath }/BookGet.do?proNo=${proNo }" role="button">글 목록</a>
</div>

<%@ include file="../footer.jsp" %>
</body>
</html>

<script>
    function addCart(){
        $("form").attr("action", "${rootPath}/CartAdd.do?pno=${product.proNo }&imgsrc1=${product.img}&price=${product.price}");
    }
    function payProduct(){
        $("form").attr("action", "${rootPath}/PayProduct.do");
    }
</script>
