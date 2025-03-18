<%-- 
    Document   : listBusRoute
    Created on : Mar 6, 2025, 1:18:42 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList, model.managerTrip.BusRoute" %>
<%
    ArrayList<BusRoute> list = (ArrayList<BusRoute>) request.getAttribute("listBusRoute");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>My Bus - Danh Sách Tuyến Xe</title>

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
                    <img src="https://storage.googleapis.com/a1aa/image/bleOVH5WQzge5bjdCt5D9VkP58J-hf_O90hRj2rGXv0.jpg" alt="Bus logo" class="img-fluid" width="50">
                    <h4 class="mt-2">My Bus</h4>
                </div>
                <ul class="nav flex-column">
                    <li class="nav-item"><a class="nav-link text-dark" href="#"><i class="fas fa-home"></i> Trang Chủ</a></li>
                    <li class="nav-item"><a class="nav-link text-dark" href="#"><i class="fas fa-users"></i> Người Dùng</a></li>

                    <!-- Quản lý Tuyến Xe -->
                    <li class="nav-item">
                        <a class="nav-link fw-bold text-dark" href="#" id="toggleBusRoute">
                            <i class="fas fa-bus"></i> Quản lý Tuyến Xe
                        </a>
                        <ul class="list-unstyled ps-3 d-none text-muted" id="busRouteMenu">
                            <li><a class="nav-link text-secondary active bg-light" href="BusRouteURL?service=listOfAll"><i class="fas fa-list"></i> Danh sách tuyến xe</a></li>
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
                    <div>
                        <span class="mr-3">Xin chào Admin</span>
                        <img src="https://storage.googleapis.com/a1aa/image/f8PlcxgsScKTpIWEKXOlgvOQYRWzrcRJl01e8rgIgFM.jpg" class="rounded-circle" width="40" height="40" alt="Admin avatar">
                    </div>
                </div>
                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Trang Chủ</a></li>
                        <li class="breadcrumb-item"><a href="BusRouteURL?service=listOfAll">Quản lý tuyến xe</a></li>
                        <li class="breadcrumb-item active">Danh sách tuyến Xe</li>
                    </ol>
                </nav>
                <div class="card p-4">
                    <form action="BusRouteURL" method="get" class="form-inline mb-3">
                        <input type="hidden" name="service" value="listOfAll"> 
                        <label class="mr-2" for="br_from">Điểm đi:</label>
                        <input class="form-control mr-3" type="text" name="br_from" id="br_from">
                        <label class="mr-2" for="br_to">Điểm đến:</label>
                        <input class="form-control mr-3" type="text" name="br_to" id="br_to">
                        <button class="btn btn-primary" type="submit" name="submit">Search</button>
                        <button type="reset" class="btn btn-secondary">Xóa</button>
                    </form>
                </div>
                <div class="card p-4">
                    <div class="d-flex justify-content-end mb-3">
                        <a href="BusRouteURL?service=insert" class="btn btn-success">+ Thêm tuyến xe</a>
                    </div>
                    <table class="table table-bordered mt-4">
                        <thead class="thead-dark">
                            <tr>
                                <th>ID Tuyến</th>
                                <th>Điểm đi</th>
                                <th>Điểm đến</th>
                                <th>Giá hiện hành</th>
                                <th>Quãng đường</th>
                                <th>Mô tả</th>
                                <th>Trạng thái</th>
                                <th>Sửa</th>
                                <th>Xóa</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for(BusRoute busRoute: list) { %>
                            <tr>
                                <td><%=busRoute.getBr_id()%></td>
                                <td><%=busRoute.getBr_from()%></td>
                                <td><%=busRoute.getBr_to()%></td>
                                <td><%=busRoute.getBr_price()%></td>
                                <td><%=busRoute.getBr_distance()%></td>
                                <td><%=busRoute.getBr_description()%></td>
                                <td><%=busRoute.getBr_status()%></td>
                                <td><a href="BusRouteURL?service=update&br_id=<%=busRoute.getBr_id()%>" class="text-primary"><i class="fas fa-edit"></i></a></td>
                                <td><a href="BusRouteURL?service=delete&br_id=<%=busRoute.getBr_id()%>" class="text-danger"><i class="fas fa-trash-alt"></i></a></td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
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
        // Kiểm tra URL hiện tại để giữ menu mở
        window.addEventListener("DOMContentLoaded", function () {
            const currentUrl = window.location.href;
            if (currentUrl.includes("BusRouteURL?service=listOfAll") || currentUrl.includes("BusRouteURL?service=insert")) {
                document.getElementById("busRouteMenu").classList.remove("d-none");
            }
        });
    </script>
</body>
</html>
