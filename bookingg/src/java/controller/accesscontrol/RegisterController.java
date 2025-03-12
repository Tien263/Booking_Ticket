/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.accesscontrol;

import MD5.BCrypt;
import dal.CustomerDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Customer;

/**
 *
 * @author ADMIN
 */
public class RegisterController extends HttpServlet {

    public boolean isValidEmail(String email) {
        String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
        return email.matches(emailRegex);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        CustomerDao cd = new CustomerDao();
        boolean exists = cd.checkUsernameExist(username);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"exists\": " + exists + "}");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmpass = request.getParameter("confirmpass");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        Boolean gender = Boolean.parseBoolean(request.getParameter("gender"));

        System.out.println(String.valueOf(gender));
        CustomerDao cd = new CustomerDao();
        // **Mã hóa mật khẩu trước khi lưu vào cơ sở dữ liệu**
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        Customer c = new Customer(email, fullname, phone, address, gender, username, hashedPassword);

        // Kiểm tra từng điều kiện riêng lẻ
        boolean hasUppercase = password.matches(".*[A-Z].*");
        boolean hasDigit = password.matches(".*\\d.*");
        boolean hasSpecialChar = password.matches(".*[@$!%*?&].*");
        boolean validLength = password.length() >= 8 && password.length() <= 16;

// Đếm số điều kiện thỏa mãn
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

// Kiểm tra xem có ít nhất 3 điều kiện được thỏa mãn hay không
        if (validConditions < 3) {
            request.setAttribute("error", "Mật khẩu phải thỏa mãn ít nhất 3 trong 4 yêu cầu: 8-16 ký tự, 1 chữ hoa, 1 số, 1 ký tự đặc biệt.");
            request.setAttribute("fullname", fullname);
            request.setAttribute("email", email);
            request.setAttribute("username", username);
            request.setAttribute("phone", phone);
            request.setAttribute("address", address);
            request.setAttribute("gender", gender);
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        if (!isValidEmail(email)) {
            request.setAttribute("error", "Email không hợp lệ! Vui lòng nhập đúng định dạng.");
            request.setAttribute("fullname", fullname);
            request.setAttribute("username", username);
            request.setAttribute("password", password);
            request.setAttribute("confirmpass", confirmpass);
            request.setAttribute("phone", phone);
            request.setAttribute("address", address);
            request.setAttribute("gender", gender);

            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        if (cd.checkEmailExist(email)) {
            request.setAttribute("error", "Email exists. Choose another email!");
            request.setAttribute("fullname", fullname);
            request.setAttribute("username", username);
            request.setAttribute("password", password);
            request.setAttribute("confirmpass", confirmpass);
            request.setAttribute("phone", phone);
            request.setAttribute("address", address);
            request.setAttribute("gender", gender);

            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        if (!confirmpass.equals(password)) {
            request.setAttribute("error", "Password is not matched. Type again!");
            request.setAttribute("fullname", fullname);
            request.setAttribute("email", email);
            request.setAttribute("phone", phone);
            request.setAttribute("address", address);
            request.setAttribute("gender", gender);

            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        if (cd.checkUsernameExist(username)) {
            request.setAttribute("error", "Username exists. Choose another username!");
            request.setAttribute("fullname", fullname);
            request.setAttribute("email", email);
            request.setAttribute("password", password);
            request.setAttribute("confirmpass", confirmpass);
            request.setAttribute("phone", phone);
            request.setAttribute("address", address);
            request.setAttribute("gender", gender);

            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        if (!phone.matches("\\d{10}")) {
            request.setAttribute("error", "Wrong phone format! Must be 10 digits!");
            request.setAttribute("fullname", fullname);
            request.setAttribute("email", email);
            request.setAttribute("username", username);
            request.setAttribute("password", password);
            request.setAttribute("confirmpass", confirmpass);
            request.setAttribute("phone", phone);
            request.setAttribute("address", address);
            request.setAttribute("gender", gender);

            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        if (cd.checkPhoneExist(phone)) {
            request.setAttribute("error", "Phone exists. Choose another phone!");
            request.setAttribute("fullname", fullname);
            request.setAttribute("email", email);
            request.setAttribute("username", username);
            request.setAttribute("password", password);
            request.setAttribute("confirmpass", confirmpass);
            request.setAttribute("address", address);
            request.setAttribute("gender", gender);

            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        cd.insert(c);
        request.setAttribute("success", "Đăng ký thành công!");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
