package com.gnjBook.vo;

public class InstockVO {

    private int inNo;
    private int proNo;
    private String pname;
    private int amount = 0;
    private int inPrice = 0;
    private String regdate;

    public int getInNo() {
        return inNo;
    }

    public void setInNo(int inNo) {
        this.inNo = inNo;
    }

    public int getProNo() {
        return proNo;
    }

    public void setProNo(int proNo) {
        this.proNo = proNo;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getInPrice() {
        return inPrice;
    }

    public void setInPrice(int inPrice) {
        this.inPrice = inPrice;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }

    @Override
    public String toString() {
        return "InstockVO{" +
                "inNo=" + inNo +
                ", proNo=" + proNo +
                ", pname='" + pname + '\'' +
                ", amount=" + amount +
                ", inPrice=" + inPrice +
                ", regdate='" + regdate + '\'' +
                '}';
    }

}