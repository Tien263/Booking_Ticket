<%-- 
    Document   : editVehicle
    Created on : Mar 6, 2025, 11:26:28 PM
    Author     : Quang Anh
--%>

<%@ page import="dal.VehicleDAO, model.Vehicle" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    VehicleDAO dao = new VehicleDAO();
    Vehicle vehicle = dao.getVehicleById(id);
%>
<html>
<head>
    <title>Sửa Phương Tiện - BusGo</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
        }
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 250px;
            background-color: #fff;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            padding-top: 20px;
        }
        .sidebar .logo {
            text-align: center;
            margin-bottom: 20px;
        }
        .sidebar .logo img {
            width: 100px;
        }
        .sidebar .nav-link {
            color: #333;
            padding: 10px 20px;
            display: block;
        }
        .sidebar .nav-link:hover {
            background-color: #f8f9fa;
        }
        .sidebar .nav-link.active {
            background-color: #e9ecef;
            font-weight: bold;
        }
        .content {
            margin-left: 250px;
            padding: 20px;
        }
        .header {
            background-color: #fff;
            padding: 15px 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        .header h2 {
            margin: 0;
            color: #007bff;
        }
        .breadcrumb {
            background-color: transparent;
            margin: 0;
        }
        .form-container {
            background-color: #fff;
            padding: 15px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            border-radius: 4px;
            max-width: 500px;
            margin: 0 auto;
        }
        .form-container label {
            font-size: 14px;
            margin-bottom: 5px;
            display: block;
        }
        .form-container input[type="text"],
        .form-container input[type="number"],
        .form-container select {
            width: 100%;
            padding: 6px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 15px;
        }
        .form-container button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 6px 12px;
            font-size: 14px;
            border-radius: 4px;
            width: 100%;
        }
        .form-container button:hover {
            background-color: #0056b3;
        }
        .form-container a {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #007bff;
            text-decoration: none;
        }
        .form-container a:hover {
            color: #0056b3;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="text-center mb-4">
            <img src="logo_hoadon.jpg" srcset="logo_hoadon.jpg 2x" alt="logo_not_found" width="50%">
            <h4 class="mt-2">BusGo</h4>
        </div>
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link active" href="vehicle"><i class="fas fa-bus me-2"></i>Cập nhật phương tiện</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="addVehicle.jsp"><i class="fas fa-blog me-2"></i>Tạo phương tiện</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="vehicle"><i class="fas fa-car me-2"></i>Quản lý Phương Tiện</a>
            </li>
            <c:if test="${not empty sessionScope.user}">
                <li class="nav-item mt-auto">
                    <a class="nav-link" href="/bookingg/logout" onclick="return confirm('Bạn có chắc chắn muốn đăng xuất?');">
                        <i class="fas fa-sign-out-alt me-2"></i>Đăng xuất
                    </a>
                </li>
            </c:if>
        </ul>
    </div>

    <!-- Content -->
    <div class="content">
        <!-- Header -->
        <div class="header">
            <h2>Sửa Phương Tiện</h2>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="vehicle">Trang Chủ</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Sửa Phương Tiện</li>
                </ol>
            </nav>
        </div>

        <!-- Form sửa phương tiện -->
        <div class="form-container">
            <form action="vehicle" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id" value="<%= vehicle.getId() %>">
                <label for="type">Loại xe:</label>
                <input type="text" name="type" id="type" value="<%= vehicle.getType() %>" required>
                <label for="capacity">Sức chứa:</label>
                <input type="number" name="capacity" id="capacity" value="<%= vehicle.getCapacity() %>" required>
                <label for="licensePlate">Biển số:</label>
                <input type="text" name="licensePlate" id="licensePlate" value="<%= vehicle.getLicensePlate() %>" required>
                <label for="status">Trạng thái:</label>
                <select name="status" id="status">
                    <option value="available" <%= vehicle.getStatus().equals("available") ? "selected" : "" %>>Available</option>
                    <option value="unavailable" <%= vehicle.getStatus().equals("unavailable") ? "selected" : "" %>>Unavailable</option>
                </select>
                <button type="submit">Cập nhật Phương Tiện</button>
            </form>
            <a href="vehicle">Quay lại danh sách</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>