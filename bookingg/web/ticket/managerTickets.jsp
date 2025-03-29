<%-- 
    Document   : managerTickets
    Created on : Mar 20, 2025, 10:05:59 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList, model.ticket.Ticket" %>
<%
    ArrayList<Ticket> tickets = (ArrayList<Ticket>) request.getAttribute("tickets");
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        
        <title>Danh sách vé - BusGo</title>
        <link rel="shortcut icon" href="assets/images/logo/logo_01_1.png">

        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/fontawesome.css">
        <link rel="stylesheet" type="text/css" href="assets/css/aos.css">
        <link rel="stylesheet" type="text/css" href="assets/css/animate.css">
        <link rel="stylesheet" type="text/css" href="assets/css/slick.css">
        <link rel="stylesheet" type="text/css" href="assets/css/slick-theme.css">
        <link rel="stylesheet" type="text/css" href="assets/css/magnific-popup.css">
        <link rel="stylesheet" type="text/css" href="assets/css/nice-select.css">
        <link rel="stylesheet" type="text/css" href="assets/css/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <style>
            .pagination {
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 10px;
                margin: 20px 0;
                font-family: Arial, sans-serif;
            }

            .page-link {
                text-decoration: none;
                padding: 8px 12px;
                border: 1px solid #ddd;
                border-radius: 5px;
                color: #333;
                background-color: #fff;
                transition: all 0.3s ease;
            }

            .page-link:hover {
                background-color: #f0f0f0;
                border-color: #aaa;
            }

            .page-link.active {
                background-color: #007bff;
                color: #fff;
                border-color: #007bff;
                pointer-events: none;
            }

            .prev, .next {
                font-weight: bold;
            }

            .prev::before {
                content: "« ";
            }

            .next::after {
                content: " »";
            }
        </style>
    </head>
    <body class="bg-light">
        <div class="d-flex">          
            <!-- Sidebar -->
            <nav class="bg-white shadow p-3 vh-100" style="width: 300px">
                <div class="text-center mb-4">
                    <img src="assets/images/logo/logo_01_1.png" srcset="assets/images/logo/logo_01_1.png 2x" alt="logo_not_found">
                    <h4 class="mt-2">BusGo</h4>
                </div>
                <ul class="nav flex-column">
                    <!-- Quản lý vé Xe -->
                    <li class="nav-item">
                        <a class="nav-link fw-bold text-dark" href="TicketURL?service=listOfAll" id="toggleTicket">
                            <i class="fas fa-bus"></i> Quản lý Vé Xe
                        </a>
                        <ul class="list-unstyled ps-3 d-none text-muted" id="ticketMenu">
                            <li><a class="nav-link text-secondary active bg-light" href="TicketURL?service=listOfAll"><i class="fas fa-ticket"></i> Danh sách Vé xe</a></li>
                        </ul>
                    </li>
                    <!-- Quản lý Tuyến Xe -->
                    <li class="nav-item">
                        <a class="nav-link fw-bold text-dark" href="#" id="toggleBusRoute">
                            <i class="fas fa-bus"></i> Quản lý Tuyến Xe
                        </a>
                        <ul class="list-unstyled ps-3 d-none text-muted" id="busRouteMenu">
                            <li><a class="nav-link text-secondary" href="BusRouteURL?service=listOfAll"><i class="fas fa-list"></i> Danh sách tuyến xe</a></li>
                            <li><a class="nav-link text-secondary " href="BusRouteURL?service=insert"><i class="fas fa-plus"></i> Thêm tuyến xe</a></li>
                        </ul>
                    </li>

                    <!-- Quản lý Chuyến Xe -->
                    <li class="nav-item">
                        <a class="nav-link fw-bold text-dark" href="#" id="toggleBusTrip">
                            <i class="fas fa-route"></i> Quản lý Chuyến xe
                        </a>
                        <ul class="list-unstyled ps-3 d-none text-muted" id="busTripMenu">
                            <li><a class="nav-link text-secondary" href="BusTripURL?service=listOfAll"><i class="fas fa-list"></i> Danh sách chuyến xe</a></li>
                            <li><a class="nav-link text-secondary" href="BusTripURL?service=insert"><i class="fas fa-plus"></i> Thêm chuyến xe</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <!--End-Sidebar -->
            <!-- Main Content -->
            <main class="col-md-10 ml-sm-auto px-4">
                <div class="d-flex justify-content-between align-items-center py-3">
                    <h2>Danh Sách Tuyến Xe</h2>
                </div>
                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Trang Chủ</a></li>
                        <li class="breadcrumb-item"><a href="TicketURL?service=listOfAll">Quản lý vé xe</a></li>
                        <li class="breadcrumb-item active">Danh sách vé Xe</li>
                    </ol>
                </nav>
                <c:if test="${not empty message}">
                    <div style="color: red; font-weight: bold; margin-bottom: 10px;">
                        ${message}
                    </div>
                </c:if>
                <div class="card p-4 mb-4">
                    <form action="TicketURL" method="get" class="form-inline mb-3">
                        <input type="hidden" name="service" value="listOfAll">                        
                        <label class="mr-2" for="br_from">Điểm đi:</label>
                        <input class="form-control mr-3" type="text" name="br_from" id="br_from" value="${br_from}">
                        <label class="mr-2" for="br_to">Điểm đến:</label>
                        <input class="form-control mr-3" type="text" name="br_to" id="br_to" value="${br_to}">
                        <label class="mr-2" for="purchaseDate">Ngày mua vé:</label>
                        <input class="form-control mr-3" type="date" name="purchaseDate" id="purchaseDate" value="${purchaseDate}">
                        <label class="mr-2" for="departureDate">Ngày khởi hành:</label>
                        <input class="form-control mr-3" type="date" name="departureDate" id="departureDate" value="${departureDate}">
                        <button class="btn btn-primary" type="submit" name="submit">Search</button>
                        <button type="reset" class="btn btn-secondary" onclick="resetForm()">Xóa</button>
                    </form>
                </div>
                <div class="card p-4">
                    <table class="table table-bordered mt-4">
                        <thead class="thead-dark">
                            <tr>
                                <th>ID</th>
                                <th>Khách hàng</th>
                                <th>Địa điểm</th>
                                <th>Ngày mua vé</th>
                                <th>Ngày Khởi hành</th>
                                <th>Thời gian</th>
                                <th>Chỗ ngồi</th>
                                <th>Loại xe</th>
                                <th>Biển số</th>
                                <th>Giá</th>
                                <th>Trạng thái</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for(Ticket ticket : tickets) { %>
                            <tr>
                                <td><%= ticket.getTicketID() %></td>
                                <td><%= ticket.getCustomerName() %></td>
                                <td><%= ticket.getDeparture() %> - <%= ticket.getDestination() %></td>
                                <td><%= ticket.getPurchaseDate() %></td>
                                <td><%= ticket.getTravelDate() %></td>
                                <td><%= ticket.getDepartureTime() %> - <%= ticket.getArrivalTime() %></td>
                                <td><%= ticket.getSeatName() %></td>
                                <td><%= ticket.getVehicleType() %></td>
                                <td><%= ticket.getLicensePlate() %></td>
                                <td><%= ticket.getPrice() %> VND</td>
                                <td><%= ticket.getStatus() %></td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
                <div class="pagination">
                    <c:if test="${currentPage > 1}">
                        <a href="TicketURL?service=listOfAll&page=${currentPage - 1}" class="page-link prev">Trang trước</a>
                    </c:if>

                    <c:forEach begin="1" end="${endPage}" var="i">
                        <a href="TicketURL?service=listOfAll&page=${i}" class="${i == currentPage ? 'page-link active' : 'page-link'}">${i}</a>
                    </c:forEach>

                    <c:if test="${currentPage < endPage}">
                        <a href="TicketURL?service=listOfAll&page=${currentPage + 1}" class="page-link next">Trang tiếp</a>
                    </c:if>
                </div>
            </main>
        </div>
    </div>
    <script>
        // Toggle danh sách Tuyến Xe
        document.getElementById("toggleBusRoute").addEventListener("click", function (event) {
            event.preventDefault();
            document.getElementById("busRouteMenu").classList.toggle("d-none");
        });

        // Toggle danh sách Chuyến Xe
        document.getElementById("toggleBusTrip").addEventListener("click", function (event) {
            event.preventDefault();
            document.getElementById("busTripMenu").classList.toggle("d-none");
        });
        // Toggle danh sách Vé Xe
        document.getElementById("toggleTicket").addEventListener("click", function (event) {
            event.preventDefault();
            document.getElementById("ticketMenu").classList.toggle("d-none");
        });
        // Kiểm tra URL hiện tại để giữ menu mở
        window.addEventListener("DOMContentLoaded", function () {
            const currentUrl = window.location.href;
            if (currentUrl.includes("TicketURL?service=listOfAll")) {
                document.getElementById("ticketMenu").classList.remove("d-none");
            }
        });
    </script>
    <script>
        function resetForm() {
            window.location.href = "TicketURL?service=listOfAll"; // Điều hướng về trang gốc
        }
    </script>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>

