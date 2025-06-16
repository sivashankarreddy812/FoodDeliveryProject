<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tap.model.Cart, com.tap.model.CartItem" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Cart - EpicEats</title>
  <link type="image/png" rel="icon" href="images/food app header logo.png">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style type="text/css">
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Inter', sans-serif;
    }

    body {
      background-color: #f8f8f8;
      color: #1c1c1c;
      min-height: 100vh;
      padding: 2rem 1rem;
    }

    .page-title {
      text-align: center;
      font-size: 24px;
      font-weight: 600;
      color: #1c1c1c;
      margin-bottom: 1.5rem;
      letter-spacing: -0.5px;
    }

    .cart-container {
      max-width: 800px;
      margin: 0 auto;
      background: #fff;
      padding: 1.5rem;
      border-radius: 12px;
      box-shadow: 0 1px 2px rgba(0, 0, 0, 0.08);
    }

    .cart-row {
      display: grid;
      grid-template-columns: 1fr auto;
      gap: 1.5rem;
      padding: 1.25rem 0;
      border-bottom: 1px solid #e8e8e8;
    }

    .cart-row:last-child {
      border-bottom: none;
    }

    .cart-left {
      display: flex;
      flex-direction: column;
      gap: 0.5rem;
    }

    .cart-left p {
      margin: 0;
      font-size: 14px;
      color: #696969;
      line-height: 1.4;
    }

    .cart-left .item-name {
      font-weight: 600;
      font-size: 16px;
      color: #1c1c1c;
      letter-spacing: -0.3px;
    }

    .cart-left .item-price {
      display: flex;
      gap: 1rem;
    }

    .cart-left .item-price span {
      color: #1c1c1c;
      font-weight: 500;
    }

    .cart-right {
      display: flex;
      flex-direction: column;
      align-items: flex-end;
      gap: 0.75rem;
    }

    .qty-box {
      display: flex;
      align-items: center;
      gap: 0.75rem;
      background: #f8f8f8;
      padding: 0.25rem;
      border-radius: 8px;
      border: 1px solid #e8e8e8;
    }

    .qty-btn {
      background: none;
      color: #1c1c1c;
      border: none;
      width: 28px;
      height: 28px;
      font-size: 16px;
      border-radius: 6px;
      cursor: pointer;
      display: flex;
      align-items: center;
      justify-content: center;
      transition: all 0.2s;
    }

    .qty-btn:hover:not(:disabled) {
      background: #fff5f5;
      color: #ef4f5f;
    }

    .qty-btn:disabled {
      color: #ccc;
      cursor: not-allowed;
    }

    .qty-display {
      min-width: 24px;
      text-align: center;
      font-weight: 500;
      color: #1c1c1c;
    }

    .remove-btn {
      background: none;
      border: none;
      color: #ef4f5f;
      padding: 6px 12px;
      font-size: 13px;
      font-weight: 500;
      border-radius: 6px;
      cursor: pointer;
      transition: all 0.2s;
    }

    .remove-btn:hover {
      background: #fff5f5;
    }

    .empty-cart {
      text-align: center;
      padding: 3rem 1rem;
      color: #696969;
    }

    .empty-cart i {
      font-size: 48px;
      color: #e8e8e8;
      margin-bottom: 1rem;
    }

    .empty-cart p {
      font-size: 15px;
      margin-bottom: 1.5rem;
    }

    .grand-total {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 1.25rem 0;
      margin-top: 1rem;
      border-top: 1px solid #e8e8e8;
      font-size: 16px;
      font-weight: 600;
      color: #1c1c1c;
    }

    .cart-actions {
      display: flex;
      flex-direction: column;
      gap: 0.75rem;
      margin-top: 1.25rem;
    }

    .action-btn {
      background: #ef4f5f;
      color: white;
      text-decoration: none;
      text-align: center;
      border: none;
      padding: 0.875rem;
      font-size: 15px;
      font-weight: 500;
      border-radius: 8px;
      cursor: pointer;
      transition: all 0.2s;
    }

    .action-btn:hover {
      background: #e63e4e;
    }

    .action-btn.secondary {
      background: #fff;
      color: #1c1c1c;
      border: 1px solid #e8e8e8;
    }

    .action-btn.secondary:hover {
      background: #f8f8f8;
      border-color: #d8d8d8;
    }

    .proceed {
      background: #1c1c1c;
    }

    .proceed:hover {
      background: #000;
    }

    @media (max-width: 640px) {
      body {
        padding: 1rem 0.5rem;
      }

      .cart-container {
        padding: 1rem;
      }

      .cart-row {
        grid-template-columns: 1fr;
        gap: 1rem;
      }

      .cart-right {
        align-items: flex-start;
      }

      .cart-left .item-price {
        flex-direction: column;
        gap: 0.25rem;
      }
    }
  </style>
