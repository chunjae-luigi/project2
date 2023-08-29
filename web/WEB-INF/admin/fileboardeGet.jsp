<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>학습자료실 페이지</title>
    <%@ include file="../../common.jsp"%>
</head>

<body>
<%@ include file="../../header.jsp"%>
<div style="display: flex; min-height: 80vh;">
    <%@include file="adminBoardList.jsp"%>
    <div class="container" style="margin-top: 20px;">
        <h2 class="title">학습자료실</h2>
        <table class="table">
            <thead>
            <tr>
                <th class="item2">제목</th>
                <th class="item3">작성일</th>
                <th class="item4">조회수</th>
            </tr>
            </thead>
            <tbody>
            <c:set var="notice" value="${filaboard}"/>
            <tr>
                <td class="item2">${filaboard.title}</td>
                <td class="item3">${filaboard.regdate}</td>
                <td class="item4">${filaboard.visited}</td>
            </tr>
            <tr>
                <td colspan="3">
                    ${filaboard.content}
                </td>
            </tr>
            </tbody>
        </table>
        <a class="btn btn-primary" href="${rootPath }/FileboardListAdmin.do" role="button">글 목록</a>
        <a class="btn btn-primary" href="${rootPath }/FileboardDelete.do?no=${filaboard.no}" role="button">글 삭제</a>
    </div>
</div>
<%@ include file="../../footer.jsp" %>
</body>
</html>
