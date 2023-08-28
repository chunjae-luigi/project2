package com.gnjBook.controller.product;

import com.gnjBook.dto.Book;
import com.gnjBook.dto.Category;
import com.gnjBook.dto.Product;
import com.gnjBook.model.BookDAO;
import com.gnjBook.model.CategoryDAO;
import com.gnjBook.model.ProductDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/BookGet.do") // 사용자가 보는 이름
public class BookGetCtrl extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setAttribute("msg", "교재 상세페이지를 출력합니다.");
    int proNo = Integer.parseInt(request.getParameter("proNo"));

    ProductDAO dao = new ProductDAO();
    Product product = dao.getProduct(proNo);

    BookDAO bdao = new BookDAO();
    Book book = bdao.getBook(proNo);

    CategoryDAO cdao = new CategoryDAO();
    Category category = cdao.getCategory(product.getCategoryId());



    request.setAttribute("product", product);
    request.setAttribute("book", book);
    request.setAttribute("category", category);

    RequestDispatcher view = request.getRequestDispatcher("/product/bookGet.jsp");
    view.forward(request, response);
  }
}