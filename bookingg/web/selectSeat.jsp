<%-- 
    Document   : selectSeats
    Created on : Feb 5, 2025, 11:16:59 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="dal.bookTicket.SeatsDAO" %>
<%@ page import="model.bookTicket.Seats" %>
<%@ page import="model.Customer" %>
<%@ page import="java.text.SimpleDateFormat, java.util.Date" %>
<% 
    Customer cus = (Customer) request.getAttribute("customer"); 
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Chọn Ghế - Rotors</title>
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

        <!-- Tailwind -->
        <script src="https://cdn.tailwindcss.com"></script>
        <% 
            String price = (String) session.getAttribute("price");
            if (price == null) {
                 price = "0"; // Giá mặc định nếu không có trong session
            }
        %>
    </head>

    <body class="bg-gray-100">
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
                                </a>
                            </div>
                        </div>

                        <div class="col-lg-6 col-md-12">
                            <nav class="main_menu clearfix">
                                <ul class="ul_li_center clearfix">
                                    <li>
                                        <a href="home.jsp">Trang chủ</a>
                                    </li>
                                    <li  class="active has_child"><a href="booking">Đặt vé</a></li>
                                    <li><a href="cuslistblog">Blog</a></li>
                                    <li>
                                        <a href="contact.jsp">Liên hệ</a>
                                    </li>
                                    <li><a href="employee_login.jsp">Nhân viên</a></li>
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
        <main class="max-w-6xl mx-auto p-4">
            <section class="breadcrumb_section text-center clearfix">
                <div class="page_title_area has_overlay d-flex align-items-center clearfix" data-bg-image="assets/images/breadcrumb/bg_01_1.jpeg">
                    <div class="overlay"></div>
                    <div class="container" data-aos="fade-up" data-aos-delay="100">
                        <h1 class="page_title text-white mb-0">Chọn Ghế</h1>
                    </div>
                </div>

                <div class="breadcrumb_nav clearfix" data-bg-color="#F2F2F2">
                    <div class="container">
                        <ul class="ul_li clearfix">
                            <li><a href="home.jsp">Trang chủ</a></li>
                            <li><a href="booking">Tìm Chuyến</a></li>
                            <li>Chọn Ghế</li>
                        </ul>
                    </div>
                </div>
            </section>                        

            <form id="seatSelectionForm" action="SelectSeatURL" method="get" onsubmit="return validateSeats()">
                <input type="hidden" name="service" value="selectSeat">
                <div class="grid grid-cols-1 lg:grid-cols-3 gap-4 mt-4">
                    <div class="lg:col-span-2 space-y-4">
                        <div class="bg-white p-4 rounded shadow">
                            <h2 class="text-xl font-bold mb-4">Chọn ghế</h2>
                            <div class="grid grid-cols-3 gap-8">
                                <!-- Bên Trái -->
                                <div class="flex-1">
                                    <h3 class="text-xl font-bold">Bên Trái</h3>
                                    <div class="grid grid-cols-2 gap-2">
                                        <%  
                                            List<Seats> seats = (List<Seats>) request.getAttribute("seats");
                                            boolean hasUpperDeck = false;

                                            for (Seats seat : seats) {
                                                if (seat.getLevel() == 2) hasUpperDeck = true;
                                            }

                                            for (Seats seat : seats) {
                                                if (seat.getLevel() == 1) {
                                                    String cssClass = seat.isAvailable() ? "bg-blue-200 hover:bg-blue-300 text-black p-1 rounded cursor-pointer text-center " : "bg-gray-300 text-gray-500 p-1 rounded cursor-not-allowed ";
                                        %>
                                        <button type="button" class="<%= cssClass %>" onclick="toggleSeat(this)" data-price="<%= price %>">
                                            <input type="checkbox" name="seatIds" value="<%= seat.getS_id() %>" hidden>
                                            <%= seat.getS_name() %>
                                        </button>
                                        <%}}%>
                                    </div>
                                </div>

                                <% if (hasUpperDeck) { %>
                                <!-- Bên Phải -->
                                <div class="flex-1">
                                    <h3 class="text-xl font-bold">Bên phải</h3>
                                    <div class="grid grid-cols-2 gap-2">
                                        <% for (Seats seat : seats) {
                                            if (seat.getLevel() == 2) {
                                                String cssClass = seat.isAvailable() ? "bg-blue-200 hover:bg-blue-300 text-black p-1 rounded cursor-pointer text-center " : "bg-gray-300 text-gray-500 p-1 rounded cursor-not-allowed ";
                                        %>
                                        <button type="button" class="<%= cssClass %>" onclick="toggleSeat(this)" data-price="<%= price %>">
                                            <input type="checkbox" name="seatIds" value="<%= seat.getS_id() %>" hidden>
                                            <%= seat.getS_name() %>
                                        </button>
                                        <% } } %>
                                    </div>
                                </div>
                                <% } %>
                                <!-- Cột trạng thái ghế -->
                                <div class="flex flex-col justify-center">
                                    <h1 class="text-xl font-bold mb-2">Trạng thái ghế</h1>
                                    <div class="flex items-center mb-2">
                                        <div class="w-4 h-4 bg-gray-300 rounded-full mr-2"></div>
                                        <span>Đã bán</span>
                                    </div>
                                    <div class="flex items-center mb-2">
                                        <div class="w-4 h-4 bg-blue-200 rounded-full mr-2"></div>
                                        <span>Còn trống</span>
                                    </div>
                                    <div class="flex items-center">
                                        <div class="w-4 h-4 bg-blue-500 rounded-full mr-2"></div>
                                        <span>Đang chọn</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="bg-white p-4 rounded shadow">
                            <div class="grid grid-cols-1 lg:grid-cols-2 gap-4">
                                <div>
                                    <h2 class="text-xl font-bold mb-4">
                                        Thông tin khách hàng
                                    </h2>
                                    <div class="mb-4">
                                        <label class="block font-bold mb-2" for="name">
                                            Họ và tên <span class="text-red-500">*</span>
                                        </label>
                                        <input class="w-full p-2 border rounded bg-gray-100" id="name" type="text"
                                               value="<%= cus.getFullname() %>" readonly />
                                    </div>
                                    <div class="mb-4">
                                        <label class="block font-bold mb-2" for="phone">
                                            Số điện thoại <span class="text-red-500">*</span>
                                        </label>
                                        <input class="w-full p-2 border rounded bg-gray-100" id="phone" type="text"
                                               value="<%= cus.getPhone() %>" readonly />
                                    </div>
                                    <div class="mb-4">
                                        <label class="block font-bold mb-2" for="email">
                                            Email <span class="text-red-500">*</span>
                                        </label>
                                        <input class="w-full p-2 border rounded bg-gray-100" id="email" type="email"
                                               value="<%= cus.getEmail() %>" readonly />
                                    </div>
                                </div>
                                <div class="text-red-500">
                                    <h3 class="font-bold">
                                        ĐIỀU KHOẢN & LƯU Ý
                                    </h3>
                                    <p class="text-black">
                                        <span class="text-red-500">(*)</span> Quý khách vui lòng có mặt tại bến xuất phát của xe
                                        trước ít nhất 15 phút giờ khởi hành, mang theo thông báo đã thanh toán vé thành công có
                                        chứa mã vé được gửi từ hệ thống BusGo. Vui lòng liên hệ Trung tâm tổng đài 1900
                                        6969 để được hỗ trợ.
                                    </p>
                                    <p class="text-black">
                                        <span class="text-red-500">(*)</span> Nếu quý khách có nhu cầu trung chuyển, vui lòng
                                        liên hệ Tổng đài trung chuyển 1900 6969 trước khi đặt vé. Chúng tôi không đón/trung
                                        chuyển tại những điểm xe trung chuyển không thể tới được.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="lg:col-span-1 space-y-4">
                        <div class="lg:col-span-1 space-y-4">
                            <div class="bg-white p-4 rounded shadow">
                                <h2 class="text-xl font-bold mb-4">
                                    Thông tin lượt đi
                                </h2>
                                <p>
                                    Tuyến xe: <%= session.getAttribute("from") %> - <%= session.getAttribute("to") %>
                                </p>
                                <p>
                                    Ngày khởi khành: <%= session.getAttribute("tripDate") %>
                                </p>
                                <p>
                                    Thời gian xuất bến: <%= session.getAttribute("departureTime") %>
                                </p>
                                <p>
                                    Thời gian đến dự kiến: <%= session.getAttribute("arrivalTime") %>
                                </p>
                                <p>
                                    Giá vé lượt đi: <%= session.getAttribute("price") %>
                                </p>
                            </div>
                            <div class="bg-white p-4 rounded shadow">
                                <h2 class="text-xl font-bold mb-4">
                                    Chi tiết giá
                                </h2>
                                <p>
                                    Số vé đặt: <span id="seatCount">0</span> vé
                                </p>
                                <p>
                                    Tổng tiền: <span id="totalPrice">0</span> VND
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Xác nhận -->
                <input type="submit" value="Xác nhận đặt vé" class="bg-green-500 hover:bg-green-600 text-white p-3 rounded mt-4 custom_btn bg_default_red btn_width text-uppercase" data-aos="fade-up" data-aos-delay="700">
            </form>
        </main>
        <!-- main body - end -->

        <!-- footer_section - start -->
        <footer class="footer_section clearfix">
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
        <!-- footer_section - end -->

        <!-- Scripts -->
        <script>
            let seatCount = 0;
            let pricePerSeat = <%= (session.getAttribute("price") != null) ? session.getAttribute("price") : "0" %>; // Đảm bảo không null

            function toggleSeat(element) {
                let seatInput = element.querySelector("input");

                if (element.classList.contains('bg-blue-200')) {
                    element.classList.remove('bg-blue-200');
                    element.classList.add('bg-blue-500', 'text-white');
                    seatInput.checked = true;
                    seatCount++;
                } else if (element.classList.contains('bg-blue-500')) {
                    element.classList.remove('bg-blue-500', 'text-white');
                    element.classList.add('bg-blue-200');
                    seatInput.checked = false;
                    seatCount--;
                }

                updateSeatInfo();
            }

            function updateSeatInfo() {
                let seatCountElement = document.getElementById("seatCount");
                let totalPriceElement = document.getElementById("totalPrice");

                if (seatCountElement && totalPriceElement) {
                    seatCountElement.innerText = seatCount;
                    totalPriceElement.innerText = (seatCount * pricePerSeat).toLocaleString();
                } else {
                    console.error("Không tìm thấy phần tử seatCount hoặc totalPrice");
                }
            }

            function validateSeats() {
                if (seatCount === 0) {
                    alert("Vui lòng chọn ít nhất một ghế trước khi đặt vé.");
                    return false; // Ngăn gửi form
                }
                return true; // Cho phép gửi form nếu có ghế được chọn
            }
        </script>

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