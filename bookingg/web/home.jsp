<%-- 
    Document   : home
    Created on : Mar 5, 2025, 10:18:45 AM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">

        <title>BusGo</title>
        <link rel="shortcut icon" href="assets/images/logo/logo_01_1.png">

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


    <%
     response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
     response.setHeader("Pragma", "no-cache");
     response.setHeader("Expires", "0");

     String user = (String) session.getAttribute("user"); // Chỉ khai báo 1 lần
    %>

    <body>


        <% if (user != null) { %>
        <p>Chào mừng, <%= user %>! <a href="LogoutController">Đăng xuất</a></p>
        <% } else { %>
        <% } %>
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


        <!-- header_section - start
        ================================================== -->
        <header class="header_section sticky text-white clearfix">
            <div class="header_top clearfix">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-7">
                            <ul class="header_contact_info ul_li clearfix">
                                <li><i class="fal fa-envelope"></i> Busgo@email.com</li>
                                <li><i class="fal fa-phone"></i> 0398 996 177</li>
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
                                <a href="home.jsp">
                                    <img src="assets/images/logo/logo_01_1.png" srcset="assets/images/logo/logo_01_1.png 2x" alt="logo_not_found" width="50%">
                                    <img src="assets/images/logo/logo_01_1.png" srcset="assets/images/logo/logo_01_1.png 2x" alt="logo_not_found" width="50%">
                                </a>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6 col-sm-6 col-6 order-last">
                            <ul class="header_action_btns ul_li_right clearfix">

                                <li class="dropdown">
                                    <!--                                    <button type="button" class="cart_btn" id="cart_dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                            <i class="fal fa-shopping-cart"></i>
                                                                            <span class="cart_counter bg_default_red">3</span>
                                                                        </button>-->
                                    <div class="cart_dropdown rotors_dropdown dropdown-menu" aria-labelledby="cart_dropdown">
                                        <h4 class="wrap_title">Cart Items: (3)</h4>
                                        <ul class="cart_items_list ul_li_block clearfix">
                                            <li>
                                                <div class="item_image">
                                                    <img src="assets/images/cart/img_2.png" alt="image_not_found">
                                                </div>
                                                <div class="item_content">
                                                    <h4 class="item_title">Digital Infrared Thermometer</h4>
                                                    <span class="item_price">$39.50</span>
                                                </div>
                                                <button type="button" class="remove_btn"><i class="fal fa-times"></i></button>
                                            </li>

                                            <li>
                                                <div class="item_image">
                                                    <img src="assets/images/cart/img_2.png" alt="image_not_found">
                                                </div>
                                                <div class="item_content">
                                                    <h4 class="item_title">Digital Infrared Thermometer</h4>
                                                    <span class="item_price">$39.50</span>
                                                </div>
                                                <button type="button" class="remove_btn"><i class="fal fa-times"></i></button>
                                            </li>

                                            <li>
                                                <div class="item_image">
                                                    <img src="assets/images/cart/img_2.png" alt="image_not_found">
                                                </div>
                                                <div class="item_content">
                                                    <h4 class="item_title">Digital Infrared Thermometer</h4>
                                                    <span class="item_price">$39.50</span>
                                                </div>
                                                <button type="button" class="remove_btn"><i class="fal fa-times"></i></button>
                                            </li>
                                        </ul>
                                        <ul class="btns_group ul_li_block clearfix">
                                            <li><a href="cart.html" class="custom_btn bg_default_red text-uppercase">View Cart <img src="assets/images/icons/icon_01.png" alt="icon_not_found"></a></li>
                                            <li><a href="#!" class="custom_btn bg_default_black text-uppercase">Checkout <img src="assets/images/icons/icon_01.png" alt="icon_not_found"></a></li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="dropdown">
                                    <button type="button" class="user_btn" id="user_dropdown" 
                                            <c:choose>
                                                <c:when test="${not empty sessionScope.user}">
                                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                                                </c:when>
                                                <c:otherwise>
                                                    onclick="window.location.href = 'login.jsp'"
                                                </c:otherwise>
                                            </c:choose>
                                            >
                                        <i class="fal fa-user"></i>
                                    </button>

                                    <c:if test="${not empty sessionScope.user}">
                                        <div class="user_dropdown rotors_dropdown dropdown-menu clearfix" aria-labelledby="user_dropdown">
                                            <div class="profile_info clearfix">
                                                <a href="#!" class="user_thumbnail">
                                                    <img src="assets/images/meta/img_01.png" alt="thumbnail_not_found">
                                                </a>
                                                <div class="user_content">
                                                    <span class="user_title">${sessionScope.user}</span>
                                                </div>
                                            </div>
                                            <ul class="ul_li_block clearfix">
                                                <li><a href="account"><i class="fal fa-user-circle"></i> Profile</a></li>
                                                <li><a href="settings.jsp"><i class="fal fa-user-cog"></i> Settings</a></li>
                                                <li><a href="logout"><i class="fal fa-sign-out"></i> Logout</a></li>
                                            </ul>
                                        </div>
                                    </c:if>
                                </li>


                                <li>
                                    <button type="button" class="mobile_sidebar_btn"><i class="fal fa-align-right"></i></button>
                                </li>
                            </ul>
                        </div>

                        <div class="col-lg-6 col-md-12">
                            <nav class="main_menu clearfix">
                                <ul class="ul_li_center clearfix">
                                    <li class="active has_child">
                                        <a href="home.jsp">Trang chủ</a>
                                    </li>
                                    <li><a href="booking">Đặt vé</a></li>
                                    <li><a href="cuslistblog">Blog</a></li>
                                    <li>
                                        <a href="contact.jsp">Liên hệ</a>
                                    </li>
                                    <li><a href="employee_login.jsp">Nhân viên</a></li>
                                </ul>
                            </nav>
                        </div>

                    </div>
                </div>
            </div>

            <!--            <div id="collapse_search_body" class="collapse_search_body collapse">
                            <div class="search_body">
                                <div class="container">
                                    <form action="#">
                                        <div class="form_item">
                                            <input type="search" name="search" placeholder="Type here...">
                                            <button type="submit"><i class="fal fa-search"></i></button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>-->
        </header>
        <!-- header_section - end
        ================================================== -->


        <!-- main body - start
        ================================================== -->
        <main>


            <!-- mobile menu - start
            ================================================== -->
            <div class="sidebar-menu-wrapper">
                <div class="mobile_sidebar_menu">
                    <button type="button" class="close_btn"><i class="fal fa-times"></i></button>

                    <div class="about_content mb_60">
                        <div class="brand_logo mb_15">
                            <a href="index.html">
                                <img src="assets/images/logo/logo_01_1.png" srcset="assets/images/logo/logo_01_2x.png 2x" alt="logo_not_found">
                            </a>
                        </div>
                        <p class="mb-0">
                            BusGo cam kết cung cấp dịch vụ đặt vé xe buýt đáng tin cậy và chất lượng cao với thông tin minh bạch, giá cả rõ ràng và hỗ trợ khách hàng tận tình, đảm bảo hành trình của bạn luôn thuận tiện và an toàn.
                        </p>
                    </div>

                    <div class="menu_list mb_60 clearfix">
                        <h3 class="title_text text-white">Danh mục</h3>
                        <ul class="ul_li_block clearfix">
                            <li class="active dropdown">
                                <a href="home.jsp" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Home</a>
                            </li>
                            <li><a href="booking">Đặt vé</a></li>
                            <li><a href="cuslistblog">Tin tức</a></li>
                            <li><a href="contact.jsp">Liên hệ</a></li>
                            <li><a href="employee_login.jsp">Đăng nhập của nhân viên</a></li>

                        </ul>
                    </div>

                    <div class="booking_car_form">
                        <h3 class="title_text text-white mb-2">Đặt vé</h3>
                        <p class="mb_15">
                        </p>
                        <form action="#">
                            <div class="form_item">
                                <h4 class="input_title text-white">Pick Up Location</h4>
                                <div class="position-relative">
                                    <input id="location_one" type="text" name="location" placeholder="City, State or Airport Code">
                                    <label for="location_one" class="input_icon"><i class="fas fa-map-marker-alt"></i></label>
                                </div>
                            </div>
                            <div class="form_item">
                                <h4 class="input_title text-white">Pick A Date</h4>
                                <input type="date" name="date">
                            </div>
                            <button type="submit" class="custom_btn bg_default_red btn_width text-uppercase">Book A Car <img src="assets/images/icons/icon_01.png" alt="icon_not_found"></button>
                        </form>
                    </div>

                </div>
                <div class="overlay"></div>
            </div>
            <!-- mobile menu - end
            ================================================== -->


            <!-- banner_section - start
            ================================================== -->
            <section class="banner_section parallaxie has_overlay text-white d-flex align-items-center clearfix" data-bg-image="assets/images/backgrounds/bg_01_1.jpg">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row align-items-center justify-content-lg-between">
                        <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                            <div class="banner_content">
                                <h1 class="text-white text-uppercase" data-aos="fade-up" data-aos-delay="100">
                                    BusGo - Đặt vé xe buýt dễ dàng và an toàn</h1>

                                BusGo cam kết cung cấp trải nghiệm đặt vé xe buýt đáng tin cậy với thông tin minh bạch và hỗ trợ khách hàng tận tâm. Đặt vé ngay để có chuyến đi thuận tiện và an toàn!
                                </p>
                                <div data-aos="fade-up" data-aos-delay="500">
                                    <a class="custom_btn bg_default_red btn_width text-uppercase" href="booking">Book Ticket <img src="assets/images/icons/icon_01.png" alt="icon_not_found"></a>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-5 col-md-12 col-sm-12 col-xs-12">
                            <div id="banner_accordion" class="banner_accordion">
                                <div class="card" data-aos="fade-up" data-aos-delay="100">
                                    <div class="card-header" id="heading_one">
                                        <button data-toggle="collapse" data-target="#collapse_one" aria-expanded="true" aria-controls="collapse_one">
                                            Tuyến: Hà Nội → Đà Nẵng
                                        </button>
                                    </div>
                                    <div id="collapse_one" class="collapse show" aria-labelledby="heading_one" data-parent="#banner_accordion">
                                        <div class="card-body">
                                            <strong>💰300.000đ/vé</strong>
                                            <p>
                                                🚌 Loại xe: Giường nằm 40 chỗ, điều hòa, wifi miễn phí.</p>
                                            <p>  ✨ Chuyến xe ưu đãi đặc biệt

                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="card" data-aos="fade-up" data-aos-delay="300">
                                    <div class="card-header" id="heading_two">
                                        <button class="collapsed" data-toggle="collapse" data-target="#collapse_two" aria-expanded="false" aria-controls="collapse_two">
                                            Tuyến: Hồ Chí Minh → Nha Trang
                                        </button>
                                    </div>
                                    <div id="collapse_two" class="collapse" aria-labelledby="heading_two" data-parent="#banner_accordion">
                                        <div class="card-body">
                                            <strong>💰350.000đ/vé</strong>
                                            <p>
                                                🚌 Loại xe: Giường nằm 40 chỗ, điều hòa, cổng sạc USB</p>
                                            <p>    ✨ Chuyến xe khuyến mãi, giảm giá 10% khi đặt trước 3 ngày
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="card" data-aos="fade-up" data-aos-delay="500">
                                    <div class="card-header" id="heading_three">
                                        <button class="collapsed" data-toggle="collapse" data-target="#collapse_three" aria-expanded="false" aria-controls="collapse_three">
                                            Tuyến: Đà Nẵng → Huế 
                                        </button>
                                    </div>
                                    <div id="collapse_three" class="collapse" aria-labelledby="heading_three" data-parent="#banner_accordion">
                                        <div class="card-body">
                                            <strong>💰150.000đ/vé</strong>
                                            <p>
                                                🚌 Loại xe: Limousine 9 chỗ, ghế massage, nước uống miễn phí</p>
                                            <p>🎁 Giảm 5% cho nhóm 4 người trở lên


                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="advance_search_form">
                        <div class="section_title text-center mb_30">
                            <h2 class="title_text mb-0 text-white" data-aos="fade-up" data-aos-delay="100">
                                <span>Tìm kiếm chuyến đi xe buýt</span>
                            </h2>
                        </div>
                        <form action="#">
                            <div class="row">
                                <!-- Lựa chọn Một chiều / Khứ hồi -->
                                <div class="col-lg-12 text-left mb-3">
                                    <label>
                                        <input type="radio" name="trip_type" value="oneway" checked> Một chiều
                                    </label>
                                    <label class="ml-4">
                                        <input type="radio" name="trip_type" value="roundtrip"> Khứ hồi
                                    </label>
                                    <a href="#" class="float-right text-danger">Hướng dẫn đặt vé xe</a>
                                </div>

                                <!-- Điểm đi -->
                                <div class="col-lg-4 col-md-6 col-sm-12">
                                    <div class="form_item" data-aos="fade-up" data-aos-delay="100">
                                        <h4 class="input_title text-white">Điểm đi</h4>
                                        <input type="text" name="departure" placeholder="Origin" required>
                                    </div>
                                </div>

                                <!-- Điểm đến -->
                                <div class="col-lg-4 col-md-6 col-sm-12">
                                    <div class="form_item" data-aos="fade-up" data-aos-delay="100">
                                        <h4 class="input_title text-white">Điểm đến</h4>
                                        <input type="text" name="destination" placeholder="Destinaion" required>
                                    </div>
                                </div>

                                <!-- Ngày đi -->
                                <div class="col-lg-2 col-md-6 col-sm-12">
                                    <div class="form_item" data-aos="fade-up" data-aos-delay="100">
                                        <h4 class="input_title text-white">Ngày đi</h4>
                                        <input type="date" name="departure_date" required>
                                    </div>
                                </div>

                                <!-- Số vé -->
                                <div class="col-lg-2 col-md-6 col-sm-12">
                                    <div class="form_item" data-aos="fade-up" data-aos-delay="100">
                                        <h4 class="input_title text-white">Số vé</h4>
                                        <select name="ticket_quantity">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <!-- Danh sách tìm kiếm gần đây -->
                            <div class="recent_searches mt-3">
                                <h5 class="input_title text-white">Recent search</h5>
                                <button type="button" class="btn btn-light btn-sm">An Giang - Bạc Liêu <small>13/02/2025</small></button>
                                <button type="button" class="btn btn-light btn-sm">TP. Hồ Chí Minh - An Nhơn <small>11/01/2025</small></button>
                                <button type="button" class="btn btn-light btn-sm">Đà Lạt - Hà Nội <small>12/01/2025</small></button>
                                <button type="button" class="btn btn-light btn-sm">Hà Nội - Đà Lạt <small>12/01/2025</small></button>
                            </div>

                            <!-- Nút tìm chuyến xe -->
                            <div class="text-center mt-4">
                                <button type="submit" class="custom_btn bg_default_red btn_width text-uppercase">
                                    Tìm chuyến xe
                                </button>
                            </div>
                        </form>
                    </div>

                    <!-- <div class="advance_search_form">
                            <div class="section_title text-center mb_30">
                                    <h2 class="title_text mb-0 text-white" data-aos="fade-up" data-aos-delay="100">
                                            <span>Find the right car for every occasion</span>
                                    </h2>
                            </div>
                            <form action="#">
                                    <div class="row">
                                            <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                                                    <div class="form_item" data-aos="fade-up" data-aos-delay="100">
                                                            <h4 class="input_title text-white">Pick Up Location</h4>
                                                            <div class="position-relative">
                                                                    <input id="location_two" type="text" name="location" placeholder="City, State or Airport Code">
                                                                    <label for="location_two" class="input_icon"><i class="fas fa-map-marker-alt"></i></label>
                                                            </div>
                                                    </div>
                                            </div>

                                            <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                                                    <div class="form_item" data-aos="fade-up" data-aos-delay="300">
                                                            <h4 class="input_title text-white">Pick A Date</h4>
                                                            <input type="date" name="date">
                                                    </div>
                                            </div>

                                            <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                                                    <div class="form_item" data-aos="fade-up" data-aos-delay="500">
                                                            <h4 class="input_title text-white">Time</h4>
                                                            <input type="time" name="time">
                                                    </div>
                                            </div>

                                            <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                                                    <div class="form_item" data-aos="fade-up" data-aos-delay="100">
                                                            <h4 class="input_title text-white">Return car to a different location</h4>
                                                            <div class="position-relative">
                                                                    <input id="location_three" type="text" name="location" placeholder="City, State or Airport Code">
                                                                    <label for="location_three" class="input_icon"><i class="fas fa-map-marker-alt"></i></label>
                                                            </div>
                                                    </div>
                                            </div>

                                            <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                                                    <div class="form_item" data-aos="fade-up" data-aos-delay="300">
                                                            <h4 class="input_title text-white">Return Date</h4>
                                                            <input type="date" name="date">
                                                    </div>
                                            </div>

                                            <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                                                    <div class="form_item" data-aos="fade-up" data-aos-delay="500">
                                                            <h4 class="input_title text-white">Time</h4>
                                                            <input type="time" name="time">
                                                    </div>
                                            </div>

                                            <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                                                    <div class="checkbox_input" data-aos="fade-up" data-aos-delay="100">
                                                            <label for="help_checkbox"><input type="checkbox" id="help_checkbox"> Help me find rental location. View Map</label>
                                                    </div>
                                            </div>

                                            <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                                                    <div class="checkbox_input" data-aos="fade-up" data-aos-delay="300">
                                                            <label for="service_checkbox"><input type="checkbox" id="service_checkbox"> Chauffeur-driven service</label>
                                                    </div>
                                            </div>
                                    </div>
                                    <hr class="mt-0">

                                    <div class="row">
                                            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                                                    <div class="form_item mb-0" data-aos="fade-up" data-aos-delay="100">
                                                            <h4 class="input_icon">Select Car Type</h4>
                                                            <select>
                                                                    <option data-display="All Cars Type">Nothing</option>
                                                                    <option value="1">Some option</option>
                                                                    <option value="2">Another option</option>
                                                                    <option value="3" disabled>A disabled option</option>
                                                                    <option value="4">Potato</option>
                                                            </select>
                                                    </div>
                                            </div>

                                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                    <div data-aos="fade-up" data-aos-delay="300">
                                                            <button type="submit" class="custom_btn bg_default_red btn_width text-uppercase">Book A Car <img src="assets/images/icons/icon_01.png" alt="icon_not_found"></button>
                                                    </div>
                                            </div>
                                    </div>
                            </form>
                    </div> -->
                </div>
            </section>
            <!-- banner_section - end
            ================================================== -->


            <!-- gallery_section - start
            ================================================== -->
            <section class="gallery_section clearfix">
                <div class="gallery_2col_carousel slideshow2_slider" data-slick='{"dots": false}' data-aos="fade-up" data-aos-delay="100">
                    <div class="item">
                        <div class="gallery_fullimage">
                            <img src="assets/images/gallery/img_01_2.jpg" alt="image_not_found">
                            <div class="item_content text-white">
                                <h3 class="item_title text-white">Cầu Vàng - Biểu tượng Đà Nẵng</h3>
                                <p>
                                    Nằm giữa thiên nhiên kỳ vĩ của Bà Nà Hills, Cầu Vàng là một tuyệt tác kiến trúc độc đáo với hai bàn tay đá khổng lồ nâng đỡ cây cầu. Đây là điểm đến lý tưởng để tận hưởng không khí trong lành và ngắm nhìn toàn cảnh núi rừng tuyệt đẹp.
                                </p>

                                <a class="text_btn text-uppercase" href="#!"><span>Find A Car</span> <img src="assets/images/icons/icon_02.png" alt="icon_not_found"></a>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="gallery_fullimage">
                            <img src="assets/images/gallery/img_02_2.jpg" alt="image_not_found">
                            <div class="item_content text-white">
                                <h3 class="item_title text-white">Khám phá rừng dừa Bảy Mẫu - Hội An</h3>
                                <p>
                                    Trải nghiệm chèo thuyền thúng độc đáo tại rừng dừa Bảy Mẫu, Hội An – nơi bạn có thể tận hưởng khung cảnh thiên nhiên xanh mát, khám phá đời sống sông nước và chiêm ngưỡng những màn biểu diễn thuyền thúng ngoạn mục. Hành trình lý tưởng để hòa mình vào văn hóa miền sông nước!
                                </p>
                                <a class="text_btn text-uppercase" href="#!"><span>Find A Car</span> <img src="assets/images/icons/icon_02.png" alt="icon_not_found"></a>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="gallery_fullimage">
                            <img src="assets/images/gallery/img_03_1.jpg" alt="image_not_found">
                            <div class="item_content text-white">
                                <h3 class="item_title text-white">Vịnh Hạ Long - Kỳ quan thiên nhiên thế giới</h3>
                                <p>
                                    Trải nghiệm hành trình khám phá Vịnh Hạ Long, nơi hội tụ những hòn đảo đá vôi kỳ vĩ và làn nước xanh ngọc bích. Lênh đênh trên du thuyền truyền thống, tận hưởng khung cảnh huyền ảo và cảm nhận nét đẹp văn hóa Việt Nam giữa thiên nhiên tuyệt mỹ.
                                </p>

                                <a class="text_btn text-uppercase" href="#!"><span>Find A Car</span> <img src="assets/images/icons/icon_02.png" alt="icon_not_found"></a>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="gallery_fullimage">
                            <img src="assets/images/gallery/img_04_1.jpg" alt="image_not_found">
                            <div class="item_content text-white">
                                <h3 class="item_title text-white">Chùa Bích Động - Viên ngọc cổ kính của Ninh Bình</h3>
                                <p>
                                    Ẩn mình giữa núi non hùng vĩ và hồ sen thơ mộng, chùa Bích Động là một trong những danh thắng tâm linh nổi bật của Ninh Bình. Kiến trúc cổ kính kết hợp cùng thiên nhiên xanh mát tạo nên một không gian yên bình, lý tưởng để tìm về sự tĩnh lặng và chiêm ngưỡng vẻ đẹp văn hóa Việt Nam.
                                </p>
                                <a class="text_btn text-uppercase" href="#!"><span>Find A Car</span> <img src="assets/images/icons/icon_02.png" alt="icon_not_found"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- gallery_section - end
            ================================================== -->


            <!-- offer_section - start
            ================================================== -->
            <section class="offer_section sec_ptb_150 clearfix">
                <div class="container">
                    <div class="has_serial_number">
                        <div class="row justify-content-lg-between">
                            <div class="col-lg-3 col-md-4 col-sm-12 col-xs-12">
                                <div class="serial_number text-right" data-aos="fade-up" data-aos-delay="100">
                                    <span>01</span>
                                    <h4 class="mb-0">Chúng Tôi Cung Cấp</h4>
                                </div>
                            </div>

                            <div class="col-lg-9 col-md-8 col-sm-12 col-xs-12">
                                <div class="offer_content">
                                    <h2 class="item_title" data-aos="fade-up" data-aos-delay="100">
                                        Vì Sao Chọn Chúng Tôi? – Trải Nghiệm Đặt Vé Xe Nhanh Chóng & Tiện Lợi
                                    </h2>
                                    <p class="mb_30" data-aos="fade-up" data-aos-delay="300">
                                        **BusGo** mang đến trải nghiệm đặt vé xe khách đơn giản, an toàn và thuận tiện. Chỉ với vài thao tác, bạn có thể dễ dàng tìm kiếm, so sánh và đặt vé cho chuyến đi mong muốn. 
                                        Chúng tôi không chỉ giúp bạn tiết kiệm thời gian mà còn cung cấp nhiều ưu đãi hấp dẫn như giảm giá cho khách hàng mới, khuyến mãi hàng ngày và ưu đãi đặc biệt dành riêng cho thành viên thân thiết.
                                    </p>
                                    <p class="mb_30" data-aos="fade-up" data-aos-delay="300">
                                        **Đảm bảo chất lượng dịch vụ** là cam kết hàng đầu của BusGo. Chúng tôi hợp tác với các nhà xe uy tín, cung cấp phương tiện hiện đại, ghế ngồi thoải mái và dịch vụ chu đáo. 
                                        Ngoài ra, đội ngũ hỗ trợ khách hàng 24/7 luôn sẵn sàng giải đáp mọi thắc mắc, giúp bạn có một chuyến đi suôn sẻ và trọn vẹn nhất.
                                    </p>
                                    <p class="mb_30" data-aos="fade-up" data-aos-delay="300">
                                        **BusGo – Đồng hành trên mọi hành trình của bạn!**
                                    </p>

                                    <div data-aos="fade-up" data-aos-delay="500">
                                        <a class="text_btn text-uppercase" href="#!">
                                            <span>Khám Phá Ưu Đãi Ngay</span> 
                                            <img src="assets/images/icons/icon_02.png" alt="icon_not_found">
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- offer_section - end
            ================================================== -->


            <!-- cars_section - start
            ================================================== -->
            <section class="cars_section clearfix">
                <div class="offers_car_carousel slideshow4_slider" data-slick='{"dots": false}' data-aos="fade-up" data-aos-delay="100">
                    <div class="item">
                        <div class="gallery_fullimage_2">
                            <img src="assets/images/gallery/img_05_1.jpg" alt="image_not_found">
                            <div class="item_content text-white">
                                <span class="item_price bg_default_blue">200,000 VND/per trip</span>
                                <h3 class="item_title text-white">Dien Linh Coach Services</h3>
                                <a class="text_btn text-uppercase" href="#!"><span>Kook A Car</span> <img src="assets/images/icons/icon_02.png" alt="icon_not_found"></a>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="gallery_fullimage_2">
                            <img src="assets/images/gallery/img_05_2.jpg" alt="image_not_found">
                            <div class="item_content text-white">
                                <span class="item_price bg_default_blue">500,000 VND/per trip</span>
                                <h3 class="item_title text-white">Tan Quang Dung Coach Services</h3>
                                <a class="text_btn text-uppercase" href="#!"><span>Kook A Car</span> <img src="assets/images/icons/icon_02.png" alt="icon_not_found"></a>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="gallery_fullimage_2">
                            <img src="assets/images/gallery/img_05_3.jpg" alt="image_not_found">
                            <div class="item_content text-white">
                                <span class="item_price bg_default_blue">350,000 VND/per trip</span>
                                <h3 class="item_title text-white">Cuoc Hue Coach Services</h3>
                                <a class="text_btn text-uppercase" href="#!"><span>Kook A Car</span> <img src="assets/images/icons/icon_02.png" alt="icon_not_found"></a>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="gallery_fullimage_2">
                            <img src="assets/images/gallery/img_05_4.jpg" alt="image_not_found">
                            <div class="item_content text-white">
                                <span class="item_price bg_default_blue">$670/Day</span>
                                <h3 class="item_title text-white">Xuan Hai Coach Services</h3>
                                <a class="text_btn text-uppercase" href="#!"><span>Kook A Car</span> <img src="assets/images/icons/icon_02.png" alt="icon_not_found"></a>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="gallery_fullimage_2">
                            <img src="assets/images/gallery/img_05_5.jpg" alt="image_not_found">
                            <div class="item_content text-white">
                                <span class="item_price bg_default_blue">$670/Day</span>
                                <h3 class="item_title text-white">Long Van Coach Services</h3>
                                <a class="text_btn text-uppercase" href="#!"><span>Kook A Car</span> <img src="assets/images/icons/icon_02.png" alt="icon_not_found"></a>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="gallery_fullimage_2">
                            <img src="assets/images/gallery/img_05_6.jpg" alt="image_not_found">
                            <div class="item_content text-white">
                                <span class="item_price bg_default_blue">$670/Day</span>
                                <h3 class="item_title text-white">Son Tung Coach Services</h3>
                                <a class="text_btn text-uppercase" href="#!"><span>Kook A Car</span> <img src="assets/images/icons/icon_02.png" alt="icon_not_found"></a>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="gallery_fullimage_2">
                            <img src="assets/images/gallery/img_05_7.jpg" alt="image_not_found">
                            <div class="item_content text-white">
                                <span class="item_price bg_default_blue">$670/Day</span>
                                <h3 class="item_title text-white">Quoc Tuan Coach Services</h3>
                                <a class="text_btn text-uppercase" href="#!"><span>Kook A Car</span> <img src="assets/images/icons/icon_02.png" alt="icon_not_found"></a>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="gallery_fullimage_2">
                            <img src="assets/images/gallery/img_05_8.jpg" alt="image_not_found">
                            <div class="item_content text-white">
                                <span class="item_price bg_default_blue">$670/Day</span>
                                <h3 class="item_title text-white">Duc Lan Coach Services</h3>
                                <a class="text_btn text-uppercase" href="#!"><span>Kook A Car</span> <img src="assets/images/icons/icon_02.png" alt="icon_not_found"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- cars_section - end
            ================================================== -->


            <!-- choose_section - start
            ================================================== -->
            <section class="choose_section sec_ptb_150 clearfix">
                <div class="container">
                    <div class="has_serial_number">
                        <div class="row justify-content-lg-between">
                            <div class="col-lg-3 col-md-4 col-sm-12 col-xs-12">
                                <div class="serial_number text-right" data-aos="fade-up" data-aos-delay="100">
                                    <span>02</span>
                                    <h4 class="mb-0">Chọn điểm đến du lịch</h4>
                                </div>
                            </div>

                            <div class="col-lg-9 col-md-8 col-sm-12 col-xs-12">
                                <div class="car_choose_carousel mb_30 clearfix" data-aos="fade-up" data-aos-delay="300">
                                    <div class="thumbnail_carousel">
                                        <div class="item">
                                            <div class="item_head">
                                                <h4 class="item_title mb-0">Các điểm đến du lịch hàng đầu</h4>
                                                <ul class="review_text ul_li_right clearfix">
                                                    <li class="text-right">
                                                        <strong>Super</strong>
                                                        <small>24+ Đánh giá</small>
                                                    </li>
                                                    <li><span class="bg_default_blue">4.8/5</span></li>
                                                </ul>
                                            </div>
                                            <img src="assets/images/gallery/img_06_1.jpg" alt="image_not_found">
                                            <ul class="btns_group ul_li_center clearfix">
                                                <li>
                                                    <span class="custom_btn btn_width bg_default_blue"><del>$800/Day</del> $400/Day</span>
                                                </li>
                                                <li>
                                                    <a href="booking" class="custom_btn btn_width bg_default_red text-uppercase">Đặt vé <img src="assets/images/icons/icon_01.png" alt="icon_not_found"></a>
                                                </li>
                                            </ul>
                                        </div>

                                        <div class="item">
                                            <div class="item_head">
                                                <h4 class="item_title mb-0">Các điểm đến du lịch hàng đầu</h4>
                                                <ul class="review_text ul_li_right clearfix">
                                                    <li class="text-right">
                                                        <strong>Super</strong>
                                                        <small>24+ Đánh giá</small>
                                                    </li>
                                                    <li><span class="bg_default_blue">4.8/5</span></li>
                                                </ul>
                                            </div>
                                            <img src="assets/images/gallery/img_06_2.jpg" alt="image_not_found">
                                            <ul class="btns_group ul_li_center clearfix">
                                                <li>
                                                    <span class="custom_btn btn_width bg_default_blue"><del>$800/Day</del> $400/Day</span>
                                                </li>
                                                <li>
                                                    <a href="booking" class="custom_btn btn_width bg_default_red text-uppercase">Đặt vé <img src="assets/images/icons/icon_01.png" alt="icon_not_found"></a>
                                                </li>
                                            </ul>
                                        </div>

                                        <div class="item">
                                            <div class="item_head">
                                                <h4 class="item_title mb-0">Các điểm đến du lịch hàng đầu</h4>
                                                <ul class="review_text ul_li_right clearfix">
                                                    <li class="text-right">
                                                        <strong>Super</strong>
                                                        <small>24+ Đánh giá</small>
                                                    </li>
                                                    <li><span class="bg_default_blue">4.8/5</span></li>
                                                </ul>
                                            </div>
                                            <img src="assets/images/gallery/img_06_3.jpg" alt="image_not_found">
                                            <ul class="btns_group ul_li_center clearfix">
                                                <li>
                                                    <span class="custom_btn btn_width bg_default_blue"><del>$800/Day</del> $400/Day</span>
                                                </li>
                                                <li>
                                                    <a href="booking" class="custom_btn btn_width bg_default_red text-uppercase">Đặt vé <img src="assets/images/icons/icon_01.png" alt="icon_not_found"></a>
                                                </li>
                                            </ul>
                                        </div>

                                        <div class="item">
                                            <div class="item_head">
                                                <h4 class="item_title mb-0">Các điểm đến du lịch hàng đầu</h4>
                                                <ul class="review_text ul_li_right clearfix">
                                                    <li class="text-right">
                                                        <strong>Super</strong>
                                                        <small>24+ Đánh giá</small>
                                                    </li>
                                                    <li><span class="bg_default_blue">4.8/5</span></li>
                                                </ul>
                                            </div>
                                            <img src="assets/images/gallery/img_06_4.jpg" alt="image_not_found">
                                            <ul class="btns_group ul_li_center clearfix">
                                                <li>
                                                    <span class="custom_btn btn_width bg_default_blue"><del>$800/Day</del> $400/Day</span>
                                                </li>
                                                <li>
                                                    <a href="booking" class="custom_btn btn_width bg_default_red text-uppercase">Đặt vé <img src="assets/images/icons/icon_01.png" alt="icon_not_found"></a>
                                                </li>
                                            </ul>
                                        </div>

                                        <div class="item">
                                            <div class="item_head">
                                                <h4 class="item_title mb-0">Các điểm đến du lịch hàng đầu</h4>
                                                <ul class="review_text ul_li_right clearfix">
                                                    <li class="text-right">
                                                        <strong>Super</strong>
                                                        <small>24+ Đánh giá</small>
                                                    </li>
                                                    <li><span class="bg_default_blue">4.8/5</span></li>
                                                </ul>
                                            </div>
                                            <img src="assets/images/gallery/img_06_5.jpg" alt="image_not_found">
                                            <ul class="btns_group ul_li_center clearfix">
                                                <li>
                                                    <span class="custom_btn btn_width bg_default_blue"><del>$800/Day</del> $400/Day</span>
                                                </li>
                                                <li>
                                                    <a href="booking" class="custom_btn btn_width bg_default_red text-uppercase">Đặt vé <img src="assets/images/icons/icon_01.png" alt="icon_not_found"></a>
                                                </li>
                                            </ul>
                                        </div>

                                        <div class="item">
                                            <div class="item_head">
                                                <h4 class="item_title mb-0">Các điểm đến du lịch hàng đầu</h4>
                                                <ul class="review_text ul_li_right clearfix">
                                                    <li class="text-right">
                                                        <strong>Super</strong>
                                                        <small>24+ Đánh giá</small>
                                                    </li>
                                                    <li><span class="bg_default_blue">4.8/5</span></li>
                                                </ul>
                                            </div>
                                            <img src="assets/images/gallery/img_06_6.jpg" alt="image_not_found">
                                            <ul class="btns_group ul_li_center clearfix">
                                                <li>
                                                    <span class="custom_btn btn_width bg_default_blue"><del>$800/Day</del> $400/Day</span>
                                                </li>
                                                <li>
                                                    <a href="booking" class="custom_btn btn_width bg_default_red text-uppercase">Đặt vé <img src="assets/images/icons/icon_01.png" alt="icon_not_found"></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="thumbnail_carousel_nav">
                                        <div class="item">
                                            <img src="assets/images/gallery/img_06_1.jpg" alt="image_not_found">
                                        </div>
                                        <div class="item">
                                            <img src="assets/images/gallery/img_06_2.jpg" alt="image_not_found">
                                        </div>
                                        <div class="item">
                                            <img src="assets/images/gallery/img_06_3.jpg" alt="image_not_found">
                                        </div>
                                        <div class="item">
                                            <img src="assets/images/gallery/img_06_4.jpg" alt="image_not_found">
                                        </div>
                                        <div class="item">
                                            <img src="assets/images/gallery/img_06_5.jpg" alt="image_not_found">
                                        </div>
                                        <div class="item">
                                            <img src="assets/images/gallery/img_06_6.jpg" alt="image_not_found">
                                        </div>
                                    </div>
                                </div>

                                <div class="car_choose_content" data-aos="fade-up" data-aos-delay="500">
                                    <ul class="info_list ul_li_block mb_15 clearfix">
                                        <li><strong>Hành khách:</strong> 1</li>
                                        <li><strong>Hành lý:</strong> 1 vali lớn, 2 vali nhỏ</li>
                                        <li><strong>Khởi hành:</strong> Ha Noi</li>
                                        <li><strong>Loại vé:</strong> Tiêu chuẩn</li>
                                        <li><strong>Tiện ích:</strong>Nước uống miễn phí, WiFi, Điều hòa, Cổng sạc, Chăn</li>
                                    </ul>
                                    <a class="terms_condition" href="#!"><i class="fas fa-info-circle mr-1"></i>Điều khoản và điều kiện</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- choose_section - end
            ================================================== -->


            <!-- feature_section - start
            ================================================== -->
            <!-- <section class="feature_section sec_ptb_150 clearfix" data-bg-color="#F2F2F2">
                    <div class="container">

                            <div class="row justify-content-center">
                                    <div class="col-lg-6 col-md-8 col-sm-12 col-xs-12">
                                            <div class="section_title mb_60 text-center" data-aos="fade-up" data-aos-delay="100">
                                                    <h2 class="title_text mb_15">
                                                            <span>Featured Vehicles</span>
                                                    </h2>
                                                    <p class="mb-0">
                                                            Mauris cursus quis lorem sed cursus. Aenean aliquam pellentesque magna, ut dictum ex pellentesque
                                                    </p>
                                            </div>
                                    </div>
                            </div>

                            <ul class="button-group filters-button-group ul_li_center mb_30 clearfix" data-aos="fade-up" data-aos-delay="300">
                                    <li><button class="button active" data-filter="*">All</button></li>
                                    <li><button class="button" data-filter=".sedan">Sedan</button></li>
                                    <li><button class="button" data-filter=".sports">Sports</button></li>
                                    <li><button class="button" data-filter=".luxury">Luxury</button></li>
                            </ul>

                            <div class="feature_vehicle_filter element-grid clearfix">
                                    <div class="element-item sedan " data-category="sedan">
                                            <div class="feature_vehicle_item" data-aos="fade-up" data-aos-delay="100">
                                                    <h3 class="item_title mb-0">
                                                            <a href="#!">
                                                                    2015 Chevrolet Corvette Stingray Z51
                                                            </a>
                                                    </h3>
                                                    <div class="item_image position-relative">
                                                            <a class="image_wrap" href="#!">
                                                                    <img src="assets/images/feature/img_01.jpg" alt="image_not_found">
                                                            </a>
                                                            <span class="item_price bg_default_blue">$230/Day</span>
                                                    </div>
                                                    <ul class="info_list ul_li_center clearfix">
                                                            <li>Sports</li>
                                                            <li>Auto</li>
                                                            <li>2 Passengers</li>
                                                            <li>Gasoline</li>
                                                    </ul>
                                            </div>
                                    </div>

                                    <div class="element-item sports " data-category="sports">
                                            <div class="feature_vehicle_item" data-aos="fade-up" data-aos-delay="300">
                                                    <h3 class="item_title mb-0">
                                                            <a href="#!">
                                                                    2019 Chevrolet Corvette Stingray Red
                                                            </a>
                                                    </h3>
                                                    <div class="item_image position-relative">
                                                            <a class="image_wrap" href="#!">
                                                                    <img src="assets/images/feature/img_02.jpg" alt="image_not_found">
                                                            </a>
                                                            <span class="item_price bg_default_blue">$230/Day</span>
                                                    </div>
                                                    <ul class="info_list ul_li_center clearfix">
                                                            <li>Sports</li>
                                                            <li>Auto</li>
                                                            <li>2 Passengers</li>
                                                            <li>Hybrid</li>
                                                    </ul>
                                            </div>
                                    </div>

                                    <div class="element-item luxury " data-category="luxury">
                                            <div class="feature_vehicle_item" data-aos="fade-up" data-aos-delay="500">
                                                    <h3 class="item_title mb-0">
                                                            <a href="#!">
                                                                    2015 Chevrolet Corvette Stingray Z51
                                                            </a>
                                                    </h3>
                                                    <div class="item_image position-relative">
                                                            <a class="image_wrap" href="#!">
                                                                    <img src="assets/images/feature/img_03.jpg" alt="image_not_found">
                                                            </a>
                                                            <span class="item_price bg_default_blue">$120/Day</span>
                                                    </div>
                                                    <ul class="info_list ul_li_center clearfix">
                                                            <li>Sports</li>
                                                            <li>Auto</li>
                                                            <li>2 Passengers</li>
                                                            <li>Gasoline</li>
                                                    </ul>
                                            </div>
                                    </div>

                                    <div class="element-item sedan " data-category="sedan">
                                            <div class="feature_vehicle_item" data-aos="fade-up" data-aos-delay="100">
                                                    <h3 class="item_title mb-0">
                                                            <a href="#!">
                                                                    2020 Audi New Generation P00234
                                                            </a>
                                                    </h3>
                                                    <div class="item_image position-relative">
                                                            <a class="image_wrap" href="#!">
                                                                    <img src="assets/images/feature/img_04.jpg" alt="image_not_found">
                                                            </a>
                                                            <span class="item_price bg_default_blue">$230/Day</span>
                                                    </div>
                                                    <ul class="info_list ul_li_center clearfix">
                                                            <li>Sports</li>
                                                            <li>Auto</li>
                                                            <li>2 Passengers</li>
                                                            <li>Electro</li>
                                                    </ul>
                                            </div>
                                    </div>

                                    <div class="element-item sports " data-category="sports">
                                            <div class="feature_vehicle_item" data-aos="fade-up" data-aos-delay="300">
                                                    <h3 class="item_title mb-0">
                                                            <a href="#!">
                                                                    2015 Chevrolet Corvette Stingray Z51
                                                            </a>
                                                    </h3>
                                                    <div class="item_image position-relative">
                                                            <a class="image_wrap" href="#!">
                                                                    <img src="assets/images/feature/img_05.jpg" alt="image_not_found">
                                                            </a>
                                                            <span class="item_price bg_default_blue">$160/Day</span>
                                                    </div>
                                                    <ul class="info_list ul_li_center clearfix">
                                                            <li>Sports</li>
                                                            <li>Auto</li>
                                                            <li>2 Passengers</li>
                                                            <li>Gasoline</li>
                                                    </ul>
                                            </div>
                                    </div>

                                    <div class="element-item luxury " data-category="luxury">
                                            <div class="feature_vehicle_item" data-aos="fade-up" data-aos-delay="500">
                                                    <h3 class="item_title mb-0">
                                                            <a href="#!">
                                                                    2015 Chevrolet Corvette Stingray Z51
                                                            </a>
                                                    </h3>
                                                    <div class="item_image position-relative">
                                                            <a class="image_wrap" href="#!">
                                                                    <img src="assets/images/feature/img_06.jpg" alt="image_not_found">
                                                            </a>
                                                            <span class="item_price bg_default_blue">$230/Day</span>
                                                    </div>
                                                    <ul class="info_list ul_li_center clearfix">
                                                            <li>Sports</li>
                                                            <li>Auto</li>
                                                            <li>2 Passengers</li>
                                                            <li>Hybrid</li>
                                                    </ul>
                                            </div>
                                    </div>	
                            </div>

                            <div class="abtn_wrap text-center clearfix" data-aos="fade-up" data-aos-delay="100">
                                    <a class="custom_btn bg_default_red btn_width text-uppercase" href="#!">Book A Car <img src="assets/images/icons/icon_01.png" alt="icon_not_found"></a>
                            </div>

                    </div>
            </section>-->
            <!-- feature_section - end
            ================================================== --> 


            <!-- offer_section - start
            ================================================== -->
            <section class="offer_section sec_ptb_150 clearfix">
                <div class="container">
                    <div class="has_serial_number">
                        <div class="row justify-content-lg-between">
                            <div class="col-lg-3 col-md-4 col-sm-12 col-xs-12">
                                <div class="serial_number text-right" data-aos="fade-up" data-aos-delay="100">
                                    <span>03</span>
                                    <h4 class="mb-0">Những gì chúng tôi cung cấp</h4>
                                </div>
                            </div>

                            <div class="col-lg-9 col-md-8 col-sm-12 col-xs-12">
                                <div class="offer_content">
                                    <h2 class="item_title" data-aos="fade-up" data-aos-delay="100">
                                        Trải nghiệm đặt vé xe buýt tốt nhất
                                    </h2>
                                    <p class="mb-0" data-aos="fade-up" data-aos-delay="300">
                                        Chúng tôi cam kết cung cấp một trải nghiệm đặt vé xe buýt an toàn, thuận tiện và minh bạch. Với hệ thống hiện đại, bạn có thể dễ dàng chọn tuyến đường yêu thích, tận hưởng dịch vụ chất lượng cao và tiếp cận các ưu đãi đặc biệt.                                    </p>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                            <div class="offer_info" data-aos="fade-up" data-aos-delay="100">
                                                <div class="item_icon">
                                                    <i class="far fa-shield-alt"></i>
                                                </div>
                                                <div class="item_content">
                                                    <h4 class="item_title">
                                                        Đảm bảo thanh toán an toàn                                                    </h4>
                                                    <p class="mb-0">
                                                        Các phương thức thanh toán an toàn và bảo vệ tối đa dữ liệu khách hàng.                                                    </p>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                            <div class="offer_info" data-aos="fade-up" data-aos-delay="300">
                                                <div class="item_icon">
                                                    <i class="fas fa-cars"></i>
                                                </div>
                                                <div class="item_content">
                                                    <h4 class="item_title">
                                                        Đặt vé xe buýt dễ dàng                                                    </h4>
                                                    <p class="mb-0">
                                                        Chọn nhanh chóng tuyến xe buýt với nhiều lựa chọn vé và các nhà điều hành uy tín.                                                    </p>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                            <div class="offer_info" data-aos="fade-up" data-aos-delay="500">
                                                <div class="item_icon">
                                                    <i class="fal fa-headset"></i>
                                                </div>
                                                <div class="item_content">
                                                    <h4 class="item_title">
                                                        Hỗ trợ đa ngôn ngữ 24/7
                                                    </h4>
                                                    <p class="mb-0">
                                                        Hỗ trợ đa ngôn ngữ bất cứ khi nào để đáp ứng nhu cầu của bạn.                                                    </p>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                            <div class="offer_info" data-aos="fade-up" data-aos-delay="700">
                                                <div class="item_icon">
                                                    <i class="far fa-tools"></i>
                                                </div>
                                                <div class="item_content">
                                                    <h4 class="item_title">
                                                        Hỗ trợ kỹ thuật khẩn cấp                                                    </h4>
                                                    <p class="mb-0">
                                                        Hỗ trợ ngay lập tức để đảm bảo hành trình của bạn luôn suôn sẻ và không gặp rắc rối.                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- offer_section - end
            ================================================== -->


            <!-- world_location_section - start
            ================================================== -->
            <section class="world_location_section sec_ptb_100 clearfix" data-bg-gradient="linear-gradient(0deg, #161829, #292D45)">
                <div class="container">

                    <div class="row justify-content-center">
                        <div class="col-lg-7 col-md-9 col-sm-12 col-xs-12">
                            <div class="section_title mb_60 text-center text-white" data-aos="fade-up" data-aos-delay="100">
                                <h2 class="title_text text-white mb_15">
                                    <span>Trụ sở chính BusGo</span>
                                </h2>
                                <p class="mb-0">
                                    Chúng tôi hoạt động từ trụ sở trung tâm, đảm bảo vận hành suôn sẻ và cung cấp dịch vụ khách hàng cao cấp. Văn phòng chính của chúng tôi được đặt tại khu công nghệ cao nhằm hỗ trợ mạng lưới tuyến đường và nâng cao trải nghiệm di chuyển cho tất cả hành khách.                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="world_location clearfix">
                        <form action="#">
                            <div class="row" data-aos="fade-up" data-aos-delay="300">
                                <div class="col-lg-8 col-md-12 col-sm-12 col-xs-12">
                                    <div class="form_item mb-0">
                                        <input id="world_location_search" type="search" name="search" placeholder="Search for a Country">
                                        <label for="world_location_search" class="input_icon"><i class="fal fa-search"></i></label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
                                    <button type="submit" class="custom_btn bg_default_red text-uppercase">Search Location <img src="assets/images/icons/icon_01.png" alt="icon_not_found"></button>
                                </div>
                            </div>
                        </form>

                        <div class="map_wrap position-relative" data-aos="fade-up" data-aos-delay="400">
                            <div id="mapBox" data-lat="40.701083" data-lon="-74.1522848" data-zoom="14" data-info="PO Box CT16122 Collins Street West, Victoria 8007, Australia." data-mlat="40.701083" data-mlon="-74.1522848">
                            </div>
                            <div class="location_content">
                                <h4>Marseille Seaport</h4>
                                <p>
                                    <i class="fas fa-map-marker-alt"></i>
                                    Chemin du Littoral, Porte 4, Marseille
                                </p>
                                <p>
                                    Office opening hours: 
                                    <span>MON-SAT: 9:00am-9:00pm</span>
                                </p>
                                <div class="save_btn">
                                    <a href="#"><i class="fas fa-envelope"></i> Save for Later</a>
                                </div>
                                <a class="text_btn text-uppercase" href="#!"><span>View All Offers</span> <img src="assets/images/icons/icon_02.png" alt="icon_not_found"></a>
                            </div>
                        </div>
                    </div>

                </div>
            </section>
            <!-- world_location_section - end
            ================================================== -->


            <!-- testimonial_section - start
            ================================================== -->
            <section class="testimonial_section sec_ptb_150 clearfix">
                <div class="container">

                    <div class="has_serial_number">
                        <div class="row justify-content-lg-between">
                            <div class="col-lg-3 col-md-4 col-sm-12 col-xs-12">
                                <div class="serial_number text-right" data-aos="fade-up" data-aos-delay="100">
                                    <span>04</span>
                                    <h4 class="mb-0">Tận hưởng chuyến đi và để lại phản hồi của bạn</h4>
                                </div>
                            </div>

                            <div class="col-lg-9 col-md-8 col-sm-12 col-xs-12">
                                <div class="testimonial_contants_wrap">
                                    <h2 class="item_title mb_30" data-aos="fade-up" data-aos-delay="100">
                                        Đánh giá và video, hình ảnh từ khách hàng của chúng tôi:
                                    </h2>

                                    <div class="testimonial_item clearfix">
                                        <div class="admin_info_wrap clearfix" data-aos="fade-up" data-aos-delay="200">
                                            <div class="admin_image">
                                                <img src="assets/images/meta/img_01.jpg" alt="image_not_found"   style="width: 50px; height: auto; vertical-align: middle; margin-right: 10px;">
                                            </div>
                                            <div class="admin_content">
                                                <h4 class="admin_name">Phạm Thu Hương</h4>
                                                <ul class="rating_star ul_li clearfix">
                                                    <li class="active"><i class="fas fa-star"></i></li>
                                                    <li class="active"><i class="fas fa-star"></i></li>
                                                    <li class="active"><i class="fas fa-star"></i></li>
                                                    <li class="active"><i class="fas fa-star"></i></li>
                                                    <li><i class="fas fa-star"></i></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <p class="mb-0" data-aos="fade-up" data-aos-delay="300">
                                            “Lần đầu tiên đặt vé qua BusGo và rất hài lòng. Nhân viên hỗ trợ tận tình, xe sạch sẽ và đi rất êm. Chắc chắn sẽ giới thiệu cho bạn bè!”
                                        </p>
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                <div class="review_image" data-aos="fade-up" data-aos-delay="300">
                                                    <img src="assets/images/testimonial/img_07_1.jpg" alt="image_not_found">
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                <div class="review_image" data-aos="fade-up" data-aos-delay="400">
                                                    <img src="assets/images/testimonial/img_07_2.jpg" alt="image_not_found">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="testimonial_item clearfix">
                                        <div class="admin_info_wrap clearfix" data-aos="fade-up" data-aos-delay="100">
                                            <div class="admin_image">
                                                <img src="assets/images/meta/img_01.jpg" alt="image_not_found" style="width: 50px; height: auto; vertical-align: middle; margin-right: 10px;">
                                            </div>
                                            <div class="admin_content">
                                                <h4 class="admin_name">Trần Hoàng Nam</h4>
                                                <ul class="rating_star ul_li clearfix">
                                                    <li class="active"><i class="fas fa-star"></i></li>
                                                    <li class="active"><i class="fas fa-star"></i></li>
                                                    <li class="active"><i class="fas fa-star"></i></li>
                                                    <li class="active"><i class="fas fa-star"></i></li>
                                                    <li class="active"><i class="fas fa-star"></i></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <p class="mb-0" data-aos="fade-up" data-aos-delay="200">
                                            “Mọi thứ đều tốt, từ quá trình đặt vé đến trải nghiệm trên xe. WiFi mạnh, có ổ cắm sạc và điều hòa mát lạnh. Mong rằng sẽ có thêm nhiều tuyến đường hơn nữa!”
                                        </p>
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                <div class="review_image" data-aos="fade-up" data-aos-delay="300">
                                                    <img src="assets/images/testimonial/img_07_3.jpg" alt="image_not_found">
                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="testimonial_item clearfix">
                                        <div class="admin_info_wrap clearfix" data-aos="fade-up" data-aos-delay="100">
                                            <div class="admin_image">
                                                <img src="assets/images/meta/img_01.jpg" alt="image_not_found" style="width: 50px; height: auto; vertical-align: middle; margin-right: 10px;">
                                            </div>
                                            <div class="admin_content">
                                                <h4 class="admin_name">Nguyễn Minh Anh </h4>
                                                <ul class="rating_star ul_li clearfix">
                                                    <li class="active"><i class="fas fa-star"></i></li>
                                                    <li class="active"><i class="fas fa-star"></i></li>
                                                    <li class="active"><i class="fas fa-star"></i></li>
                                                    <li class="active"><i class="fas fa-star"></i></li>
                                                    <li><i class="fas fa-star"></i></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <p class="mb-0" data-aos="fade-up" data-aos-delay="200">
                                            “Chuyến đi khá ổn, xe chạy đúng lịch trình, tài xế thân thiện. Tuy nhiên, nếu có thêm hướng dẫn chi tiết hơn về điểm đón thì sẽ hoàn hảo hơn!”
                                        </p>
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                <div class="review_image" data-aos="fade-up" data-aos-delay="300">
                                                    <img src="assets/images/testimonial/img_07_4.jpg" alt="image_not_found">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="links_erap clearfix">
                                        <div class="row align-items-center justify-content-lg-between">
                                            <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                                                <div class="abtn_wrap clearfix" data-aos="fade-up" data-aos-delay="100">
                                                    <a class="text_btn text-uppercase" href="#!"><span>View All Reviews</span> <img src="assets/images/icons/icon_02.png" alt="icon_not_found"></a>
                                                </div>
                                            </div>
                                            <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
                                                <ul class="primary_social_links ul_li_right clearfix" data-aos="fade-up" data-aos-delay="200">
                                                    <li><span class="social_list_title">Follow Us:</span></li>
                                                    <li><a href="#!"><i class="fab fa-facebook-f"></i></a></li>
                                                    <li><a href="#!"><i class="fab fa-youtube"></i></a></li>
                                                    <li><a href="#!"><i class="fab fa-instagram"></i></a></li>
                                                    <li><a href="#!"><i class="fab fa-twitter"></i></a></li>
                                                    <li><a href="#!"><i class="fas fa-envelope"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </section>
            <!-- testimonial_section - end
            ================================================== -->


            <!-- blog_section - start
            ================================================== -->
            <!--            <section class="blog_section clearfix">
                            <div class="updown_style_wrap">
            
                                <div class="updown_style">
                                    <div class="blog_fullimage" data-aos="fade-up" data-aos-delay="100">
                                        <img src="assets/images/blog/img_01.jpg" alt="image_not_found">
                                        <div class="item_content text-white">
                                            <h3 class="item_title text-white">Cras eu ante bibendum, lacinia velit sit amet, scelerisque enim</h3>
                                            <p>
                                                Phasellus porta pulvinar metus, sit amet bibendum lectus hendrerit vel. Duis ullamcorper, justo quis hendrerit venenatis, purus mi volutpat dui, vel commodo urna eros eget sapien
                                            </p>
                                            <a class="text_btn text-uppercase" href="#!"><span>Read in our blog</span> <img src="assets/images/icons/icon_02.png" alt="icon_not_found"></a>
                                        </div>
                                    </div>
            
                                    <div class="blog_fullimage" data-aos="fade-up" data-aos-delay="300">
                                        <img src="assets/images/blog/img_02.jpg" alt="image_not_found">
                                        <div class="item_content text-white">
                                            <h3 class="item_title text-white">Phasellus porta pulvinar metus</h3>
                                            <p>
                                                Phasellus porta pulvinar metus, sit amet bibendum lectus hendrerit vel. Duis ullamcorper, justo quis hendrerit venenatis, purus mi volutpat dui, vel commodo urna eros eget sapien
                                            </p>
                                            <a class="text_btn text-uppercase" href="#!"><span>Read in our blog</span> <img src="assets/images/icons/icon_02.png" alt="icon_not_found"></a>
                                        </div>
                                    </div>
                                </div>
            
                                <div class="updown_style">
                                    <div class="blog_fullimage" data-aos="fade-up" data-aos-delay="100">
                                        <img src="assets/images/blog/img_03.jpg" alt="image_not_found">
                                        <div class="item_content text-white">
                                            <h3 class="item_title text-white">Fed finibus mi et purus finibus, ut condimentum mauris fringilla</h3>
                                            <p>
                                                Phasellus porta pulvinar metus, sit amet bibendum lectus hendrerit vel. Duis ullamcorper, justo quis hendrerit venenatis, purus mi volutpat dui, vel commodo urna eros eget sapien
                                            </p>
                                            <a class="text_btn text-uppercase" href="#!"><span>Read in our blog</span> <img src="assets/images/icons/icon_02.png" alt="icon_not_found"></a>
                                        </div>
                                    </div>
            
                                    <div class="blog_fullimage" data-aos="fade-up" data-aos-delay="300">
                                        <img src="assets/images/blog/img_04.jpg" alt="image_not_found">
                                        <div class="item_content text-white">
                                            <h3 class="item_title text-white">Maecenas sagittis turpis non pharetra pulvinar. Nullam mollis tortor eget</h3>
                                            <p>
                                                Phasellus porta pulvinar metus, sit amet bibendum lectus hendrerit vel. Duis ullamcorper, justo quis hendrerit venenatis, purus mi volutpat dui, vel commodo urna eros eget sapien
                                            </p>
                                            <a class="text_btn text-uppercase" href="#!"><span>Read in our blog</span> <img src="assets/images/icons/icon_02.png" alt="icon_not_found"></a>
                                        </div>
                                    </div>
                                </div>
            
                            </div>
                        </section>
                         blog_section - end
                        ================================================== -->


        </main>
        <!-- main body - end
        ================================================== -->


        <!-- footer_section - start
        ================================================== -->
        <footer class="footer_section clearfix">
            <div class="footer_widget_area sec_ptb_100 clearfix">
                <div class="container">
                    <div class="row justify-content-lg-between">
                        <div class="col-lg-4 col-md-4 col-sm-12 col-sm-12">
                            <div class="footer_about" data-aos="fade-up" data-aos-delay="100">
                                <div class="brand_logo mb_30">
                                    <a href="home.jsp">
                                        <img src="assets/images/logo/logo_01_1.png" srcset="assets/images/logo/logo_01_1.png 2x" alt="logo_not_found">
                                    </a>
                                </div>
                                <p class="mb_15">
                                    BusGo cam kết cung cấp dịch vụ đặt vé xe buýt đáng tin cậy và chất lượng cao với thông tin minh bạch, giá cả rõ ràng và hỗ trợ khách hàng tận tình, đảm bảo hành trình của bạn luôn thuận tiện và an toàn.
                                <p>
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
                                <h3 class="footer_widget_title">Thông tin:</h3>
                                <ul class="ul_li_block clearfix">
                                    <li><a href="booking"><i class="fal fa-angle-right"></i> Find a Car for Rent in the Nearest Location</a></li>
                                    <li><a href="contact.jsp"><i class="fal fa-angle-right"></i> Liên hệ với chúng tôi</a></li>
                                    <li><a href="#!"><i class="fal fa-angle-right"></i> Trung tâm hỗ trợ</a></li>
                                    <li><a href="policy.jsp"><i class="fal fa-angle-right"></i> Chính sách bảo mật</a></li>
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
                            <p class="copyright_text mb-0">Bản quyền © 2020. Được phát triển bởi <a class="author_links text-white" href="login.jsp">BusGo</a></p>
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