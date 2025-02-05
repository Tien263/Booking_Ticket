<%-- 
    Document   : enter_username
    Created on : Feb 3, 2025, 10:09:39 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Enter Your Username</h2>

    <c:if test="${not empty error}">
        <p style="color: red;">${error}</p>
    </c:if>

    <form action="verify_username" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>

        <button type="submit">Next</button>
    </form>

    <br>
    <a href="emloyee_login.jsp">Back to Login</a>
</body>
</html>
