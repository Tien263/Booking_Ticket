<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Nhân Viên - BusGo</title>
    <link rel="shortcut icon" href="assets/images/logo/logo_01_1.png">

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            overflow: hidden; /* Ngăn cuộn trang */
            position: relative; /* Để video làm nền */
        }
        /* Video nền */
        .video-background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1; /* Đặt video phía sau nội dung */
        }
        .video-background video {
            width: 100%;
            height: 100%;
            object-fit: cover; /* Đảm bảo video lấp đầy màn hình */
        }
        /* Lớp phủ tối */
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5); /* Tăng độ tối để chữ trắng dễ nhìn hơn */
            z-index: -1; /* Đặt phía sau nội dung nhưng trên video */
        }
        /* Lớp lưới đen */
        .grid-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAAXNSR0IArs4c6QAAAB5JREFUGFdjZGBg+M/AwMDwP2BgYGBgYGBgYGBgYABlXgL1vX0q0gAAAABJRU5ErkJggg==') repeat; /* Lưới đen đơn giản */
            opacity: 0.3; /* Độ mờ của lưới */
            z-index: -1; /* Đặt phía sau nội dung nhưng trên video */
        }
        /* Container chính */
        .main-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            padding: 20px;
        }
        /* Container nội dung (logo + thông tin + form) */
        .content-container {
            display: flex;
            width: 1200px; /* Chiều rộng tổng */
            height: 600px; /* Chiều cao */
            background: rgba(0, 0, 0, 0.7); /* Nền đen mờ để chữ trắng nổi bật */
            border-radius: 15px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(5px);
            overflow: hidden;
        }
        /* Phần logo và thông tin công ty */
        .company-info {
            flex: 1; /* Chiếm 50% chiều rộng */
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background: rgba(0, 0, 0, 0.8); /* Nền đen mờ hơn */
        }
        .company-info img {
            width: 200px; /* Tăng kích thước logo */
            margin-bottom: 30px; /* Tăng khoảng cách dưới logo */
        }
        .company-info p {
            margin: 8px 0; /* Tăng khoảng cách giữa các dòng */
            color: #ffffff; /* Chữ trắng */
            font-size: 16px; /* Tăng kích thước chữ thông tin */
            text-align: center;
            line-height: 1.6; /* Tăng khoảng cách dòng */
        }
        .company-info p:first-child {
            font-size: 18px; /* Tăng kích thước chữ tiêu đề công ty */
            font-weight: bold;
        }
        .company-info p strong {
            color: #1e90ff; /* Màu xanh đậm cho các tiêu đề */
        }
        /* Phần đăng nhập */
        .login-section {
            flex: 1; /* Chiếm 50% chiều rộng */
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        h2 {
            text-align: center;
            color: #ffffff; /* Chữ trắng */
            margin-bottom: 25px;
            font-size: 28px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
            color: #ffffff; /* Chữ trắng */
            font-size: 16px;
        }
        input[type="text"], input[type="password"], select {
            width: 100%;
            padding: 12px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
            background: rgba(255, 255, 255, 0.9); /* Nền input sáng để dễ nhập */
            color: #333; /* Chữ trong input màu đen để dễ đọc */
        }
        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #1e90ff;
            outline: none;
        }
        button {
            width: 100%;
            padding: 14px;
            background: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            transition: background 0.3s ease;
        }
        button:hover {
            background: #218838;
        }
        .error-message {
            color: #ff3333; /* Giữ màu đỏ cho thông báo lỗi */
            font-weight: bold;
            text-align: center;
            margin-bottom: 15px;
            font-size: 14px;
        }
        .forgot-password {
            text-align: center;
            margin-top: 20px;
        }
        .forgot-password a {
            color: #1e90ff; /* Màu xanh đậm cho link */
            text-decoration: none;
            font-size: 14px;
        }
        .forgot-password a:hover {
            text-decoration: underline;
        }
        .form-group label input[type="checkbox"] {
            margin-right: 5px;
        }
    </style>
</head>
<body>

<!-- Video nền -->
<div class="video-background">
    <video autoplay muted loop>
        <source src="assets/video/video_loginn.mp4" type="video/mp4">
        Your browser does not support the video tag.
    </video>
</div>

<!-- Lớp phủ tối -->
<div class="overlay"></div>

<!-- Lớp lưới đen -->
<div class="grid-overlay"></div>

<!-- Container chính -->
<div class="main-container">
    <!-- Container nội dung -->
    <div class="content-container">
        <!-- Phần logo và thông tin công ty -->
        <div class="company-info">
            <img src="assets/images/logo/logo_01_1.png" alt="BusGo Logo">
            <p><strong>CÔNG TY CỔ PHẦN XE KHÁCH QUANG ANH</strong></p>
            <p><strong>Mã số thuế:</strong> 0101243150-104</p>
            <p><strong>Địa chỉ:</strong> Khu công nghệ cao Hòa Lạc, Thạch Thất, Hà Nội</p>
            <p><strong>Điện thoại:</strong> 0398 996 178</p>
            <p><strong>Số tài khoản:</strong> 7111 1810 204</p>
        </div>

        <!-- Phần đăng nhập -->
        <div class="login-section">
            <h2>Employee Login</h2>

            <c:if test="${not empty err}">
                <p class="error-message">${err}</p>
            </c:if>

            <form action="employee_login" method="post">
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" value="${cookie.cUsername.value}" required>
                </div>

                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required>
                </div>

                <div class="form-group">
                    <label>
                        <input type="checkbox" name="rememberMe" value="ON"> Remember me
                    </label>
                </div>

                <button type="submit">Login</button>
            </form>

            <p class="forgot-password">
                <a href="enter_username.jsp">Do you want to change password?</a>
            </p>
        </div>
    </div>
</div>

</body>
</html>