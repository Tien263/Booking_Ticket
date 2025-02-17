<%-- 
    Document   : selectSeats
    Created on : Feb 5, 2025, 11:16:59 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="dal.DAOSeats" %>
<%@ page import="entity.accesscontrol.Seats" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Chọn Ghế</title>
        <style>
            .seat-container {
                display: flex;
                justify-content: center;
                gap: 40px;
            }
            .seat-section {
                display: grid;
                grid-template-columns: repeat(2, 50px);
                gap: 10px;
            }
            .seat {
                width: 50px;
                height: 50px;
                text-align: center;
                line-height: 50px;
                border-radius: 10px;
                cursor: pointer;
                font-weight: bold;
            }
            .available {
                background-color: #BDE0FE;
            }  /* Còn trống */
            .booked {
                background-color: #D3D3D3;
                pointer-events: none;
            }  /* Đã bán */
            .selected {
                background-color: #FFD3D3;
            } /* Đang chọn */
        </style>
        <script>
            function toggleSeat(seat) {
                if (!seat.classList.contains('booked')) {
                    seat.classList.toggle('selected');
                    let checkbox = seat.querySelector("input[type='checkbox']");
                    checkbox.checked = !checkbox.checked; // Đánh dấu checkbox khi ghế được chọn
                }
            }
        </script>
    </head>
    <body>
        <h2>Chọn ghế</h2>
        <form action="BookTicketURL" method="get">
            <input type="hidden" name="service" value="selectSeat">
            <div class="seat-container">
                <!-- Tầng dưới -->
                <div>
                    <h3>Tầng dưới</h3>
                    <div class="seat-section">
                        <%
                            DAOSeats seatDao = new DAOSeats();
                            List<Seats> seats = seatDao.getSeats(1, 1); // Lấy danh sách ghế cho tripId=1, vehicleId=1
                            boolean hasUpperDeck = false; // Biến kiểm tra có tầng trên không

                            for (Seats seat : seats) {
                                if (seat.getLevel() == 2) { 
                                    hasUpperDeck = true; // Nếu có ghế tầng trên, set true
                                }
                            }

                            for (Seats seat : seats) {
                                if (seat.getLevel() == 1) { // Chỉ lấy ghế tầng dưới
                                    String cssClass = seat.isAvailable() ? "seat available" : "seat booked";
                        %>
                        <div class="<%= cssClass %>" onclick="toggleSeat(this)">
                            <input type="checkbox" name="seatId" value="<%= seat.getS_id() %>" hidden>
                            <%= seat.getS_name() %>
                        </div>
                        <% } } %>
                    </div>
                </div>

                <% if (hasUpperDeck) { %>
                <!-- Nếu có tầng trên thì hiển thị -->
                <div>
                    <h3>Tầng trên</h3>
                    <div class="seat-section">
                        <% for (Seats seat : seats) {
                            if (seat.getLevel() == 2) {
                                String cssClass = seat.isAvailable() ? "seat available" : "seat booked";
                        %>
                        <div class="<%= cssClass %>" onclick="toggleSeat(this)">
                            <input type="checkbox" name="seatId" value="<%= seat.getS_id() %>" hidden>
                            <%= seat.getS_name() %>
                        </div>
                        <% } } %>
                    </div>
                    <% } %>
                </div>
                <!-- Thông tin ẩn -->
                <input type="hidden" name="vehicleId" value="1">
                <input type="hidden" name="tripId" value="1">
                <input type="hidden" name="routeId" value="1">
                <input type="hidden" name="customerId" value="1">
                <input type="hidden" name="price" value="10.0">
                <input type="submit" value="Xác nhận đặt vé">
        </form>
    </body>
</html>


