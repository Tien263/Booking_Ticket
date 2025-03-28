<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BusGoOTP - Gửi mã OTP</title>
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
        <h2>Gửi mã OTP qua SMS</h2>
        <form action="send-otp" method="post">
            <label for="phone">Số điện thoại:</label>
            <input type="text" id="phone" name="phone" placeholder="+84398996177" required>
            <button type="submit">Gửi OTP</button>
        </form>
        <p style="color: red;"><%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %></p>
    </div>
</body>
</html>