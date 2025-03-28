<%--
    Document   : listbustrip
    Created on : Mar 28, 2025, 9:20:05 AM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh sách chuyến xe</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            .pagination {
                justify-content: center;
                margin-top: 20px;
            }
            .form-inline .form-group {
                margin-right: 15px;
            }
            .form-inline .btn {
                margin-left: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container mt-4">
            <h2>Danh sách chuyến xe</h2>

            <!-- Form tìm kiếm -->
            <form method="get" action="listbustrip" class="form-inline mb-4">
                <div class="form-group">
                    <label for="bt1_date" class="mr-2">Ngày:</label>
                    <input type="date" name="bt1_date" id="bt1_date" class="form-control" value="${bt1_date}">
                </div>
                <div class="form-group">
                    <label for="br_id" class="mr-2">Mã tuyến:</label>
                    <input type="text" name="br_id" id="br_id" class="form-control" placeholder="Mã tuyến" value="${br_id}">
                </div>
                <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                <button type="submit" name="action" value="reset" class="btn btn-secondary">Xóa</button>
            </form>

            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
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
                    <!-- Nút Previous -->
                    <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                        <a class="page-link" href="listbustrip?page=${currentPage - 1}&bt1_date=${bt1_date}&br_id=${br_id}" aria-label="Previous">
                            <span aria-hidden="true">«</span>
                        </a>
                    </li>

                    <!-- Hiển thị số trang -->
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <li class="page-item ${currentPage == i ? 'active' : ''}">
                            <a class="page-link" href="listbustrip?page=${i}&bt1_date=${bt1_date}&br_id=${br_id}">${i}</a>
                        </li>
                    </c:forEach>

                    <!-- Nút Next -->
                    <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                        <a class="page-link" href="listbustrip?page=${currentPage + 1}&bt1_date=${bt1_date}&br_id=${br_id}" aria-label="Next">
                            <span aria-hidden="true">»</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>