<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>User Registration - EpicEats</title>
    <link type="image/png" rel="icon" href="images/food app header logo.png" />
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap"
      rel="stylesheet"
    />
    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Inter", -apple-system, BlinkMacSystemFont, "Segoe UI",
          Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
      }

      body {
        margin: 0;
        padding: 0;
        background-color: #f8f8f8;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        color: #1c1c1c;
      }

      .form-container {
        background: #fff;
        padding: 40px;
        border-radius: 8px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
        width: 100%;
        max-width: 500px;
        border: 1px solid #e8e8e8;
      }

      .form-container h2 {
        text-align: center;
        margin-bottom: 32px;
        font-size: 28px;
        font-weight: 600;
        color: #1c1c1c;
        letter-spacing: -0.5px;
      }

      .form-container label {
        display: block;
        margin-bottom: 8px;
        font-weight: 500;
        color: #1c1c1c;
        font-size: 14px;
      }

      .form-container input,
      .form-container textarea,
      .form-container select {
        width: 100%;
        padding: 14px;
        margin-bottom: 24px;
        border: 1px solid #e8e8e8;
        border-radius: 4px;
        font-size: 15px;
        background-color: #f8f8f8;
        transition: all 0.2s ease;
      }

      .form-container input:focus,
      .form-container textarea:focus,
      .form-container select:focus {
        border-color: #cb202d;
        outline: none;
        background-color: #fff;
        box-shadow: 0 0 0 2px rgba(203, 32, 45, 0.1);
      }

      .form-container textarea {
        resize: vertical;
        min-height: 100px;
      }

      .form-container select {
        appearance: none;
        background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%23696969' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E");
        background-repeat: no-repeat;
        background-position: right 14px center;
        padding-right: 40px;
      }

      .form-container button[type="submit"] {
        width: 100%;
        padding: 16px;
        background-color: #cb202d;
        color: white;
        font-size: 16px;
        font-weight: 600;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.2s ease;
      }

      .form-container button[type="submit"]:hover {
        background-color: #a71b25;
      }

      @media (max-width: 640px) {
        .form-container {
          margin: 20px;
          padding: 24px;
        }

        .form-container h2 {
          font-size: 24px;
          margin-bottom: 24px;
        }
      }
    </style>
  </head>
  <body>
    <div class="form-container">
      <h2>User Registration</h2>
      <form action="user-registration" method="post" id="user-form">
        <label for="name">Full Name</label>
        <input type="text" id="name" name="name" required />

        <label for="username">Username</label>
        <input type="text" id="username" name="username" required />

        <label for="password">Password</label>
        <input type="password" id="password" name="password" required />

        <label for="email">Email</label>
        <input type="email" id="email" name="email" required />

        <label for="phone">Phone Number</label>
        <input type="tel" id="phone" name="phonenumber" required />

        <label for="address">Address</label>
        <textarea id="address" name="address" rows="3" required></textarea>

        <label for="role">Role</label>
        <select id="role" name="role" required>
          <option value="">Select Role</option>
          <option value="Customer">Customer</option>
          <option value="Restaurant Admin">Restaurant Admin</option>
          <option value="Delivery Agent">Delivery Agent</option>
          <option value="Super Admin">Super Admin</option>
        </select>

        <button type="submit">Submit</button>
      </form>
    </div>
  </body>
</html>
