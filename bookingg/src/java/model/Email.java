/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * sử dụng JavaMail API (javax.mail), một API chuẩn của Java để gửi và nhận
 * email.
 */
import javax.mail.*; //Nhập toàn bộ các lớp trong gói javax.mail để làm việc với email (gửi, nhận, quản lý email).
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage; //cho phép gửi email với nội dung văn bản, HTML, hoặc đính kèm tệp.
import java.util.Date;
import java.util.Properties;//Lớp này được sử dụng để cấu hình các thuộc tính (properties) cho phiên làm việc với máy chủ SMTP.

public class Email {

    public Email() {
    }

    /**
     *
     * @param to Địa chỉ email của người nhận
     * @param subject Tiêu đề của email.
     * @param content Nội dung của email.
     * @return
     */
    public boolean sendEmail(String to, String subject, String content) {
        final String from = "anhttphe181589@fpt.edu.vn"; //email người gửi
        final String password = "pzwj oapb renr rnmx"; //Mật khẩu (App Password) của Gmail

        /**
         * Properties : mail.smtp.host: Máy chủ SMTP của Gmail mail.smtp.port:
         * Cổng SMTP,Gmail hỗ trợ cổng 587 cho giao thức TLS (Transport Layer
         * Security). mail.smtp.auth: Yêu cầu xác thực (username/password) để
         * gửi email. mail.smtp.starttls.enable:Kích hoạt giao thức STARTTLS để
         * mã hóa kết nối -> Điều này đảm bảo email được gửi qua một kết nối an
         * toàn.
         *
         */
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        /**
         * Authenticator: một lớp trừu tượng trong JavaMail API, được sử dụng để
         * xử lý xác thực. 
         * Phương thức getPasswordAuthentication() được ghi đè
         * để trả về một đối tượng PasswordAuthentication chứa: from: Địa chỉ
         * email của người gửi (username). password: Mật khẩu ứng dụng (App
         * Password) của tài khoản Gmail.
         */
        Authenticator authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        };

        //Phien lam viec được sử dụng để tạo và gửi email.
        Session session = Session.getInstance(properties, authenticator);

        //Tạo một email mới dựa trên phiên làm việc session.
        MimeMessage message = new MimeMessage(session);

        try {
            message.addHeader("Content-type", "text/HTML; charset=UTF-8");
            message.setFrom(from);//Đặt địa chỉ email của người gửi.
            
            //Đặt địa chỉ email của người nhận (to)
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            message.setSubject(subject, "UTF-8"); //tiêu đề email và chỉ định mã hóa UTF-8 để hỗ trợ các ký tự đặc biệt (như tiếng Việt).
            message.setSentDate(new Date());//thời gian gửi email là thời gian hiện tại.
            //message.setReplyTo(InternetAddress.parse(from, false));
            message.setText(content, "UTF-8");
            Transport.send(message); //Gửi email qua máy chủ SMTP.
            return true;
        } catch (MessagingException e) {
            System.out.println("SendEmail " + e);
            return false;
        }
    }
}
