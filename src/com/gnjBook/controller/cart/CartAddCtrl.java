package com.gnjBook.controller.cart;

import com.gnjBook.dto.Cart;
import com.gnjBook.dto.Member;
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

@WebServlet("/CartAdd.do") // 사용자가 보는 이름
public class CartAddCtrl extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession(); // 세션 생성
    String id = (String) session.getAttribute("session_id");

    CartDAO dao = new CartDAO();
    Cart cart = new Cart();
    cart.setMemId(id);
    cart.setAmount(Integer.parseInt(request.getParameter("amount")));
    cart.setProNo(Integer.parseInt(request.getParameter("proNo")));
    System.out.println(cart.getProNo());
    dao.addCart(cart);

    String path = request.getContextPath();
    response.sendRedirect(path+"/CartList.do");
  }
}