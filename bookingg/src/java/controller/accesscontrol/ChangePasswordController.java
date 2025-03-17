package controller.accesscontrol;

import MD5.BCrypt;
import dal.CustomerDao;
import model.Customer;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ChangePasswordController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("changepassword.jsp").forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        CustomerDao customerDao = new CustomerDao();

        // Lấy email từ session (người dùng đang đăng nhập)
        Customer loggedInCustomer = (Customer) session.getAttribute("customer");
        if (loggedInCustomer == null) {
            request.setAttribute("error", "Bạn chưa đăng nhập!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        String email = loggedInCustomer.getEmail();
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String retypeNewPassword = request.getParameter("retypeNewPassword");

        // Kiểm tra trường nhập vào
        if (currentPassword == null || currentPassword.trim().isEmpty()) {
            request.setAttribute("error", "Mật khẩu cũ không được để trống!");
            request.getRequestDispatcher("changepassword.jsp").forward(request, response);
            return;
        }

        if (newPassword == null || newPassword.trim().isEmpty()) {
            request.setAttribute("error", "Mật khẩu mới không được để trống!");
            request.getRequestDispatcher("changepassword.jsp").forward(request, response);
            return;
        }

        if (retypeNewPassword == null || retypeNewPassword.trim().isEmpty()) {
            request.setAttribute("error", "Mật khẩu xác nhận không được để trống!");
            request.getRequestDispatcher("changepassword.jsp").forward(request, response);
            return;
        }

        // Kiểm tra mật khẩu cũ
        Customer customer = customerDao.getByEmail(email);
        if (customer == null) {
            request.setAttribute("error", "Không tìm thấy tài khoản!");
            request.getRequestDispatcher("changepassword.jsp").forward(request, response);
            return;
        }

        // So sánh mật khẩu nhập vào với mật khẩu đã mã hóa trong CSDL
        if (!BCrypt.checkpw(currentPassword, customer.getPassword())) {
            request.setAttribute("error", "Mật khẩu cũ không chính xác!");
            request.getRequestDispatcher("changepassword.jsp").forward(request, response);
            return;
        }

        // Kiểm tra mật khẩu mới có khớp không
        if (!newPassword.equals(retypeNewPassword)) {
            request.setAttribute("error", "Mật khẩu xác nhận không khớp!");
            request.getRequestDispatcher("changepassword.jsp").forward(request, response);
            return;
        }

        // **Mã hóa mật khẩu mới trước khi cập nhật vào database**
        String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());

        // Cập nhật mật khẩu mới
        customer.setPassword(hashedPassword);
        customerDao.update(customer);

        // Hiển thị thông báo thành công
        request.setAttribute("success", "Mật khẩu đã được thay đổi thành công!");
        request.getRequestDispatcher("changepassword.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Change Password Controller with Password Encryption";
    }
}
