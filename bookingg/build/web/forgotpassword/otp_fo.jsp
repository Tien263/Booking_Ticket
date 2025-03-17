<%-- 
    Document   : otp_fo
    Created on : Jan 27, 2025, 4:57:36 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Mã xác thực</h1>
        <h3>Chúng tôi gửi mã gồm 6 chữ số về ${email} của bạn</h3>
        <form action="verification" method="POST">
            <input type="hidden" name="action" value="submitOTPReset"/>
            <input type="number" name="otp" required placeholder="Nhập OTP"> <br/>
            <span>${errorOTP}</span> <br/>
            <input type="submit" value="Submit"/>
        </form>
        <form action="verification" method="POST">
            <input type="hidden" name="action" value="resendOTPResetPassword"/>
            Gửi lại sau <span id="countdown">4:00</span>: 
            <input type="submit" id="resendButton" value="Gửi lại" disabled/>
        </form>
    </body>
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

        // Bắt đầu đếm ngược 4 phút (240 giây)
        startCountdown(240);
    </script>

</html>
