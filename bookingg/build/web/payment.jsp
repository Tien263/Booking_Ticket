<%-- 
    Document   : payment
    Created on : Feb 14, 2025, 7:52:41 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thanh toan</title>
    </head>
    <body>
        <h2>Thong tin dat ve</h2>
        <form action="BookTicketURL" method="get">
            <p><strong>Điểm đi:</strong> <%= request.getAttribute("routeFrom") %></p>
            <p><strong>Điểm đến:</strong> <%= request.getAttribute("routeTo") %></p>
            <p><strong>Thời gian đi:</strong> <%= request.getAttribute("departureTime") %></p>
            <p><strong>Thời gian đến:</strong> <%= request.getAttribute("arrivalTime") %></p>
            <p><strong>Ghe Da Chon:</strong></p>
            <ul>
                <c:forEach var="seatName" items="${seatNames}">
                    <li>${seatName}</li>
                    </c:forEach>
            </ul>
            <p><strong>Tổng giá:</strong> <%= request.getAttribute("totalPrice") %> VNĐ</p>
            <input type="hidden" name="vehicleId" value="<%= request.getAttribute("vehicleId") %>">
            <input type="hidden" name="tripId" value="<%= request.getAttribute("tripId") %>">
            <input type="hidden" name="routeId" value="<%= request.getAttribute("routeId") %>">
            <input type="hidden" name="customerId" value="<%= request.getAttribute("customerId") %>">
            <c:forEach var="id" items="${seatIds}">
                <input type="hidden" name="seatId" value="${id}">
            </c:forEach>
            <input type="submit" value="Thanh toán">
        </form>
    </body>
</html>

