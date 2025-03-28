<%--
    Document   : listbusroutes
    Created on : Mar 28, 2025, 7:12:56 AM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh sách tuyến xe</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
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
            <!-- Form tìm kiếm -->
            <form method="post" action="listbusroute" class="form-inline mb-4">
                <div class="form-group">
                    <label for="br_from" class="mr-2">Điểm đi:</label>
                    <input type="text" name="br_from" id="br_from" class="form-control" placeholder="Điểm đi" value="${br_from}">
                </div>
                <div class="form-group">
                    <label for="br_to" class="mr-2">Điểm đến:</label>
                    <input type="text" name="br_to" id="br_to" class="form-control" placeholder="Điểm đến" value="${br_to}">
                </div>
                <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                <button type="submit" name="action" value="reset" class="btn btn-secondary">Xóa</button>
            </form>

            <!-- Bảng danh sách tuyến xe -->
            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>ID Tuyến</th>
                        <th>Điểm đi</th>
                        <th>Điểm đến</th>
                        <th>Giá hiện hành</th>
                        <th>Quãng đường</th>
                        <th>Mô tả</th>
                        <th>Trạng thái</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${br}" var="br">
                        <tr>
                            <td>${br.br_id}</td>
                            <td>${br.br_from}</td>
                            <td>${br.br_to}</td>
                            <td>${br.br_price}</td>
                            <td>${br.br_distance}</td>
                            <td>${br.br_description}</td>
                            <td>${br.br_status}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html