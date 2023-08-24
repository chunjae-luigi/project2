<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>로그인</title>
    <%@ include file="../common.jsp" %>
</head>
<body>
<%@ include file="../header.jsp" %>

<div class="container contents text-center">
    <h2 class="page_title text-center">로그인</h2>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb justify-content-end">
            <li class="breadcrumb-item"><a href="${rootPath }">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">Login</li>
        </ol>
    </nav>

    <%-- 로그인 Form   --%>
    <form action="${rootPath}/LoginPro.do" id="login_form" class="form_row" method="post">
        <div class="container justify-content-center" style="max-width: 400px;">
            <div class="row">
                <input class="form-control" type="text" name="id" id="id" placeholder="아이디 입력" autofocus required>
            </div>
            <div class="row">
                <input class="form-control" type="password" name="pw" id="pw"  placeholder="패스워드 입력" required>
            </div>
            <a href="" style="display: block; text-align: end; font-size: 8px; color: gray; margin-bottom: 20px;">아이디/비밀번호 찾기</a>
            <input type="submit" value="로그인" class="btn btn-primary mb-3">
            <a href="${rootPath }/member/term.jsp" class="btn btn-primary mb-3">회원가입</a>
        </div>
    </form>
</div>

<%@ include file="../footer.jsp" %>
</body>
</html>