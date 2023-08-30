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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/BookAdd.do")
public class BookAddCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String msg = "관리자의 상품등록이 로딩되었습니다.";
        request.setAttribute("msg", msg);

        CategoryDAO dao = new CategoryDAO();
        List<Category> categoryList = dao.getCategoryList();


        request.setAttribute("cateList", categoryList);
        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/bookAdd.jsp");
        view.forward(request, response);
    }
}