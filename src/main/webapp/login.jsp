<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Login Page</title>
    <link type="image/png" rel="icon" href="images/food app header logo.png" />
    <style>
      * {
        box-sizing: border-box;
      }

      body {
        margin: 0;
        padding: 0;
        font-family: "Okra", -apple-system, BlinkMacSystemFont, "Segoe UI",
          Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
        background-color: #f8f8f8;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
      }

      .login-container {
        background: #fff;
        padding: 40px;
        border-radius: 8px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
        width: 100%;
        max-width: 400px;
        border: 1px solid #e8e8e8;
      }

      .login-container h2 {
        margin-bottom: 32px;
        font-size: 28px;
        color: #1c1c1c;
        text-align: center;
        font-weight: 600;
        line-height: 1.4;
      }

      .login-container label {
        display: block;
        text-align: left;
        margin-bottom: 8px;
        font-weight: 500;
        color: #1c1c1c;
        font-size: 14px;
      }

      .login-container input {
        width: 100%;
        padding: 14px;
        margin-bottom: 24px;
        border: 1px solid #e8e8e8;
        border-radius: 4px;
        font-size: 15px;
        transition: all 0.2s ease;
        background-color: #f8f8f8;
      }

      .login-container input:focus {
        border-color: #cb202d;
        outline: none;
        background-color: #fff;
        box-shadow: 0 0 0 2px rgba(203, 32, 45, 0.1);
      }

      .login-btn {
        width: 100%;
        padding: 16px;
        background-color: #cb202d;
        color: #fff;
        font-size: 16px;
        font-weight: 600;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.2s ease;
      }

      .login-btn:hover {
        background-color: #a71b25;
      }

      .register-link {
        margin-top: 24px;
        font-size: 14px;
        color: #696969;
        text-align: center;
      }

      .register-link a {
        color: #cb202d;
        text-decoration: none;
        font-weight: 600;
        margin-left: 4px;
      }

      .register-link a:hover {
        text-decoration: underline;
      }

      .error-message {
        color: #cb202d;
        margin-bottom: 16px;
        font-size: 14px;
        text-align: center;
        background-color: #fff5f5;
        padding: 12px;
        border-radius: 4px;
        border: 1px solid #ffd7d7;
      }
    </style>
  </head>
  <body>
    <div class="login-container">
      <h2>Welcome Back!<br />Ready to feast?</h2>

      <form action="login" method="post">
        <label for="email">Email ID</label>
        <input type="email" id="email" name="email" required />

        <label for="password">Password</label>
        <input type="password" id="password" name="password" required />

        <!-- Error message -->
        <% if(request.getAttribute("error") != null) { %>
        <div class="error-message"><%= request.getAttribute("error") %></div>
        <% } %>

        <button type="submit" class="login-btn">Login</button>
      </form>

      <p class="register-link">
        Don't have an account?<a href="userregistration.jsp">Register here</a>
      </p>
    </div>
  </body>
</html>