</head>
<body>
  <h1 class="page-title">Your Cart</h1>

  <div class="cart-container">
    <%
      Cart cart = (Cart)session.getAttribute("cart");
      Integer restaurantId = (Integer)session.getAttribute("restaurantId");
    
      if(cart!=null && !cart.getItems().isEmpty()) {
        for(CartItem item : cart.getItems().values()) { %>
          <!-- Cart Item -->
          <div class="cart-row">
            <div class="cart-left">
              <p class="item-name"><%= item.getName() %></p>
              <div class="item-price">
                <span>₹<%= item.getPrice() %></span>
                <span>× <%= item.getQuantity() %></span>
                <span>= ₹<%= item.getTotalprice() %></span>
              </div>
            </div>
        
            <div class="cart-right">
              <div class="qty-box">
                <!-- Minus (-) button form -->
                <form action="cart" method="post" style="display: inline;">
                  <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                  <input type="hidden" name="restaurantId" value="<%= restaurantId %>">
                  <input type="hidden" name="action" value="update">
                  <input type="hidden" name="quantity" value="<%= item.getQuantity() - 1 %>">
                  <button type="submit" class="qty-btn" <% if(item.getQuantity() == 1) { %>disabled<% } %>>−</button>
                </form>
                <span class="qty-display"><%= item.getQuantity() %></span>
                <!-- Plus (+) button form -->
                <form action="cart" method="post" style="display: inline;">
                  <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                  <input type="hidden" name="restaurantId" value="<%= restaurantId %>">
                  <input type="hidden" name="action" value="update">
                  <input type="hidden" name="quantity" value="<%= item.getQuantity() + 1 %>">
                  <button type="submit" class="qty-btn">+</button>
                </form>
              </div>
              <form action="cart" method="post">
                <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                <input type="hidden" name="restaurantId" value="<%= session.getAttribute("restaurantId") %>">
                <input type="hidden" name="action" value="remove">
                <button type="submit" class="remove-btn">Remove</button>
              </form>
            </div>
          </div>
      <% }
      } else { %>
        <div class="empty-cart">
          <i class="fa-solid fa-basket-shopping"></i>
          <p>Your cart is empty. Add some delicious items to proceed.</p>
          <a href="menu?restaurantId=<%= session.getAttribute("restaurantId") %>" class="action-btn secondary">Browse Menu</a>
        </div>
    <% } %>
    
    <%
      if(cart != null && !cart.getItems().isEmpty()) { %>
        <!-- Grand Total -->
        <div class="grand-total">
          <span>To Pay</span>
          <span>₹<%= cart.getGrandTotal() %></span>
        </div>
    
        <!-- Action Buttons -->
        <div class="cart-actions">
          <a href="menu?restaurantId=<%= session.getAttribute("restaurantId") %>" class="action-btn secondary">Add More Items</a>
          <form action="checkout.jsp" method="Post">
            <input type="submit" value="Proceed to Payment" class="action-btn proceed">
          </form>
        </div>
    <% } %>
  </div>
</body>
</html>