package com.gnjBook.controller.pay;

import com.gnjBook.dto.Cart;
import com.gnjBook.dto.Delivery;
import com.gnjBook.dto.Payment;
import com.gnjBook.dto.Product;
import com.gnjBook.model.CartDAO;
import com.gnjBook.model.MultiPattern;
import com.gnjBook.model.ProductDAO;
import com.gnjBook.vo.PayVO;

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

@WebServlet("/PayProductPro.do") // 사용자가 보는 이름
public class PayProductProCtrl extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession(); // 세션 생성
    String id = (String) session.getAttribute("session_id");

    ProductDAO productDAO = new ProductDAO();
    Product product = productDAO.getProduct(Integer.parseInt(request.getParameter("pro_no")));

    // 출고 처리
    String method = request.getParameter("method");
    String pcom = request.getParameter("pcom");
    String paccount = request.getParameter("paccount");

    Payment pay = new Payment();
    pay.setMem_id(id);
    pay.setPro_no(product.getPro_no());
    pay.setPay_price(product.getPrice());
    pay.setAmount(Integer.parseInt(request.getParameter("amount")));
    pay.setMethod(method);
    pay.setPcom(pcom);
    pay.setPaccount(paccount);

    Delivery del = new Delivery();
    del.setMem_id(id);
    del.setAddress(request.getParameter("address1")+" "+request.getParameter("address2")+" "+request.getParameter("postcode"));
    del.setTel(request.getParameter("tel"));
    del.setName(request.getParameter("name"));

    PayVO payvo = new PayVO();
    payvo.setPro(product);
    payvo.setDel(del);
    payvo.setPay(pay);

    MultiPattern mdao = new MultiPattern();
    int pno = mdao.outstockProduct(pay, del);

    request.setAttribute("payvoList", payvo);

    String path = request.getContextPath();
    response.sendRedirect(path+"/PayList.do");
  }
}