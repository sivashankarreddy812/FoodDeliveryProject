package com.tap.model;

public class CartItem {

    private int itemId;
    private int restaurantId;
    private String name;
    private int quantity;
    private double price;
    private double totalprice;

    public CartItem() {
    }

    public CartItem(int itemId, int restaurantId, String name, int quantity, double price, double totalprice) {
        this.itemId = itemId;
        this.restaurantId = restaurantId;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.totalprice = totalprice;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(double totalprice) {
        this.totalprice = totalprice;
    }

    @Override
    public String toString() {
        return "CartItem [itemId=" + itemId + ", name=" + name + ", quantity=" + quantity + ", price=" + price + ", totalprice=" + totalprice + "]";
    }
}
