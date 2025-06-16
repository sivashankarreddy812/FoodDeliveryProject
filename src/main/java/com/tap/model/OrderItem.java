package com.tap.model;

public class OrderItem {

    private int orderitemid;
    private int orderid;
    private int menuid;
    private int quantity;
    private int totalamount;

    public OrderItem() {
    }

    public OrderItem(int orderid, int menuid, int quantity, int totalamount) {
        this.orderid = orderid;
        this.menuid = menuid;
        this.quantity = quantity;
        this.totalamount = totalamount;
    }

    public OrderItem(int orderitemid, int orderid, int menuid, int quantity, int totalamount) {
        this.orderitemid = orderitemid;
        this.orderid = orderid;
        this.menuid = menuid;
        this.quantity = quantity;
        this.totalamount = totalamount;
    }

    public int getOrderitemid() {
        return orderitemid;
    }

    public void setOrderitemid(int orderitemid) {
        this.orderitemid = orderitemid;
    }

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public int getMenuid() {
        return menuid;
    }

    public void setMenuid(int menuid) {
        this.menuid = menuid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getTotalamount() {
        return totalamount;
    }

    public void setTotalamount(int totalamount) {
        this.totalamount = totalamount;
    }

    @Override
    public String toString() {
        return "OrderItem [orderitemid=" + orderitemid + ", orderid=" + orderid + ", menuid=" + menuid +
                ", quantity=" + quantity + ", totalamount=" + totalamount + "]";
    }
}
