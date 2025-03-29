<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Blog - BusGo</title>
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
            text-align: left;
        }
        .table th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
        .table td img {
            max-width: 100px;
            max-height: 100px;
        }
        .table td:nth-child(4) {
            min-width: 500px;
            word-break: break-word;
            white-space: pre-wrap;
            overflow-wrap: break-word;
            max-height: 200px;
            overflow-y: auto;
        }
        .table th:nth-child(8), .table td:nth-child(8) {
            width: 110px;
            min-width: 110px;
        }
        .btn-action {
            margin-right: 5px;
            font-size: 14 Wpx;
            padding: 6px 10px;
        }
        .btn-add {
            position: absolute;
            top: 20px;
            right: 20px;
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
                <a class="nav-link" href="updateblog"><i class="fas fa-road me-2"></i>Cập nhật Blog</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="listblog"><i class="fas fa-bus me-2"></i>Quản lý Blog</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="createblog"><i class="fas fa-blog me-2"></i>Tạo Blog</a>
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
            <h2>Danh Sách Blog</h2>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Trang Chủ</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Danh Sách Blog</li>
                </ol>
            </nav>
        </div>

        <!-- Nút Tạo Blog Mới -->
        <a href="createblog" class="btn btn-success btn-add">
            <i class="fas fa-plus me-2"></i>Tạo Blog Mới
        </a>

        <!-- Bảng danh sách blog -->
        <div class="table-container">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tiêu đề</th>
                        <th>Mô tả ngắn</th>
                        <th>Nội dung</th>
                        <th>Ngày tạo</th>
                        <th>Ngày cập nhật</th>
                        <th>Ảnh</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${not empty blog}">
                            <c:forEach var="b" items="${blog}">
                                <tr>
                                    <td>${b.getId()}</td>
                                    <td>${b.getTitle()}</td>
                                    <td>${b.getBrief()}</td>
                                    <td>${b.getContent()}</td>
                                    <td>${b.getCreatedtime()}</td>
                                    <td>${b.getUpdatedtime()}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${not empty b.getImage()}">
                                                <img src="${b.getImage()}" alt="Blog Image"/>
                                            </c:when>
                                            <c:otherwise>
                                                Không có ảnh
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <a href="updateblog?id=${b.getId()}" class="btn btn-primary btn-sm btn-action">
                                            <i class="fas fa-pen"></i>
                                        </a>
                                        <button type="button" class="btn btn-danger btn-sm btn-action" onclick="removeBlog(${b.id})">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                        <form id="removeBlog${b.id}" action="deleteblog" method="POST" style="display:none;">
                                            <input type="hidden" name="id" value="${b.id}"/>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="8" class="text-center">Không có blog nào để hiển thị.</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>

            <!-- Phân trang -->
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                        <a class="page-link" href="listblog?page=${currentPage - 1}" aria-label="Previous">
                            <span aria-hidden="true">&laquo; Trước</span>
                        </a>
                    </li>
                    <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                        <a class="page-link" href="listblog?page=${currentPage + 1}" aria-label="Next">
                            <span aria-hidden="true">Tiếp theo &raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>

    <!-- JavaScript -->
    <script>
        function removeBlog(id) {
            var result = confirm("Bạn có chắc chắn muốn xóa blog này?");
            if (result) {
                document.getElementById("removeBlog" + id).submit();
            }
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>