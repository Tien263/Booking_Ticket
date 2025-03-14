<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">

        <title>Login - BusGo</title>
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

        <c:if test="${not empty success}">
            <div id="success-alert" class="alert alert-success alert-dismissible fade show position-fixed"
                 role="alert" 
                 style="z-index: 1050; top: 20px; right: 20px; width: auto; max-width: 300px; box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);">
                <strong>✔</strong> ${success}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
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
                                    <img src="assets/images/logo/logo_01_1.png" srcset="assets/images/logo/logo_01_1.png 2x" alt="logo_not_found" width="35%">

                                    <img src="assets/images/logo/logo_01_1.png" srcset="assets/images/logo/logo_01_1.png 2x" alt="logo_not_found" width="35%">
                                </a>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6 col-sm-6 col-6 order-last">
                            <ul class="header_action_btns ul_li_right clearfix">

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
                                    <button type="button" class="user_btn" id="user_dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fal fa-user"></i>
                                    </button>
                                    <div class="user_dropdown rotors_dropdown dropdown-menu clearfix" aria-labelledby="user_dropdown">
                                        <div class="profile_info clearfix">
                                            <a href="#!" class="user_thumbnail">
                                                <img src="assets/images/meta/img_01.png" alt="thumbnail_not_found">
                                            </a>
                                            <div class="user_content">
                                                <h4 class="user_name"><a href="#!">Rakibul Hassan</a></h4>
                                                <span class="user_title">Seller</span>
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
                            <a href="home.jsp">
                                <img src="assets/images/logo/logo_01_1.png" srcset="assets/images/logo/logo_01_1.png 2x" alt="logo_not_found">
                            </a>
                        </div>
                        <p class="mb-0">
                            Nullam id dolor auctor, dignissim magna eu, mattis ante. Pellentesque tincidunt, elit a facilisis efficitur, nunc nisi scelerisque enim, rhoncus malesuada est velit a nulla. Cras porta mi vitae dolor tristique euismod. Lorem ipsum dolor sit amet, consectetur adipiscing elit
                        </p>
                    </div>

                    <div class="menu_list mb_60 clearfix">
                        <h3 class="title_text text-white">Menu List</h3>
                        <ul class="ul_li_block clearfix">
                            <li class="active dropdown">
                                <a href="#!" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Home</a>
                                <ul class="dropdown-menu">
                                    <li><a href="index_1.html">Home Page V.1</a></li>
                                    <li><a href="index_2.html">Home Page V.2</a></li>
                                </ul>
                            </li>
                            <li><a href="gallery.html">Our Cars</a></li>
                            <li><a href="review.html">Reviews</a></li>
                            <li><a href="about.html">About</a></li>
                            <li class="dropdown">
                                <a href="#!" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Pages</a>
                                <ul class="dropdown-menu">
                                    <li><a href="service.html">Our Service</a></li>
                                    <li><a href="gallery.html">Car Gallery</a></li>
                                    <li><a href="account.html">My Account</a></li>
                                    <li><a href="reservation.html">Reservation</a></li>
                                    <li class="dropdown">
                                        <a href="#!" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Blogs</a>
                                        <ul class="dropdown-menu">
                                            <li><a href="blog.html">Blog</a></li>
                                            <li><a href="blog_details.html">Blog Details</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#!" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Our Cars</a>
                                        <ul class="dropdown-menu">
                                            <li><a href="car.html">Cars</a></li>
                                            <li><a href="car_details.html">Car Details</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="cart.html">Shopping Cart</a></li>
                                    <li><a href="faq.html">F.A.Q.</a></li>
                                    <li><a href="login.html">Login</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#!" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Contact Us</a>
                                <ul class="dropdown-menu">
                                    <li><a href="contact.html">Contact Default</a></li>
                                    <li><a href="contact_wordwide.html">Contact Wordwide</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>

                    <div class="booking_car_form">
                        <h3 class="title_text text-white mb-2">Book A Car</h3>
                        <p class="mb_15">
                            Nullam id dolor auctor, dignissim magna eu, mattis ante. Pellentesque tincidunt, elit a facilisis efficitur.
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


            <!-- breadcrumb_section - start
            ================================================== -->
            <section class="breadcrumb_section text-center clearfix">
                <div class="page_title_area has_overlay d-flex align-items-center clearfix" data-bg-image="assets/images/breadcrumb/bg_08_1.png">
                    <!-- <div class="overlay"></div> -->
                    <div class="container" data-aos="fade-up" data-aos-delay="100">
                        <h1 class="page_title text-white mb-0">Login</h1>
                    </div>
                </div>
                <div class="breadcrumb_nav clearfix" data-bg-color="#F2F2F2">
                    <div class="container">
                        <ul class="ul_li clearfix">
                            <li><a href="home.jsp">Home</a></li>
                            <li>Login</li>
                        </ul>
                    </div>
                </div>
            </section>
            <!-- breadcrumb_section - end
            ================================================== -->


            <!-- register_section - start
            ================================================== -->
            <section class="register_section sec_ptb_100 clearfix">
                <div class="container">

                    <div class="register_card mb_60" data-bg-color="##F2F2F2" data-aos="fade-up" data-aos-delay="100">
                        <div class="row align-items-center">
                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                <div class="reg_image" data-aos="fade-up" data-aos-delay="300">
                                    <img src="assets/images/about/img_03_1.jpg" alt="image_not_found">
                                </div>
                            </div>

                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                <div class="reg_form" data-aos="fade-up" data-aos-delay="500">
                                    <h3 class="form_title">LogIn:</h3>
                                    <p>
                                        Savings of up to 15% with our car rental solutions, global coverage and a dedicated customer team
                                    </p>
                                    <span class="new_account mb_15">Log In or <a href="#!">Create an Account?</a></span>
                                    <form action="cuslogin" method="post">
                                        <div class="form_item">
                                            <input type="text" name="email" placeholder="Your email" required>
                                        </div>
                                        <div class="form_item">
                                            <input type="password" name="password" placeholder="Password" required>
                                        </div>
                                        <button type="submit" class="custom_btn bg_default_red text-uppercase">Login <img src="assets/images/icons/icon_01.png" alt="icon_not_found"></button>
                                        <input type="button" class="reset_pass mb_15" name="forgot" value="Reset Your Password by e-mail?" onclick="location.href = 'forgotpassword';">
                                        <div class="checkbox_input mb-0">
                                            <label for="input_save"><input id="input_save" type="checkbox"> Save my name, email, and website in this browser for the next time I comment</label>
                                        </div>
                                    </form>
                                    <p style="color: red;">${loginerror}</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="register_card mb-0" data-bg-color="##F2F2F2" data-aos="fade-up" data-aos-delay="100">
                        <div class="section_title mb_30 text-center">
                            <h2 class="title_text mb-0" data-aos="fade-up" data-aos-delay="300">
                                <span>Register</span>
                            </h2>
                        </div>
                        <form action="register" method="POST">
                            <div class="row">
                                <!-- Cột bên trái -->
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" data-aos="fade-up" data-aos-delay="500">
                                    <div class="form_item">
                                        <label for="fullname">Full Name*</label>
                                        <input type="text" id="fullname" name="fullname" placeholder="Your Full Name" value="${fullname}" required>
                                    </div>
                                    <div class="form_item">
                                        <label for="email">Email*</label>
                                        <input type="email" id="email" name="email" placeholder="Your Email" value="${email}" required pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}" title="Vui lòng nhập đúng định dạng email">
                                    </div>
                                    <div class="form_item position-relative">
                                        <label for="username">Username*</label>
                                        <input type="text" id="username" name="username" placeholder="Username" required>
                                        <span id="username-error-icon" class="text-danger position-absolute" 
                                              style="right: 10px; top: 75%; transform: translateY(-50%); display: none;">
                                            <i class="fas fa-exclamation-circle" title="Username đã tồn tại"></i>
                                        </span>
                                    </div>
                                    <div class="form_item">
                                        <label for="phone">Phone Number*</label>
                                        <input type="tel" id="phone" name="phone" placeholder="Phone Number" value="${phone}" required pattern="[0-9]{10}">
                                    </div>
                                    <div class="form_item"><label for="gender">Gender*</label><select id="gender" name="gender" required><option value="1" <c:if test="${gender}">selected</c:if>>Male</option><option value="0" <c:if test="${gender}">selected</c:if>>Female</option></select></div>
                                    <div class="form_item"><label for="address">Address</label><input type="text" id="address" name="address" placeholder="Address" value="${address}"></div>
                                </div>

                                <!-- Cột bên phải -->
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" data-aos="fade-up" data-aos-delay="700">
                                    <div class="form_item">
                                        <label for="password">Password*</label>
                                        <div class="position-relative">
                                            <input type="password" id="password" name="password" placeholder="Password" required>
                                            <i id="togglePassword" class="fas fa-eye input_icon" style="cursor: pointer;"></i>
                                        </div>
                                    </div>
                                    <div class="form_item">
                                        <label for="confirmpass">Confirm Password*</label>
                                        <input type="password" id="confirmpass" name="confirmpass" placeholder="Confirm Password" required>
                                    </div>
                                    <!-- Password Requirements -->
                                    <div id="result" class="alert d-none" role="alert">
                                        <span id="resultText"></span>
                                    </div>
                                    <div class="border p-3 rounded mb-3">
                                        <p class="font-weight-bold mb-2">Your password must contain:</p>
                                        <ul class="list-unstyled">
                                            <li class="d-flex align-items-center"><i id="lengthIcon" class="fas fa-times text-danger mr-2"></i> At least 8 characters</li>
                                            <li class="d-flex align-items-center"><i id="varietyIcon" class="fas fa-times text-danger mr-2"></i> At least 3 of the following:
                                                <ul class="list-unstyled ml-4">
                                                    <li id="lowercase" class="d-flex align-items-center"><i class="fas fa-times text-danger mr-2"></i> Lower case letters (a-z)</li>
                                                    <li id="uppercase" class="d-flex align-items-center"><i class="fas fa-times text-danger mr-2"></i> Upper case letters (A-Z)</li>
                                                    <li id="numbers" class="d-flex align-items-center"><i class="fas fa-times text-danger mr-2"></i> Numbers (0-9)</li>
                                                    <li id="special" class="d-flex align-items-center"><i class="fas fa-times text-danger mr-2"></i> Special characters (e.g. !@#$%^&*)</li>
                                                </ul>
                                            </li>
                                            <li class="d-flex align-items-center"><i id="repeatIcon" class="fas fa-times text-danger mr-2"></i> No more than 2 identical characters in a row</li>
                                            <li class="d-flex align-items-center"><i id="matchIcon" class="fas fa-times text-danger mr-2"></i> Passwords must match</li>
                                        </ul>
                                    </div>

                                </div>
                            </div>

                            <div class="form_item text-center mt-4">
                                <button type="submit" name="register" class="custom_btn bg_default_red text-uppercase">Register</button>
                            </div>
                            <p style="color: red; text-align: center;">${error}</p>
                        </form>
                    </div>

                </div>
            </section>
            <!-- register_section - end
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


        <!-- Password Validation Script -->
        <script>
                                            $(document).ready(function () {
                                                const $password = $('#password');
                                                const $confirmpass = $('#confirmpass');
                                                const $togglePassword = $('#togglePassword');
                                                const $result = $('#result');
                                                const $resultIcon = $('#resultIcon');
                                                const $resultText = $('#resultText');
                                                const $lengthIcon = $('#lengthIcon');
                                                const $varietyIcon = $('#varietyIcon');
                                                const $repeatIcon = $('#repeatIcon');
                                                const $matchIcon = $('#matchIcon');
                                                const $lowercaseIcon = $('#lowercase i');
                                                const $uppercaseIcon = $('#uppercase i');
                                                const $numbersIcon = $('#numbers i');
                                                const $specialIcon = $('#special i');

                                                // Toggle password visibility
                                                $togglePassword.on('click', function () {
                                                    const type = $password.attr('type') === 'password' ? 'text' : 'password';
                                                    $password.attr('type', type);
                                                    $confirmpass.attr('type', type);
                                                    $(this).toggleClass('fa-eye fa-eye-slash');
                                                });

                                                // Password validation function
                                                function validatePassword() {
                                                    const password = $password.val();
                                                    const confirm = $confirmpass.val();

                                                    // Check length
                                                    const isLengthValid = password.length >= 8;
                                                    updateIcon($lengthIcon, isLengthValid);

                                                    // Check character variety
                                                    const hasLowercase = /[a-z]/.test(password);
                                                    const hasUppercase = /[A-Z]/.test(password);
                                                    const hasNumbers = /[0-9]/.test(password);
                                                    const hasSpecial = /[!@#$%^&*]/.test(password);
                                                    updateIcon($lowercaseIcon, hasLowercase);
                                                    updateIcon($uppercaseIcon, hasUppercase);
                                                    updateIcon($numbersIcon, hasNumbers);
                                                    updateIcon($specialIcon, hasSpecial);
                                                    const varietyCount = [hasLowercase, hasUppercase, hasNumbers, hasSpecial].filter(Boolean).length;
                                                    const isVarietyValid = varietyCount >= 3;
                                                    updateIcon($varietyIcon, isVarietyValid);

                                                    // Check repeated characters
                                                    const isRepeatValid = !/(.)\1{2,}/.test(password);
                                                    updateIcon($repeatIcon, isRepeatValid);

                                                    // Check if passwords match
                                                    const isMatchValid = password === confirm && password !== '';
                                                    updateIcon($matchIcon, isMatchValid);

                                                    // Overall validation
                                                    const isValid = isLengthValid && isVarietyValid && isRepeatValid && isMatchValid;
                                                    updateResult(isValid);
                                                }

                                                // Update icon function
                                                function updateIcon($icon, isValid) {
                                                    $icon.removeClass('fa-times fa-check text-danger text-success');
                                                    $icon.addClass(isValid ? 'fa-check text-success' : 'fa-times text-danger');
                                                }

                                                // Update result function
                                                function updateResult(isValid) {
                                                    $result.removeClass('d-none alert-success alert-danger');
                                                    $result.addClass(isValid ? 'alert-success' : 'alert-danger');
                                                    $resultIcon.removeClass('fa-check-circle fa-times-circle');
                                                    $resultIcon.addClass(isValid ? 'fa-check-circle' : 'fa-times-circle');
                                                    $resultText.text(isValid ? 'Success!' : 'Failed!');
                                                }

                                                // Bind input events
                                                $password.on('input', validatePassword);
                                                $confirmpass.on('input', validatePassword);

                                                // Prevent form submission if validation fails
                                                $('#registerForm').on('submit', function (e) {
                                                    const password = $password.val();
                                                    const confirm = $confirmpass.val();
                                                    const isLengthValid = password.length >= 8;
                                                    const hasLowercase = /[a-z]/.test(password);
                                                    const hasUppercase = /[A-Z]/.test(password);
                                                    const hasNumbers = /[0-9]/.test(password);
                                                    const hasSpecial = /[!@#$%^&*]/.test(password);
                                                    const varietyCount = [hasLowercase, hasUppercase, hasNumbers, hasSpecial].filter(Boolean).length;
                                                    const isVarietyValid = varietyCount >= 3;
                                                    const isRepeatValid = !/(.)\1{2,}/.test(password);
                                                    const isMatchValid = password === confirm && password !== '';

                                                    if (!(isLengthValid && isVarietyValid && isRepeatValid && isMatchValid)) {
                                                        e.preventDefault();
                                                        $(this).find('p[style="color: red; text-align: center;"]').text('Please meet all password requirements.');
                                                    }
                                                });
                                            });
        </script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
                                            $(document).ready(function () {
                                                $("#username").on("input", function () {
                                                    let username = $(this).val();
                                                    let $usernameField = $(this);
                                                    let $errorIcon = $("#username-error-icon");

                                                    if (username.length < 3) {
                                                        $errorIcon.hide();
                                                        return;
                                                    }

                                                    $.ajax({
                                                        url: "register", // Trùng với URL mapping của servlet
                                                        type: "GET",
                                                        data: {username: username},
                                                        success: function (response) {
                                                            if (response.exists) {
                                                                $usernameField.addClass("is-invalid");
                                                                $errorIcon.show();
                                                            } else {
                                                                $usernameField.removeClass("is-invalid");
                                                                $errorIcon.hide();
                                                            }
                                                        }
                                                    });
                                                });
                                            });
        </script>
        <script>
            $(document).ready(function () {
                setTimeout(function () {
                    $("#success-alert").fadeOut("slow");
                }, 3000);
            });
        </script>
    </body>
</html>