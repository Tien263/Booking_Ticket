<%-- 
    Document   : employeesearch
    Created on : Mar 26, 2025, 6:52:11 AM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Tìm kiếm nhân viên - BusGo</title>
    <link rel="shortcut icon" href="assets/images/logo/logo_01_1.png">

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
        max-width: 1200px;
        margin-left: auto;
        margin-right: auto;
        position: relative;
        z-index: 1; /* Keep z-index low for the table */
    }
    table {
        width: 100%;
        border-collapse: collapse;
        font-size: 14px;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 12px;
        text-align: left;
        vertical-align: top;
        font-size: 14px;
    }
    th {
        background-color: #f2f2f2;
        font-weight: bold;
    }
    .search-form {
        max-width: 1200px;
        margin: 30px auto;
        padding: 20px;
        background-color: #f9f9f9;
        border-radius: 5px;
        display: flex;
        flex-wrap: wrap;
        gap: 15px;
        justify-content: center;
        position: relative; /* Ensure the form has a relative position for z-index context */
        z-index: 10; /* Higher z-index for the form to ensure dropdowns appear above other elements */
    }
    .search-form div {
        display: flex;
        align-items: center;
        flex: 1 1 45%;
        min-width: 300px;
    }
    .search-form label {
        display: inline-block;
        width: 100px;
        font-size: 14px;
        margin-bottom: 0;
    }
    .search-form input[type="text"],
    .search-form select {
        width: 200px;
        padding: 6px;
        font-size: 14px;
        border: 1px solid #ddd;
        border-radius: 4px;
        position: relative;
        z-index: 100; /* Ensure the select element has a high z-index */
    }
    .search-form input[type="radio"] {
        margin: 0 5px 0 15px;
    }
    .search-form input[type="submit"] {
        padding: 10px 20px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 14px;
        cursor: pointer;
    }
    .search-form input[type="submit"]:hover {
        background-color: #0056b3;
    }
    .search-form div[style="text-align: center;"] {
        flex: 1 1 100%;
        text-align: center;
    }
    /* Style for the dropdown options to ensure they are visible */
    .search-form select option {
        z-index: 101; /* Ensure dropdown options have a higher z-index */
    }
    /* Fix for the dropdown menu visibility */
    .nice-select .list {
        z-index: 102; /* Ensure the dropdown list has the highest z-index */
        width: 100%;
        max-height: 200px;
        overflow-y: auto;
        position: absolute;
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 4px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
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
                                                <span class="user_title">${sessionScope.user}</span>
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
                            <!-- Optional: Add navigation here if needed -->
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
            <div class="page_title_area has_overlay d-flex align-items-center clearfix" data-bg-image="${pageContext.request.contextPath}/assets/images/breadcrumb/bg_08_1.jpg">
                <div class="container" data-aos="fade-up" data-aos-delay="100">
                    <h1 class="page_title text-white mb-0">Employee Search</h1>
                </div>
            </div>
            <div class="breadcrumb_nav clearfix" data-bg-color="#F2F2F2">
                <div class="container">
                    <ul class="ul_li clearfix">
                        <li><a href="home.jsp">Home</a></li>
                        <li>Employee Search</li>
                    </ul>
                </div>
            </div>
        </section>
        <!-- breadcrumb_section - end -->

        <!-- search_section - start -->
        <section class="register_section sec_ptb_100 clearfix">
            <div class="register_card mb-0" data-bg-color="#F2F2F2" data-aos="fade-up" data-aos-delay="100">
                <div class="section_title mb_30 text-center">
                    <h2 class="title_text mb-0" data-aos="fade-up" data-aos-delay="300">
                        <span>Employee Search</span>
                    </h2>
                </div>

                <!-- Search Form -->
                <form action="employeesearch" method="GET" class="search-form" data-aos="fade-up" data-aos-delay="400">
                    <div>
                        <label>Id:</label>
                        <input type="text" name="id" value="${param.id}" />
                    </div>
                    <div>
                        <label>Name:</label>
                        <input type="text" name="name" value="${param.name}" />
                    </div>
                    <div>
                        <label>Gender:</label>
                        <input type="radio" name="gender" ${param.gender ne null && param.gender eq "male" ? "checked" : ""} value="male" /> Male
                        <input type="radio" name="gender" ${param.gender ne null && param.gender eq "female" ? "checked" : ""} value="female" /> Female
                        <input type="radio" name="gender" ${param.gender eq null || param.gender eq "both" ? "checked" : ""} value="both" /> Both
                    </div>
                    <div>
                        <label>Address:</label>
                        <input type="text" name="address" value="${param.address}" />
                    </div>
                    <div>
                        <label>Phone:</label>
                        <input type="text" name="phone" value="${param.phone}" />
                    </div>
                    <div>
                        <label>Role:</label>
                        <select name="roleId">
                            <option value="-1">----------ALL------------</option>
                            <c:forEach items="${requestScope.roles}" var="r">
                                <option ${param.roleId ne null && param.roleId eq r.id ? "selected" : ""} value="${r.getId()}">${r.getName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div style="text-align: center;">
                        <input type="submit" value="Search" />
                    </div>
                </form>

                <!-- Search Results Table -->
                <div class="table-responsive" data-aos="fade-up" data-aos-delay="500">
                    <table>
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Name</th>
                                <th>Phone</th>
                                <th>Gender</th>
                                <th>Address</th>
                                <th>Role Name</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty requestScope.emps}">
                                    <c:forEach items="${requestScope.emps}" var="e">
                                        <tr>
                                            <td>${e.getId()}</td>
                                            <td>${e.getName()}</td>
                                            <td>${e.getPhone()}</td>
                                            <td>${e.gender ? "Male" : "Female"}</td>
                                            <td>${e.getAddress()}</td>
                                            <td>${e.role.name}</td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="6" class="text-center">No employees found.</td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
        <!-- search_section - end -->
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

                    <div class="col-lg-3 col-md-4 col-sm-12 col-xs-12">
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
                        <p class="copyright_text mb-0">Copyright © 2020. BusGo by <a class="author_links text-white" href="home.jsp">BusGo</a></p>
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
</body>
</html>