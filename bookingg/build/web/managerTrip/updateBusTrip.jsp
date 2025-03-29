<%-- 
    Document   : updateBusTrip
    Created on : Mar 6, 2025, 9:06:08 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.managerTrip.BusTrips" %>
<% 
    BusTrips busTrips = (BusTrips) request.getAttribute("busTrips"); 
    if (busTrips == null) {
        busTrips = new BusTrips(); // Tránh lỗi nếu busRoute chưa được set
    }
%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title>Cập nhập chuyến xe - BusGo</title>
        <link rel="shortcut icon" href="assets/images/logo/logo_01_1.png">

        <!-- Framework - CSS include -->
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

        <!-- Icon - CSS include -->
        <link rel="stylesheet" type="text/css" href="assets/css/fontawesome.css">

        <!-- Animation - CSS include -->
        <link rel="stylesheet" type="text/css" href="assets/css/aos.css">
        <link rel="stylesheet" type="text/css" href="assets/css/animate.css">

        <!-- Carousel - CSS include -->
        <link rel="stylesheet" type="text/css" href="assets/css/slick.css">
        <link rel="stylesheet" type="text/css" href="assets/css/slick-theme.css">

        <!-- Popup - CSS include -->
        <link rel="stylesheet" type="text/css" href="assets/css/magnific-popup.css">

        <!-- Select options - CSS include -->
        <link rel="stylesheet" type="text/css" href="assets/css/nice-select.css">

        <!-- Pricing range - CSS include -->
        <link rel="stylesheet" type="text/css" href="assets/css/jquery-ui.css">

        <!-- Custom - CSS include -->
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">  
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
                            <li><a class="nav-link text-secondary" href="BusTripURL?service=insert"><i class="fas fa-plus"></i> Thêm chuyến xe</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <!--End-Sidebar -->

            <!-- Main Content -->
            <main class="flex-grow-1 p-4">
                <!-- Header -->
                <header class="d-flex justify-content-between align-items-center mb-3">
                    <h2>Danh Sách Tuyến Xe</h2>
                </header>

                <!-- Breadcrumb -->
                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Trang Chủ</a></li>
                        <li class="breadcrumb-item"><a href="BusTripURL?service=listOfAll">Quản lý chuyến xe</a></li>
                        <li class="breadcrumb-item active">Sửa chuyến Xe</li>
                    </ol>
                </nav>

                <!-- Form chỉnh sửa chuyến xe -->
                <div class="bg-white p-4 shadow rounded">
                    <form action="BusTripURL" method="get">
                        <input type="hidden" name="service" value="update">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="bt1_id" class="form-label">Mã Chuyến</label>
                                <input type="text" class="form-control" id="bt1_id" name="bt1_id" value="<%=busTrips.getBt1_id()%>" readonly>
                            </div>
                            <div class="col-md-6">
                                <label for="bt1_date" class="form-label">Ngày</label>
                                <input type="date" class="form-control" id="bt1_date" name="bt1_date" value="<%=busTrips.getBt1_date()%>" required>
                            </div>
                            <div class="col-md-6">
                                <label for="bt1_departureTime" class="form-label">Thời điểm đi</label>
                                <input type="time" class="form-control" id="bt1_departureTime" name="bt1_departureTime" value="<%=busTrips.getBt1_departureTime()%>" required>
                            </div>
                            <div class="col-md-6">
                                <label for="bt1_arrivalTime" class="form-label">Thời điểm đến</label>
                                <input type="time" class="form-control" id="bt1_arrivalTime" name="bt1_arrivalTime" value="<%=busTrips.getBt1_arrivalTime()%>" required>
                            </div>
                            <div class="col-md-6 d-flex flex-column">
                                <label for="bt1_status" class="form-label">Trạng thái</label>
                                <select class="form-select" id="bt1_status" name="bt1_status">
                                    <option value="active" <%= "active".equals(busTrips.getBt1_status()) ? "selected" : "" %>>active</option>
                                    <option value="inactive" <%= "inactive".equals(busTrips.getBt1_status()) ? "selected" : "" %>>inactive</option>
                                    <option value="complete" <%= "complete".equals(busTrips.getBt1_status()) ? "selected" : "" %>>complete</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label for="br_id" class="form-label">Mã tuyến</label>
                                <input type="text" class="form-control" id="br_id" name="br_id" value="<%=busTrips.getBr_id()%>" required>
                            </div>
                        </div>
                        <div class="mt-4">
                            <button type="submit" name="submit" class="btn btn-success">Cập nhật chuyến xe</button>
                            <button type="reset" class="btn btn-secondary">Xóa</button>
                        </div>
                    </form>
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
        </script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

