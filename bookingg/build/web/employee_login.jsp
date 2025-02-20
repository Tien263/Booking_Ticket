<%-- 
    Document   : employee_login
    Created on : Jan 24, 2025, 11:44:31 PM
    Author     : ADMIN
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
     <h2>Employee Login</h2>
    
    <c:if test="${not empty loginerror}">
        <p style="color: red; font-weight: bold;">${loginerror}</p>
    </c:if>
    
    <form action="employee_login" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        
        <button type="submit">Login</button>
    </form>

    <br>
    <p>
        <a href="enter_username.jsp" style="color: blue; text-decoration: none;">Forgot Password?</a>
    </p>
</body>
</html>
