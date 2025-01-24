/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.accesscontrol;

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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Register</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Register at " + request.getContextPath() + "</h1>");
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
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmpass = request.getParameter("confirmpass");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        Boolean gender = true;

        CustomerDao cd = new CustomerDao();
        Customer c = new Customer(email, fullname, phone, address, true, username, password);
        if (cd.checkEmailExist(email)) {
            request.setAttribute("error", "Email exists. Choose another email!");
            request.setAttribute("fullname", fullname);
            request.setAttribute("username", username);
            request.setAttribute("phone", phone);
            request.setAttribute("address", address);
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        if (cd.checkUsernameExist(username)) {
            request.setAttribute("error", "Username exists. Choose another username!");
            request.setAttribute("fullname", fullname);
            request.setAttribute("username", username);
            request.setAttribute("phone", phone);
            request.setAttribute("address", address);
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
        if (!phone.matches("\\d{10}")) {
            request.setAttribute("error", "Wrong phone format! Must be 10 digits!");
            request.setAttribute("fullname", fullname);
            request.setAttribute("username", username);
            request.setAttribute("phone", phone);
            request.setAttribute("address", address);
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        if(cd.checkPhoneExist(phone)) {
            request.setAttribute("error", "Phone exists. Choose another phone!");
            request.setAttribute("fullname", fullname);
            request.setAttribute("username", username);
            request.setAttribute("phone", phone);
            request.setAttribute("address", address);
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }

        cd.insert(c);
        response.sendRedirect("login.html");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

