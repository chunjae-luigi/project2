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
        productList.add(new Product(rs.getInt("pro_no"), rs.getString("category_id"), rs.getInt("price"), rs.getString("title"), rs.getString("description"), rs.getString("content"), rs.getString("thumbnail"), rs.getString("img"), rs.getString("video"), regdate));
      }

    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return productList;
  }

  public Product getProduct(int pro_no){
    conn = db.connect();
    Product product = new Product();

    String sql = "select * from product where pro_no=?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, pro_no);
      rs = pstmt.executeQuery();

      if(rs.next()){
        String regdate = sdf.format(rs.getDate("regdate"));
        product = new Product(rs.getInt("pro_no"), rs.getString("category_id"), rs.getInt("price"), rs.getString("title"), rs.getString("description"), rs.getString("content"), rs.getString("thumbnail"), rs.getString("img"), rs.getString("video"), regdate);
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

    String sql = "insert into product(category_id, price, title, description, content, thumbnail, img, video) values(?, ?, ?, ?, ?, ?, ?, ?)";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, product.getCategory_id());
      pstmt.setInt(2, product.getPrice());
      pstmt.setString(3, product.getTitle());
      pstmt.setString(4, product.getDescription());
      pstmt.setString(5, product.getContent());
      pstmt.setString(6, product.getThumbnail());
      pstmt.setString(7, product.getImg());
      pstmt.setString(8, product.getVideo());

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

    String sql = "update product set category_id=?, price=?, title=?, description=?, content=?, thumbnail=?, img=?, video=? where pro_no=?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, product.getCategory_id());
      pstmt.setInt(2, product.getPrice());
      pstmt.setString(3, product.getTitle());
      pstmt.setString(4, product.getDescription());
      pstmt.setString(5, product.getContent());
      pstmt.setString(6, product.getThumbnail());
      pstmt.setString(7, product.getImg());
      pstmt.setString(8, product.getVideo());
      pstmt.setInt(9, product.getPro_no());

      cnt = pstmt.executeUpdate();
    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }
    return cnt;
  }
  public int deleteProduct(int pro_no){
    conn = db.connect();
    int cnt = 0;

    String sql = "delete from product where pro_no=?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, pro_no);

      cnt = pstmt.executeUpdate();
    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }
    return cnt;
  }

  public List<Product> getCategoryProduct(String category_id){
      conn = db.connect();
      List<Product> productList = new ArrayList<>();

      String sql = "select * from product where category_id=?";
      try {
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, category_id);
        rs = pstmt.executeQuery();

        while(rs.next()){
          String regdate = sdf.format(rs.getDate("regdate"));
          productList.add(new Product(rs.getInt("pro_no"), rs.getString("category_id"), rs.getInt("price"), rs.getString("title"), rs.getString("description"), rs.getString("content"), rs.getString("thumbnail"), rs.getString("img"), rs.getString("video"), regdate));
        }

      } catch (Exception e) {
        throw new RuntimeException(e);
      } finally{
        db.close(rs, pstmt, conn);
      }

      return productList;
    }
}
