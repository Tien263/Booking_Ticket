<%-- 
    Document   : forgot_password
    Created on : Jan 26, 2025, 5:04:01 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Forgot Password</h1>
        <form action="forgotpassword" method="POST">
            Email: <input type="email" name="email" value="${email}" required pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" title="Vui lòng nhập địa chỉ email hợp lệ."> <span>${errorEmail}</span> <br/>
            <span>${errorOTP}</span> <br/>
            <input type="submit" value="Send"/>
        </form>
    </body>
</html>
