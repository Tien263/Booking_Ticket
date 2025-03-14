<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Update Blog - Rotors</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/logo/favourite_icon.png">

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
</head>
<style>
    .form_item {
        margin-bottom: 20px;
    }
    #previewImage {
        max-width: 300px;
        margin-top: 10px;
    }
    textarea[name="brief"] {
        height: 100px; /* Chiều cao nhỏ hơn cho phần Tóm tắt */
    }
    textarea[name="content"] {
        height: 200px; /* Chiều cao lớn hơn cho phần Nội dung */
    }
</style>

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
                                <img src="${pageContext.request.contextPath}/assets/images/logo/logo_01_1.png" srcset="${pageContext.request.contextPath}/assets/images/logo/logo_01_1.png 2x" alt="Logo" width="35%">
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
                                            <img src="${pageContext.request.contextPath}/assets/images/meta/img_01.png" alt="User Thumbnail">
                                        </a>
                                        <div class="user_content">
                                            <h4 class="user_name"><a href="#!">User Name</a></h4>
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
                                <li class="active"><a href="index.html">Home</a></li>
                                <li><a href="gallery.html">Our Cars</a></li>
                                <li><a href="review.html">Reviews</a></li>
                                <li><a href="about.html">About</a></li>
                                <li><a href="contact.html">Contact Us</a></li>
                            </ul>
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
            <div class="page_title_area has_overlay d-flex align-items-center clearfix" data-bg-image="${pageContext.request.contextPath}/assets/images/breadcrumb/bg_08_1.png">
                <div class="container" data-aos="fade-up" data-aos-delay="100">
                    <h1 class="page_title text-white mb-0">Update Blog</h1>
                </div>
            </div>
            <div class="breadcrumb_nav clearfix" data-bg-color="#F2F2F2">
                <div class="container">
                    <ul class="ul_li clearfix">
                        <li><a href="index.html">Home</a></li>
                        <li>Update Blog</li>
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
                            <span>Cập nhật bài Blog</span>
                        </h2>
                    </div>
                    <form action="updateblog" method="POST" enctype="multipart/form-data" id="updateBlogForm">
                        <input type="hidden" name="id" value="${requestScope.b.getId()}"/>
                        <div class="row">
                            <!-- Single column -->
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" data-aos="fade-up" data-aos-delay="500">
                                <c:if test="${not empty errorMessage}">
                                    <div class="form_item text-center" style="color: red; font-weight: bold;">
                                        ${errorMessage}
                                    </div>
                                </c:if>
                                <div class="form_item">
                                    <label for="title">Tiêu đề</label>
                                    <input type="text" name="title" id="title" value="${requestScope.b.title}" required>
                                </div>
                                <div class="form_item">
                                    <label for="brief">Tóm tắt</label>
                                    <textarea name="brief" id="brief" required>${requestScope.b.brief}</textarea>
                                </div>
                                <div class="form_item">
                                    <label for="content">Nội dung</label>
                                    <textarea name="content" id="content" required>${requestScope.b.content}</textarea>
                                </div>
                                <div class="form_item">
                                    <label for="image">Hình ảnh</label>
                                    <input type="file" name="image" id="image" accept="image/*">
                                    <c:if test="${not empty requestScope.b.image}">
                                        <img id="previewImage" src="${requestScope.b.image}" alt="Ảnh hiện tại" style="display: block;">
                                        <input type="hidden" name="currentImage" value="${requestScope.b.image}">
                                    </c:if>
                                    <c:if test="${empty requestScope.b.image}">
                                        <img id="previewImage" src="" alt="Ảnh xem trước">
                                    </c:if>
                                </div>
                                <div class="form_item text-center">
                                    <p><b>Thời gian hiện tại:</b> <%= new Date() %></p>
                                </div>
                                <div class="form_item text-center mt-4">
                                    <button type="submit" class="custom_btn bg_default_red text-uppercase">Lưu</button>
                                </div>
                                <div class="form_item text-center mt-4">
                                    <a href="listblog" class="custom_btn bg_default_blue text-uppercase">Xem danh sách bài viết</a>
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
                                <a href="index.html">
                                    <img src="${pageContext.request.contextPath}/assets/images/logo/logo_01_1.png" srcset="${pageContext.request.contextPath}/assets/images/logo/logo_01_1.png 2x" alt="Logo">
                                </a>
                            </div>
                            <p class="mb_15">
                                BusGo is committed to providing a reliable and high-quality bus ticket booking service with transparent information, clear pricing, and dedicated customer support, ensuring your journey is always convenient and safe
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
                            <h3 class="footer_widget_title">Information:</h3>
                            <ul class="ul_li_block clearfix">
                                <li><a href="#!"><i class="fal fa-angle-right"></i> Find a Car for Rent</a></li>
                                <li><a href="#!"><i class="fal fa-angle-right"></i> Cars Catalog</a></li>
                                <li><a href="#!"><i class="fal fa-angle-right"></i> F.A.Q.</a></li>
                                <li><a href="#!"><i class="fal fa-angle-right"></i> About Us</a></li>
                                <li><a href="#!"><i class="fal fa-angle-right"></i> Contact Us</a></li>
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
    <!-- footer_section - end -->

    <!-- JavaScript for Image Preview -->
    <script>
        document.getElementById('image').addEventListener('change', function(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    const previewImage = document.getElementById('previewImage');
                    previewImage.src = e.target.result;
                    previewImage.style.display = 'block';
                };
                reader.readAsDataURL(file);
            }
        });
    </script>

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
</body>
</html>