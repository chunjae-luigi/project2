package com.gnjBook.dto;

public class Product {
  private int proNo;
  private String categoryId;
  private String procategory;
  private int price = 0;
  private String title;
  private String description;
  private String content;
  private String thumbnail;
  private String img = "no_img.jpg";
  private String video = "no_video.mp4";
  private String regdate;

  public Product() {
  }

  public Product(int proNo, String categoryId, String procategory, int price, String title, String description, String content, String thumbnail, String img, String video, String regdate) {
    this.proNo = proNo;
    this.categoryId = categoryId;
    this.procategory = procategory;
    this.price = price;
    this.title = title;
    this.description = description;
    this.content = content;
    this.thumbnail = thumbnail;
    this.img = img;
    this.video = video;
    this.regdate = regdate;
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

  public String getThumbnail() {
    return thumbnail;
  }

  public void setThumbnail(String thumbnail) {
    this.thumbnail = thumbnail;
  }

  public String getImg() {
    return img;
  }

  public void setImg(String img) {
    this.img = img;
  }

  public String getVideo() {
    return video;
  }

  public void setVideo(String video) {
    this.video = video;
  }

  public String getRegdate() {
    return regdate;
  }

  public void setRegdate(String regdate) {
    this.regdate = regdate;
  }
}
