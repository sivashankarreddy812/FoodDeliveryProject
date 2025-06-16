package com.tap.model;

import java.util.HashMap;

public class Cart {

    private HashMap<Integer, CartItem> items;

    public Cart() {
        this.items = new HashMap<>();
    }

    public HashMap<Integer, CartItem> getItems() {
        return items;
    }

    public void setItems(HashMap<Integer, CartItem> items) {
        this.items = items;
    }

    public double getGrandTotal() {
        double total = 0;
        for (CartItem item : items.values()) {
            total += item.getTotalprice();
        }
        return total;
    }

    public void addItemToCart(CartItem item) {
        int itemId = item.getItemId();

        if (items.containsKey(itemId)) {
            CartItem existingItem = items.get(itemId);
            int newQuantity = existingItem.getQuantity() + item.getQuantity();
            existingItem.setQuantity(newQuantity);
            existingItem.setTotalprice(newQuantity * existingItem.getPrice());
        } else {
            item.setTotalprice(item.getPrice() * item.getQuantity());
            items.put(itemId, item);
        }
    }

    public void updateItem(int itemId, int quantity) {
        if (items.containsKey(itemId)) {
            if (quantity <= 0) {
                items.remove(itemId);
            } else {
                CartItem existingItem = items.get(itemId);
                existingItem.setQuantity(quantity);
                existingItem.setTotalprice(existingItem.getPrice() * quantity);
            }
        }
    }

    public void removeItem(int itemId) {
        items.remove(itemId);
    }

    @Override
    public String toString() {
        return "Cart [items=" + items + ", grandTotal=" + getGrandTotal() + "]";
    }
}
