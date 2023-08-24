<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <%@ include file="../common.jsp" %>
    <style>

    </style>
</head>
<body>
<%@ include file="../header.jsp" %>

<div class="container contents text-center">
    <h2 class="page_title text-center">회원가입</h2>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb justify-content-end">
            <li class="breadcrumb-item"><a href="${rootPath }">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">회원가입</li>
        </ol>
    </nav>
    <form class="form_row" action="${rootPath}/JoinPro.do" method="post" onsubmit="return inform(this)">
            <div class="row">
                <div class="col-2"><label for="name" class="form-label">이름</label></div>
                <div class="col-8"><input type="text" class="form-control" id="name" name="name"></div>
            </div>
            <div class="row">
                <div class="col-2"><label for="id" class="form-label">아이디</label></div>
                <div class="col-8">
                    <input type="text" class="form-control" id="id" name="id" aria-describedby="idStatus">
                    <div id="idStatus" class="form-text text-start">아이디 중복 검사를 진행해주세요.</div>
                </div>
                <div class="col-2"><button type="button" class="btn btn-primary mb-3" onclick="idcheck()">중복검사</button></div>
                <input type="hidden" id="idck" value="no">
            </div>
            <div class="row">
                <div class="col-2"><label for="pw" class="form-label">비밀번호</label></div>
                <div class="col-3"><input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호" required></div>
                <div class="col-3">
                    <input type="password" class="form-control" id="pwchk" name="pwchk" placeholder="비밀번호 확인" required>
                </div>
                <div class="col-4"><div id="pwStatus" class="form-text text-start">비밀번호와 비밀번호 확인이 일치하지 않습니다.</div></div>
                <input type="hidden" id="pwck" value="no">
            </div>
            <div class="row">
                <div class="col-2"><label for="email" class="form-label">이메일</label></div>
                <div class="col-8"><input type="email" class="form-control" id="email" name="email"></div>
            </div>
            <div class="row">
                <div class="col-2"><label for="tel" class="form-label">전화번호</label></div>
                <div class="col-8"><input type="tel" class="form-control" id="tel" name="tel"></div>
            </div>
            <div class="row">
                <div class="col-2"><label for="birth">생년월일</label></div>
                <div class="col-4"><input type="date" class="form-control" id="birth" name="birth" value="1999-01-01"></div>
            </div>
            <div class="row">
                <div class="col-2"><label for="address1" class="form-label">주소</label></div>
                <div class="col-4"><input type="text" class="form-control" id="address1" name="address1"></div>
                <div class="col-4"><input type="text" class="form-control" id="postcode" name="postcode" placeholder="우편번호"></div>
                <div class="col-2"><button type="button" class="btn btn-primary mb-3" onclick="findAddr()">우편번호 검색</button></div>
            </div>
            <div class="row">
                <div class="col-2"><label for="address2" class="form-label">상세 주소</label></div>
                <div class="col-8"><input type="text" class="form-control" id="address2" name="address2"></div>
                <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
            </div>
            <input type="submit" class="btn btn-primary mb-3" value="가입하기">
        </form>
</div>

<%@ include file="../footer.jsp" %>
</body>
</html>

<script>
    $(document).ready(function(){
        $("#pwchk").keyup(function(){
            if($("#pw").val()===""||$("#pwchk").val()===""){
                console.log($("#pwchk").val())
                $("#pwStatus").html("<strong style='color: red'>비밀번호를 입력하세요.</strong>");
                $("#pwck").val("no");
            }
            else if($("#pw").val()==$("#pwchk").val()){
                $("#pwStatus").html("<strong style='color: green'>비밀번호가 일치합니다.</strong>");
                $("#pwck").val("yes");
            } else{
                $("#pwStatus").text("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
                $("#pwck").val("no");
            }
        })

        $("#id").keyup(function(){
            $("#idck").val("no");
            $("#idStatus").text("아이디 중복 검사를 진행해주세요");
        })
    })

    function inform(frm){
        if($("#idck").val()!="yes"){
            alert("아이디 중복 검사를 진행하지 않았습니다.")
            $("#id").focus();
            return false;
        }
        if($("#pwck").val()!="yes"){
            alert("비밀번호를 다시 확인해주십시오.");
            $("#pw").focus();
            return false;
        }
    }

    function idcheck(rootPath){
        if($("#id").val()==""){
            alert("아이디를 입력하지 않았습니다.")
            $("#id").focus();
            return false;
        }
        var params = {id:$("#id").val()}
        $.ajax({
            url:"${rootPath }/IdCheck.do",
            type: "post",
            dataType: "json",
            data: params,
            success: function(data){
                var idPass = data.result;
                if(idPass){
                    console.log(idPass);
                    $("#idck").val("no");
                    $("#idStatus").html("<strong style='color:red;'>사용할 수 없는 아이디 입니다.</strong>");
                    $("#id").focus();
                }
                else if(idPass===false){
                    $("#idck").val("yes");
                    $("#idStatus").html("<strong style='color:green;'>사용할 수 있는 아이디 입니다.</strong>");
                } else{
                    $("#idStatus").html("<strong style='color:red;'>아이디가 확인되지 않았습니다. 다시 시도하시길 바랍니다.</strong>");}
            }
        })
    }

    function findAddr(){
        new daum.Postcode({
            oncomplete:function(data){
                console.log(data);
                var roadAddr = data.roadAddress;
                var jibunAddr = data.jibunAddress;
                document.getElementById("postcode").value = data.zonecode;
                if(roadAddr !== ''){
                    document.getElementById("address1").value = roadAddr;
                } else if(jibunAddr !== ''){
                    document.getElementById("address1").value = jibunAddr;
                }
                document.getElementById("address2").focus();
            }
        }).open();
    }
</script>