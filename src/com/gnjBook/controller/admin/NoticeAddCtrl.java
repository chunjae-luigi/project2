package com.gnjBook.controller.admin;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/NoticeAdd.do") // 사용자가 보는 이름
public class NoticeAddCtrl extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setAttribute("msg", "공지사항을 추가합니다.");

    RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/noticeAdd.jsp");
    view.forward(request, response);
  }
}