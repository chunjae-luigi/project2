package com.gnjBook.controller.pay;

import com.gnjBook.dto.Cart;
import com.gnjBook.dto.Member;
import com.gnjBook.dto.Product;
import com.gnjBook.model.CartDAO;
import com.gnjBook.model.MemberDAO;
import com.gnjBook.model.ProductDAO;
import com.gnjBook.vo.CartVO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/PayProduct.do") // 사용자가 보는 이름
public class PayProductCtrl extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int amount = Integer.parseInt(request.getParameter("amount"));
    int pro_no = Integer.parseInt(request.getParameter("pro_no"));

    ProductDAO dao = new ProductDAO();
    Product product = dao.getProduct(pro_no);

    request.setAttribute("amount", amount);
    request.setAttribute("product", product);

    MemberDAO memberDAO = new MemberDAO();
    HttpSession session = request.getSession(); // 세션 생성
    Member member = memberDAO.getMember((String) session.getAttribute("session_id"));

    request.setAttribute("mem", member);

    RequestDispatcher view = request.getRequestDispatcher("/pay/productPay.jsp");
    view.forward(request,response);
  }
}