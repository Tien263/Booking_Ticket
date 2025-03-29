<%-- 
    Document   : insertBusTrip
    Created on : Mar 6, 2025, 8:38:50 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet" %>
<%
        ResultSet rsBusRoute =(ResultSet)request.getAttribute("rsBusRoute");
        ResultSet rsVehicle =(ResultSet)request.getAttribute("rsVehicle");
%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        
        <title>Thêm tuyến xe - BusGo</title>
        <link rel="shortcut icon" href="assets/images/logo/logo_01_1.png">

        <!-- CSS Libraries -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/aos.css">
        <link rel="stylesheet" href="assets/css/animate.css">
        <link rel="stylesheet" href="assets/css/slick.css">
        <link rel="stylesheet" href="assets/css/slick-theme.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="assets/css/jquery-ui.css">
        <link rel="stylesheet" href="assets/css/style.css">
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
                            <li><a class="nav-link text-secondary" href="TicketURL?service=listOfAll"><i class="fas fa-ticket"></i> Danh sách Vé xe</a></li>
                        </ul>
                    </li>
                    <!-- Quản lý Tuyến Xe -->
                    <li class="nav-item">
                        <a class="nav-link fw-bold text-dark" href="#" id="toggleBusRoute">
                            <i class="fas fa-bus"></i> Quản lý Tuyến Xe
                        </a>
                        <ul class="list-unstyled ps-3 d-none text-muted" id="busRouteMenu">
                            <li><a class="nav-link text-secondary" href="BusRouteURL?service=listOfAll"><i class="fas fa-list"></i> Danh sách tuyến xe</a></li>
                            <li><a class="nav-link text-secondary" href="BusRouteURL?service=insert"><i class="fas fa-plus"></i> Thêm tuyến xe</a></li>
                        </ul>
                    </li>

                    <!-- Quản lý Chuyến Xe -->
                    <li class="nav-item">
                        <a class="nav-link fw-bold text-dark" href="#" id="toggleBusTrip">
                            <i class="fas fa-route"></i> Quản lý Chuyến xe
                        </a>
                        <ul class="list-unstyled ps-3 d-none text-muted" id="busTripMenu">
                            <li><a class="nav-link text-secondary" href="BusTripURL?service=listOfAll"><i class="fas fa-list"></i> Danh sách chuyến xe</a></li>
                            <li><a class="nav-link text-secondary active bg-light" href="BusTripURL?service=insert"><i class="fas fa-plus"></i> Thêm chuyến xe</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <!--End-Sidebar -->
            <!-- Main Content -->
            <main class="col-md-10 ml-sm-auto px-4">
                <div class="container-fluid p-4">
                    <header class="d-flex justify-content-between align-items-center mb-4">
                        <h2>Thêm Chuyến Xe</h2>
                    </header>
                    <nav>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Trang Chủ</a></li>
                            <li class="breadcrumb-item"><a href="BusTripURL?service=listOfAll">Quản lý chuyến xe</a></li>
                            <li class="breadcrumb-item active">Thêm chuyến Xe</li>
                        </ol>
                    </nav>
                    <div class="card p-4 rounded shadow">
                        <form action="BusTripURL" method="get">
                            <input type="hidden" name="service" value="insert">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label" for="year">Năm</label>
                                    <select class="form-control" id="year" name="year" required>
                                        <% for (int i = 2025; i <= 2030; i++) { %>
                                        <option value="<%= i %>"><%= i %></option>
                                        <% } %>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label" for="month">Tháng</label>
                                    <select class="form-control" id="month" name="month" required>
                                        <% for (int i = 1; i <= 12; i++) { %>
                                        <option value="<%= i %>">Tháng <%= i %></option>
                                        <% } %>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label" for="bt1_departureTime">Thời điểm đi</label>
                                    <input type="time" class="form-control" id="bt1_departureTime" name="bt1_departureTime" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label" for="bt1_arrivalTime">Thời điểm đến</label>
                                    <input type="time" class="form-control" id="bt1_arrivalTime" name="bt1_arrivalTime" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label" for="bt1_status">Trạng thái</label>
                                    <input type="text" class="form-control" id="bt1_status" name="bt1_status" value="active" readonly>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label" for="br_id">Mã Tuyến</label>
                                    <select class="form-control" id="br_id" name="br_id" required>
                                        <% while (rsBusRoute.next()) { %>
                                        <option value="<%= rsBusRoute.getInt(1) %>"><%= rsBusRoute.getString(2) %> - <%= rsBusRoute.getString(3) %></option>
                                        <% } %>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label" for="vehicleId">Biển số xe</label>
                                    <select class="form-control" id="vehicleId" name="vehicleId" required>
                                        <% while (rsVehicle.next()) { %>
                                        <option value="<%= rsVehicle.getInt(1) %>"><%= rsVehicle.getString(2) %></option>
                                        <% } %>
                                    </select>
                                </div>
                            </div>
                            <div class="mt-4">
                                <button type="submit" name="submit" class="btn btn-success">Thêm chuyến xe</button>
                                <button type="reset" class="btn btn-secondary">Clear</button>
                            </div>
                        </form>
                    </div>
                </div>
            </main>
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
                if (currentUrl.includes("BusTripURL?service=listOfAll") || currentUrl.includes("BusTripURL?service=insert")) {
                    document.getElementById("busTripMenu").classList.remove("d-none");
                }
            });
        </script>
    </body>
</html>
