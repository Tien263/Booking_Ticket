<%-- 
    Document   : bookingg
    Created on : Feb 12, 2025, 10:25:36 PM
    Author     : Nguyen Minh Duc
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.BusTrip" %>

<%
    String from = (String) request.getAttribute("from");
    String to = (String) request.getAttribute("to");
    String hour = (String) request.getAttribute("hour");
    String minute = (String) request.getAttribute("minute");
    String time = (String) request.getAttribute("time");
    String[] provinces = (String[]) request.getAttribute("provinces");
    List<BusTrip> trips = (List<BusTrip>) request.getAttribute("trips");
    String error = (String) request.getAttribute("error");
    String message = (String) request.getAttribute("message");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Kết quả tìm kiếm chuyến xe</title>
    <style>
        table { width: 100%; border-collapse: collapse; }
        table, th, td { border: 1px solid black; }
        th, td { padding: 10px; text-align: center; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <h1>Tìm kiếm chuyến xe</h1>

    <% if (error != null) { %>
        <p style="color: red;"><%= error %></p>
    <% } %>

    <% if (message != null) { %>
        <p><%= message %></p>
    <% } %>

    <form method="GET" action="booking">
        Điểm đi: 
        <select name="from" required>
            <% for (String province : provinces) { %>
                <option value="<%= province %>" <%= province.equals(from) ? "selected" : "" %>><%= province %></option>
            <% } %>
        </select>

        Điểm đến: 
        <select name="to" required>
            <% for (String province : provinces) { %>
                <option value="<%= province %>" <%= province.equals(to) ? "selected" : "" %>><%= province %></option>
            <% } %>
        </select>

        <br><br>
        Giờ: <input type="number" name="hour" min="0" max="23" value="<%= hour != null ? hour : "" %>" required>
        Phút: <input type="number" name="minute" min="0" max="59" value="<%= minute != null ? minute : "" %>" required>
        <br><br>
        <button type="submit">Tìm kiếm</button>
    </form>

    <% if (trips != null && !trips.isEmpty()) { %>
        <h2>Kết quả tìm kiếm</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Điểm đi</th>
                    <th>Điểm đến</th>
                    <th>Giờ khởi hành</th>
                    <th>Giờ đến</th>
                    <th>Giá vé</th>
                    <th>Mô tả</th>
                    <th>Khoảng cách (km)</th>
                </tr>
            </thead>
           <tbody>
    <% for (BusTrip trip : trips) { %>
       <tr>
            <td><%= trip.getBrId() %></td>
            <td><%= trip.getBrFrom() %></td>
            <td><%= trip.getBrTo() %></td>
            <td><%= trip.getBt1DepartureTime() %></td>
            <td><%= trip.getBt1ArrivalTime() %></td>
            <td><%= trip.getTPrice() %></td>
            <td><%= trip.getBrDescription() %></td>
            <td><%= trip.getBrDistance() %></td>
            <td>
                <form action="booking.jsp" method="GET">
                    <input type="hidden" name="brId" value="<%= trip.getBrId() %>">
                    <input type="hidden" name="from" value="<%= trip.getBrFrom() %>">
                    <input type="hidden" name="to" value="<%= trip.getBrTo() %>">
                    <input type="hidden" name="departureTime" value="<%= trip.getBt1DepartureTime() %>">
                    <input type="hidden" name="arrivalTime" value="<%= trip.getBt1ArrivalTime() %>">
                    <input type="hidden" name="price" value="<%= trip.getTPrice() %>">
                    <input type="hidden" name="description" value="<%= trip.getBrDescription() %>">
                    <input type="hidden" name="distance" value="<%= trip.getBrDistance() %>">
                    <button type="submit">Chọn chuyến</button>
                </form>
            </td>
        </tr>
    <% } %>
</tbody>
        </table>
    <% } %>
</body>
</html>
