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
        <form action="ConfirmationURL" method="get">
            <input type="hidden" name="service" value="Confirmation">
            <p><strong>Tuyen:</strong> <%= request.getAttribute("routeName") %></p>
            <p><strong>Chuyen:</strong> <%= request.getAttribute("tripName") %></p>
            <p><strong>Ghe Da Chon:</strong></p>
            <ul>
                <c:forEach var="seatName" items="${seatNames}">
                    <li>${seatName}</li>
                    </c:forEach>
            </ul>
            <p><strong>Tổng giá:</strong> <%= request.getAttribute("totalPrice") %> VNĐ</p>
            <input type="hidden" name="vehicleId" value="1">
            <input type="hidden" name="tripId" value="1">
            <input type="hidden" name="routeId" value="1">
            <input type="hidden" name="customerId" value="1">
            <c:forEach var="id" items="${seatIds}">
                <input type="hidden" name="seatId" value="${id}">
            </c:forEach>
            <input type="submit" value="Thanh toán">
        </form>
    </body>
</html>

