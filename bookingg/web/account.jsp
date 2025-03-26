<%-- 
    Document   : account
    Created on : Jan 25, 2025, 1:26:53 PM
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


        <!-- header_section - start
        ================================================== -->
        <header class="header_section secondary_header sticky text-white clearfix">
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
                                <a href="index.html">
                                    <img src="assets/images/logo/logo_01_1.png" srcset="assets/images/logo/logo_01_1.png 2x" alt="logo_not_found"  width="35%">
                                    <img src="assets/images/logo/logo_01_1.png" srcset="assets/images/logo/logo_01_1.png 2x" alt="logo_not_found" width="35%">
                                </a>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6 col-sm-6 col-6 order-last">
                            <ul class="header_action_btns ul_li_right clearfix">
<<<<<<< HEAD
                                
                                <li class="dropdown">
                                    
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
=======
>>>>>>> main

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
<<<<<<< HEAD
                                        <ul class="ul_li_block clearfix">
                                            <li><a href="#!"><i class="fal fa-user-circle"></i> Profile</a></li>
                                            <li><a href="#!"><i class="fal fa-user-cog"></i> Settings</a></li>
                                            <li><a href="logout"><i class="fal fa-sign-out"></i> Logout</a></li>
                                        </ul>
                                    </div>
=======
                                    </c:if> 
>>>>>>> main
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

            <div id="collapse_search_body" class="collapse_search_body collapse">
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
            </div>
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
                                <img src="assets/images/logo/logo_01_1.png" srcset="assets/images/logo/logo_01_1.png 2x" alt="logo_not_found">
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
                            <button type="submit" class="custom_btn bg_default_red btn_width text-uppercase">Book  <img src="assets/images/icons/icon_01.png" alt="icon_not_found"></button>
                        </form>
                    </div>

                </div>
                <div class="overlay"></div>
            </div>
            <!-- mobile menu - end
            ================================================== -->


            <!-- breadcrumb_section - start
            ================================================== -->
            <section class="breadcrumb_section text-center clearfix">
                <div class="page_title_area has_overlay d-flex align-items-center clearfix" data-bg-image="assets/images/breadcrumb/bg_10.jpg">
                    <div class="overlay"></div>
                    <div class="container" data-aos="fade-up" data-aos-delay="100">
                        <h1 class="page_title text-white mb-0">Tài khoản của tôi</h1>
                    </div>
                </div>
                <div class="breadcrumb_nav clearfix" data-bg-color="#F2F2F2">
                    <div class="container">
                        <ul class="ul_li clearfix">
                            <li><a href="index.html">Trang chủ</a></li>
                            <li>Tài khoản</li>
                        </ul>
                    </div>
                </div>
            </section>
            <!-- breadcrumb_section - end
            ================================================== -->


            <!-- account_section - start
            ================================================== -->
            <section class="account_section sec_ptb_100 clearfix">
                <div class="container">
                    <div class="row justify-content-lg-between justify-content-md-center justify-content-sm-center">

                        <div class="col-lg-4 col-md-8 col-sm-10 col-xs-12">
                            <div class="account_tabs_menu clearfix" data-bg-color="#F2F2F2" data-aos="fade-up" data-aos-delay="100">
                                <h3 class="list_title mb_15">Tài khoản chi tiết</h3>
                                <ul class="ul_li_block nav" role="tablist">
                                    <li>
                                        <a class="active" data-toggle="tab" href="#admin_tab"><i class="fas fa-user"></i> ${customer.username}</a>
                                    </li>
                                    <li>
<<<<<<< HEAD
                                        <a href="logout"><i class="fas fa-sign-out-alt"></i> Log Out <img class="arrow" src="assets/images/icons/icon_02.png" alt="icon_not_found"></a>
=======
                                        <a href="logout"><i class="fas fa-sign-out-alt"></i> Đăng xuất <img class="arrow" src="assets/images/icons/icon_02.png" alt="icon_not_found"></a>
>>>>>>> main
                                    </li>
                                    <li>
                                        <a data-toggle="tab" href="booking"><i class="fas fa-address-book"></i> Đặt vé</a>
                                    </li>
                                    <li>
<<<<<<< HEAD
                                        <a href="CustomerTicketURL?service=listOfAll"><i class="fas fa-file-alt"></i> Booking History</a>
=======
                                        <a data-toggle="tab" href="#history_tab"><i class="fas fa-file-alt"></i> Lịch sử đặt vé</a>
