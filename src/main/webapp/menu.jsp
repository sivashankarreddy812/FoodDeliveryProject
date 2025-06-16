<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tap.model.Menu, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <link type="image/png" rel="icon" href="images/food app header logo.png">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <title>Menu - EpicEats</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
    }

    body {
      background-color: #f8f8f8;
      color: #1c1c1c;
      min-height: 100vh;
    }

    /* Header/Navbar */
    .navbar {
      background-color: #fff;
      padding: 1rem 2rem;
      display: flex;
      justify-content: space-between;
      align-items: center;
      box-shadow: 0 1px 2px rgba(0,0,0,0.08);
      position: sticky;
      top: 0;
      z-index: 100;
    }

    .logo {
      font-size: 28px;
      font-weight: 700;
      color: #cb202d;
      letter-spacing: -0.5px;
      text-decoration: none;
    }

    .nav-buttons {
      display: flex;
      align-items: center;
    }

    .nav-btn {
      display: flex;
      align-items: center;
      gap: 8px;
      background: none;
      border: 1px solid #e8e8e8;
      color: #1c1c1c;
      text-decoration: none;
      padding: 8px 16px;
      border-radius: 8px;
      font-size: 15px;
      font-weight: 500;
      cursor: pointer;
      transition: all 0.2s;
    }

    .nav-btn:hover {
      color: #cb202d;
      background-color: #fff5f5;
      border-color: #cb202d;
      transform: scale(1.03);
    }

    .nav-btn i {
      font-size: 18px;
    }

    /* Restaurant Info Section */
    .restaurant-info {
      background: #fff;
      padding: 2rem;
      margin-bottom: 2rem;
      border-bottom: 1px solid #e8e8e8;
      position: relative;
      overflow: hidden;
    }

    .restaurant-info::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      height: 4px;
      background: linear-gradient(90deg, #cb202d, #ff4d4d);
    }

    .restaurant-header {
      max-width: 1200px;
      margin: 0 auto;
      display: flex;
      justify-content: space-between;
      align-items: flex-start;
      gap: 2rem;
    }

    .restaurant-details h1 {
      font-size: 28px;
      font-weight: 600;
      color: #1c1c1c;
      margin-bottom: 0.75rem;
      letter-spacing: -0.5px;
    }

    .restaurant-meta {
      display: flex;
      gap: 1.5rem;
      color: #696969;
      font-size: 14px;
      margin-bottom: 1rem;
      flex-wrap: wrap;
    }

    .restaurant-meta span {
      display: flex;
      align-items: center;
      gap: 6px;
      background: #f8f8f8;
      padding: 6px 12px;
      border-radius: 6px;
      font-weight: 500;
    }

    .restaurant-meta i {
      color: #cb202d;
    }

    /* Main Title Section */
    .main-title-section {
      text-align: center;
      padding: 2.5rem 1rem;
      background-color: #fff;
      margin-bottom: 2rem;
      box-shadow: 0 1px 2px rgba(0,0,0,0.08);
      border-bottom: 1px solid #e8e8e8;
    }

    .main-title-section h1 {
      font-size: 32px;
      font-weight: 700;
      color: #1c1c1c;
      letter-spacing: -0.8px;
      animation: fadeInDown 0.8s ease-out;
    }

    @keyframes fadeInDown {
      from { opacity: 0; transform: translateY(-20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    /* Menu Container */
    .menu-container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 0 1rem 2rem;
    }

    .menu-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
      gap: 1rem;
    }

    .menu-card {
      background: #fff;
      border-radius: 8px;
      overflow: hidden;
      transition: all 0.2s ease;
      border: 1px solid #e8e8e8;
      display: flex;
      flex-direction: column;
    }

    .menu-card:hover {
      box-shadow: 0 2px 8px rgba(0,0,0,0.08);
      transform: scale(1.02);
    }

    .menu-card img {
      width: 100%;
      height: 160px;
      object-fit: cover;
      object-position: center;
    }

    .menu-card-content {
      padding: 0.8rem;
      display: flex;
      flex-direction: column;
      gap: 0.4rem;
    }

    .menu-card h3 {
      font-size: 15px;
      font-weight: 600;
      color: #1c1c1c;
      margin: 0;
    }

    .menu-card p {
      font-size: 12px;
      color: #696969;
      line-height: 1.4;
      margin: 0;
    }

    .price {
      font-weight: 600;
      color: #1c1c1c;
      font-size: 14px;
      display: flex;
      align-items: center;
      gap: 0.25rem;
    }

    .price::before {
      content: '₹';
      font-size: 12px;
      color: #696969;
    }

    .rating {
      display: inline-flex;
      align-items: center;
      gap: 4px;
      font-size: 11px;
      color: #696969;
      margin-top: 0.25rem;
    }

    .rating i {
      color: #cb202d;
      font-size: 11px;
    }

    .button-container {
      margin-top: 0.6rem;
    }

    .add-btn {
      width: 100%;
      background: #cb202d;
      color: white;
      border: none;
      padding: 0.6rem;
      border-radius: 6px;
      font-size: 13px;
      font-weight: 500;
      cursor: pointer;
      transition: background-color 0.2s;
    }

    .add-btn:hover {
      background: #a71b25;
    }

    /* Empty State */
    .empty-menu {
      text-align: center;
      padding: 2.5rem 1rem;
      color: #696969;
      background: #fff;
      border-radius: 8px;
      margin: 2rem auto;
      max-width: 350px;
      border: 1px solid #e8e8e8;
    }

    .empty-menu i {
      font-size: 36px;
      color: #e8e8e8;
      margin-bottom: 1rem;
    }

    .empty-menu h3 {
      font-size: 16px;
      font-weight: 600;
      color: #1c1c1c;
      margin-bottom: 0.5rem;
    }

    .empty-menu p {
      font-size: 13px;
      color: #696969;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
      .navbar {
        padding: 1rem;
      }

      .restaurant-header {
        flex-direction: column;
        gap: 1rem;
      }

      .restaurant-details h1 {
        font-size: 24px;
      }

      .restaurant-meta {
        gap: 0.75rem;
      }

      .restaurant-meta span {
        font-size: 13px;
        padding: 4px 8px;
      }

      .menu-grid {
        grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
        gap: 0.8rem;
      }

      .menu-container {
        padding: 0 1rem 1.5rem;
      }

      .menu-card-content {
        padding: 0.7rem;
      }

      .menu-card img {
        height: 140px;
      }

      .empty-menu {
        margin: 1.5rem auto;
      }
    }

    /* Loading Animation */
    @keyframes shimmer {
      0% {
        background-position: -200% 0;
      }
      100% {
        background-position: 200% 0;
      }
    }

    .loading {
      background: linear-gradient(90deg, #f0f0f0 25%, #e0e0e0 50%, #f0f0f0 75%);
      background-size: 200% 100%;
      animation: shimmer 1.5s infinite;
    }
  </style>
</head>
<body>

<nav class="navbar">
  <a href="index.jsp" class="logo">EpicEats</a>
  <div class="nav-buttons">
    <a href="cart.jsp" class="nav-btn">
      <i class="fa-solid fa-basket-shopping"></i>
      Cart
    </a>
  </div>
</nav>

<!-- Menu Title Section -->
<div class="main-title-section">
  <h1>Our Delicious Menu</h1>
</div>

<div class="menu-container">
  <div class="menu-grid">
    <%
    List<Menu> menuByRestaurantId = (List<Menu>)request.getAttribute("menuByRestaurantId");
    
    if(menuByRestaurantId == null || menuByRestaurantId.isEmpty()) { %>
      <div class="empty-menu">
        <i class="fa-solid fa-utensils"></i>
        <h3>No items available</h3>
        <p>Please check back later for menu updates.</p>
      </div>
    <% } else {
      for(Menu menu : menuByRestaurantId) { %>
        <div class="menu-card">
          <img src="<%= menu.getImagepath() %>" alt="<%= menu.getItemname() %>" loading="lazy">
          <div class="menu-card-content">
            <h3><%= menu.getItemname() %></h3>
            <p class="price"><%= menu.getPrice() %></p>
            <p><%= menu.getDescription() %></p>
            <span class="rating">
              <i class="fa-solid fa-star"></i>
              <%= menu.getRatings() %>
            </span>
            <form action="cart" method="post">
              <input type="hidden" name="menuId" value="<%= menu.getMenuid() %>">
              <input type="hidden" name="quantity" value="1">
              <input type="hidden" name="restaurantId" value="<%= menu.getRestaurantid() %>">
              <input type="hidden" name="action" value="add">
              <div class="button-container">
                <button type="submit" class="add-btn">Add to Cart</button>
              </div>
            </form>
          </div>
        </div>
      <% }
    } %>
  </div>
</div>

</body>
</html>
