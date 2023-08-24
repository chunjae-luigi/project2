package com.gnjBook.model;

import com.gnjBook.db.DBC;
import com.gnjBook.db.MariaDBCon;
import com.gnjBook.dto.Outstock;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class OutstockDAO {
  static DBC db = new MariaDBCon();
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  final static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

  public OutstockDAO() {
  }

  public List<Outstock> getOutstockList(){
    conn = db.connect();
    List<Outstock> outstockList = new ArrayList<>();

    String sql = "select * from outstock";
    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();

      while(rs.next()){
        String regdate = sdf.format(rs.getDate("regdate"));
        outstockList.add(new Outstock(rs.getInt("out_no"), rs.getInt("pro_no"), rs.getInt("amount"), rs.getInt("out_price"), regdate));
      }

    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return outstockList;
  }

  public Outstock getOutstock(int out_no){
    conn = db.connect();
    Outstock outstock = new Outstock();

    String sql = "select * from outstock where out_no=?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, out_no);
      rs = pstmt.executeQuery();

      if(rs.next()){
        String regdate = sdf.format(rs.getDate("regdate"));
        outstock = new Outstock(rs.getInt("out_no"), rs.getInt("pro_no"), rs.getInt("amount"), rs.getInt("out_price"), regdate);
      }

    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return outstock;
  }

  public int addOutstock(Outstock outstock){
    conn = db.connect();
    int cnt = 0;

    String sql = "insert into outstock(pro_no, amount, out_price) values(?, ?, ?)";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, outstock.getPro_no());
      pstmt.setInt(2, outstock.getAmount());
      pstmt.setInt(3, outstock.getOut_price());

      cnt = pstmt.executeUpdate();
    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }
    return cnt;
  }

  public int updateOutstock(Outstock outstock){
    conn = db.connect();
    int cnt = 0;

    String sql = "update outstock set pro_no=?, amount=?, out_price=? where out_no=?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, outstock.getPro_no());
      pstmt.setInt(2, outstock.getAmount());
      pstmt.setInt(3, outstock.getOut_price());
      pstmt.setInt(4, outstock.getOut_no());

      cnt = pstmt.executeUpdate();
    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }
    return cnt;
  }
  public int deleteOutstock(int out_no){
    conn = db.connect();
    int cnt = 0;

    String sql = "delete from outstock where out_no=?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, out_no);

      cnt = pstmt.executeUpdate();
    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }
    return cnt;
  }



}
