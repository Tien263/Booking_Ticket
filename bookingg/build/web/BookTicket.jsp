<%-- 
    Document   : confimation
    Created on : Feb 5, 2025, 11:17:32 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Xác nhận Đặt Vé</title>
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }
            th, td {
                padding: 10px;
                text-align: left;
                border: 1px solid #ddd;
            }
            th {
                background-color: #f2f2f2;
                font-weight: bold;
            }
            .price-section {
                margin-top: 20px;
                font-size: 16px;
            }
            .price-section p {
                margin: 5px 0;
            }
            .price-section .original-price {
                text-decoration: line-through;
                color: #888;
            }
            .price-section .discount {
                color: green;
            }
            .price-section .final-price {
                font-weight: bold;
                color: #d32f2f;
            }
            button {
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            button:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <h2>Thông tin vé của bạn</h2>
        <table border="1"> <!-- Bảng in ra vé -->
            <tr>
                <th>Mã vé</th>
                <th>Tên khách hàng</th>
                <th>Số điện thoại</th>
                <th>Ngày đặt vé</th>
                <th>Địa điểm</th>
                <th>Thời gian</th>
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
                    <td>${ticket.t_id}</td>
                    <td>${ticket.c_fullname}</td>
                    <td>${ticket.c_phone}</td>
                    <td>${ticket.bt_bookingDate}</td>
                    <td>${ticket.br_adress}</td>
                    <td>${ticket.bt1_time}</td>
                    <td>${ticket.s_name}</td>
                    <td><fmt:formatNumber value="${ticket.br_price}" type="number" groupingUsed="true"/> VNĐ</td>
                </tr>
            </c:forEach>
        </table>

        <div class="price-section">
            <%-- Hiển thị thông tin giá tiền --%>
            <c:choose>
                <c:when test="${not empty sessionScope.totalPriceAfterDiscount}">
                    <p class="final-price">
                        <strong>Tổng giá (sau giảm giá):</strong> 
                        <fmt:formatNumber value="${sessionScope.totalPriceAfterDiscount}" type="number" groupingUsed="true"/> VNĐ
                    </p>
                    <p class="discount">
                        <strong>Giảm giá:</strong> 
                        <fmt:formatNumber value="${sessionScope.discountApplied}" type="number" groupingUsed="true"/> VNĐ
                    </p>
                    <p class="original-price">
                        <strong>Giá gốc:</strong> 
                        <fmt:formatNumber value="${sessionScope.totalPrice}" type="number" groupingUsed="true"/> VNĐ
                    </p>
                </c:when>
                <c:otherwise>
                    <p class="final-price">
                        <strong>Tổng giá:</strong> 
                        <fmt:formatNumber value="${sessionScope.totalPrice}" type="number" groupingUsed="true"/> VNĐ
                    </p>
                </c:otherwise>
            </c:choose>
        </div>

        <form action="payment" method="post">
            <input type="hidden" name="tripId" value="${sessionScope.tripId}">
            <%-- Sử dụng totalPriceAfterDiscount nếu có, nếu không thì dùng totalPrice --%>
            <input type="hidden" name="totalPrice" value="${not empty sessionScope.totalPriceAfterDiscount ? sessionScope.totalPriceAfterDiscount : sessionScope.totalPrice}">
            <button type="submit">Thanh toán</button>
        </form>
    </body>
</html>