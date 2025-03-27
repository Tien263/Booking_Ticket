/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.forgotpass.otp;

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

/**
 *
 * @author ADMIN
 */
public class OTPVerificationRegisterController extends HttpServlet {
  private CustomerDao customerDao = new CustomerDao();
    private OTPDBContext otpDao = new OTPDBContext();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        if ("submitOTPReset".equals(action)) {
            String otp = request.getParameter("otp");
            String email = (String) session.getAttribute("email");
            if (otpDao.verifyOTP(email, otp)) {
                session.setAttribute("otpVerified", true);
                request.getRequestDispatcher("new_password.jsp").forward(request, response);
            } else {
                request.setAttribute("errorOTP", "Mã OTP không đúng. Vui lòng thử lại.");
                request.getRequestDispatcher("otp_fo.jsp").forward(request, response);
            }
        } else if ("verifyRegisterOTP".equals(action)) {
            String otp = request.getParameter("otp");
            String email = (String) session.getAttribute("registerEmail");
            if (otpDao.verifyOTP(email, otp)) {
                String fullname = (String) session.getAttribute("registerFullname");
                String username = (String) session.getAttribute("registerUsername");
                String phone = (String) session.getAttribute("registerPhone");
                String genderStr = String.valueOf(session.getAttribute("registerGender"));
                String address = (String) session.getAttribute("registerAddress");
                String hashedPassword = (String) session.getAttribute("registerPassword");

                Customer customer = new Customer();
                customer.setFullname(fullname);
                customer.setEmail(email);
                customer.setUsername(username);
                customer.setPhone(phone);
                customer.setGender(Boolean.parseBoolean(genderStr));
                customer.setAddress(address);
                customer.setPassword(hashedPassword);

                customerDao.insert(customer);

                session.removeAttribute("registerFullname");
                session.removeAttribute("registerEmail");
                session.removeAttribute("registerUsername");
                session.removeAttribute("registerPhone");
                session.removeAttribute("registerGender");
                session.removeAttribute("registerAddress");
                session.removeAttribute("registerPassword");

                request.setAttribute("success", "Đăng ký thành công!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                request.setAttribute("errorOTP", "Mã OTP không đúng. Vui lòng thử lại.");
                request.getRequestDispatcher("otp_register.jsp").forward(request, response);
            }
        }
    }
}

