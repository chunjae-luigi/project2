package com.gnjBook.controller.admin;


import com.gnjBook.dto.Delivery;
import com.gnjBook.model.DeliveryDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeliveryGetAdmin.do")
public class DeliveryGetAdminCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int dno = Integer.parseInt(request.getParameter("dno"));
        DeliveryDAO dao = new DeliveryDAO();
        Delivery delivery = dao.getDelivery(dno);

        request.setAttribute("delivery", delivery);

        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/deliveryGet.jsp");
        view.forward(request, response);
    }
}
