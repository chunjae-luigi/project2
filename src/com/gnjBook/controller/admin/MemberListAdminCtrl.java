package com.gnjBook.controller.admin;

import com.gnjBook.dto.Member;
import com.gnjBook.model.MemberDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.util.List;

@WebServlet("/MemberListAdmin.do")
public class MemberListAdminCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("msg", "회원 목록을 출력합니다.");

        MemberDAO dao = new MemberDAO();
        List<Member> memberList = dao.getMemberList();

        request.setAttribute("memberList", memberList);

        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/memberList.jsp");
        view.forward(request, response);
    }
}
