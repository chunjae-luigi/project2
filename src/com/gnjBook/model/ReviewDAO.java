package com.gnjBook.model;

import com.gnjBook.db.DBC;
import com.gnjBook.db.MariaDBCon;
import com.gnjBook.dto.Review;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {
  static DBC db = new MariaDBCon();
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  String key = "%02x";
  final static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

  public ReviewDAO() {
  }

  public List<Review> getReviewList(){
    conn = db.connect();
    List<Review> reviewList = new ArrayList<>();
    String sql = "select * from review";

    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();

      while(rs.next()){
        String regdate = sdf.format(rs.getDate("regdate"));

        reviewList.add(new Review(rs.getInt("rno"), rs.getString("mem_id"), rs.getInt("pay_no"), rs.getInt("star"), rs.getString("content"), regdate, rs.getInt("pro_no")));
      }

    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return reviewList;
  }

  public Review getReview(int rno){
    conn = db.connect();
    Review review = new Review();

    String sql = "select * from review where rno = ?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, rno);

      rs = pstmt.executeQuery();

      if(rs.next()){
        String regdate = sdf.format(rs.getDate("regdate"));

        review = new Review(rs.getInt("rno"), rs.getString("mem_id"), rs.getInt("pay_no"), rs.getInt("star"), rs.getString("content"), regdate, rs.getInt("pro_no"));
      }

    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return review;
  }

  public int addReview(Review review){
    int cnt = 0;

    conn = db.connect();

    String sql = "insert into review(mem_id, pay_no, star, content, pro_no) values (?, ?, ?, ?, ?)";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, review.getMem_id());
      pstmt.setInt(2, review.getPay_no());
      pstmt.setInt(3, review.getStar());
      pstmt.setString(4, review.getContent());
      pstmt.setInt(5, review.getPro_no());

      cnt = pstmt.executeUpdate();

    } catch (Exception e) {
      throw new RuntimeException(e);
    }

    db.close(rs, pstmt, conn);

    return cnt;
  }

  public int updateReview(Review review){
    int cnt = 0;

    conn = db.connect();
    String sql = "update review set mem_id=?, pay_no=?, star=?, content=?, pro_no=? where rno=?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, review.getMem_id());
      pstmt.setInt(2, review.getPay_no());
      pstmt.setInt(3, review.getStar());
      pstmt.setString(4, review.getContent());
      pstmt.setInt(5, review.getPro_no());
      pstmt.setInt(6, review.getRno());

      cnt = pstmt.executeUpdate();

    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return cnt;
  }

  public int deleteReview(int rno){
    int cnt = 0;

    conn = db.connect();

    String sql = "delete from review where rno=?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, rno);

      cnt = pstmt.executeUpdate();

    } catch (SQLException e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return cnt;
  }
}
