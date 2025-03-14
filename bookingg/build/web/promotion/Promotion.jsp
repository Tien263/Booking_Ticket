<%-- 
    Document   : Promotion
    Created on : Feb 13, 2025, 9:15:02 PM
    Author     : ADMIN
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Khuyến Mãi</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h2 class="text-center">Quản Lý Khuyến Mãi</h2>
        
        <div class="row">
            <div class="col-md-4">
                <a href="promotion_date" class="btn btn-primary w-100">Khuyến mãi theo sự kiện</a>
            </div>
            <div class="col-md-4">
                <a href="promotion_code" class="btn btn-success w-100">Khuyến mãi theo code</a>
            </div>
            <div class="col-md-4">
                <a href="membershipPromo.jsp" class="btn btn-warning w-100">Khuyến mãi theo hạng mục thành viên</a>
            </div>
        </div>
        
        <div class="tab-content mt-3">
            <!-- Danh sách khuyến mãi -->
            <div id="promoList" class="mt-4">
                <h4>Danh sách khuyến mãi</h4>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên Khuyến Mãi</th>
                            <th>Loại</th>
                            <th>Giảm Giá</th>
                            <th>Thao Tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Giảm giá Tết</td>
                            <td>Sự kiện</td>
                            <td>20%</td>
                            <td>
                                <button class="btn btn-warning btn-sm">Sửa</button>
                                <button class="btn btn-danger btn-sm">Xóa</button>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>CODE123</td>
                            <td>Code</td>
                            <td>10%</td>
                            <td>
                                <button class="btn btn-warning btn-sm">Sửa</button>
                                <button class="btn btn-danger btn-sm">Xóa</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
