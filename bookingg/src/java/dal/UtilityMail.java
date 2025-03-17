/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import jakarta.servlet.ServletException;
import java.io.IOException;
import java.util.Random;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.Properties;
import java.util.Random;
import java.util.Properties;
import javax.mail.internet.*;

/**
 *
 * @author ADMIN
 */
public class UtilityMail {

    private static final String FROM_EMAIL = "phuonganhhihi01@gmail.com";
    private static final String FROM_PASSWORD = "pbtt svyl lyks pees";
    private static final String SMTP_HOST = "smtp.gmail.com";
    private static final int SMTP_PORT = 587;

    public String generateOtp() {
        Random rand = new Random();
        int number = rand.nextInt(999999);
        return String.format("%06d", number);
    }

    public void sendOtpEmail(String toEmail, String otpCode, String purpose) {
        String emailContent = buildOtpEmailContent(otpCode, purpose);
        sendEmail(toEmail, "OTP Verification", emailContent);

    }

    public void resendOtp(HttpServletRequest request, HttpServletResponse response, HttpSession session)
            throws ServletException, IOException {
        String newOtp = generateOtp();
        session.setAttribute("otp", newOtp);
        session.setAttribute("otpCreationTime", LocalDateTime.now());

        String email = (String) session.getAttribute("email");
        sendOtpEmail(email, newOtp, "resend");

        String maskedEmail = maskEmail(email);
        request.setAttribute("message", "A new OTP has been sent to your email " + maskedEmail + ". The OTP will expire in 5 minutes.");
        request.setAttribute("type", "info");
        request.getRequestDispatcher("verifyOtp.jsp").forward(request, response);
    }

    public void verifyOtp(HttpServletRequest request, HttpServletResponse response, HttpSession session)
            throws ServletException, IOException {
        String enteredOtp = request.getParameter("otp");
        String sessionOtp = (String) session.getAttribute("otp");
        LocalDateTime otpCreationTime = (LocalDateTime) session.getAttribute("otpCreationTime");

        if (isOtpExpired(otpCreationTime)) {
            request.setAttribute("message", "OTP has expired. Please request a new one.");
            request.setAttribute("type", "error");
            request.getRequestDispatcher("verifyOtp.jsp").forward(request, response);
            return;
        }

        if (enteredOtp != null && enteredOtp.equals(sessionOtp)) {
            session.removeAttribute("otp");
            String customerEmail = (String) session.getAttribute("email");

            request.setAttribute("message", "OTP verified successfully. Redirecting you in 5 seconds.");
            request.setAttribute("type", "success");
            request.getRequestDispatcher("verifyOtp.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "Invalid OTP. Please try again.");
            request.setAttribute("type", "error");
            request.getRequestDispatcher("verifyOtp.jsp").forward(request, response);
        }
    }

    private String buildOtpEmailContent(String otpCode, String purpose) {
        String title = null;
        String message = null;

        switch (purpose.toLowerCase()) {
            case "reset":
                title = "Reset Your Password";
                message = "We received a request to reset your password. Please enter the following code to proceed:";

                break;
            case "resend":
                title = "Verify Your Identity";
                message = "You requested a new OTP. Please enter the following code to verify your identity:";
                break;
        }
        return buildHtmlContent(title, message, otpCode);
    }

    private void sendEmail(String toEmail, String subject, String content) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", String.valueOf(SMTP_PORT));

        Session mailSession = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM_EMAIL, FROM_PASSWORD);
            }
        });

        try {
            Message message = new MimeMessage(mailSession);
            message.setFrom(new InternetAddress(FROM_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject(subject);
            message.setContent(content,  "text/html; charset=UTF-8");
            System.out.println("✅ Gửi email thành công đến: " + toEmail);
            Transport.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException("Error sending email: " + e.getMessage(), e);
        }
    }

    private String buildHtmlContent(String title, String message, String otpCode) {
        String otpSection = otpCode != null ? "<div style=\"background-color: #ABC; padding: 10px; letter-spacing: 3px;\"><h1>" + otpCode + "</h1></div>" : "";
        return "<div style=\"width: 50vw; padding: 20px; border: 3px solid black; border-radius: 10px; text-align: center;\">"
                + "<h1>" + title + "</h1><p>" + message + "</p>" + otpSection
                + "<p>If you have any questions, feel free to contact us.</p></div>";
    }

    public String maskEmail(String email) {
        int numAsterisks = email.indexOf("@") - 1;
        String maskedSection = "*".repeat(numAsterisks);
        return email.charAt(0) + maskedSection + email.substring(email.indexOf("@"));
    }

    private boolean isOtpExpired(LocalDateTime otpCreationTime) {
        if (otpCreationTime == null) {
            return true;
        }
        return Duration.between(otpCreationTime, LocalDateTime.now()).toMinutes() > 5;
    }

    public static void main(String[] args) {
        final String fromEmail = "phuonganhhihi01@gmail.com"; // Email của bạn
        final String appPassword = "pbtt svyl lyks pees"; // Mật khẩu ứng dụng Google (App Password)
        final String toEmail = "xuantien50d@gmail.com"; // Email nhận để kiểm tra

        System.out.println("Đang kiểm tra SMTP...");

        // Cấu hình SMTP cho Gmail
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        // Tạo phiên làm việc với SMTP
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, appPassword);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject("Test SMTP");
            message.setText("Xin chào! Đây là email test gửi từ Java.");

            // Gửi email
            Transport.send(message);
            System.out.println("✅ Gửi email thành công!");

        } catch (MessagingException e) {
            System.out.println("❌ Lỗi gửi email:");
            e.printStackTrace(); // In lỗi chi tiết
        }
    }

}
