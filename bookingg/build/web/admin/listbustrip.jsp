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
    <title>Quản Lý Chuyến Xe - BusGo</title>
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
                <a class="nav-link" href="listbusroute"><i class="fas fa-road me-2"></i>Quản lý tuyến xe</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="listbustrip"><i class="fas fa-bus me-2"></i>Quản lý chuyến xe</a>
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
            <h2>Danh Sách Chuyến Xe</h2>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Trang Chủ</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Danh Sách Chuyến Xe</li>
                </ol>
            </nav>
        </div>

        <!-- Form lọc -->
        <div class="filter-form">
            <form action="${pageContext.request.contextPath}/admin/listbustrip" method="get" class="row g-3">
                <div class="col-md-3">
                    <input type="date" name="bt1_date" id="bt1_date" class="form-control" value="${bt1_date}">
                </div>
                <div class="col-md-3">
                    <input type="text" name="br_id" id="br_id" class="form-control" placeholder="Mã tuyến" value="${br_id}">
                </div>
                <div class="col-md-3">
                    <button type="submit" class="btn btn-primary me-2"><i class="fas fa-search me-2"></i>Tìm kiếm</button>
                    <button type="submit" name="action" value="reset" class="btn btn-secondary"><i class="fas fa-eraser me-2"></i>Xóa</button>
                </div>
            </form>
        </div>

        <!-- Bảng danh sách chuyến xe -->
        <div class="table-container">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Mã Chuyến</th>
                        <th>Ngày khởi hành</th>
                        <th>Thời gian khởi hành</th>
                        <th>Thời gian dự kiến</th>
                        <th>Trạng thái chuyến</th>
                        <th>Mã tuyến</th>
                        <th>Biển số xe</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${bt}" var="bt">
                        <tr>
                            <td>${bt.bt1_id}</td>
                            <td>${bt.bt1_date}</td>
                            <td>${bt.bt1_departureTime}</td>
                            <td>${bt.bt1_arrivalTime}</td>
                            <td>${bt.bt1_status}</td>
                            <td>${bt.br_id}</td>
                            <td>${bt.v_licensePlate}</td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty bt}">
                        <tr>
                            <td colspan="7" class="text-center">Không có chuyến xe nào để hiển thị.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>

            <!-- Phân trang -->
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                        <a class="page-link" href="${pageContext.request.contextPath}/admin/listbustrip?page=${currentPage - 1}&bt1_date=${bt1_date}&br_id=${br_id}" aria-label="Previous">
                            <span aria-hidden="true">Trang trước</span>
                        </a>
                    </li>
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <li class="page-item ${currentPage == i ? 'active' : ''}">
                            <a class="page-link" href="${pageContext.request.contextPath}/admin/listbustrip?page=${i}&bt1_date=${bt1_date}&br_id=${br_id}">${i}</a>
                        </li>
                    </c:forEach>
                    <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                        <a class="page-link" href="${pageContext.request.contextPath}/admin/listbustrip?page=${currentPage + 1}&bt1_date=${bt1_date}&br_id=${br_id}" aria-label="Next">
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