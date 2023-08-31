
<script>
    function addCart(proNo, img, price){
        $("form").attr("action", "${rootPath}/CartAdd.do?pno=" + proNo + "&imgsrc1=" + img + "&price=" + price + "");
    }
</script>