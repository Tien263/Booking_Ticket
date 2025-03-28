/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.employee;

import dal.RoleDao;
import dal.UserDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Role;
import model.User;

/**
 *
 * @author ADMIN
 */
public class EmployeeCreateController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RoleDao rd = new RoleDao();
        ArrayList<Role> roles = rd.list();
        request.setAttribute("roles", roles);
        request.getRequestDispatcher("employeecreate.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy tham số từ form
        String raw_username = request.getParameter("username");
        String raw_password = request.getParameter("password");
        String raw_roleId = request.getParameter("roleId");

        // Debug để kiểm tra giá trị
        System.out.println("Username: " + raw_username);
        System.out.println("Password: " + raw_password);
        System.out.println("Role ID: " + raw_roleId);

        // Kiểm tra các trường bắt buộc
        if (raw_username == null || raw_username.trim().isEmpty() ||
            raw_password == null || raw_password.trim().isEmpty() ||
            raw_roleId == null || raw_roleId.trim().isEmpty()) {
            // Nếu thiếu trường, chuyển hướng lại form với thông báo lỗi
            response.sendRedirect("employeecreate?error=missing_fields");
            return;
        }

        // Tạo đối tượng User
        User u = new User();
        u.setUsername(raw_username.trim());
        u.setPassword(raw_password.trim());

        // Tạo đối tượng Role
        Role r = new Role();
        try {
            r.setId(Integer.parseInt(raw_roleId));
        } catch (NumberFormatException e) {
            System.out.println("Invalid Role ID: " + raw_roleId);
            response.sendRedirect("employeecreate?error=invalid_role");
            return;
        }
        u.setRole(r);

        // Thêm user vào cơ sở dữ liệu
        UserDBContext ud = new UserDBContext();
        ud.insert(u); // Giả sử insert() đã được sửa để trả về boolean nếu cần

        // Chuyển hướng đến danh sách nhân viên
        response.sendRedirect(request.getContextPath() + "/admin/employeelist");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}