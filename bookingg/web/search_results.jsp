<%-- 
    Document   : bookingg
    Created on : Feb 12, 2025, 10:25:36 PM
    Author     : Nguyen Minh Duc
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.bookTicket.BusTrip" %>

<%
    String from = (String) request.getAttribute("from");
    String to = (String) request.getAttribute("to");
    String hour = (String) request.getAttribute("hour");
    String minute = (String) request.getAttribute("minute");
    String time = (String) request.getAttribute("time");
    String travelDate = request.getParameter("travelDate");

    // Nếu `travelDate` chưa có giá trị, lấy ngày hiện tại
    if (travelDate == null || travelDate.isEmpty()) {
        java.util.Date today = new java.util.Date();
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
        travelDate = sdf.format(today); // Ngày hiện tại theo định dạng yyyy-MM-dd
    }

    String[] provinces = (String[]) request.getAttribute("provinces");
    List<BusTrip> trips = (List<BusTrip>) request.getAttribute("trips");
    String error = (String) request.getAttribute("error");
    String message = (String) request.getAttribute("message");
    String c_id = (String) request.getAttribute("c_id");
 // Xử lý ngày mặc định
    if (time == null) {
        java.util.Date today = new java.util.Date();
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
        time = sdf.format(today); // Ngày hiện tại theo định dạng yyyy-MM-dd
    }

    if (hour == null) {
        hour = "5"; // Mặc định 5h
    }

    if (minute == null) {
        minute = "0"; // Mặc định 0 phút
    }
    
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Kết quả tìm kiếm chuyến xe</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">

        <title>Our Cars - Rotors - Car Rental HTML5 Template</title>
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
        <section class="breadcrumb_section text-center clearfix">
            <div class="page_title_area has_overlay d-flex align-items-center clearfix" data-bg-image="assets/images/breadcrumb/bg_01_1.jpeg">
                <div class="overlay"></div>
                <div class="container" data-aos="fade-up" data-aos-delay="100">
                    <h1 class="page_title text-white mb-0">Tìm Chuyến</h1>
                </div>
            </div>

            <div class="breadcrumb_nav clearfix" data-bg-color="#F2F2F2">
                <div class="container">
                    <ul class="ul_li clearfix">
                        <li><a href="index_1.html">Trang chủ</a></li>
                        <li>Tìm Chuyến</li>
                    </ul>
                </div>
            </div>
        </section>


        <!-- Phân cách -->

        <div class="register_card mb_60" data-bg-color="##F2F2F2" data-aos="fade-up" data-aos-delay="100" style="max-width: 900px; margin: auto; margin-top: 30px;">
            <form method="GET" action="booking">
                <div class="row">
                    <!-- Lựa chọn Một chiều / Khứ hồi -->
                    <div class="col-lg-12 text-left mb-3">
                        <label>
                            <input type="radio" name="trip_type" value="oneway" checked> Một chiều
                        </label><!-- Chức năng chính -->

                        <label class="ml-4">
                            <input type="radio" name="trip_type" value="roundtrip"> Khứ hồi
                        </label><!-- Chức năng chính -->

                        <a href="#" >Ticket booking guide</a>
                    </div>




                    <!--Chức năng chính 1: Điểm đi -->
                    <div class="col-lg-6 col-md-6 col-sm-12"  data-aos-delay="500">
                        <div class="form_item">
                            <h4 class="input_title">Điểm đi</h4>
                            <select name="from" class="form-control" required>
                                <% for (String province : provinces) { 
                                    boolean isSelected = (from != null && province.equals(from));
                                %>
                                <option value="<%= province %>" <%= isSelected ? "selected" : "" %>>
                                    <%= province %>
                                </option>
                                <% } %>
                            </select>
                        </div>
                    </div>




                    <!--Chức năng chính 1: Điểm đến -->
                    <div class="col-lg-6 col-md-6 col-sm-12"  data-aos-delay="500">
                        <div class="form_item">
                            <h4 class="input_title">Điểm đến</h4>
                            <select name="to" class="form-control" required>
                                <% for (String province : provinces) { 
                                    boolean isSelected = (to != null && province.equals(to));
                                %>
                                <option value="<%= province %>" <%= isSelected ? "selected" : "" %>>
                                    <%= province %>
                                </option>
                                <% } %>
                            </select>
                        </div>
                    </div>


                    <!-- Chức năng chính 1: Thời gian -->
                    <div class="col-lg-6 col-md-6 col-sm-12" data-aos="fade-up" data-aos-delay="500">
                        <div class="form_item">
                            <h4 class="input_title">Thời gian</h4>
                            <div class="d-flex align-items-center gap-2">
                                <label for="hour">Giờ:</label>
                                <input type="number" id="hour" name="hour" class="form-control w-25" min="0" max="23" value="<%= (hour != null) ? hour : 0 %>" required>
                                <label for="minute">Phút:</label>
                                <input type="number" id="minute" name="minute" class="form-control w-25" min="0" max="59" value="<%= (minute != null) ? minute : 0 %>" required>
                            </div>
                        </div>
                    </div>

                    <!-- Chức năng chính 2: Ngày đi -->
                    <div class="col-lg-6 col-md-6 col-sm-12" data-aos="fade-up" data-aos-delay="500">
                        <div class="form_item">
                            <h4 class="input_title">Ngày đi</h4>
                            <input type="date" name="travelDate" class="form-control" value="<%= (travelDate != null) ? travelDate : "" %>" required>
                        </div>
                    </div>




                    <!-- Nút tìm chuyến xe -->
                    <div class="text-center mt-4">
                        <button type="submit" class="custom_btn bg_default_red btn_width text-uppercase" data-aos="fade-up" data-aos-delay="700">
                            Tìm chuyến
                        </button>
                    </div>
            </form>
            <!-- Hiển thị thông báo lỗi và tin nhắn -->
            <div class="col-lg-12" data-aos="fade-up" data-aos-delay="500">
                <div class="form_item">
                    <% if (error != null) { %>
                    <p class="float-left text-danger"style="font-size: 18px; font-weight: bold;"><%= error %></p>
                    <% } %>

                    <% if (message != null) { %>
                    <p class="float-left text-danger"style="font-size: 18px; font-weight: bold;"><%= message %></p>
                    <% } %>
                </div>
            </div>
        </div>

                
        <div>
            <% if (trips != null && !trips.isEmpty()) { %>
            <h2>Kết quả tìm kiếm</h2>
            <div class="row">
                <% for (BusTrip trip : trips) { %>
                <div class="col-lg-6 col-md-6">
                    <div class="feature_vehicle_item" data-aos="fade-up" data-aos-delay="100">
                        <h3 class="item_title mb-0">
                            <a href="#!">
                                Tuyến <%= trip.getBrFrom() %> - <%= trip.getBrTo() %>
                            </a>
                        </h3>
                        <ul class="info_list ul_li_center clearfix">
                            <li>Thời Gian: <%= trip.getBt1DepartureTime() %> - <%= trip.getBt1ArrivalTime() %></li>
                            <li>Năm-Tháng-Ngày: <%= trip.getDate() %></li>
                            <li>Giá vé: <%= trip.gettPrice() %> VNĐ</li>
                            <li>Mô tả: <%= trip.getBrDescription() %></li>
                            <li>Khoảng cách: <%= trip.getBrDistance() %> km</li>
                            <li>Biển hiệu: <%= trip.getV_id() %></li>
                        </ul>
                        <form action="CheckCId" method="GET">
                            <input type="hidden" name="c_id" value="<%= c_id %>">
                            <input type="hidden" name="brId" value="<%= trip.getBrId() %>">
                            <input type="hidden" name="from" value="<%= trip.getBrFrom() %>">
                            <input type="hidden" name="to" value="<%= trip.getBrTo() %>">
                            <input type="hidden" name="departureTime" value="<%= trip.getBt1DepartureTime() %>">
                            <input type="hidden" name="arrivalTime" value="<%= trip.getBt1ArrivalTime() %>">
                            <input type="hidden" name="price" value="<%= trip.gettPrice() %>">
                            <input type="hidden" name="description" value="<%= trip.getBrDescription() %>">
                            <input type="hidden" name="distance" value="<%= trip.getBrDistance() %>">
                            <input type="hidden" name="vId" value="<%= trip.getV_id() %>">
                            <input type="hidden" name="bt1Id" value="<%= trip.getBt1_id() %>">
                            <input type="hidden" name="bt1_date" value="<%= trip.getDate() %>">
                            <button type="submit" class="btn btn-primary">Chọn chuyến</button>
                        </form>
                    </div>
                </div>
                <% } %>
            </div>
            <% } %>

        </div> 












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
