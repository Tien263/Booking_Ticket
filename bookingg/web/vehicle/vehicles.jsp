<%@ page import="java.util.List" %>
<%@ page import="model.Vehicle" %>
<%@ page import="dal.VehicleDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<html>
<head>
    <title>Danh Sách Phương Tiện - BusGo</title>
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
        .search-container {
            background-color: #fff;
            padding: 15px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        .search-container form {
            margin-bottom: 15px;
        }
        .search-container label {
            font-size: 14px;
            margin-right: 10px;
        }
        .search-container input[type="text"] {
            padding: 6px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 4px;
            width: 200px;
        }
        .search-container button {
            padding: 6px 12px;
            font-size: 14px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            margin-left: 10px;
        }
        .search-container button:hover {
            background-color: #0056b3;
        }
        .table-container {
            background-color: #fff;
            padding: 15px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .table th, .table td {
            vertical-align: middle;
            font-size: 14px;
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }
        .table th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
        .table td a {
            color: #007bff;
            text-decoration: none;
        }
        .table td a:hover {
            color: #0056b3;
        }
        .btn-action {
            margin-right: 5px;
            font-size: 14px;
            padding: 6px 10px;
        }
        .btn-add {
            position: absolute;
            top: 20px;
            right: 20px;
        }
        .alert {
            font-size: 14px;
            margin-top: 20px;
        }
        .pagination {
            margin-top: 20px;
            justify-content: center;
        }
        .pagination .page-item.disabled .page-link {
            background-color: #cccccc;
            cursor: not-allowed;
        }
        .pagination .page-link {
            color: #007bff;
        }
        .pagination .page-link:hover {
            background-color: #e9ecef;
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
                <a class="nav-link" href="vehicle"><i class="fas fa-bus me-2"></i>Cập nhật phương tiện</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="addVehicle.jsp"><i class="fas fa-blog me-2"></i>Tạo phương tiện</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="vehicle"><i class="fas fa-car me-2"></i>Quản lý Phương Tiện</a>
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
            <h2>Danh Sách Phương Tiện</h2>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Trang Chủ</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Danh Sách Phương Tiện</li>
                </ol>
            </nav>
        </div>

        <!-- Nút Thêm Phương Tiện -->
        <a href="addVehicle.jsp" class="btn btn-success btn-add">
            <i class="fas fa-plus me-2"></i>Thêm Phương Tiện
        </a>

        <!-- Form Tìm Kiếm -->
        <div class="search-container">
            <form action="vehicle" method="GET">
                <label for="licensePlate">Tìm theo Biển số:</label>
                <input type="text" name="licensePlate" id="licensePlate" value="${licensePlate}">
                <button type="submit">Tìm</button>
            </form>
            <form action="vehicle" method="GET">
                <label for="type">Tìm theo Loại xe:</label>
                <input type="text" name="type" id="type" value="${type}">
                <button type="submit">Tìm</button>
            </form>
        </div>

        <!-- Bảng danh sách phương tiện -->
        <div class="table-container">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Loại xe</th>
                        <th>Sức chứa</th>
                        <th>Biển số</th>
                        <th>Trạng thái</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${not empty vehicles}">
                            <c:forEach var="v" items="${vehicles}">
                                <tr>
                                    <td>${v.id}</td>
                                    <td>${v.type}</td>
                                    <td>${v.capacity}</td>
                                    <td>${v.licensePlate}</td>
                                    <td>${v.status}</td>
                                    <td>
                                        <a href="editVehicle.jsp?id=${v.id}" class="btn btn-primary btn-sm btn-action">
                                            <i class="fas fa-pen"></i>
                                        </a>
                                        <button type="button" class="btn btn-danger btn-sm btn-action" onclick="deleteVehicle(${v.id})">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                        <form id="deleteVehicle${v.id}" action="vehicle" method="POST" style="display:none;">
                                            <input type="hidden" name="action" value="delete"/>
                                            <input type="hidden" name="id" value="${v.id}"/>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="6" class="text-center">Không tìm thấy phương tiện nào.</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>

            <!-- Phân trang -->
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                        <a class="page-link" href="vehicle?page=${currentPage - 1}&licensePlate=${licensePlate}&type=${type}" aria-label="Previous">
                            <span aria-hidden="true">« Trước</span>
                        </a>
                    </li>
                    <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                        <a class="page-link" href="vehicle?page=${currentPage + 1}&licensePlate=${licensePlate}&type=${type}" aria-label="Next">
                            <span aria-hidden="true">Tiếp theo »</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>

        <!-- Hiển thị thông báo thành công hoặc lỗi -->
        <c:if test="${not empty sessionScope.errorMessage}">
            <div class="alert alert-danger text-center">${sessionScope.errorMessage}</div>
            <% session.removeAttribute("errorMessage"); %>
        </c:if>
        <c:if test="${not empty sessionScope.successMessage}">
            <div class="alert alert-success text-center">${sessionScope.successMessage}</div>
            <% session.removeAttribute("successMessage"); %>
        </c:if>
    </div>

    <!-- JavaScript -->
    <script>
        function deleteVehicle(id) {
            var result = confirm("Bạn có chắc chắn muốn xóa phương tiện này?");
            if (result) {
                document.getElementById("deleteVehicle" + id).submit();
            }
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>