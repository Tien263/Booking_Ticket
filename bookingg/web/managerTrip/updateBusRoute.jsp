<%-- 
    Document   : updateBusRoute
    Created on : Mar 6, 2025, 7:00:25 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.managerTrip.BusRoute" %>
<% 
    BusRoute busRoute = (BusRoute) request.getAttribute("busRoute"); 
    if (busRoute == null) {
        busRoute = new BusRoute(); // Tránh lỗi nếu busRoute chưa được set
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Cập nhập tuyến xe - BusGo</title>
        <link rel="shortcut icon" href="assets/images/logo/logo_01_1.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/fontawesome.css">
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
                            <li><a class="nav-link text-secondary " href="BusTripURL?service=insert"><i class="fas fa-plus"></i> Thêm chuyến xe</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <!--End-Sidebar -->

            <!-- Main Content -->
            <div class="flex-grow-1 p-4">
                <!-- Header -->
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h1 class="h4">Sửa Tuyến Xe</h1>
                </div>
                <!-- Breadcrumb -->
                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Trang Chủ</a></li>
                        <li class="breadcrumb-item"><a href="BusRouteURL?service=listOfAll">Quản lý tuyến xe</a></li>
                        <li class="breadcrumb-item active">Sửa tuyến Xe</li>
                    </ol>
                </nav>
                <!-- Form -->
                <div class="bg-white p-4 shadow rounded">
                    <form action="BusRouteURL" method="post">
                        <input type="hidden" name="service" value="update">
                        <div class="row">
                            <div class="col-md-6">
                                <label class="form-label">Mã Tuyến</label>
                                <input type="text" class="form-control" name="br_id" value="<%=busRoute.getBr_id()%>" readonly>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Điểm đi</label>
                                <input type="text" class="form-control" name="br_from" value="<%=busRoute.getBr_from()%>" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Điểm đến</label>
                                <input type="text" class="form-control" name="br_to" value="<%=busRoute.getBr_to()%>" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Giá</label>
                                <input type="text" class="form-control" name="br_price" value="<%=busRoute.getBr_price()%>" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Khoảng Cách</label>
                                <input type="text" class="form-control" name="br_distance" value="<%=busRoute.getBr_distance()%>" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Mô tả</label>
                                <input type="text" class="form-control" name="br_description" value="<%=busRoute.getBr_description()%>" required>
                            </div>
                            <div class="col-md-6 d-flex flex-column">
                                <label class="form-label" for="br_status">Trạng thái</label>
                                <select class="form-select" id="br_status" name="br_status">
                                    <option value="active" <%= "active".equals(busRoute.getBr_status()) ? "selected" : "" %>>active</option>
                                    <option value="inactive" <%= "inactive".equals(busRoute.getBr_status()) ? "selected" : "" %>>inactive</option>
                                </select>
                            </div>
                        </div>
                        <div class="mt-4">
                            <button type="submit" name="submit" class="btn btn-success">Sửa tuyến xe</button>
                        </div>
                    </form>
                </div>
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
        </script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
    </body>
</html>