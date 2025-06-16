package com.tap.model;

import java.sql.Timestamp;

public class Order {

    private int orderid;
    private int restaurantid;
    private int userid;
    private Timestamp orderdate;
    private int totalamount;
    private String status;
    private String paymentmode;

    public Order() {
    }

    public Order(int restaurantid, int userid, int totalamount, String status, String paymentmode) {
        this.restaurantid = restaurantid;
        this.userid = userid;
        this.totalamount = totalamount;
        this.status = status;
        this.paymentmode = paymentmode;
    }

    public Order(int orderid, int restaurantid, int userid, Timestamp orderdate, int totalamount, String status, String paymentmode) {
        this.orderid = orderid;
        this.restaurantid = restaurantid;
        this.userid = userid;
        this.orderdate = orderdate;
        this.totalamount = totalamount;
        this.status = status;
        this.paymentmode = paymentmode;
    }

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public int getRestaurantid() {
        return restaurantid;
    }

    public void setRestaurantid(int restaurantid) {
        this.restaurantid = restaurantid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public Timestamp getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(Timestamp orderdate) {
        this.orderdate = orderdate;
    }

    public int getTotalamount() {
        return totalamount;
    }

    public void setTotalamount(int totalamount) {
        this.totalamount = totalamount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPaymentmode() {
        return paymentmode;
    }

    public void setPaymentmode(String paymentmode) {
        this.paymentmode = paymentmode;
    }

    @Override
    public String toString() {
        return "Order [orderid=" + orderid + ", userid=" + userid + ", restaurantid=" + restaurantid + 
               ", totalamount=" + totalamount + ", status=" + status + ", paymentmode=" + paymentmode + "]";
    }
}
