<%-- 
    Document   : booking
    Created on : Feb 13, 2025, 10:27:21 AM
    Author     : Nguyen Minh Duc
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String brId = request.getParameter("brId");
    String from = request.getParameter("from");
    String to = request.getParameter("to");
    String departureTime = request.getParameter("departureTime");
    String arrivalTime = request.getParameter("arrivalTime");
    String price = request.getParameter("price");
    String description = request.getParameter("description");
    String distance = request.getParameter("distance");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Đặt vé xe</title>
    <style>
        table { width: 100%; border-collapse: collapse; }
        table, th, td { border: 1px solid black; }
        th, td { padding: 10px; text-align: center; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <h1>Thông tin chuyến xe</h1>
    <table>
        <tr><th>ID</th><td><%= brId %></td></tr>
        <tr><th>Điểm đi</th><td><%= from %></td></tr>
        <tr><th>Điểm đến</th><td><%= to %></td></tr>
        <tr><th>Giờ khởi hành</th><td><%= departureTime %></td></tr>
        <tr><th>Giờ đến</th><td><%= arrivalTime %></td></tr>
        <tr><th>Giá vé</th><td><%= price %></td></tr>
        <tr><th>Mô tả</th><td><%= description %></td></tr>
        <tr><th>Khoảng cách (km)</th><td><%= distance %></td></tr>
    </table>

    <h2>Chọn ngày đi</h2>
    <form action="confirmBooking.jsp" method="POST">
        <input type="hidden" name="brId" value="<%= brId %>">
        <input type="hidden" name="from" value="<%= from %>">
        <input type="hidden" name="to" value="<%= to %>">
        <input type="hidden" name="departureTime" value="<%= departureTime %>">
        <input type="hidden" name="arrivalTime" value="<%= arrivalTime %>">
        <input type="hidden" name="price" value="<%= price %>">
        <input type="hidden" name="description" value="<%= description %>">
        <input type="hidden" name="distance" value="<%= distance %>">

        Ngày đi: <input type="date" name="travelDate" required><br><br>
        <button type="submit">Đặt vé</button>
    </form>
</body>
</html>