package com.gnjBook.dto;

public class Product {
  private int proNo;
  private String categoryId;
  private String procategory;
  private int price = 0;
  private String title;
  private String description;
  private String content;
  private String img;
  private String regdate;
  private String video;


  public Product() {
  }

  public Product(int proNo, String categoryId, String procategory, int price, String title, String description, String content, String img, String regdate, String video) {
    this.proNo = proNo;
    this.categoryId = categoryId;
    this.procategory = procategory;
    this.price = price;
    this.title = title;
    this.description = description;
    this.content = content;
    this.img = img;
    this.regdate = regdate;
    this.video = video;

  }

  public int getProNo() {
    return proNo;
  }

  public void setProNo(int proNo) {
    this.proNo = proNo;
  }

  public String getCategoryId() {
    return categoryId;
  }

  public void setCategoryId(String categoryId) {
    this.categoryId = categoryId;
  }

  public String getProcategory() {
    return procategory;
  }

  public void setProcategory(String procategory) {
    this.procategory = procategory;
  }

  public int getPrice() {
    return price;
  }

  public void setPrice(int price) {
    this.price = price;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
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

  public String getImg() { return img; }

  public void setImg(String img) { this.img = img; }

  public String getVideo() { return video; }

  public void setVideo(String video) {this.video = video; }
}
