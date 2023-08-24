<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>회원약관</title>
    <%@ include file="../common.jsp" %>
</head>
<body>
<%@ include file="../header.jsp" %>

<div class="container contents text-center">
    <h2 class="page_title text-center">회원약관</h2>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb justify-content-end">
            <li class="breadcrumb-item"><a href="${rootPath }">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">회원가입</li>
        </ol>
    </nav>
    <section class="page" id="page1">
        <div class="page_wrap">
            <h3>이용 약관 </h3>
            <%@include file="term_util.jsp"%>
            <div class="btn_fr">
                <input type="checkbox" id="ck_item1" name="ck_item"> <label for="ck_item1">이용약관 동의</label><br>
            </div>
            <h3>개인정보 수집 및 이용약관</h3>
            <%@include file="term_person.jsp"%>
            <div class="btn_fr">
                <input type="checkbox" id="ck_item2" name="ck_item"> <label for="ck_item2">개인정보 수집 및 이용약관 동의</label><br><br><br>
                <button type="button" id="in_btn1" class="inBtn inBtn1">다음 단계</button>
            </div>
            <script>
                var in_btn1 = document.getElementById("in_btn1");
                var ck_item1 = document.getElementById("ck_item1");
                var ck_item2 = document.getElementById("ck_item2");
                in_btn1.addEventListener("click", function(){
                    if(ck_item1.checked && ck_item2.checked) {
                        location.href = "${rootPath}/Join.do";
                    } else if(ck_item1.checked || ck_item2.checked){
                        alert("약관에 동의하지 않으셨습니다.");
                    }
                });
            </script>
        </div>
    </section>
</div>
<br>
<%@ include file="../footer.jsp" %>
</body>
</html>