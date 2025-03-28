/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.forgotpass.otp;

import MD5.BCrypt;
import dal.CustomerDao;
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
public class ResetPasswordCustomerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Boolean allowReset = (Boolean) session.getAttribute("allowReset");
        String email = (String) session.getAttribute("resetEmail");

        if (allowReset == null || !allowReset || email == null) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Truy cập không hợp lệ!");
            return;
        }

        request.setAttribute("email", email);
        request.getRequestDispatcher("forgotpassword/new_password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("resetEmail");

        if (email == null) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Truy cập không hợp lệ!");
            return;
        }

        String password = request.getParameter("password");
        String cfpassword = request.getParameter("cfpassword");

        if (!password.equals(cfpassword)) {
            request.setAttribute("errorPass", "Mật khẩu nhập lại không trùng khớp.");
            request.getRequestDispatcher("forgotpassword/new_password.jsp").forward(request, response);
            return;
        }
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        // Cập nhật mật khẩu
        CustomerDao db = new CustomerDao();
        db.resetPassword(email, hashedPassword);

        // Xóa session để tránh truy cập lại
        session.removeAttribute("allowReset");
        session.removeAttribute("resetEmail");

// Đặt thông báo thành công vào request
        request.setAttribute("successMessage", "Thay đổi mật khẩu thành công!");

        // Chuyển tiếp về new_password.jsp để hiển thị thông báo
        request.getRequestDispatcher("forgotpassword/new_password.jsp").forward(request, response);
    }

}
