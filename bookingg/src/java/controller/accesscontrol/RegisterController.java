/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.accesscontrol;

import MD5.BCrypt;
import dal.CustomerDao;
import dal.OTPDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Customer;
import model.Email;
import model.OTP;

/**
 *
 * @author ADMIN
 */
public class RegisterController extends HttpServlet {

    private CustomerDao customerDao = new CustomerDao();
    private OTPDBContext otpDao = new OTPDBContext();

    public boolean isValidEmail(String email) {
        String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
        return email.matches(emailRegex);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        boolean exists = customerDao.checkUsernameExist(username);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"exists\": " + exists + "}");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        if (action == null || "submitRegister".equals(action)) {
            String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String confirmpass = request.getParameter("confirmpass");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String genderStr = request.getParameter("gender");
            Boolean gender = "1".equals(genderStr);
            // Kiểm tra mật khẩu
            boolean hasUppercase = password.matches(".*[A-Z].*");
            boolean hasDigit = password.matches(".*\\d.*");
            boolean hasSpecialChar = password.matches(".*[@$!%*?&].*");
            boolean validLength = password.length() >= 8 && password.length() <= 16;

            int validConditions = 0;
            if (hasUppercase) {
                validConditions++;
            }
            if (hasDigit) {
                validConditions++;
            }
            if (hasSpecialChar) {
                validConditions++;
            }
            if (validLength) {
                validConditions++;
            }

            if (validConditions < 3) {
                request.setAttribute("error", "Mật khẩu phải thỏa mãn ít nhất 3 trong 4 yêu cầu: 8-16 ký tự, 1 chữ hoa, 1 số, 1 ký tự đặc biệt.");
                setFormAttributes(request, fullname, email, username, phone, address, gender);
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            if (!isValidEmail(email)) {
                request.setAttribute("error", "Email không hợp lệ! Vui lòng nhập đúng định dạng.");
                setFormAttributes(request, fullname, email, username, phone, address, gender);
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            if (customerDao.checkEmailExist(email)) {
                request.setAttribute("error", "Email đã tồn tại. Chọn email khác!");
                setFormAttributes(request, fullname, email, username, phone, address, gender);
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            if (!confirmpass.equals(password)) {
                request.setAttribute("error", "Mật khẩu xác nhận không khớp. Nhập lại!");
                setFormAttributes(request, fullname, email, username, phone, address, gender);
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            if (customerDao.checkUsernameExist(username)) {
                request.setAttribute("error", "Tên người dùng đã tồn tại. Chọn tên khác!");
                setFormAttributes(request, fullname, email, username, phone, address, gender);
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            if (!phone.matches("\\d{10}")) {
                request.setAttribute("error", "Định dạng số điện thoại sai! Phải có 10 chữ số!");
                setFormAttributes(request, fullname, email, username, phone, address, gender);
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            if (customerDao.checkPhoneExist(phone)) {
                request.setAttribute("error", "Số điện thoại đã tồn tại. Chọn số khác!");
                setFormAttributes(request, fullname, email, username, phone, address, gender);
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            // Mã hóa mật khẩu
            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

            // Lưu thông tin vào session
            session.setAttribute("registerFullname", fullname);
            session.setAttribute("registerEmail", email);
            session.setAttribute("registerUsername", username);
            session.setAttribute("registerPhone", phone);
            session.setAttribute("registerAddress", address);
            session.setAttribute("registerGender", gender);
            session.setAttribute("registerPassword", hashedPassword);

            // Tạo và lưu OTP
            OTP otp = new OTP();
            otp.setEmail(email);
            otpDao.insert(otp); // Lưu OTP vào DB, mã OTP được sinh tự động trong insert

            // Lấy mã OTP mới nhất từ DB
            String otpCode = otpDao.getOTP(email);
            if (otpCode == null) {
                request.setAttribute("error", "Không thể tạo mã OTP. Vui lòng thử lại.");
                setFormAttributes(request, fullname, email, username, phone, address, gender);
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            // Gửi email
            Email emailSender = new Email();
            String subject = "Xác minh đăng ký tài khoản BusGo";
            String content = "Mã OTP của bạn là: " + otpCode + ". Vui lòng sử dụng mã này để hoàn tất đăng ký.";
            emailSender.sendEmail(email, subject, content);

            // Chuyển đến trang nhập OTP
            request.setAttribute("email", email);
            request.getRequestDispatcher("otp_register.jsp").forward(request, response);

        } else if ("resendRegisterOTP".equals(action)) {
            String email = (String) session.getAttribute("registerEmail");
            OTP otp = new OTP();
            otp.setEmail(email);
            otpDao.insert(otp); // Lưu OTP mới vào DB

            // Lấy mã OTP mới nhất từ DB
            String otpCode = otpDao.getOTP(email);
            if (otpCode == null) {
                request.setAttribute("error", "Không thể tạo mã OTP mới. Vui lòng thử lại.");
                request.setAttribute("email", email);
                request.getRequestDispatcher("otp_register.jsp").forward(request, response);
                return;
            }

            Email emailSender = new Email();
            String subject = "Xác minh đăng ký tài khoản BusGo (Gửi lại)";
            String content = "Mã OTP mới của bạn là: " + otpCode + ". Vui lòng sử dụng mã này để hoàn tất đăng ký.";
            emailSender.sendEmail(email, subject, content);

            request.setAttribute("email", email);
            request.getRequestDispatcher("otp_register.jsp").forward(request, response);
        }
    }

    private void setFormAttributes(HttpServletRequest request, String fullname, String email, String username,
            String phone, String address, Boolean gender) {
        request.setAttribute("fullname", fullname);
        request.setAttribute("email", email);
        request.setAttribute("username", username);
        request.setAttribute("phone", phone);
        request.setAttribute("address", address);
        request.setAttribute("gender", String.valueOf(gender));
    }

    @Override
    public String getServletInfo() {
        return "Handles customer registration with OTP verification";
    }
}
