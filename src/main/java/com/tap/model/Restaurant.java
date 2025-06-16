package com.tap.model;

import java.sql.Timestamp;

public class Restaurant {

    private int restaurantid;
    private String name;
    private String address;
    private String phonenumber;
    private String cusinetype;
    private String deliverytime;
    private int admineuserid;
    private String rating;
    private String isactive;
    private String imagepath;
    private Timestamp createddate;
    private Timestamp lastlogindate;

    public Restaurant() {
    }

    public Restaurant(String name, String address, String phonenumber, String cusinetype, String deliverytime,
                      int admineuserid, String rating, String isactive, String imagepath) {
        this.name = name;
        this.address = address;
        this.phonenumber = phonenumber;
        this.cusinetype = cusinetype;
        this.deliverytime = deliverytime;
        this.admineuserid = admineuserid;
        this.rating = rating;
        this.isactive = isactive;
        this.imagepath = imagepath;
    }

    public Restaurant(int restaurantid, String name, String address, String phonenumber, String cusinetype,
                      String deliverytime, int admineuserid, String rating, String isactive, String imagepath,
                      Timestamp createddate, Timestamp lastlogindate) {
        this.restaurantid = restaurantid;
        this.name = name;
        this.address = address;
        this.phonenumber = phonenumber;
        this.cusinetype = cusinetype;
        this.deliverytime = deliverytime;
        this.admineuserid = admineuserid;
        this.rating = rating;
        this.isactive = isactive;
        this.imagepath = imagepath;
        this.createddate = createddate;
        this.lastlogindate = lastlogindate;
    }

    public int getRestaurantid() {
        return restaurantid;
    }

    public void setRestaurantid(int restaurantid) {
        this.restaurantid = restaurantid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getCusinetype() {
        return cusinetype;
    }

    public void setCusinetype(String cusinetype) {
        this.cusinetype = cusinetype;
    }

    public String getDeliverytime() {
        return deliverytime;
    }

    public void setDeliverytime(String deliverytime) {
        this.deliverytime = deliverytime;
    }

    public int getAdmineuserid() {
        return admineuserid;
    }

    public void setAdmineuserid(int admineuserid) {
        this.admineuserid = admineuserid;
    }

    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    public String getIsactive() {
        return isactive;
    }

    public void setIsactive(String isactive) {
        this.isactive = isactive;
    }

    public String getImagepath() {
        return imagepath;
    }

    public void setImagepath(String imagepath) {
        this.imagepath = imagepath;
    }

    public Timestamp getCreateddate() {
        return createddate;
    }

    public void setCreateddate(Timestamp createddate) {
        this.createddate = createddate;
    }

    public Timestamp getLastlogindate() {
        return lastlogindate;
    }

    public void setLastlogindate(Timestamp lastlogindate) {
        this.lastlogindate = lastlogindate;
    }

    @Override
    public String toString() {
        return "Restaurant [name=" + name + ", cusinetype=" + cusinetype + ", deliverytime=" + deliverytime +
               ", rating=" + rating + "]";
    }
}
