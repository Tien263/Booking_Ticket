<%-- 
    Document   : contact
    Created on : Feb 22, 2025, 10:12:29 PM
    Author     : Quang Anh
--%>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Liên Hệ - Rotors</title>
        <link rel="shortcut icon" href="assets/images/logo/favourite_icon.png">

        <!-- Framework - CSS include -->
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

        <!-- Icon - CSS include -->
        <link rel="stylesheet" type="text/css" href="assets/css/fontawesome.css">

        <!-- Animation - CSS include -->
        <link rel="stylesheet" type="text/css" href="assets/css/aos.css">
        <link rel="stylesheet" type="text/css" href="assets/css/animate.css">

        <!-- Carousel - CSS include -->
        <link rel="stylesheet" type="text/css" href="assets/css/slick.css">
        <link rel="stylesheet" type="text/css" href="assets/css/slick-theme.css">

        <!-- Popup - CSS include -->
        <link rel="stylesheet" type="text/css" href="assets/css/magnific-popup.css">

        <!-- Select options - CSS include -->
        <link rel="stylesheet" type="text/css" href="assets/css/nice-select.css">

        <!-- Pricing range - CSS include -->
        <link rel="stylesheet" type="text/css" href="assets/css/jquery-ui.css">

        <!-- Custom - CSS include -->
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">

        <!-- Custom styles from contact.jsp with green theme -->
        <style>
            .header-custom {
                background:  #789878; /* Green gradient */
                padding: 15px 0;
                text-align: center;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            }

            .header-custom h1 {
                color: #fff;
                font-size: 28px;
                font-weight: bold;
                text-transform: uppercase;
                margin: 0;
                letter-spacing: 1px;
            }

            body {
                font-family: Arial, sans-serif;
                background-color: #f9f9f9;
                margin: 0;
                padding: 0;
            }

            .contact-container {
                display: flex;
                justify-content: space-between;
                max-width: 1200px;
                margin: 50px auto;
                padding: 20px;
                background-color: #fff;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                border-radius: 8px;
            }

            .contact-info {
                flex: 1;
                padding: 20px;
            }

            .contact-info h2 {
                color: #789878; /* Green for consistency */
                margin-bottom: 20px;
            }

            .contact-info h3 {
                color: #789878; /* Darker green for contrast */
            }

            .contact-info p {
                line-height: 1.6;
            }

            .contact-form {
                flex: 1;
                padding: 20px;
                background-color: #789878;
                border-radius: 8px;
            }

            .contact-form h2 {
                color: #f2f2f2; /* Green for consistency */
                margin-bottom: 20px;
            }

            .contact-form form {
                display: flex;
                flex-direction: column;
            }

            .contact-form input[type="text"],
            .contact-form input[type="email"],
            .contact-form textarea {
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 16px;
            }

            .contact-form textarea {
                resize: vertical;
                min-height: 100px;
            }

            .contact-form button {
                padding: 10px;
                background-color: #789878; /* Green button */
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 18px;
            }

            .contact-form button:hover {
                background-color: #789878; /* Darker green on hover */
            }

            .success-message {
                background-color: #789878; /* Green for success message */
                color: white;
                padding: 15px;
                margin-bottom: 20px;
                border-radius: 4px;
                text-align: center;
                font-weight: bold;
            }

            .back-home {
                text-align: center;
                margin: 20px 0;
            }

            .btn-home {
                display: inline-block;
                padding: 10px 20px;
                background: #789878; /* Green button */
                color: #fff;
                text-decoration: none;
                font-size: 18px;
                border-radius: 25px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
                transition: background 0.3s ease;
            }

            .btn-home:hover {
                background: #789878; /* Darker green on hover */
                box-shadow: 0 6px 8px rgba(0, 0, 0, 0.3);
            }
            .header-content{
                color: #99b697;
                
            }
            .footer-custom {
                background-color: #f2f2f2;
                padding: 30px 0;
                color: #333;
                font-size: 14px;
                border-top: 1px solid #e0e0e0;
            }

            .footer-content {
                display: flex;
                justify-content: space-between;
                max-width: 1200px;
                margin: 0 auto;
                padding: 0 20px;
            }

            .footer-section {
                flex: 1;
                padding: 0 15px;
            }

            .footer-section h3 {
                color: #789878; /* Green for footer headings */
                font-size: 18px;
                margin-bottom: 15px;
                text-transform: uppercase;
            }

            .footer-section ul {
                list-style: none;
                padding: 0;
            }

            .footer-section ul li {
                margin-bottom: 10px;
            }

            .footer-section ul li a {
                color: #333;
                text-decoration: none;
                transition: color 0.3s;
            }

            .footer-section ul li a:hover {
                color: #789878; /* Green on hover */
            }

            .footer-bottom {
                text-align: center;
                padding: 15px 0;
                background-color: #e0e0e0;
                color: #777;
                margin-top: 20px;
                font-size: 13px;
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
                    <div class="col-3 loader_section section-left"><div class="bg"></div></div>
                    <div class="col-3 loader_section section-left"><div class="bg"></div></div>
                    <div class="col-3 loader_section section-right"><div class="bg"></div></div>
                    <div class="col-3 loader_section section-right"><div class="bg"></div></div>
                </div>
            </div>
        </div>
        <!-- preloader - end -->

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
                                    <img src="assets/images/logo/logo_01_1.png" srcset="assets/images/logo/logo_01_1.png 2x" alt="logo_not_found" width="35%">

                                    <img src="assets/images/logo/logo_01_1.png" srcset="assets/images/logo/logo_01_1.png 2x" alt="logo_not_found" width="35%">
                                </a>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6 col-sm-6 col-6 order-last">
                            <ul class="header_action_btns ul_li_right clearfix">


                                <li class="dropdown">
                                    <button type="button" class="user_btn" id="user_dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fal fa-user"></i>
                                    </button>
                                    <div class="user_dropdown rotors_dropdown dropdown-menu clearfix" aria-labelledby="user_dropdown">
                                        <div class="profile_info clearfix">
                                            <a href="#!" class="user_thumbnail">
                                                <img src="assets/images/meta/img_01.png" alt="thumbnail_not_found">
                                            </a>
                                            <div class="user_content">
                                                <h4 class="user_name"><a href="cuslogin"></a></h4>
                                                <span class="user_title">Customer</span>
                                            </div>
                                        </div>
                                        <ul class="ul_li_block clearfix">
                                            <li><a href="#!"><i class="fal fa-user-circle"></i> Profile</a></li>
                                            <li><a href="#!"><i class="fal fa-user-cog"></i> Settings</a></li>
                                            <li><a href="logout"><i class="fal fa-sign-out"></i> Logout</a></li>
                                        </ul>
                                    </div>
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

        <!-- main body - start -->
        <main>
              <!-- mobile menu - start
            ================================================== -->
            <div class="sidebar-menu-wrapper">
                <div class="mobile_sidebar_menu">
                    <button type="button" class="close_btn"><i class="fal fa-times"></i></button>

                    <div class="about_content mb_60">
                        <div class="brand_logo mb_15">
                            <a href="home.jsp">
                                <img src="assets/images/logo/logo_01_1.png" srcset="assets/images/logo/logo_01_1.png 2x" alt="logo_not_found">
                            </a>
                        </div>
                        <p class="mb-0">
                            BusGo cam kết cung cấp dịch vụ đặt vé xe buýt đáng tin cậy và chất lượng cao với thông tin minh bạch, giá cả rõ ràng và hỗ trợ khách hàng tận tâm, đảm bảo hành trình của bạn luôn thuận tiện và an toàn.                        </p>
                    </div>

                    <div class="menu_list mb_60 clearfix">
                        <h3 class="title_text text-white">Danh mục</h3>
                        <ul class="ul_li_block clearfix">
                            <li class="active dropdown">
                                <a href="#!" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Trang chủ</a>
                                <ul class="dropdown-menu">
                                    <li><a href="home.jsp">Trang chủ</a></li>
                                </ul>
                            </li>
                            <li><a href="booking">Đặt vé</a></li>
                            <li><a href="cuslistblog">Blog</a></li>
                            <li><a href="contact.jsp">Liên hệ</a></li>

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
            <!-- Breadcrumb Section -->
            <section class="breadcrumb_section text-center clearfix">
                <div class="page_title_area has_overlay d-flex align-items-center clearfix" data-bg-image="assets/images/breadcrumb/bg_01_1.jpeg">
                    <div class="overlay"></div>
                    <div class="container" data-aos="fade-up" data-aos-delay="100">
                        <h1 class="page_title text-white mb-0">Liên Hệ</h1>
                    </div>
                </div>

                <div class="breadcrumb_nav clearfix" data-bg-color="#F2F2F2">
                    <div class="container">
                        <ul class="ul_li clearfix">
                            <li><a href="home.jsp">Trang chủ</a></li>
                            <li>Liên Hệ</li>
                        </ul>
                    </div>
                </div>
            </section>

            <!-- Contact Section -->
            <c:if test="${not empty successMessage}">
                <div class="success-message">
                    ${successMessage}
                </div>
            </c:if>

            <header class="header-custom">
                <div class="header-content">
                    <h1>CÔNG TY CỔ PHẦN XE KHÁCH QUANG ANH - BusGo</h1>
                </div>
            </header>

            <div class="contact-container">
                <div class="contact-info">
                    <h2>Liên Hệ Với Chúng Tôi</h2>
                    <h3>Công ty cổ phần xe khách Quang Anh</h3>
                    <p>Địa chỉ: Khu công nghệ cao Hòa Lạc - Thạch Thất - Hà Nội</p>
                    <p>Điện thoại:0398 996 177</p>
                    <p>Fax: 1900 6067</p>
                    <p>Email:  BusGo@gmail.com</p>
                    <p>Hotline: 1900 6067</p>
                </div>

                <div class="contact-form">
                    <h2>Gửi thông tin liên hệ đến chúng tôi</h2>
                    <form action="contact" method="post">
                        <input type="text" name="name" placeholder="Họ và tên" required>
                        <input type="email" name="email" placeholder="Email" required>
                        <textarea name="message" placeholder="Nhập ghi chú" required></textarea>
                        <button type="submit">Gửi</button>
                    </form>
                </div>
            </div>

            <!-- Back to Home Button -->
            <div class="back-home">
                <a href="home.jsp" class="btn-home">Quay lại Trang Chủ</a>
            </div>
        </main>
        <!-- main body - end -->

        <!-- footer_section - start -->
        <footer class="footer-custom">
            <div class="footer-content">
                <div class="footer-section about">
                    <h3>Về chúng tôi</h3>
                    <p>Công ty cung cấp dịch vụ đặt vé xe khách chất lượng hàng đầu Việt Nam.</p>
                </div>

                <div class="footer-section contact">
                    <h3>Thông tin liên hệ</h3>
                    <p>Email: BusGo@gmail.com</p>
                    <p>Điện thoại: 0398 996 177</p>
                    <p>Địa chỉ: Khu công nghệ cao Hòa Lạc - Thạch Thất - Hà Nội</p>
                </div>
            </div>
            <div class="footer-bottom">
                © 2025 Công ty cổ phần xe khách Quang Anh | All Rights Reserved
            </div>
        </footer>
        <!-- footer_section - end -->

        <!-- Framework - jQuery include -->
        <script src="assets/js/jquery-3.5.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!-- Animation - jQuery include -->
        <script src="assets/js/aos.js"></script>
        <script src="assets/js/parallaxie.js"></script>

        <!-- Carousel - jQuery include -->
        <script src="assets/js/slick.min.js"></script>

        <!-- Popup - jQuery include -->
        <script src="assets/js/magnific-popup.min.js"></script>

        <!-- Select options - jQuery include -->
        <script src="assets/js/nice-select.min.js"></script>

        <!-- Isotope - jQuery include -->
        <script src="assets/js/isotope.pkgd.js"></script>
        <script src="assets/js/imagesloaded.pkgd.min.js"></script>
        <script src="assets/js/masonry.pkgd.min.js"></script>

        <!-- Google Map - jQuery include -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDk2HrmqE4sWSei0XdKGbOMOHN3Mm2Bf-M&ver=2.1.6"></script>
        <script src="assets/js/gmaps.min.js"></script>

        <!-- Pricing range - jQuery include -->
        <script src="assets/js/jquery-ui.js"></script>

        <!-- Counter - jQuery include -->
        <script src="assets/js/waypoint.js"></script>
        <script src="assets/js/counterup.min.js"></script>

        <!-- Contact form - jQuery include -->
        <script src="assets/js/validate.js"></script>

        <!-- Mobile menu - jQuery include -->
        <script src="assets/js/mCustomScrollbar.js"></script>

        <!-- Custom - jQuery include -->
        <script src="assets/js/custom.js"></script>
    </body>
</html>