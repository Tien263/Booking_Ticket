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
        <script>
            // Hàm xử lý khi nhấn nút "Sửa"
            document.addEventListener("DOMContentLoaded", function () {
                let editButtons = document.querySelectorAll(".edit-btn");
                editButtons.forEach(button => {
                    button.addEventListener("click", function () {
                        document.getElementById("editPromoId").value = this.getAttribute("data-id");
                        document.getElementById("editPromoName").value = this.getAttribute("data-name");
                        document.getElementById("editPromoStartDate").value = this.getAttribute("data-startdate");
                        document.getElementById("editPromoEndDate").value = this.getAttribute("data-enddate");
                        document.getElementById("editPromoDiscount").value = this.getAttribute("data-discount");
                        document.getElementById("editPromoQuantity").value = this.getAttribute("data-quantity");
                    });
                });
            });
        </script>
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
                        <th>Tên Khuyến Mãi</th>
                        <th>Ngày Bắt Đầu</th>
                        <th>Ngày Hết Hạn</th>
                        <th>Giảm Giá</th>
                        <th>Số Lượng</th>
                        <th>Trạng Thái</th>
                        <th>Thao Tác</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="promo" items="${promotions}">
                        <tr>
                            <td>${promo.id}</td>
                            <td>${promo.name}</td>
                            <td>${promo.startDate}</td>
                            <td>${promo.endDate}</td>
                            <td>${promo.discount}%</td>
                            <td>${promo.quantity}</td>
                            <td>
                                <c:set var="today" value="<%= new java.util.Date() %>"/>
                                <span class="badge ${promo.endDate.after(today) ? 'bg-success' : 'bg-danger'}">
                                    ${promo.endDate.after(today) ? 'Hoạt động' : 'Hết hạn'}
                                </span>
                            </td>
                            <td>
                                <!-- Nút Sửa -->
                                <button class="btn btn-warning btn-sm edit-btn"
                                        data-bs-toggle="modal" 
                                        data-bs-target="#editDatePromoModal"
                                        data-id="${promo.id}"
                                        data-name="${promo.name}"
                                        data-startdate="${promo.startDate}"
                                        data-enddate="${promo.endDate}"
                                        data-discount="${promo.discount}"
                                        data-quantity="${promo.quantity}">
                                    Sửa
                                </button>

                                <!-- Nút Xóa -->
                                <c:choose>
                                    <c:when test="${promo.endDate.after(today)}">
                                        <!-- Mã đang hoạt động, không cho xóa -->
                                        <button class="btn btn-danger btn-sm" disabled title="Không thể xóa khuyến mãi đang hoạt động">Xóa</button>
                                    </c:when>
                                    <c:otherwise>
                                        <!-- Mã đã hết hạn, có thể xóa -->
                                        <a href="deleteDatePromotion?id=${promo.id}" class="btn btn-danger btn-sm"
                                           onclick="return confirm('Bạn có chắc chắn muốn xóa?');">Xóa</a>
                                    </c:otherwise>
                                </c:choose>
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
                                <label class="form-label">Tên Khuyến Mãi</label>
                                <input type="text" name="name" class="form-control" required>
                            </div>
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

        <!-- Modal Chỉnh Sửa Khuyến Mãi -->
        <div class="modal fade" id="editDatePromoModal" tabindex="-1" aria-labelledby="editDatePromoModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editDatePromoModalLabel">Chỉnh Sửa Khuyến Mãi</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="promotion_date" method="post">
                            <input type="hidden" id="editPromoId" name="id">
                            <div class="mb-3">
                                <label class="form-label">Tên Khuyến Mãi</label>
                                <input type="text" id="editPromoName" name="name" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Ngày Bắt Đầu</label>
                                <input type="date" id="editPromoStartDate" name="startDate" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Ngày Hết Hạn</label>
                                <input type="date" id="editPromoEndDate" name="endDate" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Giảm Giá (%)</label>
                                <input type="number" id="editPromoDiscount" name="discount" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Số Lượng</label>
                                <input type="number" id="editPromoQuantity" name="quantity" class="form-control" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Cập Nhật</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
