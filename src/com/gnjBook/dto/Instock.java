package com.gnjBook.dto;

public class Instock {
  private int in_no;
  private int pro_no;
  private int amount = 0;
  private int in_price = 0;
  private String regdate;

  public Instock() {
  }

  public Instock(int in_no, int pro_no, int amount, int in_price, String regdate) {
    this.in_no = in_no;
    this.pro_no = pro_no;
    this.amount = amount;
    this.in_price = in_price;
    this.regdate = regdate;
  }

  public int getIn_no() {
    return in_no;
  }

  public void setIn_no(int in_no) {
    this.in_no = in_no;
  }

  public int getPro_no() {
    return pro_no;
  }

  public void setPro_no(int pro_no) {
    this.pro_no = pro_no;
  }

  public int getAmount() {
    return amount;
  }

  public void setAmount(int amount) {
    this.amount = amount;
  }

  public int getIn_price() {
    return in_price;
  }

  public void setIn_price(int in_price) {
    this.in_price = in_price;
  }

  public String getRegdate() {
    return regdate;
  }

  public void setRegdate(String regdate) {
    this.regdate = regdate;
  }
}
