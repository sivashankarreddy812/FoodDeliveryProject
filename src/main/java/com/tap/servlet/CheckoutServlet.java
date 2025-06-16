package com.tap.servlet;

import java.io.IOException;
import java.sql.Timestamp;

import com.tap.model.*;
import com.tap.dao.*;
import com.tap.daoimpl.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
	
    private OrderDAO odao;

    @Override
    public void init() throws ServletException {
        odao = new OrderDAOImpl();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        User user = (User) session.getAttribute("user");

        if (cart != null && user != null && !cart.getItems().isEmpty()) {
            String paymentmode = req.getParameter("payment");
            String address = (String) session.getAttribute("userAddress");

            // Create and populate Order object
            Order order = new Order();
            order.setUserid(user.getUserid());
            order.setRestaurantid((int) session.getAttribute("restaurantId"));
            order.setOrderdate(new Timestamp(System.currentTimeMillis()));
            order.setPaymentmode(paymentmode);
            order.setStatus("Confirmed");
            order.setTotalamount((int) cart.getGrandTotal());

            // Add order and retrieve generated order ID
            int orderid = odao.addOrder(order);

            // Insert each cart item as an order item
            OrderItemDAO orderItemDAO = new OrderItemDAOImpl();

            for (CartItem item : cart.getItems().values()) {
                int menuid = item.getItemId();  // Map itemId to menuid
                int quantity = item.getQuantity();
                int totalprice = (int) item.getTotalprice();

                OrderItem orderitem = new OrderItem(orderid, menuid, quantity, totalprice);
                orderItemDAO.addOrderItem(orderitem);

                System.out.println("Inserted OrderItem ➝ OrderID: " + orderid + ", MenuID: " + menuid + ", Qty: " + quantity);
            }

            session.removeAttribute("cart");
            session.setAttribute("order", order);

            resp.sendRedirect("order_conformation.jsp");
        } else {
            resp.sendRedirect("cart.jsp");
        }
    }
}
