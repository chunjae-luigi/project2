package com.gnjBook.dto;

public class Outstock {
  private int out_no;
  private int pro_no;
  private int amount = 0;
  private int out_price = 0;
  private String regdate;

  public Outstock() {
  }

  public Outstock(int out_no, int pro_no, int amount, int out_price, String regdate) {
    this.out_no = out_no;
    this.pro_no = pro_no;
    this.amount = amount;
    this.out_price = out_price;
    this.regdate = regdate;
  }

  public int getOut_no() {
    return out_no;
  }

  public void setOut_no(int out_no) {
    this.out_no = out_no;
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

  public int getOut_price() {
    return out_price;
  }

  public void setOut_price(int out_price) {
    this.out_price = out_price;
  }

  public String getRegdate() {
    return regdate;
  }

  public void setRegdate(String regdate) {
    this.regdate = regdate;
  }
}
