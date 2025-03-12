/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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

/**
 *
 * @author ADMIN
 */
public class UpdateEmployeeController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
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

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
            currentUser.seteId(currentUser.geteId()); // 🔄 Cập nhật e_id vào User object
            session.setAttribute("user", currentUser); // 🔄 Cập nhật lại session
            System.out.println("✅ Employee updated! Redirecting to car.html");
            response.sendRedirect("car.html");
        } else {
            request.setAttribute("error", "Update failed. Please try again.");
            request.getRequestDispatcher("update_employee.jsp").forward(request, response);
        }
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
        // Tạo DAO
        EmployeeDao employeeDao = new EmployeeDao();

        // Test CASE 1: Insert Employee
        System.out.println("Testing INSERT Employee...");
        Employee newEmp = new Employee();
        newEmp.setName("Nguyen Van A");
        newEmp.setPhone("0987654321");
        newEmp.setAddress("Hanoi, Vietnam");
        newEmp.setGender(true); // true = Male, false = Female

        boolean isInserted = employeeDao.insertEmployee(newEmp);
        if (isInserted) {
            System.out.println("Employee Inserted Successfully! New ID: " + newEmp.getId());
        } else {
            System.out.println("Employee Insert Failed!");
        }

        // Test CASE 2: Update Employee (giả sử có e_id = 1)
        System.out.println("\nTesting UPDATE Employee...");
        Employee existingEmp = new Employee();
        existingEmp.setId(1); // Giả sử e_id = 1
        existingEmp.setName("Tran Van B");
        existingEmp.setPhone("0123456789");
        existingEmp.setAddress("Ho Chi Minh City");
        existingEmp.setGender(false); // Female

    }

}
