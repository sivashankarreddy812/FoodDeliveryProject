package com.tap.dao;

import java.util.List;
import com.tap.model.OrderItem;

public interface OrderItemDAO {
    void addOrderItem(OrderItem orderItem);
    void updateOrderItem(OrderItem orderItem);
    void deleteOrderItem(int orderItemId);
    OrderItem getOrderItemById(int orderItemId);
    
    List<OrderItem> getAllOrderItems();
}
