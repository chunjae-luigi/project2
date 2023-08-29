package com.gnjBook.controller.category;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

import com.gnjBook.dto.Category;
import com.gnjBook.model.CategoryDAO;

@WebServlet("/CategoryList.do")
public class CategoryListCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        CategoryDAO dao = new CategoryDAO();
        List<Category> cateList = dao.getCategoryList();

        request.setAttribute("cateList", cateList);
        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/categoryList.jsp");
        view.forward(request, response);

    }
}
