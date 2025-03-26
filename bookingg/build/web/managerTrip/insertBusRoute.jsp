<%-- 
    Document   : InsertBusRoute
    Created on : Mar 6, 2025, 4:36:36 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>My Bus - Thêm tuyến xe</title>

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
                            <li><a class="nav-link text-secondary active bg-light" href="BusRouteURL?service=insert"><i class="fas fa-plus"></i> Thêm tuyến xe</a></li>
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
                <div class="container-fluid p-4">
                    <header class="d-flex justify-content-between align-items-center mb-4">
                        <h2>Thêm Tuyến Xe</h2>
                    </header>
                    <!-- Breadcrumb -->
                    <nav>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Trang Chủ</a></li>
                            <li class="breadcrumb-item"><a href="BusRouteURL?service=listOfAll">Quản lý tuyến xe</a></li>
                            <li class="breadcrumb-item active">Thêm tuyến Xe</li>
                        </ol>
                    </nav>
                    <div class="card p-4 rounded shadow">
                        <form action="BusRouteURL" method="get">
                            <input type="hidden" name="service" value="insert">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label for="br_id" class="form-label">Mã Tuyến</label>
                                    <input type="text" class="form-control" id="br_id" name="br_id" readonly>
                                </div>
                                <div class="col-md-6">
                                    <label for="br_from" class="form-label">Điểm đi</label>
                                    <input type="text" class="form-control" id="br_from" name="br_from" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="br_to" class="form-label">Điểm đến</label>
                                    <input type="text" class="form-control" id="br_to" name="br_to" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="br_price" class="form-label">Giá</label>
                                    <input type="text" class="form-control" id="br_price" name="br_price" required>
                                </div>

                                <div class="col-md-6">
                                    <label for="br_distance" class="form-label">Khoảng Cách (km)</label>
                                    <input type="text" class="form-control" id="br_distance" name="br_distance" >
                                </div>
                                <div class="col-md-6">
                                    <label for="br_description" class="form-label">Mô tả</label>
                                    <input type="text" class="form-control" id="br_description" name="br_description" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="br_status" class="form-label">Trạng thái</label>
                                    <input type="text" class="form-control" id="br_status" name="br_status" value="active" readonly>
                                </div>
                            </div>
                            <div class="mt-4">
                                <button type="submit" name="submit" class="btn btn-success">Thêm tuyến xe</button>
                                <button type="reset" class="btn btn-secondary">Clear</button>
                            </div>
                        </form>
                    </div>
<<<<<<< HEAD
=======
                </header>
                <!-- Breadcrumb -->
                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Trang Chủ</a></li>
                        <li class="breadcrumb-item"><a href="BusRouteURL?service=listOfAll">Quản lý tuyến xe</a></li>
                        <li class="breadcrumb-item active">Thêm tuyến Xe</li>
                    </ol>
                </nav>
                <div class="card p-4">
                    <form action="BusRouteURL" method="get">
                        <input type="hidden" name="service" value="insert">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="br_id" class="form-label">Mã Tuyến</label>
                                <input type="text" class="form-control" id="br_id" name="br_id" readonly>
                            </div>
                            <div class="col-md-6">
                                <label for="br_from" class="form-label">Điểm đi</label>
                                <input type="text" class="form-control" id="br_from" name="br_from" required>
                            </div>
                            <div class="col-md-6">
                                <label for="br_to" class="form-label">Điểm đến</label>
                                <input type="text" class="form-control" id="br_to" name="br_to" required>
                            </div>
                            <div class="col-md-6">
                                <label for="br_price" class="form-label">Giá</label>
                                <input type="text" class="form-control" id="br_price" name="br_price" required>
                            </div>

                            <div class="col-md-6">
                                <label for="br_distance" class="form-label">Khoảng Cách (km)</label>
                                <input type="text" class="form-control" id="br_distance" name="br_distance" >
                            </div>
                            <div class="col-md-6">
                                <label for="br_description" class="form-label">Mô tả</label>
                                <input type="text" class="form-control" id="br_description" name="br_description" required>
                            </div>
                            <div class="col-md-6">
                                <label for="br_status" class="form-label">Trạng thái</label>
                                <input type="text" class="form-control" id="br_status" name="br_status" value="active" readonly>
                            </div>
                        </div>
                        <div class="mt-4">
                            <button type="submit" name="submit" class="btn btn-success">Thêm tuyến xe</button>
                            <button type="reset" class="btn btn-secondary">Clear</button>
                        </div>
                    </form>
>>>>>>> main
                </div>
            </main>
        </div>
<<<<<<< HEAD
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
                if (currentUrl.includes("BusRouteURL?service=insert") || currentUrl.includes("BusRouteURL?service=insert")) {
                    document.getElementById("busRouteMenu").classList.remove("d-none");
                }
            });
        </script>

=======
        <script src="assets/js/bootstrap.bundle.min.js"></script>
>>>>>>> main
    </body>
</html>

