package com.gnjBook.controller.admin;

import com.gnjBook.model.ProductDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/BookDelete.do")
public class BookDeleteCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int proNo = Integer.parseInt(request.getParameter("no"));

        String msg = "상품 정보를 삭제합니다.";
        ServletContext application = request.getServletContext();
        String home = application.getContextPath();

        ProductDAO dao = new ProductDAO();
        int cnt = dao.deleteProduct(proNo);
        PrintWriter out = response.getWriter();

        if(cnt > 0) {
            response.sendRedirect(home + "/ProList.do");
        }else{
            out.println("<script>history.go(-1);</script>");

        }
    }
}


