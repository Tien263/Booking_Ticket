<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Nhân Viên - BusGo</title>
        <link rel="shortcut icon" href="assets/images/logo/logo_01_1.png">

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 350px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            font-weight: bold;
        }
        input[type="text"], input[type="password"], select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            width: 100%;
            padding: 10px;
            background: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background: #218838;
        }
        .error-message {
            color: red;
            font-weight: bold;
            text-align: center;
        }
        .forgot-password {
            text-align: center;
            margin-top: 10px;
        }
        .forgot-password a {
            color: blue;
            text-decoration: none;
        }
        .forgot-password a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Employee Login</h2>

    <c:if test="${not empty err}">
        <p class="error-message">${err}</p>
    </c:if>

    <form action="employee_login" method="post">
<!--        <div class="form-group">
            <label for="role">Role:</label>
            <select id="role" name="role">
                <option value="blog">Blog Manager</option>
                <option value="promotion">Promotion Manager</option>
            </select>
        </div>-->

        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" value="${cookie.cUsername.value}" required>
        </div>

        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>

        <div class="form-group">
            <label>
                <input type="checkbox" name="rememberMe" value="ON"> Remember me
            </label>
        </div>

        <button type="submit">Login</button>
    </form>

    <p class="forgot-password">
        <a href="enter_username.jsp">Do you want to change password?</a>
    </p>
</div>

</body>
</html>
