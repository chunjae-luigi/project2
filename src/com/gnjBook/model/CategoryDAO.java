package com.gnjBook.model;

import com.gnjBook.db.DBC;
import com.gnjBook.db.MariaDBCon;
import com.gnjBook.dto.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {
  static DBC db = new MariaDBCon();
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  public CategoryDAO() {
  }

  public List<Category> getCategoryList(){
    conn = db.connect();
    List<Category> categoryList = new ArrayList<>();

    String sql = "select * from category";
    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();

      while(rs.next()){
        categoryList.add(new Category(rs.getString("category_id"), rs.getString("category_name")));
      }

    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return categoryList;
  }

  public Category getCategory(String id){
    conn = db.connect();
    Category category = new Category();

    String sql = "select * from category where category_id=?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);
      rs = pstmt.executeQuery();

      if(rs.next()){
        category = new Category(rs.getString("category_id"), rs.getString("category_name"));
      }

    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return category;
  }

  public int addCategory(String id, String name){
    conn = db.connect();
    int cnt = 0;

    String sql = "insert into category(category_id, category_name) values(?, ?)";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);
      pstmt.setString(2, name);
      cnt = pstmt.executeUpdate();
    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }
    return cnt;
  }

  public int updateCategory(Category category){
    conn = db.connect();
    int cnt = 0;

    String sql = "update category set category_name=? where category_id=?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, category.getCategory_name());
      pstmt.setString(2, category.getCategory_id());
      cnt = pstmt.executeUpdate();
    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }
    return cnt;
  }
  public int deleteCategory(String id){
    conn = db.connect();
    int cnt = 0;

    String sql = "delete from category where category_id=?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);
      cnt = pstmt.executeUpdate();
    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }
    return cnt;
  }
}
