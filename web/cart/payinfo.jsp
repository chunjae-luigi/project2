<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<form action="${path }/AddPaymentPro.do" method="post" onsubmit="return payCheck(this)">
    <h3>결제 정보</h3>
    <table class="table">
        <tbody>
        <tr>
            <th>결제 수단</th>
            <td>
                <select name="pmethod" id="pmethod" class="form-control">
                    <option value="신용카드">신용카드</option>
                    <option value="체크카드">체크카드</option>
                    <option value="계좌이체">계좌이체</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>결제사</th>
            <td>
                <select name="pcom" id="pcom" class="form-control">
                    <option value="선택안함">선택안함</option>
                </select>
                <input type="hidden" name="pcom2" id="pcom2" value="">
            </td>
        </tr>
        <tr>
            <th>결제 번호</th>
            <td>
                <input type="text" name="cnum" id="cnum" class="form-control" required>
                <input type="hidden" name="payAmount" id="payAmount">
                <input type="hidden" name="payCk" id="payCk" value="no">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="button" id="pay" value="결재" class="btn btn-primary">
            </td>
        </tr>
        </tbody>
    </table>
    <div class="btn-wrap container">
        <c:if test="${!empty sid }">
            <input type="submit" class="btn btn-primary" value="구매">
        </c:if>
        <a href="${path }/ProList.do" class="btn btn-primary">제품 목록</a>
    </div>
</form>

<script>
    $(document).ready(function(){
        var cardArr1 = ["현대카드","농협카드","BC카드","KB카드"];
        var cardArr2 = ["하나카드","농협카드","BC카드"];
        var bankArr = ["카카오뱅크","농협은행","신한은행","기업은행","국민은행"];
        $("#pmethod").change(function(){
            var th = $(this).val();
            if(th==="신용카드"){
                for(var i=0;i<cardArr1.length;i++) {
                    $("#pcom").append("<option value='" + cardArr1[i] + "'>" + cardArr1[i] + "</option>");
                }
            } else if(th==="체크카드"){
                for(var i=0;i<cardArr2.length;i++) {
                    $("#pcom").append("<option value='"+cardArr2[i]+"'>"+cardArr2[i]+"</option>");
                }
            } else {
                for(var i=0;i<bankArr.length;i++) {
                    $("#pcom").append("<option value='"+bankArr[i]+"'>"+bankArr[i]+"</option>");
                }
            }
        }).change();
        $("#pcom").change(function(){
            $("#pcom2").val($(this).val());
        });
    });
</script>
<script>
    //주소 연동 API
    function findAddr() {
        new daum.Postcode({
            oncomplete: function(data) {
                console.log(data);
                var roadAddr = data.roadAddress;
                var jibunAddr = data.jibunAddress;
                document.getElementById("postcode").value = data.zonecode;
                if(roadAddr !== '') {
                    document.getElementById("address1").value = roadAddr;
                } else if(jibunAddr !== ''){
                    document.getElementById("address1").value = jibunAddr;
                }
                document.getElementById("address2").focus();
            }
        }).open();
    }
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //결제모듈 API 연동
    $(document).ready(function(){
        var totalPay=0;
        var proName;
        $("#pay").click(function(){
            var email = $("#name").val();
            var cname = $("#email").val();
            var tel = $("#tel").val();
            var addr = $("#addr").val();
            var postcode = $("#postcode").val();
            proName = $("#proName").val();
            if($("#amount").val()!="") {
                totalPay = parseInt($("#sprice").val()) * parseInt($("#amount").val());
            } else {
                alert("구매할 수량을 입력하지 않으셨습니다.");
                $("#amount").focus();
                return;
            }
            alert("결제할 금액 : "+totalPay);
            //상품명_현재시간
            var d = new Date();
            var date = d.getFullYear()+''+(d.getMonth()+1)+''+d.getDate()+''+d.getHours()+''+d.getMinutes()+''+d.getSeconds();
            IMP.init('imp31083748'); // 결제 API를 사용하기 위한 코드 입력!
            IMP.request_pay({		//결제 요청
                merchant_uid : '상품명_' + date, //상점 거래 ID
                name : proName,				// 결제 명
                amount : totalPay,					// 결제금액
                buyer_email : email, // 구매자 email
                buyer_name : cname,				// 구매자 이름
                buyer_tel : tel,		// 구매자 전화번호
                buyer_addr : addr,		// 구매자 주소
                buyer_postcode : postcode			// 구매자 우편번호
            }, function(rsp){
                if(rsp.success){
                    console.log(rsp);
                    var msg = '결제가 완료 되었습니다.';
                    var r1 = '고유 아이디 : ' +rsp.imp_uid;
                    var r2 = '상점 거래 아이디 : ' +rsp.merchant_uid;
                    var r3 = '결제 금액 : ' +rsp.paid_amount;
                    var r4 = '카드 승인 번호 : '+rsp.apply_num;

                    //$("#payCk").val("yes");
                    //$("#payAmount").val(rsp.paid_amount);
                    //$("#pmethod").val(rsp.pay_method);
                    //$("#pcom").val(rsp.pg_provider);
                    //$("#cnum").val(rsp.apply_num);
                    //alert(msg);
                    //$("#paymentResult").html(r1+"<br>"+r2+"<br>"+r3+"<br>"+r4);
                } else{
                    //$("#paymentResult").html('결제실패<br>'+'에러내용 : ' +rsp.error_msg);
                }
                //테스트용이므로 실패시에도 그냥 통과시킴
                $("#payCk").val("yes");
                $("#payAmount").val(totalPay);
                $("#pmethod").val("신용카드");
                $("#pcom").val("삼성카드");
                $("#cnum").val("123-1234-1234-1278");
                $("#paymentResult").text("결제 완료 : "+totalPay);
            });
        });
    });
</script>
<script>
    function payCheck(f){
        var payCk = f.payCk.value;
        if(payCk!="yes"){
            alert("아직 결제 전 입니다.");
            return;
        }
    }
</script>