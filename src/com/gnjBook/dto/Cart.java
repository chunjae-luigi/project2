package com.gnjBook.dto;

public class Cart {
  private int cartNo;
  private String memId;
  private int proNo;
  private int amount;

  public Cart() {
  }

  public Cart(int cartNo, String memId, int proNo, int amount) {
    this.cartNo = cartNo;
    this.memId = memId;
    this.proNo = proNo;
    this.amount = amount;
  }

  public int getCartNo() {
    return cartNo;
  }

  public void setCartNo(int cartNo) {
    this.cartNo = cartNo;
  }

  public String getMemId() {
    return memId;
  }

  public void setMemId(String memId) {
    this.memId = memId;
  }

  public int getProNo() {
    return proNo;
  }

  public void setProNo(int proNo) {
    this.proNo = proNo;
  }

  public int getAmount() {
    return amount;
  }

  public void setAmount(int amount) {
    this.amount = amount;
  }
}
