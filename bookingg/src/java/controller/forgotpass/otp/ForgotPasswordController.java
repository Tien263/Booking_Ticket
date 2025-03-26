/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.forgotpass.otp;

import dal.CustomerDao;
import dal.OTPDBContext;
import model.OTP;
import model.Email;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * Người dùng truy cập trang quên mật khẩu (GET) và nhập email. Servlet kiểm tra
 * email (POST), nếu hợp lệ thì tạo và gửi OTP qua email. Chuyển hướng người
 * dùng đến trang xác minh OTP.
 */
public class ForgotPasswordController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("forgotpassword/forgot_password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        /**
         * Lấy email từ form và check email có tồn tại trong cơ sở dữ
         * liệu không (dùng CustomerDao). 
         * Nếu email không tồn tại, hiển thị
         * thông báo lỗi trên trang forgot_password.jsp. 
         * Nếu email hợp lệ: Lưu email và trạng thái vào session (resetEmail, allowOTP, action). Tạo
         * và lưu mã OTP vào cơ sở dữ liệu (dùng OTPDBContext). Gửi email chứa
         * mã OTP đến người dùng. Nếu gửi email thất bại, hiển thị
         * thông báo lỗi. Nếu thành công, chuyển hướng đến trang xác minh OTP
         * (/verification)
         */
        HttpSession session = request.getSession();
        String email = request.getParameter("email");

        // Kiểm tra email hợp lệ
        CustomerDao db = new CustomerDao();
        String errorEmail = "";
        //(CustomerDao) để kiểm tra xem email có tồn tại trong bảng khách hàng không.
        if (!db.isEmailExists(email)) {
            errorEmail = "Không tìm thấy Email";
        }
        if (errorEmail.equalsIgnoreCase("Không tìm thấy Email")) {
            request.setAttribute("errorEmail", errorEmail);
            request.getRequestDispatcher("forgotpassword/forgot_password.jsp").forward(request, response);
            return;
        }

        // Lưu trạng thái để cho phép truy cập OTP
        /**
         * Lưu email mà người dùng đã nhập để sử dụng trong các bước tiếp theo
         * (ví dụ: xác minh OTP hoặc đặt lại mật khẩu). allowOTP: Đặt giá trị
         * true để cho phép truy cập vào trang xác minh OTP
         */
        session.setAttribute("resetEmail", email);
        session.setAttribute("allowOTP", true);  // Thêm biến này để kiểm soát /verification
        session.setAttribute("action", "forgotpassword");

        // Gửi OTP
        OTPDBContext otpDB = new OTPDBContext();
        OTP otpSend = new OTP(); //Tạo một đối tượng OTP để lưu thông tin OTP.
        otpSend.setEmail(email);//Gán email của người dùng vào đối tượng OTP.
        otpDB.insert(otpSend);//lưu một mã OTP mới vào cơ sở dữ liệu.
        String OTPCode = otpDB.getOTP(email); //Lấy mã OTP mới nhất (chưa sử dụng, chưa hết hạn) cho email này từ cơ sở dữ liệu.

        Email userEmail = new Email(); //Tạo một đối tượng Email để gửi email.
        if (OTPCode != null && !OTPCode.isEmpty()) {
            boolean result = userEmail.sendEmail(email, "Vui lòng xác thực địa chỉ email của bạn cho Busgo", "Đây là mã OTP của bạn: " + OTPCode);
            if (!result) {
                request.setAttribute("errorOTP", "Gửi OTP không thành công");
                request.getRequestDispatcher("forgotpassword/forgot_password.jsp").forward(request, response);
                return;
            }
        }

        response.sendRedirect("verification");
    }

}
