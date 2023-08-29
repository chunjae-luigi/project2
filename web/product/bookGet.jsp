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
        <div class="col-4" style="width: 700px">
            <img class="card-img-top" src="${rootPath}/storage/${product.img }" alt="${product.title }" width="100"/>
        </div>
        <div class="col-8" style="width: 440px">
            <form action="" method="post">
            <table class="table">
                <thead>
                <tr>
                    <td colspan="2"><h2>${product.title }</h2></td>
                </tr>
                </thead>
                <tbody >
                <tr>
                    <th scope="row">카테고리</th>
                    <td>${category.categoryName} </td>
                </tr>
                <tr>
                    <th scope="row">저자</th>
                    <td>${product.author} </td>
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
    <ul class="nav nav-tabs" style="margin-top:24px;">
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#content_area">상세설명</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#review_area">리뷰</a>
        </li>
    </ul>
    <div class="content" style="margin-top: 24px; padding: 24px; border: 1px solid black; ">
        <video height="300" width="500" controls >
            <source src="${rootPath}/storage/${product.video }" type="video/mp4">
        </video>
        ${product.content}
    </div>
    <div id="review_area" style="padding-bottom: 24px; border: 1px solid black; margin: 24px auto 0; ">
        <c:if test="${!empty reviewList}">
            <table>
                <thead>
                <tr>
                    <th>#</th>
                    <th>리뷰내용</th>
                    <th>별점</th>
                    <th>비고</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${reviewList }" var="review" varStatus="status">
                    <tr>
                        <td>${status.count }</td>
                        <td>${review.content }</td>
                        <td>
                            <c:choose>
                                <c:when test="${review.star eq 5}">★★★★★</c:when>
                                <c:when test="${review.star eq 4}">★★★★</c:when>
                                <c:when test="${review.star eq 3}">★★★</c:when>
                                <c:when test="${review.star eq 2}">★★</c:when>
                                <c:when test="${review.star eq 1}">★</c:when>
                            </c:choose>
                        </td>
                        <td>
                            <c:if test="${sid eq 'admin' || sid eq review.memId}">
                                <a href="${rootPath }/ReviewDeletePro.do?rno=${review.rno }">리뷰삭제</a>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${empty reviewList}">
            <p class="text-center">등록된 리뷰가 없습니다.</p>
        </c:if>
    </div>
    <a class="btn btn-primary" href="${rootPath }/BookList.do?category=*" role="button">글 목록</a>
    <c:if test="${reviewPass eq true}">
    <a class="btn btn-primary" href="${rootPath }/ReviewAdd.do?proNo=${product.proNo }" role="button">리뷰등록</a>
    </c:if>
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
