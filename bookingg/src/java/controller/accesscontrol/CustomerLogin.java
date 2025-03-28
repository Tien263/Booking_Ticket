/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.accesscontrol;

import MD5.BCrypt;
import dal.CustomerDao;
import dal.UtilityMail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.Scanner;
import model.Customer;
import model.Employee;

/**
 *
 * @author ADMIN
 */
public class CustomerLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CustomerLogin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerLogin at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String forgot = request.getParameter("forgot");
        CustomerDao cd = new CustomerDao();
        Customer customer = cd.getByEmail(email);
        HttpSession session = request.getSession();
        UtilityMail mailUtility = new UtilityMail();
        Employee loggedUser = (Employee) session.getAttribute("user");

        session.setAttribute("user", loggedUser);
        if (forgot != null) {
            handleForgotPassword(request, response, session, email, customer, cd, mailUtility);
            return;
        }

        if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
            request.setAttribute("loginerror", "Email and Password are required!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        
        if (cd.checkEmailExist(email)) {
            Customer c = cd.getCustomerByEmail(email, password);
            if (c != null) {     
                session.setAttribute("customer", c);
                session.setAttribute("user", email);
                session.setAttribute("c_id", c.getId()); 
                int flag =0;
                try {
                      flag = (int) session.getAttribute("flag");
                } catch (Exception e) {
                     response.sendRedirect("home.jsp");
                     return;
                }
                if (flag != 0) {
                     response.sendRedirect("SeatURL");
                     return;
                }
                response.sendRedirect("home.jsp");

            } else {
                request.setAttribute("loginerror", "Wrong passoword!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } else {
            request.setAttribute("loginerror", "Email not exists. Choose another email!");
            request.getRequestDispatcher("login.jsp").forward(request, response);

        }
    }

    private void handleForgotPassword(HttpServletRequest request, HttpServletResponse response, HttpSession session,
            String email, Customer customer, CustomerDao cdao, UtilityMail mailUtility)
            throws ServletException, IOException {
        try {
            if (customer != null) {

                // Mask the email for display
                String maskedEmail = mailUtility.maskEmail(email);
                String otpMessage = "We just sent an OTP to your email " + maskedEmail + ". Please use it to reset your password within 30 minutes.";

                // Generate OTP and set it in the session along with the creation time
                String otpCode = mailUtility.generateOtp();
                session.setAttribute("otp", otpCode);
                session.setAttribute("otpCreationTime", LocalDateTime.now());
                session.setAttribute("email", email);
                session.setAttribute("purpose", "forgot");

                // Send OTP email for password reset
                mailUtility.sendOtpEmail(email, otpCode, "reset");

                // Forward to OTP verification page with success message
                request.setAttribute("message", otpMessage);
                request.setAttribute("type", "info");
                request.getRequestDispatcher("verifyOtp.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Invalid email for password reset.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred. Please try again.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
