<%-- 
    Document   : new_password
    Created on : Jan 26, 2025, 5:23:55 PM
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
        <h1>New password</h1>
        <form action="resetpasswordcustomer" method="POST">
            Password: <input type="password" name="password" required 
                             pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$" 
                             title="Mật khẩu phải có ít nhất 8 ký tự, bao gồm chữ thường, chữ hoa, số và ký tự đặc biệt." /> <br/>
            Confirm password: <input type="password" name="cfpassword" required/> <br/>
            <span>${errorPass}</span> <br/>
            <input type="submit" value="Submit"/>
        </form>
    </body>
</html>
