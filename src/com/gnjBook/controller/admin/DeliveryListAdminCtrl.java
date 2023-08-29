package com.gnjBook.controller.admin;


import com.gnjBook.dto.Delivery;
import com.gnjBook.dto.Product;
import com.gnjBook.model.DeliveryDAO;
import com.gnjBook.model.ProductDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/DeliveryListAdmin.do")
public class DeliveryListAdminCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DeliveryDAO dao = new DeliveryDAO();
        List<Delivery> delList = dao.getDeliveryList();

        request.setAttribute("delList", delList);

        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/deliveryList.jsp");
        view.forward(request, response);
    }
}
