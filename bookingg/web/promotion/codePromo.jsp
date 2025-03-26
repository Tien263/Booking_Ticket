<<<<<<< HEAD
<%-- 
    Document   : codePromo
    Created on : Feb 14, 2025, 2:00:30 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Khuyến Mãi - Mã Giảm Giá</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script>
        // Hàm tạo mã ngẫu nhiên
        function generateRandomCode() {
            let chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
            let code = '';
            for (let i = 0; i < 8; i++) {
                code += chars.charAt(Math.floor(Math.random() * chars.length));
            }
            document.getElementById('promoCode').value = code;
        }

        // Hàm xử lý khi nhấn nút "Sửa"
        document.addEventListener("DOMContentLoaded", function () {
            let editButtons = document.querySelectorAll(".edit-btn");
            editButtons.forEach(button => {
                button.addEventListener("click", function () {
                    document.getElementById("editPromoId").value = this.getAttribute("data-id");
                    document.getElementById("editPromoName").value = this.getAttribute("data-name");
                    document.getElementById("editPromoCode").value = this.getAttribute("data-code");
                    document.getElementById("editPromoDiscount").value = this.getAttribute("data-discount");
                    document.getElementById("editPromoEndDate").value = this.getAttribute("data-enddate");
                    document.getElementById("editPromoQuantity").value = this.getAttribute("data-quantity");
                });
            });
        });
    </script>
</head>
<body>
    <div class="container mt-4">
        <h2 class="text-center">Quản Lý Khuyến Mãi - Mã Giảm Giá</h2>

        <div class="row mb-3">
            <div class="col-md-6">
                <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addCodeModal">Thêm Mã Giảm Giá</button>
            </div>
            <div class="col-md-6">
                <input type="text" class="form-control" placeholder="Tìm kiếm mã giảm giá...">
            </div>
        </div>

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên Khuyến Mãi</th>
                    <th>Mã Code</th>
                    <th>Giảm Giá</th>
                    <th>Ngày Hết Hạn</th>
                    <th>Số Lượng</th>
                    <th>Trạng Thái</th>
                    <th>Thao Tác</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="promo" items="${promotions}">
=======
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>All Promotions</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <h1>All Promotions</h1>

        <!-- Promotions By Date -->
        <h2>Promotions By Date</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Discount (%)</th>
                    <th>Quantity</th>
                    <th>Employee ID</th>
                    <th>Priority</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="promo" items="${datePromotions}">
                    <tr>
                        <td>${promo.id}</td>
                        <td>${promo.name}</td>
                        <td>${promo.startDate}</td>
                        <td>${promo.endDate}</td>
                        <td>${promo.discount}</td>
                        <td>${promo.quantity}</td>
                        <td>
                            <c:choose>
                                <c:when test="${promo.eId != null}">${promo.eId}</c:when>
                                <c:otherwise>N/A</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${promo.priority != null}">${promo.priority}</c:when>
                                <c:otherwise>N/A</c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Promotions By Code -->
        <h2>Promotions By Code</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Code</th>
                    <th>Discount (%)</th>
                    <th>End Date</th>
                    <th>Quantity</th>
                    <th>Advertisement ID</th>
                    <th>Employee ID</th>
                    <th>Priority</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="promo" items="${codePromotions}">
>>>>>>> main
                    <tr>
                        <td>${promo.id}</td>
                        <td>${promo.name}</td>
                        <td>${promo.code}</td>
<<<<<<< HEAD
                        <td>${promo.discount}%</td>
                        <td>${promo.endDate}</td>
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
                                    data-bs-target="#editCodeModal"
                                    data-id="${promo.id}"
                                    data-name="${promo.name}"
                                    data-code="${promo.code}"
                                    data-discount="${promo.discount}"
                                    data-enddate="${promo.endDate}"
                                    data-quantity="${promo.quantity}">
                                Sửa
                            </button>

                            <!-- Xóa -->
                            <c:choose>
                                <c:when test="${promo.endDate.after(today)}">
                                    <button class="btn btn-danger btn-sm" disabled title="Không thể xóa mã giảm giá đang hoạt động">Xóa</button>
                                </c:when>
                                <c:otherwise>
                                    <a href="deletePromotion?id=${promo.id}" class="btn btn-danger btn-sm"
                                       onclick="return confirm('Bạn có chắc chắn muốn xóa?');">Xóa</a>
                                </c:otherwise>
=======
                        <td>${promo.discount}</td>
                        <td>${promo.endDate}</td>
                        <td>${promo.quantity}</td>
                        <td>
                            <c:choose>
                                <c:when test="${promo.aId != null}">${promo.aId}</c:when>
                                <c:otherwise>N/A</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${promo.eId != null}">${promo.eId}</c:when>
                                <c:otherwise>N/A</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${promo.priority != null}">${promo.priority}</c:when>
                                <c:otherwise>N/A</c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Promotions By Passengers -->
        <h2>Promotions By Passengers</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Discount (%)</th>
                    <th>Min Tickets</th>
                    <th>Min Points</th>
                    <th>Employee ID</th>
                    <th>Priority</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="promo" items="${passengerPromotions}">
                    <tr>
                        <td>${promo.id}</td>
                        <td>${promo.name}</td>
                        <td>${promo.discount}</td>
                        <td>${promo.minTickets}</td>
                        <td>${promo.minPoints}</td>
                        <td>
                            <c:choose>
                                <c:when test="${promo.eId != null}">${promo.eId}</c:when>
                                <c:otherwise>N/A</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${promo.priority != null}">${promo.priority}</c:when>
                                <c:otherwise>N/A</c:otherwise>
>>>>>>> main
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
<<<<<<< HEAD

    <!-- Modal Thêm Mã Giảm Giá -->
    <div class="modal fade" id="addCodeModal" tabindex="-1" aria-labelledby="addCodeModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addCodeModalLabel">Thêm Mã Giảm Giá</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="promotion_code" method="post">
                        <div class="mb-3">
                            <label class="form-label">Tên Khuyến Mãi</label>
                            <input type="text" name="name" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Mã Code</label>
                            <div class="input-group">
                                <input type="text" id="promoCode" name="code" class="form-control" required readonly>
                                <button type="button" class="btn btn-secondary" onclick="generateRandomCode()">Tạo Ngẫu Nhiên</button>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Mức Giảm (%)</label>
                            <input type="number" name="discount" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Ngày Hết Hạn</label>
                            <input type="date" name="endDate" class="form-control" required>
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

    <!-- Modal Chỉnh Sửa Mã Giảm Giá -->
    <div class="modal fade" id="editCodeModal" tabindex="-1" aria-labelledby="editCodeModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editCodeModalLabel">Chỉnh Sửa Mã Giảm Giá</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="promotion_code" method="post">
                        <input type="hidden" id="editPromoId" name="id">
                        <div class="mb-3">
                            <label class="form-label">Tên Khuyến Mãi</label>
                            <input type="text" id="editPromoName" name="name" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Mã Code</label>
                            <input type="text" id="editPromoCode" name="code" class="form-control" readonly>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Mức Giảm (%)</label>
                            <input type="number" id="editPromoDiscount" name="discount" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Ngày Hết Hạn</label>
                            <input type="date" id="editPromoEndDate" name="endDate" class="form-control" required>
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
=======
</body>
</html>
>>>>>>> main
