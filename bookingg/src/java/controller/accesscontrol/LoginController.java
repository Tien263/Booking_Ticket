/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.accesscontrol;

import dal.UserDBContext;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.User;

/**
 *
 * @author sonng
 */
public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user = req.getParameter("username");
        String pass = req.getParameter("password");

        UserDBContext db = new UserDBContext();
        User account = db.get(user, pass);  // Không cần role nữa

        if (account != null) {
            req.getSession().setAttribute("account", account);

            // Gửi thông báo login success qua request
            req.setAttribute("submit", "Login success!");

            // Forward request tới trang 'home.jsp' hoặc trang chính
            req.getRequestDispatcher("home.jsp").forward(req, resp);  // Chuyển hướng tới trang 'home.jsp' với thông báo
        } else {
            req.getSession().setAttribute("err", "Username hoặc password không đúng!");
            req.getSession().setAttribute("username", user);
            resp.sendRedirect("login");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //pre-processing
        req.getRequestDispatcher("login.jsp").forward(req, resp);
        //post-processing
    }
}
