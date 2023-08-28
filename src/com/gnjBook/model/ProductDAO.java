package com.gnjBook.model;

import com.gnjBook.db.DBC;
import com.gnjBook.db.MariaDBCon;
import com.gnjBook.dto.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
  static DBC db = new MariaDBCon();
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  final static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

  public ProductDAO() {
  }

  public List<Product> getProductList(){
    conn = db.connect();
    List<Product> productList = new ArrayList<>();

    String sql = "select * from product";
    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();

      while(rs.next()){
        String regdate = sdf.format(rs.getDate("regdate"));
        productList.add(new Product(rs.getInt("proNo"), rs.getString("categoryId"), rs.getString("procategory"), rs.getInt("price"), rs.getString("title"), rs.getString("description"), rs.getString("content"), rs.getString("thumbnail"), regdate));
      }

    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return productList;
  }

  public Product getProduct(int proNo){
    conn = db.connect();
    Product product = new Product();

    String sql = "select * from product where proNo=?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, proNo);
      rs = pstmt.executeQuery();

      if(rs.next()){
        String regdate = sdf.format(rs.getDate("regdate"));
        product = new Product(rs.getInt("proNo"), rs.getString("categoryId"), rs.getString("procategory"), rs.getInt("price"), rs.getString("title"), rs.getString("description"), rs.getString("content"), rs.getString("thumbnail"), regdate);
      }

    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return product;
  }

  public int addProduct(Product product){
    conn = db.connect();
    int cnt = 0;

    String sql = "insert into product(categoryId, price, title, description, content, thumbnail) values(?, ?, ?, ?, ?, ?, )";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, product.getCategoryId());
      pstmt.setInt(2, product.getPrice());
      pstmt.setString(3, product.getTitle());
      pstmt.setString(4, product.getDescription());
      pstmt.setString(5, product.getContent());
      pstmt.setString(6, product.getThumbnail());

      cnt = pstmt.executeUpdate();
    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }
    return cnt;
  }

  public int updateProduct(Product product){
    conn = db.connect();
    int cnt = 0;

    String sql = "update product set categoryId=?, price=?, title=?, description=?, content=?, thumbnail=? where proNo=?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, product.getCategoryId());
      pstmt.setInt(2, product.getPrice());
      pstmt.setString(3, product.getTitle());
      pstmt.setString(4, product.getDescription());
      pstmt.setString(5, product.getContent());
      pstmt.setString(6, product.getThumbnail());
      pstmt.setInt(7, product.getProNo());

      cnt = pstmt.executeUpdate();
    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }
    return cnt;
  }
  public int deleteProduct(int proNo){
    conn = db.connect();
    int cnt = 0;

    String sql = "delete from product where proNo=?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, proNo);

      cnt = pstmt.executeUpdate();
    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }
    return cnt;
  }

  public List<Product> getCategoryProduct(String categoryId){
      conn = db.connect();
      List<Product> productList = new ArrayList<>();

      String sql = "select * from product where categoryId=?";
      try {
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, categoryId);
        rs = pstmt.executeQuery();

        while(rs.next()){
          String regdate = sdf.format(rs.getDate("regdate"));

          productList.add(new Product(rs.getInt("proNo"), rs.getString("categoryId"), rs.getString("procategory"), rs.getInt("price"), rs.getString("title"), rs.getString("description"), rs.getString("content"), rs.getString("thumbnail"), regdate));
        }

      } catch (Exception e) {
        throw new RuntimeException(e);
      } finally{
        db.close(rs, pstmt, conn);
      }

      return productList;
    }
}
