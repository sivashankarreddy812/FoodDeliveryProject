<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Checkout</title>
    <link type="image/png" rel="icon" href="images/food app header logo.png">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f4f4f4;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 40px;
        }

        h1 {
            font-size: 28px;
            color: #333;
            margin-bottom: 20px;
        }

        .checkout-container {
            background-color: #ffffff;
            padding: 30px;
            width: 400px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .checkout-container label {
            font-weight: bold;
            font-size: 16px;
            margin-bottom: 8px;
            display: block;
        }

        .checkout-container input[type="text"],
        .checkout-container select {
            width: 100%;
            padding: 10px;
            font-size: 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
            margin-bottom: 20px;
        }

        .checkout-container button {
            width: 100%;
            padding: 12px;
            background-color: #ff4d4d;
            color: white;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .checkout-container button:hover {
            background-color: #e04343;
        }
        
    </style>
</head>
<body>

	<h1>Checkout</h1>
	
	<div class="checkout-container">
	    <form action="checkout" method="Post">
		    <label for="address">Delivery Address</label>
		    <input type="text" id="address" name="address" value="<%= session.getAttribute("userAddress") %>">
		
		    <label for="payment">Payment Method</label>
		    <select id="payment" name="payment">
		        <option>Card</option>
		        <option>Cash on Delivery</option>
		        <option>GPay</option>
		    </select>
			<button type="submit">Place Order</button>
		</form>
	</div>
	
</body>
</html>