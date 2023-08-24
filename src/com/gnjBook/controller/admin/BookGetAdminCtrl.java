package com.gnjBook.controller.admin;

import com.gnjBook.dto.Category;
import com.gnjBook.dto.Product;
import com.gnjBook.model.CategoryDAO;
import com.gnjBook.model.ProductDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/BookGetAdmin.do") // 사용자가 보는 이름
public class BookGetAdminCtrl extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setAttribute("msg", "교재 상세페이지를 출력합니다.");
    int id = Integer.parseInt(request.getParameter("id"));

    ProductDAO dao = new ProductDAO();
    Product product = dao.getProduct(id);

    CategoryDAO cdao = new CategoryDAO();
    Category category = cdao.getCategory(product.getCategory_id());

    request.setAttribute("book", product);
    request.setAttribute("category", category);

    RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/bookGet.jsp");
    view.forward(request, response);
  }
}