/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.accesscontrol;

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
 * @author admin
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
        HttpSession session = request.getSession();
        String email = request.getParameter("email");

        // Kiểm tra email hợp lệ
        CustomerDao db = new CustomerDao();
        String errorEmail = "";
        if (!db.isEmailExists(email)) {
            errorEmail = "Không tìm thấy Email";
        }
        if (errorEmail.equalsIgnoreCase("Không tìm thấy Email")) {
            request.setAttribute("errorEmail", errorEmail);
            request.getRequestDispatcher("forgotpassword/forgot_password.jsp").forward(request, response);
            return;
        }

        // Lưu trạng thái để cho phép truy cập OTP
        session.setAttribute("resetEmail", email);
        session.setAttribute("allowOTP", true);  // Thêm biến này để kiểm soát /verification
        session.setAttribute("action", "forgotpassword");

        // Gửi OTP
        OTPDBContext otpDB = new OTPDBContext();
        OTP otpSend = new OTP();
        otpSend.setEmail(email);
        otpDB.insert(otpSend);
        String OTPCode = otpDB.getOTP(email);
        Email userEmail = new Email();
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
