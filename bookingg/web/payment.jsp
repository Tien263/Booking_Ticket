<%-- 
    Document   : payment
    Created on : Feb 14, 2025, 7:52:41 PM
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
        <form action="BookTicketURL" method="post">
            <input type="hidden" name="service" value="Confirmation">
            <p><strong>Mã vé:</strong> <%= request.getAttribute("bookingId") %></p>
            <p><strong>Tuyến:</strong> <%= request.getAttribute("routeName") %></p>
            <p><strong>Chuyến:</strong> <%= request.getAttribute("tripName") %></p>
            <p><strong>Ghế:</strong> <%= request.getAttribute("seatName") %></p>
            <p><strong>Giá:</strong> <%= request.getAttribute("price") %> VNĐ</p>
            <input type="hidden" name="bookingId" value="<%= request.getAttribute("bookingId") %>">
            <input type="hidden" name="seatId" value="<%= request.getAttribute("seatId") %>">
            <input type="submit" value="Thanh toán">
        </form>
    </body>
</html>
