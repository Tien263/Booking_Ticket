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
            function generateRandomCode() {
                let chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
                let code = '';
                for (let i = 0; i < 8; i++) {
                    code += chars.charAt(Math.floor(Math.random() * chars.length));
                }
                document.getElementById('promoCode').value = code;
            }
            
            
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
                        <tr>
                            <td>${promo.id}</td>
                            <td>${promo.code}</td>
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
                                <a href="editPromotion?id=${promo.id}" class="btn btn-warning btn-sm">Sửa</a>

                                <c:set var="today" value="<%= new java.util.Date() %>"/>
                                <c:choose>
                                    <c:when test="${promo.endDate.after(today)}">
                                        <!-- Mã đang hoạt động, không cho xóa -->
                                        <button class="btn btn-danger btn-sm" disabled title="Không thể xóa mã giảm giá đang hoạt động">Xóa</button>
                                    </c:when>
                                    <c:otherwise>
                                        <!-- Mã đã hết hạn, có thể xóa -->
                                        <a href="deletePromotion?id=${promo.id}" class="btn btn-danger btn-sm"
                                           onclick="return confirm('Bạn có chắc chắn muốn xóa?');">Xóa</a>
                                    </c:otherwise>
                                </c:choose>
                            </td>

                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

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

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
