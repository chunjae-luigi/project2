package com.gnjBook.controller;

import com.gnjBook.dto.Product;
import com.gnjBook.model.ProductDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class Main extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext application = request.getServletContext();
        application.setAttribute("rootPath", request.getContextPath());

        ProductDAO dao = new ProductDAO();
        List<Product> proList = dao.getProductListmain();

        request.setAttribute("proList", proList);

        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/index.jsp");
        view.forward(request, response);
    }
}
