<%-- 
    Document   : listBusRoute
    Created on : Mar 6, 2025, 1:18:42 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList, model.managerTrip.BusRoute" %>
<%
    ArrayList<BusRoute> list = (ArrayList<BusRoute>) request.getAttribute("listBusRoute");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        
        <title>Hiển thị thông tin tuyến - BusGo</title>
        <link rel="shortcut icon" href="assets/images/logo/logo_01_1.png">

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
                            <li><a class="nav-link text-secondary" href="TicketURL?service=listOfAll"><i class="fas fa-ticket"></i> Danh sách Vé xe</a></li>
                        </ul>
                    </li>
                    <!-- Quản lý Tuyến Xe -->
                    <li class="nav-item">
                        <a class="nav-link fw-bold text-dark" href="#" id="toggleBusRoute">
                            <i class="fas fa-bus"></i> Quản lý Tuyến Xe
                        </a>
                        <ul class="list-unstyled ps-3 d-none text-muted" id="busRouteMenu">
                            <li><a class="nav-link text-secondary active bg-light" href="BusRouteURL?service=listOfAll"><i class="fas fa-list"></i> Danh sách tuyến xe</a></li>
                            <li><a class="nav-link text-secondary " href="BusRouteURL?service=insert"><i class="fas fa-plus"></i> Thêm tuyến xe</a></li>
                        </ul>
                    </li>

                    <!-- Quản lý Chuyến Xe -->
                    <li class="nav-item">
                        <a class="nav-link fw-bold text-dark" href="#" id="toggleBusTrip">
                            <i class="fas fa-route"></i> Quản lý Chuyến xe
                        </a>
                        <ul class="list-unstyled ps-3 d-none text-muted" id="busTripMenu">
                            <li><a class="nav-link text-secondary" href="BusTripURL?service=listOfAll"><i class="fas fa-list"></i> Danh sách chuyến xe</a></li>
                            <li><a class="nav-link text-secondary" href="BusTripURL?service=insert"><i class="fas fa-plus"></i> Thêm chuyến xe</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <!--End-Sidebar -->
            <!-- Main Content -->
            <main class="col-md-10 ml-sm-auto px-4">
                <div class="d-flex justify-content-between align-items-center py-3">
                    <h2>Danh Sách Tuyến Xe</h2>
                    <li><a href="logout"><i class="fal fa-sign-out"></i> Logout</a></li>    
                </div>                    
                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Trang Chủ</a></li>
                        <li class="breadcrumb-item"><a href="BusRouteURL?service=listOfAll">Quản lý tuyến xe</a></li>
                        <li class="breadcrumb-item active">Danh sách tuyến Xe</li>
                    </ol>
                </nav>
                <c:if test="${not empty message}">
                    <div style="color: red; font-weight: bold; margin-bottom: 10px;">
                        ${message}
                    </div>
                </c:if>
                <div class="card p-4 mb-4">
                    <form action="BusRouteURL" method="get" class="form-inline mb-3">
                        <input type="hidden" name="service" value="listOfAll"> 
                        <label class="mr-2" for="br_from">Điểm đi:</label>
                        <input class="form-control mr-3" type="text" name="br_from" id="br_from" value="${br_from}">
                        <label class="mr-2" for="br_to">Điểm đến:</label>
                        <input class="form-control mr-3" type="text" name="br_to" id="br_to" value="${br_to}">
                        <button class="btn btn-primary" type="submit" >Tìm kiếm</button>
                        <button type="reset" class="btn btn-secondary" onclick="resetForm()">Xóa</button>
                    </form>
                </div>
                <div class="card p-4">
                    <div class="d-flex justify-content-end mb-3">
                        <a href="BusRouteURL?service=insert" class="btn btn-success">+ Thêm tuyến xe</a>
                    </div>

                    <table class="table table-bordered">
                        <thead class="thead-dark">
                            <tr>
                                <th>ID Tuyến</th>
                                <th>Điểm đi</th>
                                <th>Điểm đến</th>
                                <th>Giá hiện hành</th>
                                <th>Quãng đường</th>
                                <th>Mô tả</th>
                                <th>Trạng thái</th>
                                <th>Sửa</th>
                                <th>Xóa</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for(BusRoute busRoute: list) { %>
                            <tr>
                                <td><%=busRoute.getBr_id()%></td>
                                <td><%=busRoute.getBr_from()%></td>
                                <td><%=busRoute.getBr_to()%></td>
                                <td><%=busRoute.getBr_price()%></td>
                                <td><%=busRoute.getBr_distance()%></td>
                                <td><%=busRoute.getBr_description()%></td>
                                <td><%=busRoute.getBr_status()%></td>
                                <td><a href="BusRouteURL?service=update&br_id=<%=busRoute.getBr_id()%>" class="text-primary"><i class="fas fa-edit"></i></a></td>
                                <td><a href="BusRouteURL?service=delete&br_id=<%=busRoute.getBr_id()%>" class="text-danger"><i class="fas fa-trash-alt"></i></a></td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
                <div class="pagination">
                    <c:if test="${currentPage > 1}">
                        <a href="BusRouteURL?service=listOfAll&page=${currentPage - 1}" class="page-link prev">Trang trước</a>
                    </c:if>

                    <c:forEach begin="1" end="${endPage}" var="i">
                        <a href="BusRouteURL?service=listOfAll&page=${i}" class="${i == currentPage ? 'page-link active' : 'page-link'}">${i}</a>
                    </c:forEach>

                    <c:if test="${currentPage < endPage}">
                        <a href="BusRouteURL?service=listOfAll&page=${currentPage + 1}" class="page-link next">Trang tiếp</a>
                    </c:if>
                </div>

            </main>
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
        // Toggle danh sách Vé Xe
        document.getElementById("toggleTicket").addEventListener("click", function (event) {
            event.preventDefault();
            document.getElementById("ticketMenu").classList.toggle("d-none");
        });
        // Kiểm tra URL hiện tại để giữ menu mở
        window.addEventListener("DOMContentLoaded", function () {
            const currentUrl = window.location.href;
            if (currentUrl.includes("BusRouteURL?service=listOfAll") || currentUrl.includes("BusRouteURL?service=insert")) {
                document.getElementById("busRouteMenu").classList.remove("d-none");
            }
        });
    </script>
    <script>
        function resetForm() {
            window.location.href = "BusRouteURL?service=listOfAll"; // Điều hướng về trang gốc
        }
    </script>
</body>
</html>
