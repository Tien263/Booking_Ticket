<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cập Nhật Blog - BusGo</title>
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
        .form-container {
            background-color: #fff;
            padding: 15px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        .form-container .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        .form-container label {
            width: 100px;
            font-size: 14px;
            margin-bottom: 0;
        }
        .form-container input[type="text"],
        .form-container textarea,
        .form-container select,
        .form-container input[type="file"] {
            width: 100%;
            padding: 6px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .form-container textarea[name="content"] {
            height: 300px; /* Chiều cao cho Nội dung */
        }
        .form-container textarea[name="brief"] {
            height: 80px; /* Chiều cao cho Tóm tắt */
        }
        .form-container .preview-image {
            max-width: 300px;
            height: auto;
            margin-top: 10px;
            display: block;
        }
        .form-container .submit-btn {
            text-align: center;
            margin-top: 15px;
        }
        .form-container .submit-btn button,
        .form-container .submit-btn a {
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 14px;
            margin: 0 10px;
        }
        .form-container .submit-btn button {
            background-color: #007bff;
            color: white;
            border: none;
        }
        .form-container .submit-btn button:hover {
            background-color: #0056b3;
        }
        .form-container .submit-btn a {
            background-color: #17a2b8;
            color: white;
            text-decoration: none;
        }
        .form-container .submit-btn a:hover {
            background-color: #138496;
        }
        .alert {
            font-size: 14px;
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
                <a class="nav-link active" href="updateblog"><i class="fas fa-road me-2"></i>Cập nhật Blog</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="listblog"><i class="fas fa-bus me-2"></i>Quản lý Blog</a>
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
            <h2>Cập Nhật Blog</h2>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Trang Chủ</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Cập Nhật Blog</li>
                </ol>
            </nav>
        </div>

        <!-- Form Cập Nhật Blog -->
        <div class="form-container">
            <!-- Hiển thị thông báo lỗi chung -->
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger text-center">${errorMessage}</div>
            </c:if>

            <form action="${pageContext.request.contextPath}/blog/updateblog" method="POST" enctype="multipart/form-data" id="updateBlogForm">
                <input type="hidden" name="id" value="${requestScope.b.getId()}"/>
                <div class="row">
                    <!-- Cột bên trái: Tiêu đề, Tóm tắt -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="title">Tiêu đề:</label>
                            <input type="text" name="title" id="title" value="${requestScope.b.title}" required>
                        </div>
                        <div class="form-group">
                            <label for="brief">Tóm tắt:</label>
                            <textarea name="brief" id="brief" required>${requestScope.b.brief}</textarea>
                        </div>
                    </div>

                    <!-- Cột bên phải: Hình ảnh, Thời gian hiện tại -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="image">Hình ảnh:</label>
                            <input type="file" name="image" id="image" accept="image/*">
                            <c:if test="${not empty requestScope.b.image}">
                                <img id="previewImage" class="preview-image" src="${requestScope.b.image}" alt="Ảnh hiện tại">
                                <input type="hidden" name="currentImage" value="${requestScope.b.image}">
                            </c:if>
                            <c:if test="${empty requestScope.b.image}">
                                <img id="previewImage" class="preview-image" src="" alt="Ảnh xem trước">
                            </c:if>
                        </div>
                        <div class="form-group">
                            <label>Thời gian:</label>
                            <p><b><%= new Date() %></b></p>
                        </div>
                    </div>
                </div>

                <!-- Nội dung: Chiếm toàn bộ chiều rộng -->
                <div class="form-group">
                    <label for="content">Nội dung:</label>
                    <textarea name="content" id="content" required>${requestScope.b.content}</textarea>
                </div>

                <!-- Nút Lưu và Xem danh sách bài viết -->
                <div class="submit-btn">
                    <button type="submit"><i class="fas fa-save me-2"></i>Lưu</button>
                    <a href="listblog"><i class="fas fa-list me-2"></i>Xem danh sách bài viết</a>
                </div>
            </form>
        </div>
    </div>

    <!-- JavaScript for Image Preview -->
    <script>
        document.getElementById('image').addEventListener('change', function (event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    const previewImage = document.getElementById('previewImage');
                    previewImage.src = e.target.result;
                    previewImage.style.display = 'block';
                };
                reader.readAsDataURL(file);
            }
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>