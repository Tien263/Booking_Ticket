package com.example.config;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class VerifyOtp extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String otp = request.getParameter("otp");
        String sessionOtp = (String) request.getSession().getAttribute("otp");
        String phoneNumber = (String) request.getSession().getAttribute("phoneNumber");

        if (otp == null || otp.isEmpty()) {
            request.setAttribute("error", "Vui lòng nhập mã OTP!");
            request.getRequestDispatcher("verify-otp.jsp").forward(request, response);
            return;
        }

        if (sessionOtp == null || !sessionOtp.equals(otp)) {
            request.setAttribute("error", "Mã OTP không đúng!");
            request.getRequestDispatcher("verify-otp.jsp").forward(request, response);
            return;
        }

        // Xác minh thành công
        request.getSession().removeAttribute("otp"); // Xóa OTP sau khi xác minh
        request.setAttribute("message", "Xác minh thành công cho số điện thoại: " + phoneNumber);
        request.getRequestDispatcher("verify-otp.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
        response.setContentType("text/plain");
        response.getWriter().write("Phương thức GET không được hỗ trợ. Vui lòng sử dụng POST.");
    }
}