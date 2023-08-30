<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>qna 글쓰기</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%@ include file="../common.jsp"%>

</head>
<body>
<%@ include file="../header.jsp"%>
<div style="display: flex; min-height: 80vh;">
    <div class="container" style="margin-top: 20px;">
        <h2 class="title" style="margin: 30px auto;">답변하기</h2>
        <form action="${rootPath }/QnaAddPro.do" method="post">
            <input type="hidden" name="lev" value="${lev }" >
            <input type="hidden" name="par" value="${par }" >

            <div class="mb-3">
                <label class="form-label" for="title">제목</label>
                <input class="form-control" type="text" name="title" id="title">
            </div>
            <div class="mb-3">
                <label for="content" class="form-label">내용 입력</label>
                <textarea class="form-control" name="content" id="content" rows="5"></textarea>
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-primary mb-3">글 등록</button>
            </div>
        </form>
        <a class="btn btn-primary" href="${rootPath }/QnaList.do" role="button">글 목록</a>
    </div>
</div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>
