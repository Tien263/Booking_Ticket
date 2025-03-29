<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Tuyến Xe - BusGo</title>
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
        .filter-form {
            background-color: #fff;
            padding: 15px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        .table-container {
            background-color: #fff;
            padding: 15px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .table th, .table td {
            vertical-align: middle;
        }
        .pagination {
            justify-content: center;
            margin-top: 20px;
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
                <a class="nav-link" href="employeelist"><i class="fas fa-users me-2"></i>Quản lý nhân viên</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="listbusroute"><i class="fas fa-road me-2"></i>Quản lý tuyến xe</a>
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
            <h2>Danh Sách Tuyến Xe</h2>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Trang Chủ</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Danh Sách Tuyến Xe</li>
                </ol>
            </nav>
        </div>

        <!-- Form lọc -->
        <div class="filter-form">
            <form action="listbusroute" method="post" class="row g-3">
                <div class="col-md-3">
                    <input type="text" name="br_from" id="br_from" class="form-control" placeholder="Điểm đi" value="${br_from}">
                </div>
                <div class="col-md-3">
                    <input type="text" name="br_to" id="br_to" class="form-control" placeholder="Điểm đến" value="${br_to}">
                </div>
                <div class="col-md-3">
                    <button type="submit" class="btn btn-primary me-2"><i class="fas fa-search me-2"></i>Tìm kiếm</button>
                </div>
            </form>
        </div>

        <!-- Bảng danh sách tuyến xe -->
        <div class="table-container">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID Tuyến</th>
                        <th>Điểm đi</th>
                        <th>Điểm đến</th>
                        <th>Giá hiện hành</th>
                        <th>Quãng đường</th>
                        <th>Mô tả</th>
                        <th>Trạng thái</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${br}" var="br">
                        <tr>
                            <td>${br.br_id}</td>
                            <td>${br.br_from}</td>
                            <td>${br.br_to}</td>
                            <td>${br.br_price}</td>
                            <td>${br.br_distance}</td>
                            <td>${br.br_description}</td>
                            <td>${br.br_status}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <!-- Phân trang -->
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                        <a class="page-link" href="listbusroute?page=${currentPage - 1}&br_from=${br_from}&br_to=${br_to}" aria-label="Previous">
                            <span aria-hidden="true">Trang trước</span>
                        </a>
                    </li>
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <li class="page-item ${currentPage == i ? 'active' : ''}">
                            <a class="page-link" href="listbusroute?page=${i}&br_from=${br_from}&br_to=${br_to}">${i}</a>
                        </li>
                    </c:forEach>
                    <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                        <a class="page-link" href="listbusroute?page=${currentPage + 1}&br_from=${br_from}&br_to=${br_to}" aria-label="Next">
                            <span aria-hidden="true">Trang tiếp</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>