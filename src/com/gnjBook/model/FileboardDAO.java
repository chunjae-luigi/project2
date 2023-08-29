package com.gnjBook.model;

import com.gnjBook.db.DBC;
import com.gnjBook.db.MariaDBCon;
import com.gnjBook.dto.Fileboard;
import com.gnjBook.dto.Notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class FileboardDAO {
  static DBC db = new MariaDBCon();
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  final static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

  public FileboardDAO() {
  }

  public int fileboardUpload(Fileboard file){
    int cnt = 0;
    conn = db.connect();
    String sql = "insert into fileboard values (?,?,?,?,?)";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(2, file.getTitle());
      pstmt.setString(3, file.getContent());
      pstmt.setString(4, file.getFilename1());
      pstmt.setString(5, file.getFilename2());
      pstmt.setString(6, file.getFilename3());
      cnt = pstmt.executeUpdate();
    } catch (SQLException e) {
      throw new RuntimeException(e);
    } finally {
      db.close(rs, pstmt, conn);
    }
    return cnt;
  }

  public List<Fileboard> getFileboardList(){
    List<Fileboard> fileList = new ArrayList<>();
    conn = db.connect();
    String sql = "select * from fileboard order by regdate desc";
    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while(rs.next()){
        Fileboard file = new Fileboard();
        file.setTitle(rs.getString("title"));
        file.setContent(rs.getString("content"));
        file.setFilename1(rs.getString("filename1"));
        file.setFilename2(rs.getString("filename2"));
        file.setFilename3(rs.getString("filename3"));
        fileList.add(file);
      }
    } catch (SQLException e) {
      throw new RuntimeException(e);
    } finally {
      db.close(rs, pstmt, conn);
    }
    return fileList;
  }

  public int addFileboard(Fileboard fileboard){
    int cnt = 0;

    conn = db.connect();
    String sql = "insert into fileboard(title, content) values(?, ?)";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, fileboard.getTitle());
      pstmt.setString(2, fileboard.getContent());
      cnt = pstmt.executeUpdate();

    } catch (SQLException e) {
      throw new RuntimeException(e);
    }

    db.close(rs, pstmt, conn);

    return cnt;
  }

  public int updateFileboard(Fileboard fileboard){
    int cnt = 0;

    conn = db.connect();
    String sql = "update fileboard set title=?, content=? where no=?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, fileboard.getTitle());
      pstmt.setString(2, fileboard.getContent());
      pstmt.setInt(3, fileboard.getNo());
      cnt = pstmt.executeUpdate();

    } catch (SQLException e) {
      throw new RuntimeException(e);
    }

    db.close(rs, pstmt, conn);

    return cnt;
  }

  public int deleteNotice(int no){
    int cnt = 0;

    conn = db.connect();
    String sql = "delete from notice where no=?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, no);
      cnt = pstmt.executeUpdate();

    } catch (SQLException e) {
      throw new RuntimeException(e);
    }

    db.close(rs, pstmt, conn);

    return cnt;
  }

  public int countUp(int no){
    int cnt = 0;
    conn = db.connect();
    Fileboard fileboard = new Fileboard();

    String sql = "update fileboard set visited = visited+1 where no=?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, no);
      cnt = pstmt.executeUpdate();
    } catch (SQLException e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return cnt;
  }
}
