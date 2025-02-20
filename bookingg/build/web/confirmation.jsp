<%-- 
    Document   : confimation
    Created on : Feb 5, 2025, 11:17:32 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Xác nhận Đặt Vé</title>     
    </head>
    <body>
        <h2>Thông tin vé của bạn</h2>
        <table border="1"> <!-- Table in ra vé -->
            <tr>
                <th>Mã vé</th>
                <th>Tên khách hàng</th>
                <th>Số điện thoại</th>
                <th>Ngày đặt vé</th>
                <th>Điểm đi</th>
                <th>Điểm đến</th>
                <th>Thời gian đi</th>
                <th>Thời gian đến</th>
                <th>Ghế</th>
                <th>Giá</th>
            </tr>
            <%-- Kiểm tra danh sách bookedTickets có dữ liệu không --%>
            <c:choose>
                <c:when test="${not empty bookedTickets}">
                    <p style="color: green;">Danh sách vé đã được truyền thành công!</p>
                </c:when>
                <c:otherwise>
                    <p style="color: red;">Không có vé nào được truyền sang trang này.</p>
                </c:otherwise>
            </c:choose>

            <c:forEach var="ticket" items="${bookedTickets}">
                <tr>
                    <td>${ticket.getBt_id()}</td>
                    <td>${ticket.getC_fullname()}</td>
                    <td>${ticket.getC_phone()}</td>
                    <td>${ticket.getBt_bookingDate()}</td>
                    <td>${ticket.getBr_from()}</td>
                    <td>${ticket.getBr_to()}</td>
                    <td>${ticket.getBt1_departureTime()}</td>
                    <td>${ticket.getBt1_arrivalTime()}</td>
                    <td>${ticket.getS_name()}</td>
                    <td>${ticket.getT_price()} VNĐ</td>
                </tr>
            </c:forEach>
        </table>
        <br>
        <a href="selectSeat.jsp">Đặt vé mới</a>
    </body>
</html>
