<%-- 
    Document   : contact
    Created on : Feb 22, 2025, 10:12:29 PM
    Author     : Quang Anh
--%>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Liên hệ</title>
        <style>
            .header {
                background: linear-gradient(90deg, #ff5722, #ff8a50);
                padding: 15px 0;
                text-align: center;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            }

            .header-content h1 {
                color: #fff;
                font-size: 28px;
                font-weight: bold;
                text-transform: uppercase;
                margin: 0;
                letter-spacing: 1px;
            }

            body {
                font-family: Arial, sans-serif;
                background-color: #f9f9f9;
                margin: 0;
                padding: 0;
            }

            .contact-container {
                display: flex;
                justify-content: space-between;
                max-width: 1200px;
                margin: 50px auto;
                padding: 20px;
                background-color: #fff;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                border-radius: 8px;
            }

            .contact-info {
                flex: 1;
                padding: 20px;
            }

            .contact-info h2 {
                color: #ff5722;
                margin-bottom: 20px;
            }

            .contact-info h3 {
                color: #d32f2f;
            }

            .contact-info p {
                line-height: 1.6;
            }

            .contact-form {
                flex: 1;
                padding: 20px;
                background-color: #f5f5f5;
                border-radius: 8px;
            }

            .contact-form h2 {
                color: #ff5722;
                margin-bottom: 20px;
            }

            .contact-form form {
                display: flex;
                flex-direction: column;
            }

            .contact-form input[type="text"],
            .contact-form input[type="email"],
            .contact-form textarea {
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 16px;
            }

            .contact-form textarea {
                resize: vertical;
                min-height: 100px;
            }

            .contact-form button {
                padding: 10px;
                background-color: #ff5722;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 18px;
            }

            .contact-form button:hover {
                background-color: #e64a19;
            }
            .success-message {
                background-color: #4caf50;
                color: white;
                padding: 15px;
                margin-bottom: 20px;
                border-radius: 4px;
                text-align: center;
                font-weight: bold;
            }
            .back-home {
                text-align: center;
                margin: 20px 0;
            }

            .btn-home {
                display: inline-block;
                padding: 10px 20px;
                background: #ff5722;
                color: #fff;
                text-decoration: none;
                font-size: 18px;
                border-radius: 25px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
                transition: background 0.3s ease;
            }

            .btn-home:hover {
                background: #e64a19;
                box-shadow: 0 6px 8px rgba(0, 0, 0, 0.3);
            }

            .footer {
                background-color: #f2f2f2;
                padding: 30px 0;
                color: #333;
                font-size: 14px;
                border-top: 1px solid #e0e0e0;
            }

            .footer-content {
                display: flex;
                justify-content: space-between;
                max-width: 1200px;
                margin: 0 auto;
                padding: 0 20px;
            }

            .footer-section {
                flex: 1;
                padding: 0 15px;
            }

            .footer-section h3 {
                color: #ff5722;
                font-size: 18px;
                margin-bottom: 15px;
                text-transform: uppercase;
            }

            .footer-section ul {
                list-style: none;
                padding: 0;
            }

            .footer-section ul li {
                margin-bottom: 10px;
            }

            .footer-section ul li a {
                color: #333;
                text-decoration: none;
                transition: color 0.3s;
            }

            .footer-section ul li a:hover {
                color: #ff5722;
            }

            .footer-bottom {
                text-align: center;
                padding: 15px 0;
                background-color: #e0e0e0;
                color: #777;
                margin-top: 20px;
                font-size: 13px;
            }

        </style>
    </head>
    <body>
        <c:if test="${not empty successMessage}">
            <div class="success-message">
                ${successMessage}
            </div>
        </c:if>
        <!-- Header Start -->
        <header class="header">
            <div class="header-content">
                <h1>CÔNG TY CỔ PHẦN XE KHÁCH Quang Anh - QA BUS LINE</h1>
            </div>
        </header>
        <!-- Header End -->

        <div class="contact-container">
            <div class="contact-info">
                <h2>LIÊN HỆ VỚI CHÚNG TÔI</h2>
                <h3>CÔNG TY CỔ PHẦN XE KHÁCH Quang Anh - QA BUS LINE</h3>
                <p>Địa chỉ: Thành phố Lào Cai, Tỉnh Lào Cai, Việt Nam</p>
                <p>Điện thoại: 0123456789</p>
                <p>Fax: 02838386853</p>
                <p>Email: hotro@qa.vn</p>
                <p>Hotline: 19001100</p>
            </div>

            <div class="contact-form">
                <h2>Gửi thông tin liên hệ đến chúng tôi</h2>
                <form action="contact" method="post">
                    <input type="text" name="name" placeholder="Họ và tên" required>
                    <input type="email" name="email" placeholder="Email" required>
                    <textarea name="message" placeholder="Nhập ghi chú" required></textarea>
                    <button type="submit">Gửi</button>
                </form>
            </div>
        </div>
        <!-- Back to Home Button Start -->
        <div class="back-home">
            <a href="car.html" class="btn-home">Quay lại Trang Chủ</a>
        </div>
        <!-- Back to Home Button End -->

        <!-- Footer Start -->
        <footer class="footer">
            <div class="footer-content">
                <div class="footer-section about">
                    <h3>Về chúng tôi</h3>
                    <p>Công ty cung cấp dịch vụ đặt vé xe khách chất lượng hàng đầu Việt Nam.</p>
                </div>

                <div class="footer-section contact">
                    <h3>Thông tin liên hệ</h3>
                    <p>Email: support@example.com</p>
                    <p>Điện thoại: 1900 1100</p>
                    <p>Địa chỉ: Thành Phố Lào Cai, Lào Cai, Việt Nam</p>
                </div>
            </div>
            <div class="footer-bottom">
                &copy; 2025 Công ty Quang Anh | All Rights Reserved
            </div>
        </footer>
        <!-- Footer End -->

    </body>
</html>

