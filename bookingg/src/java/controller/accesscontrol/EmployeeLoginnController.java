package controller.accesscontrol;

import dal.EmployeeDao;
import dal.UserDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

public class EmployeeLoginnController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("rememberMe");

        Cookie cUsername = new Cookie("cUsername", username);

        UserDBContext userDao = new UserDBContext();
        User user = userDao.checkAuthen(username, password);

        if (user == null) {
            request.setAttribute("err", "Invalid username or password!");
            request.getRequestDispatcher("employee_login.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession();
        session.setAttribute("user", user); // Lưu user vào session

        // Kiểm tra e_id của user
        if (!user.hasEmployeeInfo()) { // Nếu e_id <= 0 (tức là chưa có thông tin nhân viên)
            request.setAttribute("message", "Please update your employee information.");
            request.getRequestDispatcher("update_employee.jsp").forward(request, response);
            return;
        }

        // Xử lý "Remember Me"
        if ("ON".equals(rememberMe)) {
            cUsername.setMaxAge(7 * 24 * 60 * 60);
        } else {
            cUsername.setMaxAge(0);
        }
        response.addCookie(cUsername);

        // Phân quyền theo roleID nếu đã có e_id
        redirectBasedOnRole(user, request, response);
    }

    // Hàm phân quyền dựa trên roleID
    private void redirectBasedOnRole(User user, HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        switch (user.getRoleID()) {
            case 1:
                response.sendRedirect(request.getContextPath() + "/blog/createblog");
                break;
            case 8:
                response.sendRedirect(request.getContextPath() + "/admin/menu.jsp");
                break;
            case 3:
                response.sendRedirect(request.getContextPath() + "/BusTripURL?service=listOfAll");
                break;
            case 4:
                response.sendRedirect(request.getContextPath() + "/BusRouteURL?service=listOfAll");
                break;
            case 5:
                response.sendRedirect(request.getContextPath() + "/promotion/promotion_code");
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
        return "Employee Login Controller";
    }
}