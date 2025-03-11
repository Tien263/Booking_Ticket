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
import jakarta.servlet.annotation.WebServlet;
import model.Customer;

/**
 *
 * @author ADMIN
 */
public class ChangeAccountController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangeAccountController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangeAccountController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("change1.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        Boolean gender = Boolean.parseBoolean(request.getParameter("gender"));

        if (fullname == null || email == null || phone == null || gender == null) {

            request.setAttribute("error", "Missing required fields!");
            request.getRequestDispatcher("change1.jsp").forward(request, response);
            return;
        }

        CustomerDao cd = new CustomerDao();
        Customer c = new Customer(email, fullname, phone, address, gender, username);
        Customer currentCustomer = cd.getByEmail(email);
        if (currentCustomer == null) {
            request.setAttribute("error", "Account does not exist!");
            request.getRequestDispatcher("change1.jsp").forward(request, response);
            return;
        }

        // Kiểm tra username đã tồn tại hay chưa (trừ tài khoản hiện tại)
        if (cd.isUsernameExists(username, currentCustomer.getEmail())) {
            request.setAttribute("error", "Username already exists!");
            request.getRequestDispatcher("change1.jsp").forward(request, response);
            return;
        }

        // Kiểm tra phone đã tồn tại hay chưa (trừ tài khoản hiện tại)
        if (cd.isPhoneExists(phone, currentCustomer.getEmail())) {
            request.setAttribute("error", "Phone number already exists!");
            request.getRequestDispatcher("change1.jsp").forward(request, response);
            return;
        }

        // Nếu không trùng, tiến hành cập nhật
        cd.updateacc(c);
        Customer refreshedCustomer = cd.getByEmail(email);
        request.getSession().setAttribute("customer", refreshedCustomer);

        request.getSession().setAttribute("successMessage", "Account updated successfully!");
        response.sendRedirect("account");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public static void main(String[] args) {
        // Tạo dữ liệu đầu vào giả lập
        String fullname = "John Doe";
        String email = "johndoe@example.com"; // Email cần phải tồn tại trong DB để cập nhật
        String username = "johndoe";
        String password = "123456";
        String phone = "0123456789";
        String address = "123 Main Street";
        Boolean gender = true; // true: male, false: female

        // Kiểm tra xem các trường có hợp lệ hay không
        if (fullname == null || email == null || phone == null || gender == null) {
            System.out.println("Error: Missing required fields!");
            return;
        }

        // Tạo đối tượng Customer từ dữ liệu giả lập
        Customer customer = new Customer(email, fullname, phone, address, gender, username, password);

        // Tạo đối tượng CustomerDao để thao tác với cơ sở dữ liệu
        CustomerDao customerDao = new CustomerDao();

        // Gọi phương thức update và kiểm tra kết quả
//        boolean isUpdated = customerDao.update(customer);
        // Kiểm tra kết quả và in thông báo
//        if (isUpdated) {
        System.out.println("Customer information updated successfully!");
//        } else {
        // System.out.println("Failed to update customer information. Please check the input or database.");
    }
}

//}
