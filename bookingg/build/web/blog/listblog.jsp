<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Danh sách Blog - Rotors</title>
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/logo/logo_01_1.png">

        <!-- framework - css include -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/fontawesome.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/aos.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/animate.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/slick.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/slick-theme.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/magnific-popup.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/nice-select.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.css">

        <style>
            .table-responsive {
                margin-top: 30px;
                max-width: 1200px; /* Giới hạn chiều rộng tối đa, bạn có thể điều chỉnh giá trị này */
                margin-left: auto; /* Căn giữa */
                margin-right: auto; /* Căn giữa */
/*                padding-left: 0cm;  Khoảng cách 5cm bên trái 
                padding-right: 0cm;  Khoảng cách 5cm bên phải */
                position: relative;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                font-size: 14px; /* Cỡ chữ 14px cho toàn bảng */
            }
            th, td {
                border: 1px solid #ddd;
                padding: 12px;
                text-align: left;
                vertical-align: top;
                font-size: 14px; /* Cỡ chữ 14px cho tiêu đề và ô dữ liệu */
            }
            th {
                background-color: #f2f2f2;
                font-weight: bold;
            }
            td img {
                max-width: 100px;
                max-height: 100px;
            }
            .btn-action {
                margin-right: 5px;
                font-size: 14px; /* Cỡ chữ 14px cho nút hành động */
                padding: 6px 10px; /* Giảm padding để nút nhỏ hơn */
            }
            /* Định dạng cột Nội dung */
            td:nth-child(4) {
                min-width: 500px; /* Tăng chiều rộng cột Nội dung */
                word-break: break-word;
                white-space: pre-wrap;
                overflow-wrap: break-word;
                max-height: 200px; /* Giữ chiều cao tối đa */
                overflow-y: auto;
            }
            /* Định dạng cột Hành động */
            th:nth-child(8), td:nth-child(8) {
                width: 110px; /* Chiều rộng cố định cho cột Hành động */
                min-width: 110px; /* Chiều rộng tối thiểu */
            }
            /* Ẩn tất cả các hàng trừ hàng hiện tại */
            tr.blog-row {
                display: none;
            }
            tr.blog-row.active {
                display: table-row;
            }
            /* Định dạng nút điều hướng */
            .navigation-buttons {
                text-align: center;
                margin-top: 20px;
            }
            .nav-btn {
                padding: 10px 20px;
                margin: 0 10px;
                background-color: #007bff;
                color: white;
                border: none;
                cursor: pointer;
                border-radius: 5px;
                font-size: 14px; /* Cỡ chữ 14px cho nút điều hướng */
            }
            .nav-btn:disabled {
                background-color: #cccccc;
                cursor: not-allowed;
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
                                    <img src="logo_01_1.png" srcset="logo_01_1.png 2x" alt="logo_not_found" width="35%">
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
                                                    <img src="img_01.png" alt="thumbnail_not_found" width="35%">
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

                            </nav>
                        </div>


                    </div>
                </div>
        </header>
        <!-- header_section - end -->

        <!-- main body - start -->
        <main>
            <!-- breadcrumb_section - start -->
            <section class="breadcrumb_section text-center clearfix">
                <div class="page_title_area has_overlay d-flex align-items-center clearfix" data-bg-image="${pageContext.request.contextPath}/assets/images/breadcrumb/bg_08_1.jpg">
                    <div class="container" data-aos="fade-up" data-aos-delay="100">
                        <h1 class="page_title text-white mb-0">Danh sách Blog</h1>
                    </div>
                </div>
                <div class="breadcrumb_nav clearfix" data-bg-color="#F2F2F2">
                    <div class="container">
                        <ul class="ul_li clearfix">
                            <li><a href="index.html">Home</a></li>
                            <li>Danh sách Blog</li>
                        </ul>
                    </div>
                </div>
            </section>
            <!-- breadcrumb_section - end -->

            <!-- blog_list_section - start -->
            <section class="register_section sec_ptb_100 clearfix">
                <div class="register_card mb-0" data-bg-color="#F2F2F2" data-aos="fade-up" data-aos-delay="100">
                    <div class="section_title mb_30 text-center">
                        <h2 class="title_text mb-0" data-aos="fade-up" data-aos-delay="300">
                            <span>Danh sách Blog</span>
                        </h2>
                    </div>
                    <div class="table-responsive" data-aos="fade-up" data-aos-delay="500">
                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Tiêu đề</th>
                                    <th>Mô tả ngắn</th>
                                    <th>Nội dung</th>
                                    <th>Ngày tạo</th>
                                    <th>Ngày cập nhật</th>
                                    <th>Ảnh</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody id="blogTable">
                                <c:choose>
                                    <c:when test="${not empty blog}">
                                        <c:forEach var="b" items="${blog}" varStatus="loop">
                                            <tr class="blog-row ${loop.first ? 'active' : ''}" data-index="${loop.index}">
                                                <td>${b.getId()}</td>
                                                <td>${b.getTitle()}</td>
                                                <td>${b.getBrief()}</td>
                                                <td>${b.getContent()}</td>
                                                <td>${b.getCreatedtime()}</td>
                                                <td>${b.getUpdatedtime()}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${not empty b.getImage()}">
                                                            <img src="${b.getImage()}" alt="Blog Image"/>
                                                        </c:when>
                                                        <c:otherwise>
                                                            Không có ảnh
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <a href="updateblog?id=${b.getId()}" class="btn btn-primary btn-sm btn-action">
                                                        <i class="fas fa-pen"></i>
                                                    </a>
                                                    <button type="button" class="btn btn-danger btn-sm btn-action" onclick="removeBlog(${b.id})">
                                                        <i class="fas fa-trash-alt"></i>
                                                    </button>
                                                    <form id="removeBlog${b.id}" action="deleteblog" method="POST" style="display:none;">
                                                        <input type="hidden" name="id" value="${b.id}"/>
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="8" class="text-center">Không có blog nào.</td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                        <!-- Nút điều hướng -->
                        <div class="navigation-buttons">
                            <button id="prevBtn" class="nav-btn" onclick="prevBlog()">← Trước</button>
                            <button id="nextBtn" class="nav-btn" onclick="nextBlog()">Tiếp theo →</button>
                        </div>
                    </div>
                </div>
            </section>
            <!-- blog_list_section - end -->
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

        <!-- JavaScript -->
        <script>
            let currentIndex = 0;
            const rows = document.querySelectorAll('#blogTable .blog-row');
            const totalRows = rows.length;

            function updateDisplay() {
                rows.forEach((row, index) => {
                    row.classList.toggle('active', index === currentIndex);
                });
                document.getElementById('prevBtn').disabled = currentIndex === 0;
                document.getElementById('nextBtn').disabled = currentIndex === totalRows - 1;
            }

            function prevBlog() {
                if (currentIndex > 0) {
                    currentIndex--;
                    updateDisplay();
                }
            }

            function nextBlog() {
                if (currentIndex < totalRows - 1) {
                    currentIndex++;
                    updateDisplay();
                }
            }

            function removeBlog(id) {
                var result = confirm("Are you sure you want to delete this blog?");
                if (result) {
                    document.getElementById("removeBlog" + id).submit();
                }
            }

            // Khởi tạo hiển thị
            if (totalRows > 0) {
                updateDisplay();
            }
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