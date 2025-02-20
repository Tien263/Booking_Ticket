<%-- 
    Document   : datePromo.jsp
    Created on : Feb 20, 2025, 1:47:37 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Khuyến Mãi - Theo Ngày</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h2 class="text-center">Quản Lý Khuyến Mãi - Theo Ngày</h2>

        <div class="row mb-3">
            <div class="col-md-6">
                <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addDatePromoModal">Thêm Khuyến Mãi</button>
            </div>
            <div class="col-md-6">
                <input type="text" class="form-control" placeholder="Tìm kiếm khuyến mãi...">
            </div>
        </div>
        
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Ngày Bắt Đầu</th>
                    <th>Ngày Hết Hạn</th>
                    <th>Giảm Giá</th>
                    <th>Số Lượng</th>
                    <th>Trạng Thái</th> <!-- Cột Trạng Thái -->
                    <th>Thao Tác</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="promo" items="${promotions}">
                    <tr>
                        <td>${promo.id}</td> <!-- sửa từ promo.pbd_id thành promo.id -->
                        <td>${promo.startDate}</td> <!-- sửa từ promo.pbd_startDate thành promo.startDate -->
                        <td>${promo.endDate}</td> <!-- sửa từ promo.pbd_endDate thành promo.endDate -->
                        <td>${promo.discount}%</td> <!-- sửa từ promo.pbd_discount thành promo.discount -->
                        <td>${promo.quantity}</td> <!-- sửa từ promo.pbd_quantity thành promo.quantity -->
                        <td>
                                <c:set var="today" value="<%= new java.util.Date() %>"/>
                                <span class="badge ${promo.endDate.after(today) ? 'bg-success' : 'bg-danger'}">
                                    ${promo.endDate.after(today) ? 'Hoạt động' : 'Hết hạn'}
                                </span>
                            </td>
                        </td>
                        <td>
                            <a href="editDatePromotion?id=${promo.id}" class="btn btn-warning btn-sm">Sửa</a>
                            <a href="deleteDatePromotion?id=${promo.id}" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc muốn xóa?');">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Modal Thêm Khuyến Mãi -->
    <div class="modal fade" id="addDatePromoModal" tabindex="-1" aria-labelledby="addDatePromoModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addDatePromoModalLabel">Thêm Khuyến Mãi Theo Ngày</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="promotion_date" method="post">
                        <div class="mb-3">
                            <label class="form-label">Ngày Bắt Đầu</label>
                            <input type="date" name="startDate" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Ngày Hết Hạn</label>
                            <input type="date" name="endDate" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Giảm Giá (%)</label>
                            <input type="number" name="discount" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Số Lượng</label>
                            <input type="number" name="quantity" class="form-control" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Thêm</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
