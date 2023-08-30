<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>묻고답하기 상세보기</title>
    <%@ include file="../common.jsp"%>
</head>

<body>
<%@ include file="../header.jsp"%>
<div class="container contents">
    <h2 class="page_title text-center">Q & A 상세보기</h2>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb justify-content-end">
            <li class="breadcrumb-item"><a href="${rootPath }">Home</a></li>
            <li class="breadcrumb-item"><a href="#">Community</a></li>
            <li class="breadcrumb-item active" aria-current="page">QnA</li>
        </ol>
    </nav>
    <table class="table">
        <thead>

        <tr>
            <th class="item2">제목</th>
            <th class="item3">작성일</th>
            <th class="item4">조회수</th>
        </tr>
        </thead>
        <tbody>
        <c:set var="qna" value="${qna}"/>
        <tr>
            <td class="item2">${qna.title}</td>
            <td class="item3">${qna.regdate}</td>
            <td class="item4">${qna.visited}</td>
        </tr>
        <tr>
            <td colspan="3">
                ${qna.content}
            </td>
        </tr>
    </tbody>
    </table>
        <div class="btn-group">
            <a class="btn btn-primary" href="${rootPath }/QnaList.do" role="button">글 목록</a>
            <a class="btn btn-primary" href="${rootPath }/QnaUpdate.do?no=${qna.qno}" role="button">글 수정</a>
            <a class="btn btn-primary" href="${rootPath }/QnaDelete.do?no=${qna.qno}" role="button">글 삭제</a>
        </div>
        <div class="btn-group">
            <c:if test="${qna.getLev() eq 0 }"></c:if>
            <c:if test="${member.author eq sid }">
            </c:if>
            <c:if test="${sid eq 'admin' }">
                <a class="btn btn-primary" href="${rootPath }/QnaAddAdmin.do?lev=1&par=${qna.qno}" role="button">답변하기</a>
            </c:if>
        </div>
    </div>
    <%@ include file="../footer.jsp" %>
</body>
</html>
