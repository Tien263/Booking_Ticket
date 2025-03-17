<%-- 
    Document   : cuslistblog
    Created on : [Date]
    Author     : [Author]
--%>

<%@ page import="java.util.List" %>
<%@ page import="model.Blog" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Blog - Rotors</title>
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

    <!-- Custom styles from cuslistblog.jsp -->
    <style>
        body {
            background-color: #7da47f; /* Light green background */
            color: white;
            font-family: Arial, sans-serif;
        }
        .blog-container {
            width: 60%;
            margin: 20px auto;
            padding: 20px;
        }
        .blog-item {
            background: white;
            color: black;
            padding: 20px;
            margin-bottom: 30px;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Added shadow for depth */
        }
        .blog-item img {
            width: 100%;
            height: auto;
            border-radius: 5px;
        }
        .blog-meta {
            display: flex;
            justify-content: space-between;
            font-size: 14px;
            color: gray;
            margin-top: 10px;
        }
        .blog-title {
            font-size: 24px;
            font-weight: bold;
            margin: 10px 0;
        }
        .blog-brief {
            font-size: 16px;
            line-height: 1.5;
        }
        .read-more {
            display: inline-block;
            margin-top: 10px;
            color: #a8dadc; /* Light teal for link */
            font-weight: bold;
            text-decoration: none;
        }
        .read-more::after {
            content: " →";
        }
        .read-more:hover {
            color: #81c784; /* Lighter green on hover */
        }
        /* Updated footer styles */
        .footer_section {
            background-color: #ffffff; /* White background */
            color: #333; /* Dark text for contrast */
        }
        .footer_widget_area {
            background-color: #ffffff; /* White background for widget area */
            padding: 50px 0; /* Reduced padding for cleaner look */
        }
        .footer_bottom {
            background-color: #f5f5f5; /* Light gray for contrast */
            color: #666; /* Slightly lighter text */
            padding: 15px 0;
        }
        .footer_widget_title {
            color: #7da47f; /* Green for headings to match theme */
        }
        .footer_contact_info ul li,
        .footer_useful_links ul li a {
            color: #333; /* Dark text for readability */
        }
        .footer_useful_links ul li a:hover {
            color: #7da47f; /* Green on hover to match theme */
        }
        .footer_bottom a {
            color: #7da47f; /* Green for links */
        }
        .footer_bottom a:hover {
            color: #5d8c5f; /* Darker green on hover */
        }
        .primary_social_links li a {
            color: #333; /* Dark icons */
        }
        .primary_social_links li a:hover {
            color: #7da47f; /* Green on hover */
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
                                <li class="active"><a href="cuslistblog">Blog</a></li>
                                <li><a href="contact.jsp">Contact Us</a></li>
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
        <!-- Breadcrumb Section -->
        <section class="breadcrumb_section text-center clearfix">
            <div class="page_title_area has_overlay d-flex align-items-center clearfix" data-bg-image="assets/images/breadcrumb/bg_01_1.jpeg">
                <div class="overlay"></div>
                <div class="container" data-aos="fade-up" data-aos-delay="100">
                    <h1 class="page_title text-white mb-0">Blog</h1>
                </div>
            </div>

            <div class="breadcrumb_nav clearfix" data-bg-color="#F2F2F2">
                <div class="container">
                    <ul class="ul_li clearfix">
                        <li><a href="home.jsp">Trang chủ</a></li>
                        <li>Blog</li>
                    </ul>
                </div>
            </div>
        </section>

        <!-- Blog Section -->
        <div class="blog-container">
            <%
                List<Blog> blogList = (List<Blog>) request.getAttribute("blogList");
                if (blogList != null && !blogList.isEmpty()) {
                    for (Blog blog : blogList) {
            %>
            <div class="blog-item" data-aos="fade-up" data-aos-delay="100">
                <img src="<%= blog.getImage() %>" alt="Blog Image">
                <div class="blog-meta">
                    <span><%= blog.getUpdatedtime() %></span>
                </div>
                <h2 class="blog-title"><%= blog.getTitle() %></h2>
                <p class="blog-brief"><%= blog.getBrief() %></p>
                <a href="blogdetail.jsp?id=<%= blog.getId() %>" class="read-more">READ MORE</a>
            </div>
            <%
                    }
                } else {
            %>
            <p>Không có blog nào được tìm thấy.</p>
            <%
                }
            %>
        </div>
    </main>
    <!-- main body - end -->

    <!-- footer_section - start -->
    <footer class="footer_section clearfix">
        <div class="footer_widget_area clearfix">
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
                                <ul class="ul_li_block clearfix"></ul>
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
                                <li><a href="#!"><i class="fal fa-angle-right"></i> Privacy Policy</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer_bottom clearfix">
            <div class="container">
                <div class="row align-items-center justify-content-lg-between">
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <p class="copyright_text mb-0">Copyright © 2020. Rotors by <a class="author_links" href="#!">Merkulove</a></p>
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