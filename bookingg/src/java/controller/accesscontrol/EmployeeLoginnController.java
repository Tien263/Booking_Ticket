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

        // Xử lý "Remember Me"
        if ("ON".equals(rememberMe)) {
            cUsername.setMaxAge(7 * 24 * 60 * 60);
        } else {
            cUsername.setMaxAge(0);
        }
        response.addCookie(cUsername);

        // Chuyển hướng theo vai trò của user
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
        return "Employee Login Controller";
    }
}
