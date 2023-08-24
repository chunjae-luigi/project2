package com.gnjBook.model;

import com.gnjBook.db.DBC;
import com.gnjBook.db.MariaDBCon;
import com.gnjBook.dto.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MultiPattern {
  static DBC db = new MariaDBCon();
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  public MultiPattern() {
  }

  public void instock(Instock instock){
    int cnt = 0;
    InstockDAO instockDAO = new InstockDAO();
    cnt += instockDAO.inInstock(instock);
  }

  // 출고 처리. 트랜잭션이 필요하다.
  public int outstock(Payment payment, Delivery delivery, Cart cart){
    int pay_no = 0;
    conn = db.connect();
    String sql = "";
    try {
      conn.setAutoCommit(false);
      int cnt = 0;

      // 출고 시 결제 기록
      sql = "insert into payment(mem_id, pro_no, pay_price, amount, method, pcom, paccount, dno) values(?, ?, ?, ?, ?, ?, ?, '')";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, payment.getMem_id());
      pstmt.setInt(2, payment.getPro_no());
      pstmt.setInt(3, payment.getPay_price());
      pstmt.setInt(4, payment.getAmount());
      pstmt.setString(5, payment.getMethod());
      pstmt.setString(6, payment.getPcom());
      pstmt.setString(7, payment.getPaccount());
      cnt += pstmt.executeUpdate();

      // 출고 시 출고 기록
      sql = "insert into outstock(pro_no, amount, out_price) values(?, ?, ?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, payment.getPro_no());
      pstmt.setInt(2, payment.getAmount());
      pstmt.setInt(3, payment.getPay_price());
      cnt += pstmt.executeUpdate();

      sql = "insert into delivery(pay_no, mem_id, daddress, mem_tel, state) values (?, ?, ?, ?, 0)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, delivery.getPay_no());
      pstmt.setString(2, delivery.getMem_id());
      pstmt.setString(3, delivery.getDaddress());
      pstmt.setString(4, delivery.getMem_tel());
      cnt += pstmt.executeUpdate();

      // 출고 시 카트에서 삭제
      sql = "delete from cart where cart_no=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, cart.getCart_no());
      cnt += pstmt.executeUpdate();

      // 출고, 결제 시 결제 번호 반환
      sql = "select pay_no from payment order by pay_no desc limit 1";
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();

      if(rs.next()){
        pay_no = rs.getInt("pay_no");
      }

      conn.commit();
      conn.setAutoCommit(true);
    } catch (SQLException e) {
      try {
        conn.rollback();
      } catch (SQLException ex) {
        throw new RuntimeException(ex);
      }

      throw new RuntimeException(e);
    }
    return pay_no;
  }

  public void refund(Payment pay){
    conn = db.connect();
    int cnt = 0;
    String sql = "";

    try {
      conn.setAutoCommit(false);

      // 반품 시 결제 취소
      sql = "delete from payment where pay_no=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, pay.getPay_no());
      cnt += pstmt.executeUpdate();


      // 반품 시 출고 취소
      sql = "delete from outstock where pay_no=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, pay.getPay_no());
      cnt += pstmt.executeUpdate();

      // 반품 시 장바구니에 다시 넣기
      sql = "insert into cart(mem_id, pro_no, amount) values(?, ?, ?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, pay.getMem_id());
      pstmt.setInt(2, pay.getPro_no());
      pstmt.setInt(3, pay.getAmount());
      cnt += pstmt.executeUpdate();

      // 반품 시 배송 삭제
      sql = "delete from delivery where pay_no=?";
      pstmt.setInt(1, pay.getPay_no());
      cnt += pstmt.executeUpdate();

      conn.commit();
      conn.setAutoCommit(true);
    } catch (SQLException e) {
      try {
        conn.rollback();
      } catch (SQLException ex) {
        throw new RuntimeException(ex);
      }

      throw new RuntimeException(e);
    }
  }

}
