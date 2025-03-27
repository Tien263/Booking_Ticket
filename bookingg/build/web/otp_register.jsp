<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Xác minh OTP</title>
</head>
<body>
    <!-- Thông báo thành công -->
    <c:if test="${not empty success}">
        <div>
            <strong>✔</strong> ${success}
        </div>
    </c:if>

    <!-- Thông báo lỗi -->
    <c:if test="${not empty error}">
        <div>
            <strong>✘</strong> ${error}
        </div>
    </c:if>

    <h2>Xác minh mã OTP</h2>
    <p>Chúng tôi đã gửi mã gồm 6 chữ số đến email: ${email}</p>

    <form action="registverification" method="POST" id="verifyOTPForm">
        <input type="hidden" name="action" value="verifyRegisterOTP"/>
        <div>
            <label for="otp">Mã OTP</label>
            <input type="number" name="otp" id="otp" required placeholder="Nhập mã OTP">
            <c:if test="${not empty errorOTP}">
                <div>${errorOTP}</div>
            </c:if>
        </div>
        <div>
            <input type="submit" value="Xác minh">
        </div>
    </form>

    <form action="register" method="POST" id="resendOTPForm">
        <input type="hidden" name="action" value="resendRegisterOTP"/>
        <div>
            <p>Gửi lại sau <span id="countdown">2:00</span>:</p>
            <input type="submit" id="resendButton" value="Gửi lại" disabled/>
        </div>
    </form>

    <script>
        function startCountdown(duration) {
            let timer = duration, minutes, seconds;
            let countdownElement = document.getElementById('countdown');
            let resendButton = document.getElementById('resendButton');
            let interval = setInterval(function () {
                minutes = Math.floor(timer / 60);
                seconds = timer % 60;
                seconds = seconds < 10 ? '0' + seconds : seconds;
                countdownElement.textContent = minutes + ":" + seconds;
                if (--timer < 0) {
                    clearInterval(interval);
                    resendButton.disabled = false;
                    countdownElement.textContent = "0:00";
                }
            }, 1000);
        }
        startCountdown(120); // 2 phút
    </script>
</body>
</html>
