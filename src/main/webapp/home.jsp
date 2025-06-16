<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tap.model.Restaurant, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="icon" type="image/png" href="images/food app header logo.png">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <title>Epiceats</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Inter', sans-serif;
    }

    body {
      background-color: #f8f8f8;
      color: #1c1c1c;
    }

    .header {
      background-color: #fff;
      color: #1c1c1c;
      padding: 1rem 2rem;
      display: flex;
      justify-content: space-between;
      align-items: center;
      box-shadow: 0 1px 2px rgba(0, 0, 0, 0.08);
      position: sticky;
      top: 0;
      z-index: 100;
    }

    .header-logo {
      font-size: 28px;
      font-weight: 700;
      color: #e23744; /* Updated red */
      letter-spacing: -0.5px;
    }

    .nav-links {
      display: flex;
      gap: 24px;
    }

    .nav-links a {
      color: #1c1c1c;
      text-decoration: none;
      font-weight: 500;
      font-size: 15px;
      transition: all 0.2s;
      padding: 8px 16px;
      border-radius: 8px;
      background-color: transparent;
    }

    .nav-links a:hover {
      color: #e23744;
      background-color: #ffe5e8;
    }

    .hero-box {
      background-color: #e23744; /* Updated red */
      color: #fff;
      text-align: center;
      padding: 3rem 2rem;
      border-radius: 12px;
      margin: 2rem auto;
      max-width: 900px;
    }

    .hero-box h1 {
      font-size: 36px;
      font-weight: 700;
      margin-bottom: 1rem;
    }

    .hero-box p {
      font-size: 18px;
      margin-bottom: 2rem;
    }

    .search-form {
      display: flex;
      justify-content: center;
    }

    .search-bar {
      width: 80%;
      max-width: 600px;
      padding: 14px 20px;
      border-radius: 30px;
      border: none;
      outline: none;
      font-size: 15px;
      color: #333;
      background-color: #fff;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }

    .section-title {
      font-size: 24px;
      font-weight: 600;
      margin: 2rem;
      color: #1c1c1c;
    }

    .card-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
      gap: 2rem;
      padding: 0 2rem 2rem;
    }

    .card-grid a {
      text-decoration: none;
      color: inherit;
    }

    .card {
      background-color: #fff;
      border-radius: 12px;
      overflow: hidden;
      transition: transform 0.2s ease;
      border: 1px solid #e8e8e8;
    }

    .card:hover {
      transform: translateY(-4px);
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
    }

    .card img {
      width: 100%;
      height: 200px;
      object-fit: cover;
    }

    .card-content {
      padding: 1rem;
    }

    .card h3 {
      font-size: 18px;
      font-weight: 600;
      margin-bottom: 0.5rem;
      color: #1c1c1c;
    }

    .card p {
      font-size: 14px;
      margin-bottom: 0.5rem;
      color: #696969;
    }

    .card .meta {
      font-size: 13px;
      color: #696969;
      display: flex;
      align-items: center;
      gap: 8px;
    }

    .card .meta b {
      color: #1c1c1c;
      font-weight: 500;
    }

    .empty-message {
      text-align: center;
      padding: 60px 20px;
      color: #696969;
      grid-column: 1 / -1;
    }

    .empty-message h3 {
      font-size: 20px;
      font-weight: 600;
      margin-bottom: 8px;
      color: #1c1c1c;
    }

    @media (max-width: 768px) {
      .search-bar {
        width: 100%;
      }

      .card-grid {
        grid-template-columns: 1fr;
      }

      .hero-box {
        padding: 2rem 1rem;
      }
    }
  </style>
</head>
<body>

  <!-- Header -->
  <header class="header">
    <div class="header-logo">EpicEats</div>
    <div class="nav-links">
      <a href="login.jsp">Sign In</a>
      <a href="userregistration.jsp">Sign Up</a>
    </div>
  </header>

  <!-- Hero -->
  <section class="hero-box">
    <h1>Your Food, Delivered!</h1>
    <p>Order from your favorite restaurants and get it delivered to your doorstep.</p>
    <form action="SearchServlet" method="POST" class="search-form">
      <input type="text" name="searchQuery" class="search-bar" placeholder="Search for restaurants or dishes...">
    </form>
  </section>

  <!-- Restaurants List -->
  <section>
    <div class="section-title">Discover Nearby Restaurants</div>
    <div class="card-grid">
      <%
        List<Restaurant> allRestaurants = (List<Restaurant>)request.getAttribute("allRestaurants");
        if(allRestaurants == null || allRestaurants.isEmpty()) {
      %>
        <div class="empty-message">
          <h3>No restaurants available at the moment.</h3>
          <p>Please check back later!</p>
        </div>
      <% } else {
          for(Restaurant restaurant : allRestaurants) {
      %>
        <a href="menu?restaurantId=<%= restaurant.getRestaurantid() %>">
          <div class="card">
            <img src="<%= restaurant.getImagepath() %>" alt="restaurant image">
            <div class="card-content">
              <h3><%= restaurant.getName() %></h3>
              <p><%= restaurant.getAddress() %></p>
              <p class="meta"><b>Cuisine:</b> <%= restaurant.getCusinetype() %></p>
              <p class="meta"><b>ETA:</b> <%= restaurant.getDeliverytime() %> | <b>Rating:</b> <%= restaurant.getRating() %> ⭐</p>
            </div>
          </div>
        </a>
      <% } } %>
    </div>
  </section>

</body>
</html>
