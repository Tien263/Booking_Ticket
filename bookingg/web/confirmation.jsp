<%-- 
    Document   : confimation
    Created on : Feb 5, 2025, 11:17:32 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Xác nhận Đặt Vé</title>
    </head>
    <body>
        <h2>Thông tin vé của bạn</h2>
        <p><strong>Mã vé:</strong> <%= request.getAttribute("ticketId") %></p>
        <p><strong>Tuyến:</strong> <%= request.getAttribute("routeName") %></p>
        <p><strong>Chuyến:</strong> <%= request.getAttribute("tripName") %></p>
        <p><strong>Ghế:</strong> <%= request.getAttribute("seatName") %></p>
        <p><strong>Giá:</strong> <%= request.getAttribute("price") %> VNĐ</p>
        
        <a href="selectSeat.jsp">Đặt vé mới</a>
    </body>
</html>
