<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 목록</title>
    <%@ include file="../../common.jsp"%>
</head>

<body>
<%@ include file="../../header.jsp"%>
<div style="display: flex; min-height: 80vh;">
    <%@include file="adminBoardList.jsp"%>
    <div class="container" style="margin-top: 20px;">
        <h2 class="title">회원</h2>
        <div class="container">
            <form action="${rootPath}/MemberDelete.do" method="post" onsubmit="deleteTrue()">
                <table class="table table-secondary" id="tb1">
                    <thead>
                    <tr>
                        <th></th>
                        <th>번호</th>
                        <th>아이디</th>
                        <th>이름</th>
                        <th>등록일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="member" items="${memberList}" varStatus="status">
                    <tr>
                        <td class="check"><input type="checkbox" name="isDelete" value="${member.id}"></td>
                        <td>${status.count}</td>
                        <td>
                            <a class="link-body-emphasis link-offset-2 link-underline-opacity-25 link-underline-opacity-75-hover" href="${rootPath }/MemberGetAdmin.do?id=${member.id}" style="display:inline-block; width:100%;">${member.id}</a>
                        </td>
                        <td>${member.name}</td>
                        <td>${member.regdate}</td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <input class="btn btn-primary" type="submit" value="회원 삭제">
                <nav aria-label="Page navigation example" id="page-nation1">
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                    </ul>
                </nav>
            </form>
        </div>
    </div>
</div>
<%@ include file="../../footer.jsp" %>
</body>
</html>
<script>
    function deleteTrue(){
        let isdelete = confirm("정말 삭제하시겠습니까?");
        if(isdelete){
            return true;
        } else{
            return false;
        }
    }
</script>