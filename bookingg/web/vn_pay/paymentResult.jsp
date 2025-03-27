<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>BusGo - Kết quả giao dịch</title>
    <link rel="shortcut icon" href="assets/images/logo/logo_01_1.png">
    
    <!-- framework - css include -->
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
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" 
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" 
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <style>
        .transaction-section {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            padding: 40px 20px;
        }
        .transaction-card {
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            padding: 40px;
            max-width: 600px;
            width: 100%;
            text-align: center;
            transition: transform 0.3s ease;
        }
        .transaction-card:hover {
            transform: translateY(-5px);
        }
        .transaction-card img {
            width: 150px;
            margin-bottom: 30px;
        }
        .transaction-card h3 {
            font-size: 28px;
            margin-bottom: 20px;
            font-weight: 700;
            line-height: 1.2;
        }
        .transaction-card p {
            font-size: 18px;
            color: #555;
            margin: 10px 0;
        }
        .transaction-card strong {
            font-size: 26px;
            font-weight: 700;
        }
        .success { color: #28a745; }
        .error { color: #dc3545; }
        .pending { color: #ffc107; }
        .btn-home {
            margin-top: 30px;
            display: inline-block;
            padding: 12px 30px;
            background-color: #dc3545;
            color: #fff;
            text-decoration: none;
            border-radius: 25px;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }
        .btn-home:hover {
            background-color: #c82333;
            color: #fff;
        }
    </style>
</head>

<body>
    <!-- Header and other sections remain unchanged -->
    <!-- ... (keeping your existing header code) ... -->

    <!-- main body - start -->
    <main>
        <section class="transaction-section">
            <div class="transaction-card" data-aos="fade-up" data-aos-delay="100">
                <div>
                    <img src="/bookingg/assets/images/logo/logo_01_1.png" alt="BusGo Logo">
                </div>

                <!-- Giao dịch thành công -->
                <c:if test="${transResult}">
                    <div>
                        <h3 class="success">
                            Bạn đã giao dịch thành công! 
                            <i class="fas fa-check-circle"></i>
                        </h3>
                        <p>Vui lòng để ý số điện thoại của nhân viên tư vấn:</p>
                        <strong style="color: #dc3545;">0383459560</strong>
                    </div>
                </c:if>

                <!-- Giao dịch thất bại -->
                <c:if test="${transResult == false}">
                    <div>
                        <h3 class="error">
                            Đơn hàng giao dịch thất bại!
                            <i class="fas fa-times-circle"></i>
                        </h3>
                        <p>Cảm ơn quý khách đã dùng dịch vụ của chúng tôi.</p>
                        <p>Liên hệ tổng đài để được tư vấn:</p>
                        <strong style="color: #dc3545;">0383456xxx</strong>
                    </div>
                </c:if>

                <!-- Đang xử lý giao dịch -->
                <c:if test="${transResult == null}">
                    <div>
                        <h3 class="pending">
                            Chúng tôi đã tiếp nhận đơn hàng, xin chờ xử lý!
                            <i class="fas fa-hourglass-half"></i>
                        </h3>
                        <p>Vui lòng để ý số điện thoại của nhân viên tư vấn:</p>
                        <strong style="color: #dc3545;">0383456xxx</strong>
                    </div>
                </c:if>

                <a href="/bookingg/home.jsp" class="btn-home">Quay về trang chủ</a>
            </div>
        </section>
    </main>
    <!-- main body - end -->

    <!-- Footer and scripts remain unchanged -->
    <!-- ... (keeping your existing footer and script code) ... -->

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
    <!-- select options - jquery include -->
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