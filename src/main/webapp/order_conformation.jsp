<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Order Placed - EpicEats</title>
    <link type="image/png" rel="icon" href="images/food app header logo.png" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    />
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
          Roboto, sans-serif;
      }

      body {
        background-color: #f8f8f8;
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 20px;
        position: relative;
        overflow: hidden;
      }

      /* Animated background circles */
      body::before,
      body::after {
        content: "";
        position: absolute;
        width: 300px;
        height: 300px;
        border-radius: 50%;
        background: radial-gradient(
          circle at center,
          rgba(203, 32, 45, 0.1) 0%,
          transparent 70%
        );
        animation: float 8s ease-in-out infinite;
        z-index: 0;
      }

      body::before {
        top: -100px;
        left: -100px;
        animation-delay: -4s;
      }

      body::after {
        bottom: -100px;
        right: -100px;
        animation-delay: -2s;
      }

      @keyframes float {
        0%,
        100% {
          transform: translate(0, 0) scale(1);
          opacity: 0.5;
        }
        50% {
          transform: translate(20px, 20px) scale(1.2);
          opacity: 0.8;
        }
      }

      .popup {
        background-color: white;
        border-radius: 16px;
        box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1);
        padding: 40px;
        text-align: center;
        max-width: 450px;
        width: 100%;
        position: relative;
        z-index: 1;
        animation: slideUp 0.8s cubic-bezier(0.16, 1, 0.3, 1) forwards;
        transform: translateY(30px);
        opacity: 0;
        border: 1px solid rgba(203, 32, 45, 0.1);
      }

      @keyframes slideUp {
        to {
          transform: translateY(0);
          opacity: 1;
        }
      }

      .success-circle {
        width: 120px;
        height: 120px;
        background: #fff;
        border-radius: 50%;
        margin: 0 auto 30px;
        position: relative;
        display: flex;
        align-items: center;
        justify-content: center;
        box-shadow: 0 0 0 4px rgba(203, 32, 45, 0.1);
        animation: circlePulse 2s ease-in-out infinite;
      }

      .success-circle::before {
        content: "";
        position: absolute;
        width: 100%;
        height: 100%;
        border-radius: 50%;
        border: 2px solid transparent;
        border-top-color: #cb202d;
        border-right-color: #cb202d;
        animation: spin 1.5s linear infinite;
      }

      @keyframes spin {
        to {
          transform: rotate(360deg);
        }
      }

      @keyframes circlePulse {
        0% {
          box-shadow: 0 0 0 0 rgba(203, 32, 45, 0.4);
        }
        70% {
          box-shadow: 0 0 0 20px rgba(203, 32, 45, 0);
        }
        100% {
          box-shadow: 0 0 0 0 rgba(203, 32, 45, 0);
        }
      }

      .check-icon {
        font-size: 50px;
        color: #cb202d;
        animation: checkmark 0.5s ease-in-out 0.4s both;
        position: relative;
        z-index: 1;
      }

      @keyframes checkmark {
        0% {
          transform: scale(0);
        }
        50% {
          transform: scale(1.2);
        }
        100% {
          transform: scale(1);
        }
      }

      .popup h1 {
        font-size: 28px;
        font-weight: 600;
        color: #1c1c1c;
        margin-bottom: 16px;
        animation: fadeIn 0.5s ease-in-out 0.6s both;
      }

      .popup p {
        font-size: 16px;
        color: #696969;
        margin-bottom: 12px;
        line-height: 1.5;
        animation: fadeIn 0.5s ease-in-out 0.8s both;
      }

      .popup strong {
        color: #cb202d;
        font-weight: 600;
      }

      .back-btn {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        margin-top: 32px;
        padding: 14px 28px;
        background-color: #cb202d;
        color: white;
        border: none;
        border-radius: 8px;
        font-size: 15px;
        font-weight: 500;
        text-decoration: none;
        transition: all 0.2s ease;
        animation: fadeIn 0.5s ease-in-out 1.2s both;
        position: relative;
        overflow: hidden;
      }

      .back-btn::before {
        content: "";
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(
          90deg,
          transparent,
          rgba(255, 255, 255, 0.2),
          transparent
        );
        transition: 0.5s;
      }

      .back-btn:hover::before {
        left: 100%;
      }

      .back-btn:hover {
        background-color: #a71b25;
        transform: translateY(-2px);
      }

      .back-btn i {
        font-size: 16px;
      }

      @keyframes fadeIn {
        from {
          opacity: 0;
          transform: translateY(10px);
        }
        to {
          opacity: 1;
          transform: translateY(0);
        }
      }

      /* Celebration dots animation */
      .celebration-dots {
        position: absolute;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
        pointer-events: none;
        z-index: 0;
      }

      .celebration-dots::before,
      .celebration-dots::after {
        content: "•";
        position: absolute;
        color: #cb202d;
        font-size: 24px;
        animation: floatDot 3s ease-in-out infinite;
      }

      .celebration-dots::before {
        top: 20%;
        left: 10%;
        animation-delay: -1s;
      }

      .celebration-dots::after {
        top: 30%;
        right: 10%;
        animation-delay: -2s;
      }

      @keyframes floatDot {
        0%,
        100% {
          transform: translateY(0) scale(1);
          opacity: 0.3;
        }
        50% {
          transform: translateY(-20px) scale(1.5);
          opacity: 0.8;
        }
      }

      @media (max-width: 480px) {
        .popup {
          padding: 30px 20px;
        }

        .success-circle {
          width: 100px;
          height: 100px;
        }

        .check-icon {
          font-size: 40px;
        }

        .popup h1 {
          font-size: 24px;
        }

        .popup p {
          font-size: 15px;
        }

        body::before,
        body::after {
          width: 200px;
          height: 200px;
        }
      }
    </style>
  </head>
  <body>
    <div class="celebration-dots"></div>
    <div class="popup">
      <div class="success-circle">
        <div class="check-icon">
          <i class="fa-solid fa-circle-check"></i>
        </div>
      </div>
      <h1>Order Confirmed! 🎉</h1>
      <p>Thank you for ordering with <strong>EpicEats</strong></p>
      <p>Your delicious food is being prepared with love ❤️</p>
      <p>We'll notify you when your order is ready!</p>

      <a href="home.jsp" class="back-btn">
        <i class="fa-solid fa-arrow-left"></i>
        Back to Home
      </a>
    </div>
  </body>
</html>
