<%-- 
    Document   : customer_ticket
    Created on : Mar 23, 2025, 6:46:46 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, model.ticket.Ticket" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    ArrayList<Ticket> tickets = (ArrayList<Ticket>) request.getAttribute("tickets");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Kết quả tìm kiếm chuyến xe - Rotors</title>
        <link rel="shortcut icon" href="assets/images/logo/favourite_icon.png">

        <!-- fraimwork - css include -->
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

        <!-- icon - css include -->
        <link rel="stylesheet" type="text/css" href="assets/css/fontawesome.css">

        <!-- animation - css include -->
        <link rel="stylesheet" type="text/css" href="assets/css/aos.css">
        <link rel="stylesheet" type="text/css" href="assets/css/animate.css">

        <!-- carousel - css include -->
        <link rel="stylesheet" type="text/css" href="assets/css/slick.css">
        <link rel="stylesheet" type="text/css" href="assets/css/slick-theme.css">

        <!-- popup - css include -->
        <link rel="stylesheet" type="text/css" href="assets/css/magnific-popup.css">

        <!-- select options - css include -->
        <link rel="stylesheet" type="text/css" href="assets/css/nice-select.css">

        <!-- pricing range - css include -->
        <link rel="stylesheet" type="text/css" href="assets/css/jquery-ui.css">

        <!-- custom - css include -->
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">

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

    <body>
        <!-- backtotop - start -->
        <div id="thetop"></div>
        <div class="backtotop">
            <a href="#" class="scroll">
                <i class="far fa-arrow-up"></i>
            </a>
        </div>
        <!-- backtotop - end -->

        <!-- preloader - start -->
        <div class="preloader">
            <div class="animation_preloader">
                <div class="spinner"></div>
                <p class="text-center">Loading</p>
            </div>
            <div class="loader">
                <div class="row vh-100">
                    <div class="col-3 loader_section section-left">
                        <div class="bg"></div>
                    </div>
                    <div class="col-3 loader_section section-left">
                        <div class="bg"></div>
                    </div>
                    <div class="col-3 loader_section section-right">
                        <div class="bg"></div>
                    </div>
                    <div class="col-3 loader_section section-right">
                        <div class="bg"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- preloader - end -->

        <!-- header_section - start -->
        <header class="header_section secondary_header sticky text-white clearfix">
            <div class="header_top clearfix">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-7">
                            <ul class="header_contact_info ul_li clearfix">
                                <li><i class="fal fa-envelope"></i> rotorsmail@email.com</li>
                                <li><i class="fal fa-phone"></i> +1-202-555-0156</li>
                            </ul>
                        </div>
                        <div class="col-lg-5">
                            <ul class="primary_social_links ul_li_right clearfix">
                                <li><a href="#!"><i class="fab fa-facebook-f"></i></a></li>
                                <li><a href="#!"><i class="fab fa-instagram"></i></a></li>
                                <li><a href="#!"><i class="fab fa-twitter"></i></a></li>
                                <li><a href="#!"><i class="fab fa-youtube"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="header_bottom clearfix">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-3 col-md-6 col-sm-6 col-6">
                            <div class="brand_logo">
                                <a href="index.html">
                                    <img src="assets/images/logo/logo_01_1.png" srcset="assets/images/logo/logo_01_1.png 2x" alt="logo_not_found" width="35%">
                                </a>
                            </div>
                        </div>

                        <div class="col-lg-6 col-md-12">
                            <nav class="main_menu clearfix">
                                <ul class="ul_li_center clearfix">
                                    <li><a href="home.jsp">Home</a></li>
                                    <li><a href="booking">Booking Ticket</a></li>
                                    <li><a href="cuslistblog">Blog</a></li>
                                    <li>
                                        <a href="contact.jsp">Contact Us</a>
                                    </li>
                                    <li><a href="employee_login.jsp">Employee Login</a></li>
                                </ul>
                            </nav>
                        </div>

                        <div class="col-lg-3 col-md-6 col-sm-6 col-6 order-last">
                            <ul class="header_action_btns ul_li_right clearfix">
                                <li><button type="button" class="search_btn" data-toggle="collapse" data-target="#collapse_search_body"><i class="fal fa-search"></i></button></li>
                                <li><button type="button" class="mobile_sidebar_btn"><i class="fal fa-align-right"></i></button></li>
                            </ul>
                        </div>
                    </div>
                </div>
        </header>
        <!-- header_section - end -->

        <!-- main body - start -->
        <main>
            <section class="breadcrumb_section text-center clearfix">
                <div class="page_title_area has_overlay d-flex align-items-center clearfix" data-bg-image="assets/images/breadcrumb/bg_01_1.jpeg">
                    <div class="overlay"></div>
                    <div class="container" data-aos="fade-up" data-aos-delay="100">
                        <h1 class="page_title text-white mb-0">Chi tiết vé</h1>
                    </div>
                </div>

                <div class="breadcrumb_nav clearfix" data-bg-color="#F2F2F2">
                    <div class="container">
                        <ul class="ul_li clearfix">
                            <li><a href="home.jsp">Trang chủ</a></li>
                            <li>Lịch sử vé</li>
                            <li>Chi tiết vé</li>
                        </ul>
                    </div>
                </div>
            </section>
            <!-- Hiển thị thông báo lỗi nếu có -->
            <c:if test="${not empty sessionScope.error}">
                <div class="alert alert-danger">
                    ${sessionScope.error}
                </div>
                <c:remove var="error" scope="session" />
            </c:if>

            <!-- Chỉ hiển thị thông báo thành công nếu không có lỗi -->
            <c:if test="${empty sessionScope.error and not empty sessionScope.message}">
                <div class="alert alert-success">
                    ${sessionScope.message}
                </div>
                <c:remove var="message" scope="session" />
            </c:if>
            <% for(Ticket ticket : tickets) { %>
            <div class="bg-white shadow-lg rounded-lg p-6 mb-6 max-w-3xl mx-auto border border-gray-200">
                <div class="flex justify-between items-start space-x-6">
                    <!-- Cột thông tin chuyến đi -->
                    <div class="flex-1">
                        <h3 class="text-xl font-bold text-blue-600 mb-2">
                            <%= ticket.getDeparture() %> → <%= ticket.getDestination() %>
                        </h3>
                        <div class="space-y-2 border-b pb-3">
                            <p class="text-gray-700">
                                <strong class="text-gray-900">Ngày khởi hành:</strong> <%= ticket.getTravelDate() %>
                            </p>
                            <p class="text-gray-700">
                                <strong class="text-gray-900">Xe:</strong> <%= ticket.getVehicleType() %>
                            </p>
                            <p class="text-gray-700">
                                <strong class="text-gray-900">Thời gian khởi hành:</strong> <%= ticket.getDepartureTime() %>
                            </p>
                            <p class="text-gray-700">
                                <strong class="text-gray-900">Giá:</strong> <span class="text-green-600 font-semibold"><%= ticket.getPrice() %> VNĐ</span>
                            </p>
                        </div>
                    </div>

                    <!-- Cột thông tin khách hàng -->
                    <div class="flex-1">
                        <h3 class="text-lg font-bold text-gray-800 mb-2">
                            <%= ticket.getCustomerName() %>
                        </h3>
                        <div class="space-y-2 border-b pb-3">
                            <p class="text-gray-700">
                                <strong class="text-gray-900">Ngày mua vé:</strong> <%= ticket.getPurchaseDate() %>
                            </p>
                            <p class="text-gray-700">
                                <strong class="text-gray-900">Biển số:</strong> <%= ticket.getLicensePlate() %>
                            </p>
                            <p class="text-gray-700">
                                <strong class="text-gray-900">Thời gian đến dự kiến:</strong> <%= ticket.getArrivalTime() %>
                            </p>
                            <p class="text-gray-700">
                                <strong class="text-gray-900">Trạng thái:</strong> 
                                <span class="px-2 py-1 rounded-md font-medium
                                      <%= ticket.getStatus().equals("Confirmed") ? "bg-green-500 text-white" : "bg-yellow-500 text-black" %>">
                                    <%= ticket.getStatus() %>
                                </span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>     
            <div class="pagination">
                <c:if test="${currentPage > 1}">
                    <a href="CustomerTicketURL?service=detail&page=${currentPage - 1}" class="page-link prev">Trang trước</a>
                </c:if>

                <c:forEach begin="1" end="${endPage}" var="i">
                    <a href="CustomerTicketURL?service=detail&page=${i}" class="${i == currentPage ? 'page-link active' : 'page-link'}">${i}</a>
                </c:forEach>

                <c:if test="${currentPage < endPage}">
                    <a href="CustomerTicketURL?service=detail&page=${currentPage + 1}" class="page-link next">Trang tiếp</a>
                </c:if>
            </div>
        </main>
        <!-- main body - end -->

        <!-- footer_section - start
            ================================================== -->
        <footer class="footer_section clearfix">
            <div class="footer_widget_area sec_ptb_100 clearfix">
                <div class="container">
                    <div class="row justify-content-lg-between">
                        <div class="col-lg-4 col-md-4 col-sm-12 col-sm-12">
                            <div class="footer_about" data-aos="fade-up" data-aos-delay="100">
                                <div class="brand_logo mb_30">
                                    <a href="index.html">
                                        <img src="assets/images/logo/logo_01_1.png" srcset="assets/images/logo/logo_01_1.png 2x" alt="logo_not_found">
                                    </a>
                                </div>
                                <p class="mb_15">
                                    BusGo is committed to providing a reliable and high-quality bus ticket booking service with transparent information, clear pricing, and dedicated customer support, ensuring your journey is always convenient and safe
                                </p>
                                <div class="footer_useful_links mb_30">
                                    <ul class="ul_li_block clearfix">

                                    </ul>
                                </div>
                                <div class="form_item mb-0">
                                    <form action="#">
                                        <input id="footer_search" type="search" name="search" placeholder="Search">
                                        <label for="footer_search" class="input_icon"><i class="fal fa-search"></i></label>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-4 col-sm-12 col-sm-12">
                            <div class="footer_contact_info" data-aos="fade-up" data-aos-delay="200">
                                <h3 class="footer_widget_title">Liên hệ:</h3>
                                <ul class="ul_li_block clearfix">
                                    <li>
                                        <strong><i class="fas fa-map-marker-alt"></i> Địa chỉ:</strong>
                                        <p class="mb-0">
                                            Khu công nghệ cao Hòa Lạc - Thạch Thất - Hà Nội
                                        </p>
                                    </li>
                                    <li><i class="fas fa-clock"></i> 7:00 - 22:00</li>
                                    <li><i class="fas fa-envelope"></i> <strong>BusGo@gmail.com</strong></li>
                                    <li><i class="fas fa-phone"></i> <strong>0398 996 177</strong></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-4 col-sm-12 col-sm-12">
                            <div class="footer_useful_links" data-aos="fade-up" data-aos-delay="300">
                                <h3 class="footer_widget_title">Information:</h3>
                                <ul class="ul_li_block clearfix">
                                    <li><a href="#!"><i class="fal fa-angle-right"></i> Find a Car for Rent in the Nearest Location</a></li>
                                    <li><a href="#!"><i class="fal fa-angle-right"></i> Cars Catalog</a></li>
                                    <li><a href="#!"><i class="fal fa-angle-right"></i> F.A.Q.</a></li>
                                    <li><a href="#!"><i class="fal fa-angle-right"></i> About Us</a></li>
                                    <li><a href="#!"><i class="fal fa-angle-right"></i> Contact Us</a></li>
                                    <li><a href="#!"><i class="fal fa-angle-right"></i> Help Center</a></li>
                                    <li><a href="#!"><i class="fal fa-angle-right"></i> Privacy Police</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="footer_bottom text-white clearfix" data-bg-color="#000C21">
                <div class="container">
                    <div class="row align-items-center justify-content-lg-between">
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <p class="copyright_text mb-0">Copyright © 2020. Rotors by <a class="author_links text-white" href="#!">Merkulove</a></p>
                        </div>

                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <ul class="primary_social_links ul_li_right clearfix">
                                <li><a href="#!"><i class="fab fa-facebook-f"></i></a></li>
                                <li><a href="#!"><i class="fab fa-instagram"></i></a></li>
                                <li><a href="#!"><i class="fab fa-twitter"></i></a></li>
                                <li><a href="#!"><i class="fab fa-youtube"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- footer_section - end
        ================================================== -->

        <!-- fraimwork - jquery include -->
        <script src="assets/js/jquery-3.5.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!-- animation - jquery include -->
        <script src="assets/js/aos.js"></script>
        <script src="assets/js/parallaxie.js"></script>

        <!-- carousel - jquery include -->
        <script src="assets/js/slick.min.js"></script>

        <!-- popup - jquery include -->
        <script src="assets/js/magnific-popup.min.js"></script>

        <!-- select ontions - jquery include -->
        <script src="assets/js/nice-select.min.js"></script>

        <!-- isotope - jquery include -->
        <script src="assets/js/isotope.pkgd.js"></script>
        <script src="assets/js/imagesloaded.pkgd.min.js"></script>
        <script src="assets/js/masonry.pkgd.min.js"></script>

        <!-- google map - jquery include -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDk2HrmqE4sWSei0XdKGbOMOHN3Mm2Bf-M&ver=2.1.6"></script>
        <script src="assets/js/gmaps.min.js"></script>

        <!-- pricing range - jquery include -->
        <script src="assets/js/jquery-ui.js"></script>

        <!-- counter - jquery include -->
        <script src="assets/js/waypoint.js"></script>
        <script src="assets/js/counterup.min.js"></script>

        <!-- contact form - jquery include -->
        <script src="assets/js/validate.js"></script>

        <!-- mobile menu - jquery include -->
        <script src="assets/js/mCustomScrollbar.js"></script>

        <!-- custom - jquery include -->
        <script src="assets/js/custom.js"></script>
        <script src="https://cdn.tailwindcss.com">
        </script>
    </body>
</html>
