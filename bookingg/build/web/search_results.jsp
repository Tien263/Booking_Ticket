<%-- 
    Document   : bookingg
    Created on : Feb 12, 2025, 10:25:36 PM
    Author     : Nguyen Minh Duc
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.bookTicket.BusTrip" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String from = (String) request.getAttribute("from");
    String to = (String) request.getAttribute("to");
    String hour = (String) request.getAttribute("hour");
    String minute = (String) request.getAttribute("minute");
    String time = (String) request.getAttribute("time");
    String travelDate = request.getParameter("travelDate");

    // Nếu `travelDate` chưa có giá trị, lấy ngày hiện tại
    if (travelDate == null || travelDate.isEmpty()) {
        java.util.Date today = new java.util.Date();
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
        travelDate = sdf.format(today); // Ngày hiện tại theo định dạng yyyy-MM-dd
    }

    String[] provinces = (String[]) request.getAttribute("provinces");
    List<BusTrip> trips = (List<BusTrip>) request.getAttribute("trips");
    String error = (String) request.getAttribute("error");
    String message = (String) request.getAttribute("message");
    String c_id = (String) request.getAttribute("c_id");
    // Xử lý ngày mặc định
    if (time == null) {
        java.util.Date today = new java.util.Date();
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
        time = sdf.format(today); // Ngày hiện tại theo định dạng yyyy-MM-dd
    }

    if (hour == null) {
        hour = "5"; // Mặc định 5h
    }

    if (minute == null) {
        minute = "0"; // Mặc định 0 phút
    }
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
                                    <li class="active has_child">
                                        <a href="home.jsp">Home</a>
                                    </li>
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
                    <h1 class="page_title text-white mb-0">Tìm Chuyến</h1>
                </div>
            </div>

            <div class="breadcrumb_nav clearfix" data-bg-color="#F2F2F2">
                <div class="container">
                    <ul class="ul_li clearfix">
                        <li><a href="home.jsp">Trang chủ</a></li>
                        <li>Tìm Chuyến</li>
                    </ul>
                </div>
            </div>
        </section>

        <div class="register_card mb_60" data-bg-color="#F2F2F2" data-aos="fade-up" data-aos-delay="100" style="max-width: 900px; margin: auto; margin-top: 30px;">
            <form method="GET" action="booking">
                <div class="row">
                    <div class="col-lg-12 text-left mb-3">
                        <label>
                            <input type="radio" name="trip_type" value="oneway" checked> Một chiều
                        </label>
                        <label class="ml-4">
                            <input type="radio" name="trip_type" value="roundtrip"> Khứ hồi
                        </label>
                        <a href="#">Ticket booking guide</a>
                    </div>

                    <div class="col-lg-6 col-md-6 col-sm-12" data-aos-delay="500">
                        <div class="form_item">
                            <h4 class="input_title">Điểm đi</h4>
                            <select name="from" class="form-control" required>
                                <% for (String province : provinces) { 
                                    boolean isSelected = (from != null && province.equals(from));
                                %>
                                <option value="<%= province %>" <%= isSelected ? "selected" : "" %>>
                                    <%= province %>
                                </option>
                                <% } %>
                            </select>
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-6 col-sm-12" data-aos-delay="500">
                        <div class="form_item">
                            <h4 class="input_title">Điểm đến</h4>
                            <select name="to" class="form-control" required>
                                <% for (String province : provinces) { 
                                    boolean isSelected = (to != null && province.equals(to));
                                %>
                                <option value="<%= province %>" <%= isSelected ? "selected" : "" %>>
                                    <%= province %>
                                </option>
                                <% } %>
                            </select>
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-6 col-sm-12" data-aos="fade-up" data-aos-delay="500">
                        <div class="form_item">
                            <h4 class="input_title">Thời gian</h4>
                            <div class="d-flex align-items-center gap-2">
                                <label for="hour">Giờ:</label>
                                <input type="number" id="hour" name="hour" class="form-control w-25" min="0" max="23" value="<%= (hour != null) ? hour : 0 %>" required>
                                <label for="minute">Phút:</label>
                                <input type="number" id="minute" name="minute" class="form-control w-25" min="0" max="59" value="<%= (minute != null) ? minute : 0 %>" required>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-6 col-sm-12" data-aos="fade-up" data-aos-delay="500">
                        <div class="form_item">
                            <h4 class="input_title">Ngày đi</h4>
                            <input type="date" name="travelDate" class="form-control" value="<%= (travelDate != null) ? travelDate : "" %>" required>
                        </div>
                    </div>

                    <div class="text-center mt-4">
                        <button type="submit" class="custom_btn bg_default_red btn_width text-uppercase" data-aos="fade-up" data-aos-delay="700">
                            Tìm chuyến
                        </button>
                    </div>
                </div>
            </form>

            <div class="col-lg-12" data-aos="fade-up" data-aos-delay="500">
                <div class="form_item">
                    <% if (error != null) { %>
                    <p class="float-left text-danger" style="font-size: 18px; font-weight: bold;"><%= error %></p>
                    <% } %>
                    <% if (message != null) { %>
                    <p class="float-left text-danger" style="font-size: 18px; font-weight: bold;"><%= message %></p>
                    <% } %>
                </div>
            </div>
        </div>

        <div class="container">
            <% if (trips != null && !trips.isEmpty()) { %>
            <h2>Kết quả tìm kiếm</h2>
            <div class="row">
                <% for (BusTrip trip : trips) { %>
                <div class="col-lg-6 col-md-6">
                    <div class="feature_vehicle_item" data-aos="fade-up" data-aos-delay="100">
                        <h3 class="item_title mb-0">
                            <a href="#!">
                                Tuyến <%= trip.getBrFrom() %> - <%= trip.getBrTo() %>
                            </a>
                        </h3>
                        <ul class="info_list ul_li_center clearfix">
                            <li>Thời Gian: <%= trip.getBt1DepartureTime() %> - <%= trip.getBt1ArrivalTime() %></li>
                            <li>Năm-Tháng-Ngày: <%= trip.getDate() %></li>
                            <li>Giá vé: <%= trip.gettPrice() %> VNĐ</li>
                            <li>Mô tả: <%= trip.getBrDescription() %></li>
                            <li>Khoảng cách: <%= trip.getBrDistance() %> km</li>
                            <li>Biển hiệu: <%= trip.getV_id() %></li>
                        </ul>
                        <form action="CheckCId" method="GET">
                            <input type="hidden" name="c_id" value="<%= c_id %>">
                            <input type="hidden" name="brId" value="<%= trip.getBrId() %>">
                            <input type="hidden" name="from" value="<%= trip.getBrFrom() %>">
                            <input type="hidden" name="to" value="<%= trip.getBrTo() %>">
                            <input type="hidden" name="departureTime" value="<%= trip.getBt1DepartureTime() %>">
                            <input type="hidden" name="arrivalTime" value="<%= trip.getBt1ArrivalTime() %>">
                            <input type="hidden" name="price" value="<%= trip.gettPrice() %>">
                            <input type="hidden" name="description" value="<%= trip.getBrDescription() %>">
                            <input type="hidden" name="distance" value="<%= trip.getBrDistance() %>">
                            <input type="hidden" name="vId" value="<%= trip.getV_id() %>">
                            <input type="hidden" name="bt1Id" value="<%= trip.getBt1_id() %>">
                            <input type="hidden" name="bt1_date" value="<%= trip.getDate() %>">
                            <button type="submit" class="btn btn-primary">Chọn chuyến</button>
                        </form>
                    </div>
                </div>
                <% } %>
            </div>
            <% } %>
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
</body>
</html>