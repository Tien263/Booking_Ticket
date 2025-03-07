<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <title>Home V.1 - Rotors - Car Rental HTML5 Template</title>
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

    <!-- header_section - start
    ================================================== -->
    <header class="header_section sticky text-white clearfix">
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
                            <a href="index_1.html">
                                <img src="assets/images/logo/logo_01_1.png" srcset="assets/images/logo/logo_01_1.png 2x" alt="logo_not_found" width="50%">
                                <img src="assets/images/logo/logo_01_1.png" srcset="assets/images/logo/logo_01_1.png 2x" alt="logo_not_found" width="50%">
                            </a>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-6 col-6 order-last">
                        <ul class="header_action_btns ul_li_right clearfix">
                            <li>
                                <button type="button" class="search_btn" data-toggle="collapse" data-target="#collapse_search_body" aria-expanded="false" aria-controls="collapse_search_body">
                                    <i class="fal fa-search"></i>
                                </button>
                            </li>
                            <li class="dropdown">
                                <button type="button" class="cart_btn" id="cart_dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fal fa-shopping-cart"></i>
                                    <span class="cart_counter bg_default_red">3</span>
                                </button>
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
                                        <li><a href="#!"><i class="fal fa-sign-out"></i> Logout</a></li>
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
                                    <a href="#!">Home</a>
                                    <ul class="submenu">
                                        <li><a href="index_1.html">Home Page V.1</a></li>
                                        <li><a href="index_2.html">Home Page V.2</a></li>
                                    </ul>
                                </li>
                                <li><a href="gallery.html">Our Cars</a></li>
                                <li><a href="review.html">Reviews</a></li>
                                <li><a href="about.html">About</a></li>
                                <li class="has_child">
                                    <a href="#!">Pages</a>
                                    <ul class="submenu">
                                        <li><a href="service.html">Our Service</a></li>
                                        <li><a href="gallery.html">Car Gallery</a></li>
                                        <li><a href="account.html">My Account</a></li>
                                        <li><a href="reservation.html">Reservation</a></li>
                                        <li class="has_child">
                                            <a href="#!">Blogs</a>
                                            <ul class="submenu">
                                                <li><a href="blog.html">Blog</a></li>
                                                <li><a href="blog_details.html">Blog Details</a></li>
                                            </ul>
                                        </li>
                                        <li class="has_child">
                                            <a href="#!">Our Cars</a>
                                            <ul class="submenu">
                                                <li><a href="car.html">Cars</a></li>
                                                <li><a href="car_details.html">Car Details</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="cart.html">Shopping Cart</a></li>
                                        <li><a href="faq.html">F.A.Q.</a></li>
                                        <li><a href="login.jsp">Login</a></li>
                                        <li><a href="login.html">LoginEmployees</a></li>
                                    </ul>
                                </li>
                                <li class="has_child">
                                    <a href="#!">Contact Us</a>
                                    <ul class="submenu">
                                        <li><a href="contact.html">Contact Default</a></li>
                                        <li><a href="contact_wordwide.html">Contact Wordwide</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
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
                            <img src="assets/images/logo/logo_01_1.png" srcset="assets/images/logo/logo_01_2x.png 2x" alt="logo_not_found">
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

        <!-- Forgot Password Section - start -->
        <section class="email_section sec_ptb_150 clearfix">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6 col-md-8 col-sm-12 col-xs-12">
                        <div class="form_item mb-0" data-aos="fade-up" data-aos-delay="100">
                            <h3 class="text-center mb_30">Forgot Password</h3>
                            <form action="forgotpassword" method="POST">
                                <div class="form_item">
                                    <label for="email_input">Email:</label>
                                    <input id="email_input" type="email" name="email" value="${email}" required pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" title="Vui lòng nhập địa chỉ email hợp lệ.">
                                    <span class="text-danger">${errorEmail}</span>
                                </div>
                                <span class="text-danger d-block mb-3">${errorOTP}</span>
                                <button type="submit" class="custom_btn bg_default_red btn_width text-uppercase">Send <img src="assets/images/icons/icon_01.png" alt="icon_not_found"></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Forgot Password Section - end -->
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
                                <a href="index.html">
                                    <img src="assets/images/logo/logo_01_1.png" srcset="assets/images/logo/logo_02_2x.png 2x" alt="logo_not_found">
                                </a>
                            </div>
                            <p class="mb_15">
                                Cras sit amet mi non orci pretium consectetur. Donec iaculis ante ac sollicitudin luctus. Phasellus ut lacus lacus. Phasellus sagittis ex id tortor tincidunt luctus. Donec consectetur consequat bibendum
                            </p>
                            <div class="footer_useful_links mb_30">
                                <ul class="ul_li_block clearfix">
                                    <li><a href="#!"><i class="fal fa-angle-right"></i> Rental Information</a></li>
                                    <li><a href="#!"><i class="fal fa-angle-right"></i> F.A.Q.</a></li>
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
                            <h3 class="footer_widget_title">Contact Us:</h3>
                            <ul class="ul_li_block clearfix">
                                <li>
                                    <strong><i class="fas fa-map-marker-alt"></i> Main Office Address:</strong>
                                    <p class="mb-0">
                                        Unit 9, Manor Industrial Estate, Lower Wash Lane, Warrington, WA4
                                    </p>
                                </li>
                                <li><i class="fas fa-clock"></i> 8:00am-9:30pm</li>
                                <li><i class="far fa-angle-right"></i> Other Office Locations</li>
                                <li><i class="fas fa-envelope"></i> <strong>rotorseml@eml.fr</strong></li>
                                <li><i class="fas fa-phone"></i> <strong>+880 1680 6361 89</strong></li>
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