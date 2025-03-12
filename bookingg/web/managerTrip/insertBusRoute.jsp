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

        <link rel="shortcut icon" href="assets/images/logo/favourite_icon.png">
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

    </head>
    <body class="bg-light">
        <div class="d-flex">
            <!-- Sidebar -->
            <nav class="bg-white shadow p-3 vh-100" style="width: 300px">
                <div class="text-center mb-4">
                    <img src="https://storage.googleapis.com/a1aa/image/bleOVH5WQzge5bjdCt5D9VkP58J-hf_O90hRj2rGXv0.jpg" alt="Bus logo" class="img-fluid" width="50">
                    <h4 class="mt-2">My Bus</h4>
                </div>
                <ul class="nav flex-column">
                    <li class="nav-item"><a class="nav-link text-dark" href="#"><i class="fas fa-home"></i> Trang Chủ</a></li>
                    <li class="nav-item"><a class="nav-link text-dark" href="#"><i class="fas fa-users"></i> Người Dùng</a></li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href=""BusRouteURL?service=listOfAll""><i class="fas fa-bus"></i> Quản lý Tuyến Xe</a>
                        <ul class="list-unstyled ps-3">
                            <li><a class="nav-link text-dark" href="BusRouteURL?service=listOfAll"><i class="fas fa-list"></i> Danh sách tuyến xe</a></li>
                            <li><a class="nav-link text-dark active bg-light" href="BusRouteURL?service=insert"><i class="fas fa-plus"></i> Thêm tuyến xe</a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link text-dark" href="BusTripURL?service=listOfAll"><i class="fas fa-route"></i> Quản lý Chuyến xe</a></li>
                </ul>
            </nav>

            <!-- Main Content -->
            <div class="container-fluid p-4">
                <header class="d-flex justify-content-between align-items-center mb-4">
                    <h2>Thêm Tuyến Xe</h2>
                    <div class="d-flex align-items-center">
                        <span class="me-3">Xin chào Admin</span>
                        <img src="https://storage.googleapis.com/a1aa/image/f8PlcxgsScKTpIWEKXOlgvOQYRWzrcRJl01e8rgIgFM.jpg" class="rounded-circle" width="40" height="40" alt="Admin avatar">
                    </div>
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
                    <form>
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
            </div>
        </div>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCU41RrJpPRR4mzeSKi-a2qLiIlRckELkE&libraries=places"></script>
        <script>
            function calculateDistance() {
                var origin = document.getElementById("br_from").value.trim();
                var destination = document.getElementById("br_to").value.trim();

                if (!origin || !destination) {
                    document.getElementById("br_distance").value = "";
                    return;
                }

                var service = new google.maps.DistanceMatrixService();
                service.getDistanceMatrix(
                        {
                            origins: [origin],
                            destinations: [destination],
                            travelMode: google.maps.TravelMode.DRIVING,
                        },
                        function (response, status) {
                            if (status !== "OK") {
                                console.error("Lỗi kết nối Google Maps API:", status);
                                document.getElementById("br_distance").value = "";
                                return;
                            }

                            var result = response.rows[0]?.elements[0];
                            if (!result || result.status !== "OK") {
                                console.error("Không thể tính khoảng cách. Vui lòng kiểm tra lại địa điểm!");
                                document.getElementById("br_distance").value = "";
                                return;
                            }

                            var distanceText = result.distance.text; // Ví dụ: "10.5 km"
                            var distanceValue = parseFloat(distanceText.replace(/[^\d.]/g, "")); // Chỉ lấy số
                            document.getElementById("br_distance").value = distanceValue;
                        }
                );
            }

            document.addEventListener("DOMContentLoaded", function () {
                document.getElementById("br_from").addEventListener("change", calculateDistance);
                document.getElementById("br_to").addEventListener("change", calculateDistance);
            });
        </script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

