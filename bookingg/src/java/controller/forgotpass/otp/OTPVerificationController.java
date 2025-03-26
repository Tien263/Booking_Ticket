package controller.forgotpass.otp;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import dal.OTPDBContext;
import dal.CustomerDao;
import model.OTP;
import model.User;
import model.Email;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;

/**
 *
 * @author admin
 */
public class OTPVerificationController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Boolean allowOTP = (Boolean) session.getAttribute("allowOTP");
        String email = (String) session.getAttribute("resetEmail");

        //Đảm bảo chỉ những người dùng đã gửi email hợp lệ (trong bước quên mật khẩu trước đó) mới được truy cập vào trang xác minh OTP.
        if (allowOTP == null || !allowOTP || email == null) { //thì người dùng không có quyền truy cập trang xác minh OTP.
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Truy cập không hợp lệ!");
            return;
        }

        request.setAttribute("email", email);
        if (((String) session.getAttribute("action")).equals("forgotpassword")) {
            request.getRequestDispatcher("forgotpassword/otp_fo.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CustomerDao db = new CustomerDao();
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        String email = (String) session.getAttribute("resetEmail");
        String otp = request.getParameter("otp");
        OTP newotp = new OTP();
        newotp.setEmail(email);
        newotp.setOtp(otp);
         if (action.equals("submitOTPReset")) {
            OTPDBContext otpDB = new OTPDBContext();
            if (otpDB.verifyOTP(email, otp)) {
                // Cho phép truy cập vào reset password
                session.setAttribute("allowReset", true);
                session.removeAttribute("allowOTP"); // Xóa trạng thái OTP để tránh dùng lại
                otpDB.update(newotp);
                response.sendRedirect("resetpasswordcustomer");
            } else {
                // OTP không đúng, quay lại trang nhập OTP với thông báo lỗi
                request.setAttribute("errorOTP", "Mã OTP không đúng. Vui lòng thử lại.");
                request.setAttribute("email", email);
                request.getRequestDispatcher("forgotpassword/otp_fo.jsp").forward(request, response);
            }
        
        }
        else if (action.equals("resendOTPResetPassword")) {
            OTPDBContext otpDB = new OTPDBContext();
            OTP otpSend = new OTP();
            otpSend.setEmail(email);
            otpDB.insert(otpSend);
            String OTPCode = otpDB.getOTP(email);
            Email userEmail = new Email();
            if (OTPCode != null && !OTPCode.isEmpty()) {
                boolean result = userEmail.sendEmail(email, "Xác thực địa chỉ email của bạn", "Đây là mã OTP của bạn: " + OTPCode);
                if (!result) {
                    request.setAttribute("errorOTP", "Gửi OTP không thành công");
                    request.getRequestDispatcher("forgotpassword/forgot_password.jsp").forward(request, response);
                }
            }
            
            request.getRequestDispatcher("forgotpassword/otp_fo.jsp").forward(request, response);
        }
    }

}
