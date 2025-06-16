package com.tap.model;

public class Menu {

    private int menuid;
    private int restaurantid;
    private String itemname;
    private String description;
    private int price;
    private String isavailable;
    private float ratings;
    private String imagepath;

    public Menu() {
    }

    public Menu(int restaurantid, String itemname, String description, int price, String isavailable, float ratings, String imagepath) {
        this.restaurantid = restaurantid;
        this.itemname = itemname;
        this.description = description;
        this.price = price;
        this.isavailable = isavailable;
        this.ratings = ratings;
        this.imagepath = imagepath;
    }

    public Menu(int menuid, int restaurantid, String itemname, String description, int price, String isavailable, float ratings, String imagepath) {
        this.menuid = menuid;
        this.restaurantid = restaurantid;
        this.itemname = itemname;
        this.description = description;
        this.price = price;
        this.isavailable = isavailable;
        this.ratings = ratings;
        this.imagepath = imagepath;
    }

    public int getMenuid() {
        return menuid;
    }

    public void setMenuid(int menuid) {
        this.menuid = menuid;
    }

    public int getRestaurantid() {
        return restaurantid;
    }

    public void setRestaurantid(int restaurantid) {
        this.restaurantid = restaurantid;
    }

    public String getItemname() {
        return itemname;
    }

    public void setItemname(String itemname) {
        this.itemname = itemname;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getIsavailable() {
        return isavailable;
    }

    public void setIsavailable(String isavailable) {
        this.isavailable = isavailable;
    }

    public float getRatings() {
        return ratings;
    }

    public void setRatings(float ratings) {
        this.ratings = ratings;
    }

    public String getImagepath() {
        return imagepath;
    }

    public void setImagepath(String imagepath) {
        this.imagepath = imagepath;
    }

    @Override
    public String toString() {
        return "Menu [menuid=" + menuid + ", itemname=" + itemname + ", price=" + price + ", ratings=" + ratings + "]";
    }
}
