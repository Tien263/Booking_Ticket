/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.accesscontrol;

import dal.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

public class ResetPasswordController extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangePasswordController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePasswordController at " + request.getContextPath () + "</h1>");
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
        String username = (String) session.getAttribute("username");

        if (username == null) {
            response.sendRedirect("enter_username.jsp");
            return;
        }

        String oldPassword = request.getParameter("old_password");
        String newPassword = request.getParameter("new_password");
        String confirmPassword = request.getParameter("confirm_password");

        UserDBContext userDAO = new UserDBContext();
        User user = userDAO.getUserByUsername(username);

        if (user == null) {
            request.setAttribute("error", "User not found!");
            request.getRequestDispatcher("enter_username.jsp").forward(request, response);
            return;
        }

        if (!user.getPassword().equals(oldPassword)) {
            request.setAttribute("error", "Old password is incorrect!");
            request.getRequestDispatcher("reset_password.jsp").forward(request, response);
            return;
        }

        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "New password and confirm password do not match!");
            request.getRequestDispatcher("reset_password.jsp").forward(request, response);
            return;
        }

        boolean isUpdated = userDAO.updatePassword(username, newPassword);

        if (isUpdated) {
            request.setAttribute("success", "Password changed successfully!");
            session.removeAttribute("username"); // Xóa session để tránh lỗi bảo mật
            request.getRequestDispatcher("employee_login.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Failed to change password!");
            request.getRequestDispatcher("reset_password.jsp").forward(request, response);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
