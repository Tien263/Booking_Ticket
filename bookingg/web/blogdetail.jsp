<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Blog" %>
<%@ page import="dal.BlogDao" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Blog Detail - BusGo</title>
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
        <!-- custom inline CSS for blog detail -->
        <style>
            .blog-detail {
                max-width: 800px; /* Giới hạn chiều rộng để văn bản không quá dài */
                margin: 0 auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                overflow: hidden; /* Đảm bảo phần nội dung không bị tràn */
            }
            .blog-detail h1 {
                font-size: 2.5rem;
                color: #333;
                margin-bottom: 15px;
                text-align: center;
            }
            .blog-detail h3 {
                font-size: 1.5rem;
                color: #666;
                margin-bottom: 20px;
                text-align: center;
                font-style: italic;
            }
            .blog-detail .blog-image {
                text-align: center;
                margin-bottom: 30px;
            }
            .blog-detail .blog-image img {
                max-width: 100%;
                height: auto;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
            .blog-detail .content {
                font-size: 1.1rem;
                line-height: 1.8;
                color: #444;
                margin-bottom: 30px;
                text-align: justify;
                padding: 20px;
                white-space: pre-wrap; /* Giúp xuống dòng tự động */
                word-wrap: break-word; /* Giúp ngắt từ tự động khi gặp từ dài */
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .blog-detail .blog-meta {
                font-size: 0.9rem;
                color: #777;
                text-align: center;
                margin-bottom: 20px;
            }
            .blog-detail .back-link {
                display: inline-block;
                font-size: 1rem;
                color: #007bff;
                text-decoration: none;
                padding: 10px 20px;
                border: 1px solid #007bff;
                border-radius: 5px;
                transition: all 0.3s ease;
            }
            .blog-detail .back-link:hover {
                background-color: #007bff;
                color: #fff;
                text-decoration: none;
            }
        </style>
    </head>

    <body>
        <c:if test="${not empty success}">
            <div id="success-alert" class="alert alert-success alert-dismissible fade show position-fixed"
                 role="alert" 
                 style="z-index: 1050; top: 20px; right: 20px; width: auto; max-width: 300px; box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);">
                <strong>✔</strong> ${success}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
        </c:if>
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
                                    <img src="assets/images/logo/logo_01_1.png" srcset="assets/images/logo/logo_01_1.png 2x" alt="logo_not_found" width="35%">
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
        </header>
        <!-- header_section - end -->

        <!-- main body - start -->
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
                                <a href="home.jsp" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Trang chủ</a>
                            </li>
                            <li><a href="booking">Đặt vé</a></li>
                            <li><a href="cuslistblog">Blog</a></li>
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
            <!-- breadcrumb_section - start -->
            <section class="breadcrumb_section text-center clearfix">
                <div class="page_title_area has_overlay d-flex align-items-center clearfix" data-bg-image="assets/images/breadcrumb/bg_08_1.png">
                    <div class="container" data-aos="fade-up" data-aos-delay="100">
                        <h1 class="page_title text-white mb-0">Blog Detail</h1>
                    </div>
                </div>
                <div class="breadcrumb_nav clearfix" data-bg-color="#F2F2F2">
                    <div class="container">
                        <ul class="ul_li clearfix">
                            <li><a href="home.jsp">Home</a></li>
                            <li><a href="cuslistblog">Blog</a></li>
                            <li>Blog Detail</li>
                        </ul>
                    </div>
                </div>
            </section>
            <!-- breadcrumb_section - end -->

            <!-- blog detail section - start -->
            <%
                String blogId = request.getParameter("id");
                BlogDao blogDao = new BlogDao();
                Blog blog = blogDao.get(Integer.parseInt(blogId));
            %>
            <section class="blog_detail_section sec_ptb_100 clearfix">
                <div class="container">
                    <div class="blog-detail" data-aos="fade-up" data-aos-delay="100">
                        <h1><%= blog.getTitle() %></h1>
                        <h3><%= blog.getBrief() %></h3>
                        <div class="blog-image">
                            <img src="<%= blog.getImage() %>" alt="Blog Image">
                        </div>
                        <div class="content"><%= blog.getContent() %></div>
                        <div class="blog-meta">
                            <span>Date: <%= blog.getUpdatedtime() %></span>
                        </div>
                        <a href="cuslistblog" class="back-link">← Back to Blog List</a>
                    </div>
                </div>
            </section>
            <!-- blog detail section - end -->
        </main>
        <!-- main body - end -->

        <!-- footer_section - start -->
        <footer class="footer_section clearfix" data-bg-color="#F2F2F2">
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
                                    BusGo cam kết cung cấp dịch vụ đặt vé xe buýt đáng tin cậy và chất lượng cao với thông tin minh bạch, giá cả rõ ràng và hỗ trợ khách hàng tận tình, đảm bảo hành trình của bạn luôn thuận tiện và an toàn.
                                </p>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-12 col-sm-12">
                            <div class="footer_contact_info" data-aos="fade-up" data-aos-delay="200">
                                <h3 class="footer_widget_title">Liên hệ:</h3>
                                <ul class="ul_li_block clearfix">
                                    <li><strong><i class="fas fa-map-marker-alt"></i> Địa chỉ:</strong><p class="mb-0">Khu công nghệ cao Hòa Lạc - Thạch Thất - Hà Nội</p></li>
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
                                    <li><a href="contact.jsp"><i class="fal fa-angle-right"></i> Trung tâm hỗ trợ</a></li>
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
                            <p class="copyright_text mb-0">Bản quyền © 2020. Được phát triển bởi <a class="author_links text-white" href="home.jsp">BusGo</a></p>
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
        <script>
                                                        $(document).ready(function () {
                                                            setTimeout(function () {
                                                                $("#success-alert").fadeOut("slow");
                                                            }, 3000);
                                                        });
        </script>
    </body>
</html>