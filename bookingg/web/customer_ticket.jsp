<%-- 
    Document   : customer_ticket
    Created on : Mar 23, 2025, 6:46:46 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, model.ticket.BookedTicket" %>
<%@ page import="dal.feedback.FeedbackDAO, model.feedback.Feedback" %>
<%@ page import="java.time.LocalDateTime, java.time.temporal.ChronoUnit" %>
<%@ page import="java.time.LocalDate" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    ArrayList<BookedTicket> tickets = (ArrayList<BookedTicket>) request.getAttribute("tickets"); 
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Kết quả tìm kiếm chuyến xe - Rotors</title>
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
        <style>
            .pagination {
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 10px;
                margin: 20px 0;
                font-family: Arial, sans-serif;
            }

            .page-link {
                text-decoration: none;
                padding: 8px 12px;
                border: 1px solid #ddd;
                border-radius: 5px;
                color: #333;
                background-color: #fff;
                transition: all 0.3s ease;
            }

            .page-link:hover {
                background-color: #f0f0f0;
                border-color: #aaa;
            }

            .page-link.active {
                background-color: #007bff;
                color: #fff;
                border-color: #007bff;
                pointer-events: none;
            }

            .prev, .next {
                font-weight: bold;
            }

            .prev::before {
                content: "« ";
            }

            .next::after {
                content: " »";
            }
        </style> 
        <style>
            /* Form đánh giá */
            .feedback-form {
                display: none;
                background: #ffffff;
                border-radius: 12px;
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
                padding: 20px;
                margin-top: 15px;
                border: 1px solid #e9ecef;
                transition: all 0.3s ease;
            }

            .feedback-form.active {
                display: block;
            }

            .feedback-form h3 {
                color: #2c3e50;
                font-weight: 700;
                margin-bottom: 20px;
                text-align: center;
                font-size: 1.5rem;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 8px;
            }

            .feedback-form .form-group {
                margin-bottom: 20px;
            }

            .feedback-form .rating-group {
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .feedback-form .rating-group label {
                color: #34495e;
                font-weight: 600;
                margin: 0;
                white-space: nowrap;
                display: flex;
                align-items: center;
                gap: 5px;
            }

            .feedback-form .rating-group select {
                flex: 1;
                border: 2px solid #dfe6e9;
                border-radius: 8px;
                padding: 10px;
                font-size: 1rem;
                transition: all 0.3s ease;
                background: #f8f9fa;
            }

            .feedback-form select:focus {
                border-color: #3498db;
                box-shadow: 0 0 8px rgba(52, 152, 219, 0.2);
                outline: none;
            }

            .feedback-form textarea {
                border: 2px solid #dfe6e9;
                border-radius: 8px;
                padding: 12px;
                width: 100%;
                font-size: 1rem;
                min-height: 100px;
                resize: vertical;
                transition: all 0.3s ease;
                background: #f8f9fa;
            }

            .feedback-form textarea:focus {
                border-color: #3498db;
                box-shadow: 0 0 8px rgba(52, 152, 219, 0.2);
                outline: none;
            }

            .feedback-form .readonly {
                background: #e9ecef;
                border-color: #ced4da;
                color: #6c757d;
            }

            .feedback-form .btn-submit {
                background: linear-gradient(90deg, #3498db, #2980b9);
                border: none;
                padding: 12px 20px;
                border-radius: 8px;
                font-weight: 600;
                color: #fff;
                width: 100%;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 8px;
                transition: all 0.3s ease;
            }

            .feedback-form .btn-submit:hover {
                background: linear-gradient(90deg, #2980b9, #1f618d);
                transform: translateY(-2px);
                box-shadow: 0 4px 10px rgba(52, 152, 219, 0.3);
            }

            /* Nút Đóng màu đỏ */
            .feedback-form .btn-close {
                background: linear-gradient(90deg, #e74c3c, #c0392b); /* Gradient đỏ */
                border: none;
                padding: 12px 20px;
                border-radius: 8px;
                font-weight: 600;
                color: #fff;
                width: 100%;
                margin-top: 10px;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 8px;
                transition: all 0.3s ease;
            }

            .feedback-form .btn-close:hover {
                background: linear-gradient(90deg, #c0392b, #a93226); /* Đỏ đậm hơn khi hover */
                transform: translateY(-2px);
                box-shadow: 0 4px 10px rgba(231, 76, 60, 0.3);
            }

            /* Thông báo màu xanh lá cây */
            .feedback-form .disabled-message {
                color: #27ae60; /* Xanh lá cây */
                font-weight: 600;
                text-align: center;
                margin: 15px 0;
                padding: 10px;
                background: #eafaf1; /* Nền xanh nhạt */
                border-radius: 8px;
                border: 1px dashed #27ae60; /* Viền xanh lá cây */
            }

            .feedback-form.active {
                animation: slideIn 0.3s ease-out;
            }

            @keyframes slideIn {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
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
                                    <li><a href="booking">Đặt vé</a></li>
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
        <main>
            <section class="breadcrumb_section text-center clearfix">
                <div class="page_title_area has_overlay d-flex align-items-center clearfix" data-bg-image="assets/images/breadcrumb/bg_01_1.jpeg">
                    <div class="overlay"></div>
                    <div class="container" data-aos="fade-up" data-aos-delay="100">
                        <h1 class="page_title text-white mb-0">Lịch sử vé</h1>
                    </div>
                </div>

                <div class="breadcrumb_nav clearfix" data-bg-color="#F2F2F2">
                    <div class="container">
                        <ul class="ul_li clearfix">
                            <li><a href="home.jsp">Trang chủ</a></li>
                            <li>Lịch sử vé</li>
                        </ul>
                    </div>
                </div>
            </section>
            <!-- Hiển thị thông báo lỗi nếu có -->
            <c:if test="${not empty sessionScope.error}">
                <div class="alert alert-danger">
                    ${sessionScope.error}
                </div>
                <c:remove var="error" scope="session" />
            </c:if>

            <!-- Chỉ hiển thị thông báo thành công nếu không có lỗi -->
            <c:if test="${empty sessionScope.error and not empty sessionScope.message}">
                <div class="alert alert-success">
                    ${sessionScope.message}
                </div>
                <c:remove var="message" scope="session" />
            </c:if>
            <% 
            FeedbackDAO feedbackDAO = new FeedbackDAO();
            for(BookedTicket ticket : tickets) { 
                Feedback feedback = feedbackDAO.getFeedbackByBookTicketID(ticket.getBtId());
            %>
            <!-- Form lọc -->
            <div class="bg-white shadow-md rounded-lg p-4 mb-4 max-w-3xl mx-auto">
                <div class="flex justify-between items-center">
                    <div class="flex flex-col">
                        <h3 class="text-lg font-bold">
                            Mã vé: <%= ticket.getBtId() %> 
                        </h3>
                        <p class="text-gray-600">
                            Ngày mua: <%= ticket.getBtBookingDate() %>
                        </p>
                        <p class="text-gray-600">
                            Giá: <%= ticket.getBtTotalAmount() %>
                        </p>
                    </div>
                    <div class="flex flex-col">
                        <p>&nbsp;</p>
                        <p class="text-gray-600">
                            Số vé: <%= ticket.getBtTicketNumber() %>
                        </p>
                        <p class="text-gray-600">
                            Trạng thái: <%= ticket.getBtStatus() %>
                        </p>
                    </div>
                    <div class="flex space-x-2">
                        <a href="CustomerTicketURL?service=detail&bt_id=<%= ticket.getBtId() %>" 
                           class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">
                            Chi tiết vé
                        </a>
                        <%
                        LocalDate bookingLocalDate = ticket.getBtBookingDate();
                        LocalDateTime bookingDate = bookingLocalDate.atStartOfDay(); // Thêm 00:00:00
                        LocalDateTime currentDate = LocalDateTime.now();
                        long daysDifference = ChronoUnit.DAYS.between(bookingDate, currentDate);
                        if (!"confirmed".equals(ticket.getBtStatus()) 
                        && !"cancelled".equals(ticket.getBtStatus()) 
                        && daysDifference <= 1) { 
                        %>
                        <a href="CustomerTicketURL?service=cancel&bt_id=<%= ticket.getBtId() %>" 
                           class="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600">
                            Hủy vé
                        </a>
                        <% } %>     
                        <% if ("confirmed".equals(ticket.getBtStatus())) { %>
                        <a href="javascript:void(0);" 
                           onclick="toggleFeedbackForm('feedback_<%= ticket.getBtId() %>')" 
                           class="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600">
                            Đánh giá
                        </a>
                        <% } %>
                    </div>
                </div>
                <% if ("confirmed".equals(ticket.getBtStatus())) { %>
                <div id="feedback_<%= ticket.getBtId() %>" class="feedback-form">
                    <h3><i class="fas fa-star"></i> Đánh Giá Chuyến Đi</h3>
                    <form action="FeedbackURL" method="POST">
                        <input type="hidden" name="service" value="addFeedback">
                        <input type="hidden" name="bookTicketId" value="<%= ticket.getBtId() %>">

                        <!-- Phần đánh giá ngang hàng -->
                        <div class="form-group rating-group">
                            <label><i class="fas fa-star-half-alt"></i> Chọn Đánh Giá:</label>
                            <select name="rating" class="form-control" <%= feedback != null ? "disabled" : "" %> required>
                                <option value="" disabled <%= feedback == null ? "selected" : "" %>>Chọn số sao</option>
                                <option value="1" <%= feedback != null && feedback.getRating() == 1 ? "selected" : "" %>> ★ - Tệ</option>
                                <option value="2" <%= feedback != null && feedback.getRating() == 2 ? "selected" : "" %>> ★ ★ - Hơi Tệ</option>
                                <option value="3" <%= feedback != null && feedback.getRating() == 3 ? "selected" : "" %>> ★ ★ ★ - Tốt</option>
                                <option value="4" <%= feedback != null && feedback.getRating() == 4 ? "selected" : "" %>> ★ ★ ★ ★ - Rất Tốt</option>
                                <option value="5" <%= feedback != null && feedback.getRating() == 5 ? "selected" : "" %>> ★ ★ ★ ★ ★ - Tuyệt vời</option>
                            </select>
                        </div>

                        <!-- Phần bình luận bên dưới -->
                        <div class="form-group">
                            <label><i class="fas fa-comment"></i> Bình luận:</label>
                            <textarea name="comment" class="form-control <%= feedback != null ? "readonly" : "" %>" <%= feedback != null ? "readonly" : "" %> required placeholder="Chia sẻ cảm nhận của bạn..."><%= feedback != null ? feedback.getComment() : "" %></textarea>
                        </div>

                        <% if (feedback == null) { %>
                        <button type="submit" class="btn btn-submit"><i class="fas fa-paper-plane"></i> Gửi Đánh Giá</button>
                        <% } else { %>
                        <div class="disabled-message"><i class="fas fa-check-circle"></i> <strong>Bạn đã đánh giá rồi!</strong></div>
                        <% } %>
                        <button type="button" onclick="toggleFeedbackForm('feedback_<%= ticket.getBtId() %>')" class="btn btn-close"><i class="fas fa-times"></i> Đóng</button>
                    </form>
                </div>
                <% } %>
            </div>  
            <% } %>
            <div class="pagination">
                <c:if test="${currentPage > 1}">
                    <a href="CustomerTicketURL?service=listOfAll&page=${currentPage - 1}" class="page-link prev">Trang trước</a>
                </c:if>

                <c:forEach begin="1" end="${endPage}" var="i">
                    <a href="CustomerTicketURL?service=listOfAll&page=${i}" class="${i == currentPage ? 'page-link active' : 'page-link'}">${i}</a>
                </c:forEach>

                <c:if test="${currentPage < endPage}">
                    <a href="CustomerTicketURL?service=listOfAll&page=${currentPage + 1}" class="page-link next">Trang tiếp</a>
                </c:if>
            </div>
        </main>
        <!-- main body - end -->

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

        <!-- Modal Đánh giá -->
        <div class="modal fade" id="feedbackModal" tabindex="-1" role="dialog" aria-labelledby="feedbackModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="feedbackModalLabel">Đánh giá vé</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body" id="feedbackModalBody">
                        <!-- Nội dung của feedback.jsp sẽ được tải vào đây -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>

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
        <script src="https://cdn.tailwindcss.com">
        </script>
        <script>
            function toggleFeedbackForm(formId) {
                var form = document.getElementById(formId);
                if (form) {
                    form.classList.toggle("active");
                    console.log("Toggled feedback form: " + formId); // Debug
                } else {
                    console.error("Form not found: " + formId); // Debug
                }
            }
        </script>
    </body>
</html>
