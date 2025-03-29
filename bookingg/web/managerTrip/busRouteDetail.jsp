<%-- 
    Document   : busRouteDetail.jsp
    Created on : Mar 12, 2025, 9:11:11 AM
    Author     : Admin
--%>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@page import="model.managerTrip.BusRoute" %>
<%
    BusRoute busRoute = (BusRoute) request.getAttribute("busRoute");
%>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Chi Tiết Tuyến Xe - BusGo</title>
        <link rel="shortcut icon" href="assets/images/logo/logo_01_1.png">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    </head>
    <body class="container mt-4">
        <h2>Chi Tiết Tuyến Xe</h2>
        <table class="table table-bordered">
            <tr>
                <th>Mã Tuyến</th>
                <td><%= busRoute.getBr_id() %></td>
            </tr>
            <tr>
                <th>Điểm xuất phát</th>
                <td><%= busRoute.getBr_from()%></td>
            </tr>
            <tr>
                <th>Điểm kết thúc</th>
                <td><%= busRoute.getBr_to()%></td>
            </tr>
            <tr>
                <th>Khoảng cách(km)</th>
                <td><%= busRoute.getBr_distance() %></td>
            </tr>
            <tr>
                <th>Giá</th>
                <td><%= busRoute.getBr_price() %></td>
            </tr>
            <tr>
                <th>Mô tả</th>
                <td><%= busRoute.getBr_description() %></td>
            </tr>
        </table>
        <a href="BusTripURL?service=listOfAll" class="btn btn-secondary">Quay lại</a>
    </body>
</html>

