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

@WebServlet("/CartPay.do") // 사용자가 보는 이름
public class CartPayCtrl extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String[] checked = request.getParameterValues("cartCheck");

    List<CartVO> cartVOList = new ArrayList<>();

    CartDAO cartDAO = new CartDAO();
    List<Cart> cartList = new ArrayList<>();
    for(String s: checked){
      cartList.add(cartDAO.getCart(Integer.parseInt(s)));
    }

    ProductDAO productDAO = new ProductDAO();
    for(Cart c: cartList){
      CartVO cvo = new CartVO();
      cvo.setCart(c);
      cvo.setProduct(productDAO.getProduct(c.getPro_no()));
      cartVOList.add(cvo);
    }

    request.setAttribute("cartVOList", cartVOList);

    MemberDAO memberDAO = new MemberDAO();
    HttpSession session = request.getSession(); // 세션 생성
    Member customer = memberDAO.getMember((String) session.getAttribute("session_id"));

    request.setAttribute("cus", customer);

    RequestDispatcher view = request.getRequestDispatcher("/cart/cartPay.jsp");
    view.forward(request,response);
  }
}