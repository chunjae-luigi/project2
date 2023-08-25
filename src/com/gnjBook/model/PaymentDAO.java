package com.gnjBook.model;

import com.gnjBook.db.DBC;
import com.gnjBook.db.MariaDBCon;
import com.gnjBook.dto.Payment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PaymentDAO {
  static DBC db = new MariaDBCon();
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  public PaymentDAO() {
  }

  public List<Payment> getPaymentList(){
    conn = db.connect();
    List<Payment> paymentList = new ArrayList<>();

    String sql = "select * from payment";
    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();

      while(rs.next()){
        paymentList.add(new Payment(rs.getInt("pay_no"), rs.getString("mem_id"), rs.getInt("pro_no"), rs.getInt("pay_price"), rs.getInt("amount"), rs.getString("method"), rs.getString("pcom"), rs.getString("paccount"), rs.getInt("dno")));
      }

    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return paymentList;
  }

  public Payment getpayment(int pay_no){
    conn = db.connect();
    Payment payment = new Payment();

    String sql = "select * from payment where pay_no=?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, pay_no);
      rs = pstmt.executeQuery();

      if(rs.next()){
        payment = new Payment(rs.getInt("pay_no"), rs.getString("mem_id"), rs.getInt("pro_no"), rs.getInt("pay_price"), rs.getInt("amount"), rs.getString("method"), rs.getString("pcom"), rs.getString("paccount"), rs.getInt("dno"));
      }

    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return payment;
  }

  public int addPayment(Payment payment){
    conn = db.connect();
    int cnt = 0;

    String sql = "insert into payment(mem_id, pro_no, pay_price, amount, method, pcom, paccount, dno) values(?, ?, ?, ?, ?, ?, ?, ?)";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, payment.getMem_id());
      pstmt.setInt(2, payment.getPro_no());
      pstmt.setInt(3, payment.getPay_price());
      pstmt.setInt(4, payment.getAmount());
      pstmt.setString(5, payment.getMethod());
      pstmt.setString(6, payment.getPcom());
      pstmt.setString(7, payment.getPaccount());
      pstmt.setInt(8, payment.getDno());

      cnt = pstmt.executeUpdate();
    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }
    return cnt;
  }

  public int updatePayment(Payment payment){
    conn = db.connect();
    int cnt = 0;

    String sql = "update payment set mem_id=?, pro_no=?, pay_price=?, amount=?, method=?, pcom=?, paccount=?, dno=? where pay_no=?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, payment.getMem_id());
      pstmt.setInt(2, payment.getPro_no());
      pstmt.setInt(3, payment.getPay_price());
      pstmt.setInt(4, payment.getAmount());
      pstmt.setString(5, payment.getMethod());
      pstmt.setString(6, payment.getPcom());
      pstmt.setString(7, payment.getPaccount());
      pstmt.setInt(8, payment.getDno());
      pstmt.setInt(9, payment.getPay_no());

      cnt = pstmt.executeUpdate();
    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }
    return cnt;
  }
  public int deletePayment(int pay_no){
    conn = db.connect();
    int cnt = 0;

    String sql = "delete from payment where pay_no=?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, pay_no);

      cnt = pstmt.executeUpdate();
    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }
    return cnt;
  }

  //  특정 회원의 결제 내역 가져오기
  public List<Payment> getMemberPaymentList(String id){
    conn = db.connect();
    List<Payment> paymentList = new ArrayList<>();

    String sql = "select * from payment where mem_id=?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);
      rs = pstmt.executeQuery();

      while(rs.next()){
        paymentList.add(new Payment(rs.getInt("pay_no"), rs.getString("mem_id"), rs.getInt("pro_no"), rs.getInt("pay_price"), rs.getInt("amount"), rs.getString("method"), rs.getString("pcom"), rs.getString("paccount"), rs.getInt("dno")));
      }

    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return paymentList;
  }
}
