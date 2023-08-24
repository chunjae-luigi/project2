package com.gnjBook.dto;

public class Product {
  private int pro_no;
  private String category_id;
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

  public Product(int pro_no, String category_id, int price, String title, String description, String content, String thumbnail, String img, String video, String regdate) {
    this.pro_no = pro_no;
    this.category_id = category_id;
    this.price = price;
    this.title = title;
    this.description = description;
    this.content = content;
    this.thumbnail = thumbnail;
    this.img = img;
    this.video = video;
    this.regdate = regdate;
    this.setProcategory();
  }

  public int getPro_no() {
    return pro_no;
  }

  public void setPro_no(int pro_no) {
    this.pro_no = pro_no;
  }

  public String getCategory_id() {
    return category_id;
  }

  public void setCategory_id(String category_id) {
    this.category_id = category_id;
    this.setProcategory();
  }

  public String getProcategory() {
    return procategory;
  }

  public void setProcategory() {
    if(this.category_id!=null && this.pro_no!=0){
        this.procategory = this.category_id + "_" + this.pro_no;
    }
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
