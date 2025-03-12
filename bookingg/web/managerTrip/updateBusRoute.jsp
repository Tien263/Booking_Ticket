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
    <title>My Bus - Sửa tuyến xe</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/fontawesome.css">
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
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="BusRouteURL?service=listOfAll"><i class="fas fa-bus"></i> Quản lý Tuyến Xe</a>
                        <ul class="list-unstyled ps-3">
                            <li><a class="nav-link text-dark" href=""BusRouteURL?service=listOfAll""><i class="fas fa-list"></i> Danh sách tuyến xe</a></li>
                            <li><a class="nav-link text-dark" href="BusRouteURL?service=insert"><i class="fas fa-plus"></i> Thêm tuyến xe</a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link text-dark" href="BusTripURL?service=listOfAll"><i class="fas fa-route"></i> Quản lý Chuyến xe</a></li>
                </ul>
            </nav>
        <!-- Main Content -->
        <div class="flex-grow-1 p-4">
            <!-- Header -->
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1 class="h4">Sửa Tuyến Xe</h1>
                <div class="d-flex align-items-center">
                    <span class="me-3">Xin chào Admin</span>
                    <img src="https://storage.googleapis.com/a1aa/image/f8PlcxgsScKTpIWEKXOlgvOQYRWzrcRJl01e8rgIgFM.jpg" width="40" height="40" class="rounded-circle" alt="Admin avatar"/>
                </div>
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
                        <div class="col-md-6">
                            <label class="form-label">Trạng thái</label>
                            <input type="text" class="form-control" name="br_status" value="<%=busRoute.getBr_status()%>">
                        </div>
                    </div>
                    <div class="mt-4">
                        <button type="submit" name="submit" class="btn btn-success">Sửa tuyến xe</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>