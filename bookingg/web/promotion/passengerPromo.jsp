<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Khuyến Mãi Theo Hạng Thành Viên</title>
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
        .btn-add {
            position: absolute;
            top: 20px;
            right: 20px;
        }
    </style>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // Xử lý nút "Sửa" để điền dữ liệu vào modal chỉnh sửa
            let editButtons = document.querySelectorAll(".edit-btn");
            editButtons.forEach(button => {
                button.addEventListener("click", function () {
                    document.getElementById("editPromoId").value = this.getAttribute("data-id");
                    document.getElementById("editPromoName").value = this.getAttribute("data-name");
                    document.getElementById("editPromoDiscount").value = this.getAttribute("data-discount");
                    document.getElementById("editPromoMinTickets").value = this.getAttribute("data-mintickets");
                    document.getElementById("editPromoMinPoints").value = this.getAttribute("data-minpoints");
                    document.getElementById("editPromoEId").value = this.getAttribute("data-eid") || '';
                    document.getElementById("editPromoPriority").value = this.getAttribute("data-priority") || '';
                });
            });

            // Xử lý nút xóa
            let deleteButtons = document.querySelectorAll(".delete-btn");
            deleteButtons.forEach(button => {
                button.addEventListener("click", function () {
                    if (confirm("Bạn có chắc chắn muốn xóa khuyến mãi này?")) {
                        let id = this.getAttribute("data-id");
                        window.location.href = "promotion_passenger?action=delete&id=" + id;
                    }
                });
            });
        });
    </script>
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
                <a class="nav-link active" href="promotion_passenger"><i class="fas fa-bus me-2"></i>Khuyến mãi theo hạng thành viên</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="promotion_code"><i class="fas fa-list me-2"></i> Khuyến Mãi Theo Mã</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="promotion_date"><i class="fas fa-list me-2"></i> Khuyến Mãi Theo Ngày</a>
            </li>
        </ul>
    </div>

    <!-- Content -->
    <div class="content">
        <!-- Header -->
        <div class="header">
            <h2>Danh Sách Khuyến Mãi Theo Hạng Thành Viên</h2>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Trang Chủ</a></li>
                    <li class="breadcrumb-item"><a href="#">Quản Lý Khuyến Mãi</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Danh Sách Khuyến Mãi Theo Hạng Thành Viên</li>
                </ol>
            </nav>
        </div>

        <!-- Nút Thêm Khuyến Mãi Theo Hạng Thành Viên -->
        <button type="button" class="btn btn-success btn-add" data-bs-toggle="modal" data-bs-target="#addPassengerPromoModal">
            <i class="fas fa-plus me-2"></i> Thêm Khuyến Mãi Theo Hạng Thành Viên
        </button>

        <!-- Form lọc -->
        <div class="filter-form">
            <form action="promotion_passenger" method="get" class="row g-3">
                <div class="col-md-3">
                    <input type="text" name="filterName" class="form-control" placeholder="Tìm theo tên" value="${param.filterName}">
                </div>
                <div class="col-md-3">
                    <input type="number" name="filterDiscount" class="form-control" placeholder="Tìm theo giảm giá (%)" step="0.01" value="${param.filterDiscount}">
                </div>
                <div class="col-md-3">
                    <input type="number" name="filterMinTickets" class="form-control" placeholder="Số vé tối thiểu" value="${param.filterMinTickets}">
                </div>
                <div class="col-md-3">
                    <input type="number" name="filterMinPoints" class="form-control" placeholder="Số điểm tối thiểu" value="${param.filterMinPoints}">
                </div>
                <div class="col-md-3">
                    <select name="filterStatus" class="form-select">
                        <option value="">Tất cả trạng thái</option>
                        <option value="active" ${param.filterStatus == 'active' ? 'selected' : ''}>Hoạt động</option>
                        <option value="inactive" ${param.filterStatus == 'inactive' ? 'selected' : ''}>Hết hạn</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <button type="submit" class="btn btn-primary me-2"><i class="fas fa-search me-2"></i> Tìm kiếm</button>
                    <button type="button" class="btn btn-secondary" onclick="window.location.href='promotion_passenger'"><i class="fas fa-eraser me-2"></i> Xóa</button>
                </div>
            </form>
        </div>

        <!-- Hiển thị thông báo -->
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">${errorMessage}</div>
        </c:if>
        <c:if test="${not empty successMessage}">
            <div class="alert alert-success">${successMessage}</div>
        </c:if>

        <!-- Bảng danh sách khuyến mãi theo hạng thành viên -->
        <div class="table-container">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên Khuyến Mãi</th>
                    <th>Giảm Giá</th>
                    <th>Số Vé Tối Thiểu</th>
                    <th>Số Điểm Tối Thiểu</th>
                    <th>Mã Nhân Viên</th>
                    <th>Độ Ưu Tiên</th>
                    <th>Trạng Thái</th>
                    <th>Sửa</th>
                    <th>Xóa</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="promo" items="${promotions}">
                    <tr>
                        <td>${promo.id}</td>
                        <td>${promo.name}</td>
                        <td>${promo.discount}%</td>
                        <td>${promo.minTickets}</td>
                        <td>${promo.minPoints}</td>
                        <td>${promo.eId != null ? promo.eId : ''}</td>
                        <td>${promo.priority != null ? promo.priority : ''}</td>
                        <td>
                            <span class="badge ${promo.priority != null && promo.priority > 0 ? 'bg-success' : 'bg-danger'}">
                                ${promo.priority != null && promo.priority > 0 ? 'Hoạt động' : 'Hết hạn'}
                            </span>
                        </td>
                        <td>
                            <button class="btn btn-warning btn-sm edit-btn"
                                    data-bs-toggle="modal"
                                    data-bs-target="#editPassengerPromoModal"
                                    data-id="${promo.id}"
                                    data-name="${promo.name}"
                                    data-discount="${promo.discount}"
                                    data-mintickets="${promo.minTickets}"
                                    data-minpoints="${promo.minPoints}"
                                    data-eid="${promo.eId}"
                                    data-priority="${promo.priority}">
                                <i class="fas fa-edit"></i>
                            </button>
                        </td>
                        <td>
                            <button class="btn btn-danger btn-sm delete-btn" data-id="${promo.id}">
                                <i class="fas fa-trash"></i>
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <!-- Phân trang -->
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                        <a class="page-link" href="promotion_passenger?page=${currentPage - 1}" aria-label="Previous">
                            <span aria-hidden="true">Trang trước</span>
                        </a>
                    </li>
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <li class="page-item ${currentPage == i ? 'active' : ''}">
                            <a class="page-link" href="promotion_passenger?page=${i}">${i}</a>
                        </li>
                    </c:forEach>
                    <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                        <a class="page-link" href="promotion_passenger?page=${currentPage + 1}" aria-label="Next">
                            <span aria-hidden="true">Trang tiếp</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>

    <!-- Modal Thêm Khuyến Mãi Theo Hạng Thành Viên -->
    <div class="modal fade" id="addPassengerPromoModal" tabindex="-1" aria-labelledby="addPassengerPromoModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addPassengerPromoModalLabel">Thêm Khuyến Mãi Theo Hạng Thành Viên</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="promotion_passenger" method="post">
                        <div class="mb-3">
                            <label class="form-label">Tên Khuyến Mãi</label>
                            <input type="text" name="name" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Giảm Giá (%)</label>
                            <input type="number" name="discount" class="form-control" step="0.01" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Số Vé Tối Thiểu</label>
                            <input type="number" name="minTickets" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Số Điểm Tối Thiểu</label>
                            <input type="number" name="minPoints" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Mã Nhân Viên</label>
                            <input type="number" name="eId" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Độ Ưu Tiên</label>
                            <input type="number" name="priority" class="form-control">
                        </div>
                        <button type="submit" class="btn btn-primary">Thêm</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Chỉnh Sửa Khuyến Mãi Theo Hạng Thành Viên -->
    <div class="modal fade" id="editPassengerPromoModal" tabindex="-1" aria-labelledby="editPassengerPromoModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editPassengerPromoModalLabel">Chỉnh Sửa Khuyến Mãi Theo Hạng Thành Viên</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="promotion_passenger" method="post">
                        <input type="hidden" id="editPromoId" name="id">
                        <div class="mb-3">
                            <label class="form-label">Tên Khuyến Mãi</label>
                            <input type="text" id="editPromoName" name="name" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Giảm Giá (%)</label>
                            <input type="number" id="editPromoDiscount" name="discount" class="form-control" step="0.01" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Số Vé Tối Thiểu</label>
                            <input type="number" id="editPromoMinTickets" name="minTickets" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Số Điểm Tối Thiểu</label>
                            <input type="number" id="editPromoMinPoints" name="minPoints" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Mã Nhân Viên</label>
                            <input type="number" id="editPromoEId" name="eId" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Độ Ưu Tiên</label>
                            <input type="number" id="editPromoPriority" name="priority" class="form-control">
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