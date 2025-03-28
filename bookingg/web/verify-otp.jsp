<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BusGoOTP - Xác minh mã OTP</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f0f0f0;
        }
        .container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        input, button {
            padding: 10px;
            margin: 10px 0;
            width: 100%;
            box-sizing: border-box;
        }
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Xác minh mã OTP</h2>
        <form action="verify-otp" method="post">
            <label for="otp">Nhập mã OTP:</label>
            <input type="text" id="otp" name="otp" placeholder="Nhập mã OTP" required>
            <button type="submit">Xác minh OTP</button>
        </form>
        <p style="color: red;"><%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %></p>
        <p style="color: green;"><%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %></p>
    </div>
</body>
</html>