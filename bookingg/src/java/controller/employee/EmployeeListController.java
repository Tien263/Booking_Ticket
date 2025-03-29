package controller.employee;

import dal.EmployeeDao;
import dal.RoleDao;
import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Employee;
import model.Role;

public class EmployeeListController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EmployeeDao db = new EmployeeDao();
        RoleDao dbRole = new RoleDao();

        // Lấy tham số tìm kiếm từ request
        String raw_id = request.getParameter("id");
        String raw_name = request.getParameter("name");
        String raw_gender = request.getParameter("gender");
        String raw_address = request.getParameter("address");
        String raw_phone = request.getParameter("phone");
        String raw_roleId = request.getParameter("roleId");

        // Chuyển đổi tham số
        Integer id = (raw_id != null && !raw_id.isBlank()) ? Integer.parseInt(raw_id) : null;
        String name = raw_name;
        Boolean gender = (raw_gender != null && !raw_gender.equals("both")) ? raw_gender.equals("male") : null;
        String address = raw_address;
        String phone = raw_phone;
        Integer roleId = (raw_roleId != null && !raw_roleId.equals("-1")) ? Integer.parseInt(raw_roleId) : null;

        // Tìm kiếm nhân viên
        ArrayList<Employee> emps = db.search(id, name, phone, address, gender, roleId);

        // Lấy danh sách vai trò
        ArrayList<Role> roles = dbRole.list();

        // Đặt các thuộc tính vào request để JSP sử dụng
        request.setAttribute("emps", emps);
        request.setAttribute("roles", roles);

        request.getRequestDispatcher("employeelist.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response); // Chuyển POST sang GET để xử lý tìm kiếm
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}