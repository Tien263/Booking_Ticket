<%-- 
    Document   : insertBusTrip
    Created on : Mar 6, 2025, 8:38:50 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet" %>
<%
        ResultSet rsVehicle =(ResultSet)request.getAttribute("rsVehicle");
%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>My Bus - Thêm chuyến xe</title>
        <link rel="shortcut icon" href="assets/images/logo/favourite_icon.png">

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
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="BusRouteURL?service=listOfAll"><i class="fas fa-bus"></i> Quản lý Tuyến Xe</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="BusTripURL?service=listOfAll"><i class="fas fa-route"></i> Quản lý Chuyến xe</a>
                        <ul class="list-unstyled ps-3">
                            <li><a class="nav-link text-dark" href="BusTripURL?service=listOfAll"><i class="fas fa-list"></i> Danh sách chuyến xe</a></li>
                            <li><a class="nav-link text-dark active bg-light" href="BusTripURL?service=insert"><i class="fas fa-plus"></i> Thêm chuyến xe</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <!-- Main Content -->
            <div class="col-md-9 p-4">
                <header class="d-flex justify-content-between align-items-center mb-4">
                    <h2>Thêm Chuyến Xe</h2>
                    <div class="d-flex align-items-center">
                        <span class="me-3">Xin chào Admin</span>
                        <img src="https://storage.googleapis.com/a1aa/image/f8PlcxgsScKTpIWEKXOlgvOQYRWzrcRJl01e8rgIgFM.jpg" width="40" height="40" class="rounded-circle" alt="Admin avatar">
                    </div>
                </header>
                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Trang Chủ</a></li>
                        <li class="breadcrumb-item"><a href="BusTripURL?service=listOfAll">Quản lý chuyến xe</a></li>
                        <li class="breadcrumb-item active">Thêm chuyến Xe</li>
                    </ol>
                </nav>
                <div class="bg-white p-4 rounded shadow">
                    <form action="BusTripURL" method="get">
                        <input type="hidden" name="service" value="insert">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label" for="bt1_id">Mã Chuyến</label>
                                <input type="text" class="form-control" id="bt1_id" name="bt1_id" readonly>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label" for="bt1_date">Ngày</label>
                                <input type="date" class="form-control" id="bt1_date" name="bt1_date" required>
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
                                <input type="text" class="form-control" id="bt1_status" name="bt1_status" value="Đang chờ" readonly>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label" for="br_id">Mã Tuyến</label>
                                <input type="text" class="form-control" id="br_id" name="br_id" required>
                            </div>
                            <div class="col-md-6 d-flex flex-col">
                                <label class="form-label">Biển số xe</label>
                                <select name="vehicleId" id="vehicleId">
                                    <%while(rsVehicle.next()){%>
                                    <option value="<%=rsVehicle.getInt(1)%>"><%=rsVehicle.getString(2)%></option>
                                    <%}%>
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
        </div>
    </body>
</html>
