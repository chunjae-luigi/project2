<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark" style="width: 280px">
        <span class="fs-4">관리자페이지</span>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
        <li class="nav-item">
            <a id="admin-member-nav" href="${rootPath}/MemberListAdmin.do" class="nav-link text-white">
                회원 관리
            </a>
        </li>
        <li class="nav-item">
            <a id="admin-notice-nav" href="${rootPath}/NoticeListAdmin.do" class="nav-link text-white">
                공지사항 관리
            </a>
        </li>
        <li class="nav-item">
            <a id="admin-book-nav" href="${rootPath}/BookListAdmin.do" class="nav-link text-white">
                교재 관리
            </a>
        </li>
    </ul>
</div>

<script>
    var link =  document.location.href;
    let nav;
    if(link.includes("Member")){
        nav = $("#admin-member-nav");
        $(nav).attr("aria-current", "page");
        $(nav).addClass("active");
    } else if(link.includes("Notice")){
        nav = $("#admin-notice-nav");
        $(nav).attr("aria-current", "page");
        $(nav).addClass("active");
    } else if(link.includes("Book")){
        nav = $("#admin-book-nav");
        $(nav).attr("aria-current", "page");
        $(nav).addClass("active");
    }

</script>