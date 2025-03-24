<%-- 
    Document   : error
    Created on : Feb 5, 2025, 11:17:59 AM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p>Lỗi: <%= request.getAttribute("message") %></p>
        <a href="home.jsp">Quay lại</a>
    </body>
</html>
