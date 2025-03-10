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
<html>
    <head>
        <meta charset="utf-8" />
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />
        <title>Bus Ticket Booking</title>
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
        <main class="max-w-6xl mx-auto p-4">
            <div class="bg-green-500 text-white text-center py-4 rounded">
                <img alt="FUTA Bus Lines logo" class="mx-auto mb-2" height="50"
                     src="https://storage.googleapis.com/a1aa/image/ngQyCrFJhxt_MJUEIuluASVCn5PNgYLQwGUjmABjfyU.jpg"
                     width="100" />
                <a href="booking" style="text-decoration: underline; display: block; text-align: left;"> &laquo; Quay lại</a>

            </div>                        
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
                                        ĐIỀU KHOẢN &amp; LƯU Ý
                                    </h3>
                                    <p class="text-black">
                                        <span class="text-red-500">(*)</span> Quý khách vui lòng có mặt tại bến xuất phát của xe
                                        trước ít nhất 30 phút giờ khởi hành, mang theo thông báo đã thanh toán vé thành công có
                                        chứa mã vé được gửi từ hệ thống FUTA BUS LINES. Vui lòng liên hệ Trung tâm tổng đài 1900
                                        6067 để được hỗ trợ.
                                    </p>
                                    <p class="text-black">
                                        <span class="text-red-500">(*)</span> Nếu quý khách có nhu cầu trung chuyển, vui lòng
                                        liên hệ Tổng đài trung chuyển 1900 6918 trước khi đặt vé. Chúng tôi không đón/trung
                                        chuyển tại những điểm xe trung chuyển không thể tới được.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="lg:col-span-1 space-y-4">
                        <div class="bg-white p-4 rounded shadow">
                            <h2 class="text-xl font-bold mb-4">
                                Thông tin lượt đi
                            </h2>
                            <p>
                                Tuyến xe: <%= session.getAttribute("from") %> - <%= session.getAttribute("to") %>
                            </p>
                            <p>
                                Thời gian xuất bến: <%= session.getAttribute("departureTime") %>
                            </p>
                            <p>
                                Số lượng ghế: <span id="seatCount">0</span> Ghế
                            </p>
                            <p>
                                Tổng tiền lượt đi: <span id="totalPrice">0</span> VND
                            </p>
                        </div>
                        <div class="bg-white p-4 rounded shadow">
                            <h2 class="text-xl font-bold mb-4">
                                Chi tiết giá
                            </h2>
                            <p>
                                Giá vé lượt đi: 0đ
                            </p>
                            <p>
                                Phí thanh toán: 0đ
                            </p>
                            <p>
                                Tổng tiền: 0đ
                            </p>
                        </div>
                    </div>
                </div>
                <!-- Xác nhận -->
                <input type="submit" value="Xác nhận đặt vé" class="bg-green-500 hover:bg-green-600 text-white p-3 rounded mt-4">
            </form>
        </main>
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
        <script src="assets/js/jquery-3.6.0.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/aos.js"></script>
        <script src="assets/js/slick.min.js"></script>
        <script src="assets/js/magnific-popup.min.js"></script>
        <script src="assets/js/jquery.nice-select.min.js"></script>
        <script src="assets/js/jquery-ui.js"></script>
        <script src="assets/js/main.js"></script>

    </body>
</html>


