package com.gnjBook.dto;

public class Cart {
  private int cart_no;
  private String mem_id;
  private int pro_no;
  private int amount;

  public Cart() {
  }

  public Cart(int cart_no, String mem_id, int pro_no, int amount) {
    this.cart_no = cart_no;
    this.mem_id = mem_id;
    this.pro_no = pro_no;
    this.amount = amount;
  }

  public int getCart_no() {
    return cart_no;
  }

  public void setCart_no(int cart_no) {
    this.cart_no = cart_no;
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

  public int getAmount() {
    return amount;
  }

  public void setAmount(int amount) {
    this.amount = amount;
  }
}
