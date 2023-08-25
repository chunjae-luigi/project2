package com.gnjBook.controller.pay;

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

@WebServlet("/PayCart.do") // 사용자가 보는 이름
public class PayCartCtrl extends HttpServlet {
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
      cvo.setProduct(productDAO.getProduct(c.getProNo()));
      cartVOList.add(cvo);
    }

    request.setAttribute("cartVOList", cartVOList);

    MemberDAO memberDAO = new MemberDAO();
    HttpSession session = request.getSession(); // 세션 생성
    Member member = memberDAO.getMember((String) session.getAttribute("session_id"));

    request.setAttribute("mem", member);

    RequestDispatcher view = request.getRequestDispatcher("/pay/cartPay.jsp");
    view.forward(request,response);
  }
}