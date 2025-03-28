package controller.accesscontrol;

import dal.EmployeeDao;
import model.Employee;
import model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UpdateEmployeeController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateEmployeeController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateEmployeeController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");

        if (currentUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Lấy thông tin từ form
        String name = request.getParameter("e_name");
        String phone = request.getParameter("e_phone");
        String address = request.getParameter("e_address");
        boolean gender = Boolean.parseBoolean(request.getParameter("e_gender"));

        EmployeeDao employeeDao = new EmployeeDao();
        boolean isUpdated = false;

        if (currentUser.hasEmployeeInfo()) {
            // Nếu user đã có Employee, chỉ cập nhật thông tin
            Employee emp = new Employee();
            emp.setId(currentUser.geteId()); // Lấy e_id hiện tại
            emp.setName(name);
            emp.setPhone(phone);
            emp.setAddress(address);
            emp.setGender(gender);
            isUpdated = employeeDao.updateEmployee(emp);

        } else {
            // Nếu user chưa có Employee, thêm mới
            Employee emp = new Employee();
            emp.setName(name);
            emp.setPhone(phone);
            emp.setAddress(address);
            emp.setGender(gender);

            boolean isInserted = employeeDao.insertEmployee(emp);

            if (isInserted) {
                int newEId = emp.getId();
                boolean isUserUpdated = employeeDao.updateUserEId(currentUser.getUsername(), newEId);

                if (isUserUpdated) {
                    currentUser.seteId(newEId);
                    session.setAttribute("user", currentUser);
                    isUpdated = true;
                } else {
                    request.setAttribute("error", "Failed to update e_id in Users table!");
                    request.getRequestDispatcher("update_employee.jsp").forward(request, response);
                    return;
                }
            } else {
                request.setAttribute("error", "Failed to insert Employee record!");
                request.getRequestDispatcher("update_employee.jsp").forward(request, response);
                return;
            }
        }

        if (isUpdated) {
            // Cập nhật lại session
            session.setAttribute("user", currentUser);

            // Lấy roleID từ bảng Users
            int roleId = getRoleIdFromDatabase(currentUser.getUsername(), employeeDao);
            currentUser.setRoleID(roleId);
            session.setAttribute("user", currentUser);

            // Phân quyền dựa trên roleID
            redirectBasedOnRole(currentUser, request, response);
        } else {
            request.setAttribute("error", "Update failed. Please try again.");
            request.getRequestDispatcher("update_employee.jsp").forward(request, response);
        }
    }

    // Hàm lấy roleID từ bảng Users
    private int getRoleIdFromDatabase(String username, EmployeeDao employeeDao) {
        String sql = "SELECT r_id FROM Users WHERE u_username = ?";
        try {
            PreparedStatement ps = employeeDao.getConnection().prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("r_id");
            }
        } catch (SQLException e) {
            Logger.getLogger(UpdateEmployeeController.class.getName()).log(Level.SEVERE, null, e);
        }
        return -1; // Trả về -1 nếu không tìm thấy
    }

    // Hàm phân quyền dựa trên roleID
    private void redirectBasedOnRole(User user, HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        switch (user.getRoleID()) {
            case 1:
                response.sendRedirect(request.getContextPath() + "/blog/createblog");
                break;
            case 2:
                response.sendRedirect(request.getContextPath() + "/seller");
                break;
            case 3:
                response.sendRedirect(request.getContextPath() + "/BusTripURL?service=listOfAll");
                break;
            case 4:
                response.sendRedirect(request.getContextPath() + "/BusRouteURL?service=listOfAll");
                break;
            case 5:
                response.sendRedirect(request.getContextPath() + "/promotion/Promotion.jsp");
                break;
            case 6:
                response.sendRedirect(request.getContextPath() + "/vehicle/vehicle");
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/home");
                break;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}