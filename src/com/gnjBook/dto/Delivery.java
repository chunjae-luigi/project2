package com.gnjBook.dto;

public class Delivery {
  private int dno;
  private int pay_no;
  private String mem_id;
  private String daddress;
  private String mem_tel;
  private String dcom;
  private String dtel;
  private int state = 0;
  private String etd;
  private String eta;
  private String dcode;

  public Delivery() {
  }

  public Delivery(int dno, int pay_no, String mem_id, String daddress, String mem_tel, String dcom, String dtel, int state, String etd, String eta, String dcode) {
    this.dno = dno;
    this.pay_no = pay_no;
    this.mem_id = mem_id;
    this.daddress = daddress;
    this.mem_tel = mem_tel;
    this.dcom = dcom;
    this.dtel = dtel;
    this.state = state;
    this.etd = etd;
    this.eta = eta;
    this.dcode = dcode;
  }

  public int getDno() {
    return dno;
  }

  public void setDno(int dno) {
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

  public String getDaddress() {
    return daddress;
  }

  public void setDaddress(String daddress) {
    this.daddress = daddress;
  }

  public String getMem_tel() {
    return mem_tel;
  }

  public void setMem_tel(String mem_tel) {
    this.mem_tel = mem_tel;
  }

  public String getDcom() {
    return dcom;
  }

  public void setDcom(String dcom) {
    this.dcom = dcom;
  }

  public String getDtel() {
    return dtel;
  }

  public void setDtel(String dtel) {
    this.dtel = dtel;
  }

  public int getState() {
    return state;
  }

  public void setState(int state) {
    this.state = state;
  }

  public String getEtd() {
    return etd;
  }

  public void setEtd(String etd) {
    this.etd = etd;
  }

  public String getEta() {
    return eta;
  }

  public void setEta(String eta) {
    this.eta = eta;
  }

  public String getDcode() {
    return dcode;
  }

  public void setDcode(String dcode) {
    this.dcode = dcode;
  }
}
