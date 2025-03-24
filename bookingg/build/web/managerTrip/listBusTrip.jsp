<%-- 
    Document   : listBusTrip
    Created on : Mar 6, 2025, 8:28:22 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList, model.managerTrip.BusTrips" %>
<%
    ArrayList<BusTrips> list = (ArrayList<BusTrips>) request.getAttribute("listBusTrip");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>My Bus - Danh Sách Chuyến Xe</title>
        <link rel="shortcut icon" href="assets/images/logo/favourite_icon.png">

        <!-- CSS Libraries -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/aos.css">
        <link rel="stylesheet" href="assets/css/animate.css">
        <link rel="stylesheet" href="assets/css/slick.css">
        <link rel="stylesheet" href="assets/css/slick-theme.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="assets/css/jquery-ui.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <style>
            .pagination {
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 10px;
                margin: 20px 0;
                font-family: Arial, sans-serif;
            }

            .page-link {
                text-decoration: none;
                padding: 8px 12px;
                border: 1px solid #ddd;
                border-radius: 5px;
                color: #333;
                background-color: #fff;
                transition: all 0.3s ease;
            }

            .page-link:hover {
                background-color: #f0f0f0;
                border-color: #aaa;
            }

            .page-link.active {
                background-color: #007bff;
                color: #fff;
                border-color: #007bff;
                pointer-events: none;
            }

            .prev, .next {
                font-weight: bold;
            }

            .prev::before {
                content: "« ";
            }

            .next::after {
                content: " »";
            }
        </style>
    </head>
    <body class="bg-light">
        <div class="d-flex">
            <!-- Sidebar -->
            <nav class="bg-white shadow p-3 vh-100" style="width: 300px">
                <div class="text-center mb-4">
                    <img src="assets/images/logo/logo_01_1.png" srcset="assets/images/logo/logo_01_1.png 2x" alt="logo_not_found">
                    <h4 class="mt-2">BusGo</h4>
                </div>
                <ul class="nav flex-column">
                    <!-- Quản lý vé Xe -->
                    <li class="nav-item">
                        <a class="nav-link fw-bold text-dark" href="TicketURL?service=listOfAll" id="toggleTicket">
                            <i class="fas fa-bus"></i> Quản lý Vé Xe
                        </a>
                        <ul class="list-unstyled ps-3 d-none text-muted" id="ticketMenu">
                            <li><a class="nav-link text-secondary active bg-light" href="TicketURL?service=listOfAll"><i class="fas fa-ticket"></i> Danh sách Vé xe</a></li>
                        </ul>
                    </li>
                    <!-- Quản lý Tuyến Xe -->
                    <li class="nav-item">
                        <a class="nav-link fw-bold text-dark" href="#" id="toggleBusRoute">
                            <i class="fas fa-bus"></i> Quản lý Tuyến Xe
                        </a>
                        <ul class="list-unstyled ps-3 d-none text-muted" id="busRouteMenu">
                            <li><a class="nav-link text-secondary" href="BusRouteURL?service=listOfAll"><i class="fas fa-list"></i> Danh sách tuyến xe</a></li>
                            <li><a class="nav-link text-secondary" href="BusRouteURL?service=insert"><i class="fas fa-plus"></i> Thêm tuyến xe</a></li>
                        </ul>
                    </li>

                    <!-- Quản lý Chuyến Xe -->
                    <li class="nav-item">
                        <a class="nav-link fw-bold text-dark" href="#" id="toggleBusTrip">
                            <i class="fas fa-route"></i> Quản lý Chuyến xe
                        </a>
                        <ul class="list-unstyled ps-3 d-none text-muted" id="busTripMenu">
                            <li><a class="nav-link text-secondary active bg-light" href="BusTripURL?service=listOfAll"><i class="fas fa-list"></i> Danh sách chuyến xe</a></li>
                            <li><a class="nav-link text-secondary" href="BusTripURL?service=insert"><i class="fas fa-plus"></i> Thêm chuyến xe</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <!--End-Sidebar -->

            <!-- Main Content -->
            <div class="flex-grow-1 p-4">
                <header class="d-flex justify-content-between align-items-center mb-4">
                    <h2>Danh Sách Chuyến Xe</h2>
                </header>
                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Trang Chủ</a></li>
                        <li class="breadcrumb-item"><a href="BusTripURL?service=listOfAll">Quản lý chuyến xe</a></li>
                        <li class="breadcrumb-item active">Danh sách chuyến Xe</li>
                    </ol>
                </nav>
                <!-- Search Form -->
                <div class="card p-4 mb-4">
                    <form action="BusTripURL" method="get" class="row g-3">
                        <input type="hidden" name="service" value="listOfAll"> 
                        <div class="col-md-3">
                            <label for="bt1_date" class="form-label">Ngày:</label>
                            <input type="date" class="form-control" name="bt1_date" id="bt1_date" value="${bt1_date}">
                        </div>
                        <div class="col-md-3">
                            <label for="br_id" class="form-label">Mã tuyến:</label>
                            <input type="number" class="form-control" name="br_id" id="br_id" min="1" value="${br_id}">
                        </div>
                        <div class="col-md-3 d-flex align-items-end">
                            <button type="submit" class="btn btn-primary me-2">Tìm kiếm</button>
                            <button type="reset" class="btn btn-secondary" onclick="resetForm()">Xóa</button>
                        </div>
                    </form>

                </div>

                <!-- Bus Trip Table -->
                <div class="card p-4">
                    <div class="d-flex justify-content-end mb-3">
                        <a href="BusTripURL?service=insert" class="btn btn-success">+ Thêm chuyến xe</a>
                    </div>
                    <table class="table table-bordered">
                        <thead class="table-dark">
                            <tr>
                                <th>Mã Chuyến</th>
                                <th>Ngày khởi hành</th>
                                <th>Thời gian khởi hành</th>
                                <th>Thời gian đến dự kiến</th>
                                <th>Trạng thái chuyến</th>
                                <th>Mã tuyến</th>
                                <th>Biển số xe</th>
                                <th>Sửa</th>
                                <th>Xóa</th>
                            </tr>
                        </thead>
                        <% for(BusTrips busTrips: list) { %>
                        <tbody>
                            <tr>
                                <td><%= busTrips.getBt1_id() %></td>
                                <td><%= busTrips.getBt1_date() %></td>
                                <td><%= busTrips.getBt1_departureTime() %></td>
                                <td><%= busTrips.getBt1_arrivalTime() %></td>
                                <td><%= busTrips.getBt1_status() %></td>
                                <td>
                                    <a href="BusRouteURL?service=detail&br_id=<%= busTrips.getBr_id() %>" class="text-primary">
                                        <%= busTrips.getBr_id() %>
                                    </a>
                                </td>
                                <td><%= busTrips.getV_licensePlate() %></td>
                                <td><a href="BusTripURL?service=update&bt1_id=<%=busTrips.getBt1_id()%>" class="text-warning"><i class="fas fa-edit"></i></a></td>
                                <td><a href="BusTripURL?service=delete&bt1_id=<%=busTrips.getBt1_id()%>" class="text-danger"><i class="fas fa-trash-alt"></i></a></td>
                            </tr>
                        </tbody>
                        <% } %>
                    </table>
                </div>
                <div class="pagination">
                    <c:if test="${currentPage > 1}">
                        <a href="BusTripURL?service=listOfAll&page=${currentPage - 1}" class="page-link prev">Trang trước</a>
                    </c:if>

                    <c:forEach begin="1" end="${endPage}" var="i">
                        <a href="BusTripURL?service=listOfAll&page=${i}" class="${i == currentPage ? 'page-link active' : 'page-link'}">${i}</a>
                    </c:forEach>

                    <c:if test="${currentPage < endPage}">
                        <a href="BusTripURL?service=listOfAll&page=${currentPage + 1}" class="page-link next">Trang tiếp</a>
                    </c:if>
                </div>

            </div>
        </div>

        <script>
            // Toggle danh sách Tuyến Xe
            document.getElementById("toggleBusRoute").addEventListener("click", function (event) {
                event.preventDefault();
                document.getElementById("busRouteMenu").classList.toggle("d-none");
            });

            // Toggle danh sách Chuyến Xe
            document.getElementById("toggleBusTrip").addEventListener("click", function (event) {
                event.preventDefault();
                document.getElementById("busTripMenu").classList.toggle("d-none");
            });
            // Kiểm tra URL hiện tại để giữ menu mở
            window.addEventListener("DOMContentLoaded", function () {
                const currentUrl = window.location.href;
                if (currentUrl.includes("BusRouteURL?service=listOfAll") || currentUrl.includes("BusRouteURL?service=insert")) {
                    document.getElementById("busRouteMenu").classList.remove("d-none");
                }
            });
            // Toggle danh sách Vé Xe
            document.getElementById("toggleTicket").addEventListener("click", function (event) {
                event.preventDefault();
                document.getElementById("ticketMenu").classList.toggle("d-none");
            });
            // Kiểm tra URL hiện tại để giữ menu mở
            window.addEventListener("DOMContentLoaded", function () {
                const currentUrl = window.location.href;
                if (currentUrl.includes("BusTripURL?service=listOfAll") || currentUrl.includes("BusTripURL?service=insert")) {
                    document.getElementById("busTripMenu").classList.remove("d-none");
                }
            });
        </script>
        <script>
            function resetForm() {
                window.location.href = "BusTripURL?service=listOfAll"; // Điều hướng về trang gốc
            }
        </script>
    </body>
</html>