>>>>>>> main
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-lg-8 col-md-8 col-sm-10 col-xs-12">
                            <div class="account_tab_content tab-content">
                                <div id="admin_tab" class="tab-pane active">

                                    <c:if test="${not empty sessionScope.successMessage}">
                                        <p style="color: green; text-align: center;">${sessionScope.successMessage}</p>
                                        <c:remove var="successMessage" scope="session"/>
                                    </c:if>

                                    <div class="account_info_list" data-aos="fade-up" data-aos-delay="100">
                                        <h3 class="list_title mb_30">Thông tin cá nhân:</h3>
                                        <ul class="ul_li_block clearfix">
                                            <li><span>Họ và tên:</span> ${customer.getFullname()} </li>
                                            <li><span>Email:</span> ${customer.getEmail()} </li>
                                            <li><span>Tên người dùng:</span> ${customer.getUsername()} </li>
                                            <li><span>Số điện thoại:</span> ${customer.getPhone()} </li>
                                            <li><span>Giới tính:</span> ${customer.isGender() ? 'Male' : 'Female'}</li>
                                            <li><span>Địa chỉ:</span> ${customer.getAddress()}</li>
                                        </ul>


                                        <a class="text_btn text-uppercase" href="change1"><span>Thay đổi thông tin cá nhân</span> <img src="assets/images/icons/icon_02.png" alt="icon_not_found"></a>

                                        <div>
                                            <a class="text_btn text-uppercase" href="changepassword"><span>Thay đổi mật khẩu</span> <img src="assets/images/icons/icon_02.png" alt="icon_not_found"></a>

                                        </div>
                                    </div>



                                    <div class="account_info_list" data-aos="fade-up" data-aos-delay="500">
                                        <h3 class="list_title mb_30">Lịch sử đặt vé:</h3>
                                        <ul class="ul_li_block clearfix">
                                            <li><span>Upcoming Reservations:</span> No Reservations Yet</li>
                                            <li><span>Past Rentals:</span> 0</li>
                                        </ul>
                                        <a class="text_btn text-uppercase" href="booking"><span>Đặt vé</span> <img src="assets/images/icons/icon_02.png" alt="icon_not_found"></a>
                                    </div>
                                </div>

                                <div id="profile_tab" class="tab-pane fade">


                                    <div class="account_info_list" data-aos="fade-up" data-aos-delay="300">
                                        <h3 class="list_title mb_30">Lịch sử đặt vé:</h3>
                                        <ul class="ul_li_block clearfix">
                                            <li><span>Upcoming Reservations:</span> No Reservations Yet</li>
                                            <li><span>Past Rentals:</span> 0</li>
                                        </ul>
                                        <a class="text_btn text-uppercase" href="booking"><span>Đặt vé</span> <img src="assets/images/icons/icon_02.png" alt="icon_not_found"></a>
                                    </div>

                                    <div class="account_info_list" data-aos="fade-up" data-aos-delay="500">
                                        <h3 class="list_title mb_30">Account:</h3>
                                        <ul class="ul_li_block clearfix">
                                            <li><span>Họ và tên:</span> ${customer.getFullname()} </li>
                                            <li><span>Email:</span> ${customer.getEmail()} </li>
                                            <li><span>Tên người dùng:</span> ${customer.getUsername()} </li>
                                            <li><span>Số điện thoại:</span> ${customer.getPhone()} </li>
                                            <li><span>Giới tính:</span> ${customer.isGender() ? 'Male' : 'Female'}</li>
                                            <li><span>Địa chỉ:</span> ${customer.getAddress()}</li>                                        </ul>
                                        <a class="text_btn text-uppercase" href="#!"><span>Change Account Information</span> <img src="assets/images/icons/icon_02.png" alt="icon_not_found"></a>
                                    </div>
                                </div>

                                <div id="history_tab" class="tab-pane fade">
<<<<<<< HEAD
                                    
=======
                                    <div class="account_info_list" data-aos="fade-up" data-aos-delay="100">
                                        <h3 class="list_title mb_30">Booking History:</h3>
                                        <ul class="ul_li_block clearfix">
                                            <li><span>Upcoming Reservations:</span> No Reservations Yet</li>
                                            <li><span>Past Rentals:</span> 0</li>
                                        </ul>
                                        <a class="text_btn text-uppercase" href="#!"><span>Book A Car</span> <img src="assets/images/icons/icon_02.png" alt="icon_not_found"></a>
                                    </div>

                                    <div class="account_info_list" data-aos="fade-up" data-aos-delay="500">
                                        <h3 class="list_title mb_30">Tài khoản</h3>
                                        <ul class="ul_li_block clearfix">
                                            <li><span>Họ và tên:</span> ${customer.getFullname()} </li>
                                            <li><span>Email:</span> ${customer.getEmail()} </li>
                                            <li><span>Tên người dùng:</span> ${customer.getUsername()} </li>
                                            <li><span>Số điện thoại:</span> ${customer.getPhone()} </li>
                                            <li><span>Giới tính:</span> ${customer.isGender() ? 'Male' : 'Female'}</li>
                                            <li><span>Địa chỉ:</span> ${customer.getAddress()}</li>
                                        </ul>
                                        <a class="text_btn text-uppercase" href="change1"><span>Thay đổi thông tin tài khoản</span> <img src="assets/images/icons/icon_02.png" alt="icon_not_found"></a>
                                    </div>
>>>>>>> main
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </section>
            <!-- account_section - end
            ================================================== -->


        </main>
        <!-- main body - end
        ================================================== -->


        <!-- footer_section - start
        ================================================== -->
        <footer class="footer_section clearfix" data-bg-color="#F2F2F2">
            <div class="footer_widget_area sec_ptb_100 clearfix">
                <div class="container">
                    <div class="row justify-content-lg-between">
                        <div class="col-lg-4 col-md-4 col-sm-12 col-sm-12">
                            <div class="footer_about" data-aos="fade-up" data-aos-delay="100">
                                <div class="brand_logo mb_30">
                                    <a href="index.html">
                                        <img src="assets/images/logo/logo_02_1x.png" srcset="assets/images/logo/logo_02_2x.png 2x" alt="logo_not_found">
                                    </a>
                                </div>
                                <p class="mb_15">
<<<<<<< HEAD
                                    BusGo is committed to providing a reliable and high-quality bus ticket booking service with transparent information, clear pricing, and dedicated customer support, ensuring your journey is always convenient and safe
                                </p>
                                <div class="footer_useful_links mb_30">
                                    
=======
                                    BusGo cam kết cung cấp dịch vụ đặt vé xe buýt đáng tin cậy và chất lượng cao với thông tin minh bạch, giá cả rõ ràng và hỗ trợ khách hàng tận tâm, đảm bảo hành trình của bạn luôn thuận tiện và an toàn.                                </p>
                                </p>
                                <div class="footer_useful_links mb_30">

>>>>>>> main
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
