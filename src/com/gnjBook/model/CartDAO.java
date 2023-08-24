package com.gnjBook.model;

import com.gnjBook.db.DBC;
import com.gnjBook.db.MariaDBCon;
import com.gnjBook.dto.Cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {
  static DBC db = new MariaDBCon();
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  public CartDAO() {
  }

  public List<Cart> getCartList(){
    conn = db.connect();
    List<Cart> cartList = new ArrayList<>();

    String sql = "select * from cart";
    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();

      while(rs.next()){
        cartList.add(new Cart(rs.getInt("cart_no"), rs.getString("mem_id"), rs.getInt("pro_no"), rs.getInt("amount")));
      }

    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return cartList;
  }

  public Cart getCart(int cart_no){
    conn = db.connect();
    Cart cart = new Cart();

    String sql = "select * from cart where cart_no=?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, cart_no);
      rs = pstmt.executeQuery();

      if(rs.next()){
        cart = new Cart(rs.getInt("cart_no"), rs.getString("mem_id"), rs.getInt("pro_no"), rs.getInt("amount"));
      }

    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return cart;
  }

  public int addCart(Cart cart){
    conn = db.connect();
    int cnt = 0;

    String sql = "insert into cart(mem_id, pro_no, amount) values(?, ?, ?)";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, cart.getMem_id());
      pstmt.setInt(2, cart.getPro_no());
      pstmt.setInt(3, cart.getAmount());

      cnt = pstmt.executeUpdate();
    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }
    return cnt;
  }

  public int updateCart(Cart cart){
    conn = db.connect();
    int cnt = 0;

    String sql = "update cart set mem_id=?, pro_no=?, amount=? where cart_no=?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, cart.getMem_id());
      pstmt.setInt(2, cart.getPro_no());
      pstmt.setInt(3, cart.getAmount());
      pstmt.setInt(4, cart.getCart_no());

      cnt = pstmt.executeUpdate();
    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }
    return cnt;
  }
  public int deleteCart(int cart_no){
    conn = db.connect();
    int cnt = 0;

    String sql = "delete from cart where cart_no=?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, cart_no);

      cnt = pstmt.executeUpdate();
    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }
    return cnt;
  }

  // 특정 회원의 장바구니 목록 가져오기
  public List<Cart> getMemberCartList(String mem_id){
    conn = db.connect();
    List<Cart> cartList = new ArrayList<>();

    String sql = "select * from cart where mem_id=?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, mem_id);

      rs = pstmt.executeQuery();

      while(rs.next()){
        cartList.add(new Cart(rs.getInt("cart_no"), rs.getString("mem_id"), rs.getInt("pro_no"), rs.getInt("amount")));
      }

    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return cartList;
  }
}
