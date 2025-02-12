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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String forgot = request.getParameter("forgot");
        BCrypt bCrypt = new BCrypt();
//        String password1 =  bCrypt.hashpw(password, bCrypt.gensalt());
        CustomerDao cd = new CustomerDao();
        Customer customer = cd.getByEmail(email);
        HttpSession session = request.getSession();
        UtilityMail mailUtility = new UtilityMail();

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
                response.sendRedirect("car.html");
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

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        CustomerDao customerDao = new CustomerDao();

        System.out.print("Enter email: ");
        String email = scanner.nextLine();

        System.out.print("Enter password: ");
        String password = scanner.nextLine();

        // Gọi DAO để lấy Customer từ Database
        Customer c = customerDao.getCustomerByEmail(email, password);

        if (c != null) {
            System.out.println("\nLogin successful! ✅");
            System.out.println("Email: " + c.getEmail());
            System.out.println("password: " + c.getPassword());

            // Kiểm tra thông tin khách hàng đã đầy đủ chưa
            scanner.close();
        }
    }
}
