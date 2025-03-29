<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Ngăn cache
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    // Kiểm tra đăng nhập
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Nhân Viên - BusGo</title>
    <link rel="shortcut icon" href="assets/images/logo/logo_01_1.png">
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
        .search-form {
            background-color: #fff;
            padding: 15px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        .search-form .row {
            align-items: flex-start;
        }
        .search-form .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        .search-form label {
            width: 100px;
            font-size: 14px;
            margin-bottom: 0;
        }
        .search-form input[type="text"],
        .search-form select {
            width: 150px;
            padding: 6px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .search-form input[type="radio"] {
            margin: 0 5px 0 15px;
        }
        .search-form .submit-btn {
            text-align: center;
            margin-top: 15px;
        }
        .search-form .submit-btn button {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
        }
        .search-form .submit-btn button:hover {
            background-color: #0056b3;
        }
        .table-container {
            background-color: #fff;
            padding: 15px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .table th, .table td {
            vertical-align: middle;
        }
        .btn-add {
            position: absolute;
            top: 20px;
            right: 20px;
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
                <a class="nav-link active" href="employeelist"><i class="fas fa-users me-2"></i>Quản lý nhân viên</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="listbusroute"><i class="fas fa-road me-2"></i>Quản lý tuyến xe</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="listbustrip"><i class="fas fa-bus me-2"></i>Quản lý chuyến xe</a>
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
            <h2>Danh Sách Nhân Viên</h2>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Trang Chủ</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Danh Sách Nhân Viên</li>
                </ol>
            </nav>
        </div>

        <!-- Nút Thêm Nhân Viên -->
        <a href="employeecreate" class="btn btn-success btn-add">
            <i class="fas fa-plus me-2"></i>Thêm Nhân Viên
        </a>

        <!-- Form Tìm Kiếm -->
        <div class="search-form">
            <form action="${pageContext.request.contextPath}/admin/employeelist" method="get" class="w-100">
                <div class="row">
                    <!-- Cột bên trái: ID, Tên, Giới tính -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>ID:</label>
                            <input type="text" name="id" value="${param.id}" />
                        </div>
                        <div class="form-group">
                            <label>Tên:</label>
                            <input type="text" name="name" value="${param.name}" />
                        </div>
                        <div class="form-group">
                            <label>Giới tính:</label>
                            <input type="radio" name="gender" ${param.gender ne null && param.gender eq "male" ? "checked" : ""} value="male" /> Nam
                            <input type="radio" name="gender" ${param.gender ne null && param.gender eq "female" ? "checked" : ""} value="female" /> Nữ
                            <input type="radio" name="gender" ${param.gender eq null || param.gender eq "both" ? "checked" : ""} value="both" /> Tất cả
                        </div>
                    </div>

                    <!-- Cột bên phải: Địa chỉ, Số điện thoại, Vai trò -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Địa chỉ:</label>
                            <input type="text" name="address" value="${param.address}" />
                        </div>
                        <div class="form-group">
                            <label>Số điện thoại:</label>
                            <input type="text" name="phone" value="${param.phone}" />
                        </div>
                        <div class="form-group">
                            <label>Vai trò:</label>
                            <select name="roleId">
                                <option value="-1">Tất cả vai trò</option>
                                <c:forEach items="${roles}" var="r">
                                    <option ${param.roleId ne null && param.roleId eq r.id ? "selected" : ""} value="${r.id}">${r.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- Nút Tìm kiếm ở giữa -->
                <div class="submit-btn">
                    <button type="submit"><i class="fas fa-search me-2"></i>Tìm kiếm</button>
                </div>
            </form>
        </div>

        <!-- Bảng danh sách nhân viên -->
        <div class="table-container">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Employee ID</th>
                        <th>Employee Name</th>
                        <th>Gender</th>
                        <th>Address</th>
                        <th>Role</th>
                        <th>Phone</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${not empty emps}">
                            <c:forEach items="${emps}" var="e">
                                <tr>
                                    <td>${e.id}</td>
                                    <td>${e.name}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${e.gender}">
                                                Nam
                                            </c:when>
                                            <c:otherwise>
                                                Nữ
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>${e.address}</td>
                                    <td>${e.role.name}</td>
                                    <td>${e.phone}</td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="6" class="text-center">Không có nhân viên nào để hiển thị.</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>