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
        <p><strong>Mã vé:</strong> <%= request.getAttribute("bookingId") %></p>
        <p><strong>Tên Khách Hàng:</strong> <%= request.getAttribute("c_fullname") %></p>
        <p><strong>Số điện thoại:</strong> <%= request.getAttribute("c_phone") %></p>
        <p><strong>Ngày đặt vé:</strong> <%= request.getAttribute("bt_bookingDate") %></p>
        <p><strong>Điểm đi:</strong> <%= request.getAttribute("br_from") %></p>
        <p><strong>Điểm đến:</strong> <%= request.getAttribute("br_to") %></p>
        <p><strong>Thời điểm đi:</strong> <%= request.getAttribute("bt1_departureTime") %></p>
        <p><strong>Thời điểm đến:</strong> <%= request.getAttribute("bt1_arrivalTime") %></p>
        <p><strong>Ghế:</strong> <%= request.getAttribute("s_name") %></p>
        <p><strong>Giá:</strong> <%= request.getAttribute("t_price") %> VNĐ</p>       
        <a href="selectSeat.jsp">Đặt vé mới</a>
    </body>
</html>
