<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thanh toán</title>
    </head>
    <body>
        <h2>Thông tin đặt vé</h2>
        <form action="/vnpay_jsp/vnpay_pay.jsp" method="get">
            <p><strong>Điểm đi:</strong> <%= session.getAttribute("from") %></p>
            <p><strong>Điểm đến:</strong> <%= session.getAttribute("to") %></p>
            <p><strong>Thời gian đi:</strong> <%= session.getAttribute("departureTime") %></p>
            <p><strong>Thời gian đến:</strong> <%= session.getAttribute("arrivalTime") %></p>
            <p><strong>Ghế đã chọn:</strong></p>
            <ul>
                <c:forEach var="seatName" items="${seatNames}">
                    <li>${seatName}</li>
                </c:forEach>
            </ul>
            <p><strong>Tổng giá:</strong> <%= request.getAttribute("totalPrice") %> VNĐ</p>
            <!-- Thêm các thông tin cần thiết cho thanh toán nếu có -->
            <input type="hidden" name="totalPrice" value="<%= request.getAttribute("totalPrice") %>">
            <input type="submit" value="Thanh toán">
        </form>
    </body>
</html>
