package com.gnjBook.dto;

public class Payment {
  private int pay_no;
  private String mem_id;
  private int pro_no;
  private int pay_price;
  private int amount = 1;
  private String method;
  private String pcom;
  private String paccount;
  private int dno;

  public Payment() {
  }

  public Payment(int pay_no, String mem_id, int pro_no, int pay_price, int amount, String method, String pcom, String paccount, int dno) {
    this.pay_no = pay_no;
    this.mem_id = mem_id;
    this.pro_no = pro_no;
    this.pay_price = pay_price;
    this.amount = amount;
    this.method = method;
    this.pcom = pcom;
    this.paccount = paccount;
    this.dno = dno;
  }

  public int getPay_no() {
    return pay_no;
  }

  public void setPay_no(int pay_no) {
    this.pay_no = pay_no;
  }

  public String getMem_id() {
    return mem_id;
  }

  public void setMem_id(String mem_id) {
    this.mem_id = mem_id;
  }

  public int getPro_no() {
    return pro_no;
  }

  public void setPro_no(int pro_no) {
    this.pro_no = pro_no;
  }

  public int getPay_price() {
    return pay_price;
  }

  public void setPay_price(int pay_price) {
    this.pay_price = pay_price;
  }

  public int getAmount() {
    return amount;
  }

  public void setAmount(int amount) {
    this.amount = amount;
  }

  public String getMethod() {
    return method;
  }

  public void setMethod(String method) {
    this.method = method;
  }

  public String getPcom() {
    return pcom;
  }

  public void setPcom(String pcom) {
    this.pcom = pcom;
  }

  public String getPaccount() {
    return paccount;
  }

  public void setPaccount(String paccount) {
    this.paccount = paccount;
  }

  public int getDno() {
    return dno;
  }

  public void setDno(int dno) {
    this.dno = dno;
  }
}
