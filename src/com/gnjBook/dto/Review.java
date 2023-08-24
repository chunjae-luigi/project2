package com.gnjBook.dto;

public class Review {
  private int rno;
  private String mem_id;
  private int pay_no;
  private int star = 5;
  private String content;
  private String regdate;
  private int pro_no;

  public Review() {
  }

  public Review(int rno, String mem_id, int pay_no, int star, String content, String regdate, int pro_no) {
    this.rno = rno;
    this.mem_id = mem_id;
    this.pay_no = pay_no;
    this.star = star;
    this.content = content;
    this.regdate = regdate;
    this.pro_no = pro_no;
  }

  public int getRno() {
    return rno;
  }

  public void setRno(int rno) {
    this.rno = rno;
  }

  public String getMem_id() {
    return mem_id;
  }

  public void setMem_id(String mem_id) {
    this.mem_id = mem_id;
  }

  public int getPay_no() {
    return pay_no;
  }

  public void setPay_no(int pay_no) {
    this.pay_no = pay_no;
  }

  public int getStar() {
    return star;
  }

  public void setStar(int star) {
    this.star = star;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String getRegdate() {
    return regdate;
  }

  public void setRegdate(String regdate) {
    this.regdate = regdate;
  }

  public int getPro_no() {
    return pro_no;
  }

  public void setPro_no(int pro_no) {
    this.pro_no = pro_no;
  }
}
