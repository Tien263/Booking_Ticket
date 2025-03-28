<%--
    Document   : otp_fo
    Created on : Jan 27, 2025, 4:57:36 PM
    Author     : admin
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Xác minh OTP</title>
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/logo/logo_01_1.png">

        <!-- framework - css include -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
        <!-- icon - css include -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/fontawesome.css">
        <!-- animation - css include -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/aos.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/animate.css">
        <!-- carousel - css include -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/slick.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/slick-theme.css">
        <!-- popup - css include -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/magnific-popup.css">
        <!-- select options - css include -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/nice-select.css">
        <!-- pricing range - css include -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/jquery-ui.css">
        <!-- custom - css include -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.css">

        <style>
            body {
                background-color: #7da47f; /* Light green background */
                color: white;
                font-family: Arial, sans-serif;
            }
            .register_section {
                padding: 100px 0;
            }
            .register_card {
                background: white;
                color: black;
                padding: 30px;
                border-radius: 5px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .form_item {
                margin-bottom: 20px;
            }
            .form_item label {
                display: block;
                font-weight: bold;
                margin-bottom: 5px;
                color: #002859;
            }
            .form_item input[type="number"],
            .form_item input[type="text"] {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 16px;
            }
            .form_item button,
            .form_item input[type="submit"] {
                background-color: #7da47f;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
            }
            .form_item button:hover,
            .form_item input[type="submit"]:hover {
                background-color: #5d8c5f;
            }
            .form_item input[type="submit"][disabled] {
                background-color: #cccccc;
                cursor: not-allowed;
            }
            .error-message {
                color: red;
                font-size: 14px;
                margin-top: 5px;
            }
            .countdown-text {
                color: #002859;
                font-weight: bold;
            }
            .footer_section {
                background-color: #ffffff;
                color: #333;
            }
            .footer_widget_area {
                background-color: #ffffff;
                padding: 50px 0;
            }
            .footer_bottom {
                background-color: #f5f5f5;
                color: #666;
                padding: 15px 0;
            }
            .footer_widget_title {
                color: #7da47f;
            }
            .footer_contact_info ul li,
            .footer_useful_links ul li a {
                color: #333;
            }
            .footer_useful_links ul li a:hover {
                color: #7da47f;
            }
            .footer_bottom a {
                color: #7da47f;
            }
            .footer_bottom a:hover {
                color: #5d8c5f;
            }
            .primary_social_links li a {
                color: #333;
            }
            .primary_social_links li a:hover {
                color: #7da47f;
            }
        </style>
    </head>
    <body>
        <!-- sidebar-menu-wrapper - start -->
        <div class="sidebar-menu-wrapper">
            <div class="mobile_sidebar_menu">
                <button type="button" class="close_btn"><i class="fal fa-times"></i></button>

                <div class="about_content mb_60">
                    <div class="brand_logo mb_15">
                        <a href="home.jsp">
                            <img src="${pageContext.request.contextPath}/assets/images/logo/logo_01_1.png" srcset="${pageContext.request.contextPath}/assets/images/logo/logo_01_1.png 2x" alt="logo_not_found">
                        </a>
                    </div>
                    <p class="mb-0">
                        BusGo cam kết cung cấp dịch vụ đặt vé xe buýt đáng tin cậy và chất lượng cao với thông tin minh bạch, giá cả rõ ràng và hỗ trợ khách hàng tận tâm, đảm bảo hành trình của bạn luôn thuận tiện và an toàn.
                    </p>
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
                        <button type="submit" class="custom_btn bg_default_red btn_width text-uppercase">Book A Car <img src="${pageContext.request.contextPath}/assets/images/icons/icon_01.png" alt="icon_not_found"></button>
                    </form>
                </div>
            </div>
            <div class="overlay"></div>
        </div>
        <!-- sidebar-menu-wrapper - end -->

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

        <!-- header_section - start -->
        <header class="header_section secondary_header sticky text-white clearfix">
            <div class="header_top clearfix">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-7">
                            <ul class="header_contact_info ul_li clearfix">
                                <li><i class="fal fa-envelope"></i> BusGo@gmail.com</li>
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
                                    <img src="${pageContext.request.contextPath}/assets/images/logo/logo_01_1.png" srcset="${pageContext.request.contextPath}/assets/images/logo/logo_01_1.png 2x" alt="logo_not_found" width="35%">
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6 col-6 order-last">
                            <ul class="header_action_btns ul_li_right clearfix">
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
                                                    <img src="${pageContext.request.contextPath}/assets/images/meta/img_01.png" alt="thumbnail_not_found" width="35%">
                                                </a>
                                                <div class="user_content">
                                                    <span class="user_title">${sessionScope.username}</span>
                                                </div>
                                            </div>
                                            <ul class="ul_li_block clearfix">
                                                <li><a href="account"><i class="fal fa-user-circle"></i> Profile</a></li>
                                                <li><a href="settings.jsp"><i class="fal fa-user-cog"></i> Settings</a></li>
                                                <li><a href="employee_login.jsp"><i class="fal fa-sign-out"></i> Logout</a></li>
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
                                <!-- Có thể thêm menu nếu cần -->
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- header_section - end -->

        <!-- main body - start -->
        <main>
            <!-- breadcrumb_section - start -->
            <section class="breadcrumb_section text-center clearfix">
                <div class="breadcrumb_nav clearfix" data-bg-color="#F2F2F2">
                    <div class="container">
                        <ul class="ul_li clearfix">
                            <li><a href="home.jsp">Trang chủ</a></li>
                            <li>Xác minh OTP</li>
                        </ul>
                    </div>
                </div>
            </section>
            <!-- breadcrumb_section - end -->

            <!-- register_section - start -->
            <section class="register_section sec_ptb_100 clearfix">
                <div class="container">
                    <div class="register_card mb-0" data-bg-color="#F2F2F2" data-aos="fade-up" data-aos-delay="100">
                        <div class="section_title mb_30 text-center">
                            <h2 class="title_text mb-0" data-aos="fade-up" data-aos-delay="300">
                                <span>Xác minh mã OTP</span>
                            </h2>
                            <p class="mt-3">Chúng tôi đã gửi mã gồm 6 chữ số đến email: ${email}</p>
                        </div>
                        <form action="verification" method="POST" id="verifyOTPForm">
                            <input type="hidden" name="action" value="submitOTPReset"/>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" data-aos="fade-up" data-aos-delay="500">
                                    <div class="form_item">
                                        <label for="otp">Mã OTP</label>
                                        <input type="number" name="otp" id="otp" required placeholder="Nhập mã OTP">
                                        <c:if test="${not empty errorOTP}">
                                            <div class="error-message">${errorOTP}</div>
                                        </c:if>
                                    </div>
                                    <div class="form_item text-center mt-4">
                                        <button type="submit" class="custom_btn bg_default_red text-uppercase">Xác minh</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <form action="verification" method="POST" id="resendOTPForm">
                            <input type="hidden" name="action" value="resendOTPResetPassword"/>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" data-aos="fade-up" data-aos-delay="500">
                                    <div class="form_item text-center">
                                        <p class="countdown-text">Gửi lại sau <span id="countdown">4:00</span>:</p>
                                        <input type="submit" id="resendButton" value="Gửi lại" class="custom_btn bg_default_blue text-uppercase" disabled/>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </section>
            <!-- register_section - end -->
        </main>
        <!-- main body - end -->

        <!-- footer_section - start -->
        <footer class="footer_section clearfix" data-bg-color="#F2F2F2">
            <div class="footer_widget_area sec_ptb_100 clearfix">
                <div class="container">
                    <div class="row justify-content-lg-between">
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <div class="footer_about" data-aos="fade-up" data-aos-delay="100">
                                <div class="brand_logo mb_30">
                                    <a href="home.jsp">
                                        <img src="${pageContext.request.contextPath}/assets/images/logo/logo_01_1.png" srcset="${pageContext.request.contextPath}/assets/images/logo/logo_01_1.png 2x" alt="Logo">
                                    </a>
                                </div>
                                <p class="mb_15">
                                    BusGo cam kết cung cấp dịch vụ đặt vé xe buýt đáng tin cậy và chất lượng cao với thông tin minh bạch, giá cả rõ ràng và hỗ trợ khách hàng tận tình, đảm bảo hành trình của bạn luôn thuận tiện và an toàn.
                                </p>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-4 col-sm-12 col-sm-12">
                            <div class="footer_contact_info" data-aos="fade-up" data-aos-delay="200">
                                <h3 class="footer_widget_title">Liên hệ:</h3>
                                <ul class="ul_li_block clearfix">
                                    <li><i class="fas fa-map-marker-alt"></i> Khu công nghệ cao Hòa Lạc - Thạch Thất - Hà Nội</li>
                                    <li><i class="fas fa-clock"></i> 7:00 - 22:00</li>
                                    <li><i class="fas fa-envelope"></i> BusGo@gmail.com</li>
                                    <li><i class="fas fa-phone"></i> 0398 996 177</li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
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
                            <p class="copyright_text mb-0">Bản quyền © 2020. Được phát triển bởi <a class="author_links" href="home.jsp">BusGo</a></p>
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
        <!-- footer_section - end -->

        <!-- framework - jquery include -->
        <script src="${pageContext.request.contextPath}/assets/js/jquery-3.5.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
        <!-- animation - jquery include -->
        <script src="${pageContext.request.contextPath}/assets/js/aos.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/parallaxie.js"></script>
        <!-- carousel - jquery include -->
        <script src="${pageContext.request.contextPath}/assets/js/slick.min.js"></script>
        <!-- popup - jquery include -->
        <script src="${pageContext.request.contextPath}/assets/js/magnific-popup.min.js"></script>
        <!-- select options - jquery include -->
        <script src="${pageContext.request.contextPath}/assets/js/nice-select.min.js"></script>
        <!-- isotope - jquery include -->
        <script src="${pageContext.request.contextPath}/assets/js/isotope.pkgd.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/imagesloaded.pkgd.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/masonry.pkgd.min.js"></script>
        <!-- google map - jquery include -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDk2HrmqE4sWSei0XdKGbOMOHN3Mm2Bf-M&ver=2.1.6"></script>
        <script src="${pageContext.request.contextPath}/assets/js/gmaps.min.js"></script>
        <!-- pricing range - jquery include -->
        <script src="${pageContext.request.contextPath}/assets/js/jquery-ui.js"></script>
        <!-- counter - jquery include -->
        <script src="${pageContext.request.contextPath}/assets/js/waypoint.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/counterup.min.js"></script>
        <!-- contact form - jquery include -->
        <script src="${pageContext.request.contextPath}/assets/js/validate.js"></script>
        <!-- mobile menu - jquery include -->
        <script src="${pageContext.request.contextPath}/assets/js/mCustomScrollbar.js"></script>
        <!-- custom - jquery include -->
        <script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>

        <!-- Countdown script -->
        <script>
            function startCountdown(duration) {
                let timer = duration, minutes, seconds;
                let countdownElement = document.getElementById('countdown');
                let resendButton = document.getElementById('resendButton');

                let interval = setInterval(function () {
                    minutes = Math.floor(timer / 60);
                    seconds = timer % 60;

                    seconds = seconds < 10 ? '0' + seconds : seconds;
                    countdownElement.textContent = minutes + ":" + seconds;

                    if (--timer < 0) {
                        clearInterval(interval);
                        resendButton.disabled = false;
                        countdownElement.textContent = "0:00";
                    }
                }, 1000);
            }

            // Bắt đầu đếm ngược 4 phút (240 giây)
            startCountdown(240);
        </script>
    </body>
</html>