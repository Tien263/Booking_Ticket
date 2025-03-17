package controller.accesscontrol;

import dal.ContactDAO;
import model.Contact;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ContactController extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        // Kiểm tra lỗi nhập liệu
        String errorMessage = validateInput(name, email, message);

        if (errorMessage != null) {
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("contact.jsp").forward(request, response);
            return;
        }

        // Lấy thời gian hiện tại
        Timestamp createdAt = Timestamp.valueOf(LocalDateTime.now());

        // Tạo đối tượng Contact và lưu vào CSDL
        Contact contact = new Contact(name, email, message, createdAt);
        ContactDAO contactDAO = new ContactDAO();
        contactDAO.insertContact(contact);

        // Gửi thông báo thành công
        request.setAttribute("successMessage", "Gửi liên hệ thành công! Cảm ơn bạn đã liên hệ, chúng tôi sẽ phản hồi lại sớm.");
        request.getRequestDispatcher("contact.jsp").forward(request, response);
    }

    /**
     * Hàm kiểm tra dữ liệu đầu vào
     */
    private String validateInput(String name, String email, String message) {
        // Kiểm tra họ và tên
        if (name == null || name.trim().isEmpty()) {
            return "Họ và tên không được để trống!";
        }
        if (name.length() > 200) {
            return "Họ và tên không được vượt quá 200 ký tự!";
        }

        // Kiểm tra email
        if (email == null || email.trim().isEmpty()) {
            return "Email không được để trống!";
        }
        if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
            return "Email không hợp lệ! Vui lòng nhập đúng định dạng email (ví dụ: example@email.com)";
        }

        // Kiểm tra mô tả
        if (message == null || message.trim().isEmpty()) {
            return "Mô tả không được để trống!";
        }

        return null; // Không có lỗi
    }

    @Override
    public String getServletInfo() {
        return "Contact Controller with Input Validation";
    }
}