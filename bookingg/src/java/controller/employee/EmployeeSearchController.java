/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.employee;

import dal.EmployeeDao;
import dal.RoleDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Employee;
import model.Role;

/**
 *
 * @author ADMIN
 */
public class EmployeeSearchController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EmployeeSearchController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EmployeeSearchController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String raw_id = request.getParameter("id");
        String raw_name = request.getParameter("name");
        String raw_gender = request.getParameter("gender");
        String raw_address = request.getParameter("address");
        String raw_phone = request.getParameter("phone");
        String raw_roleId = request.getParameter("roleId");
        
        
        Integer id = (raw_id != null && !raw_id.isBlank()) ? Integer.parseInt(raw_id) : null;
        String name = raw_name;
        Boolean gender = (raw_gender != null && !raw_gender.equals("both")) ? raw_gender.equals("male") : null;
        String address = raw_address;
        String phone = raw_phone;
        Integer roleId = (raw_roleId != null && !raw_roleId.equals("-1")) ? Integer.parseInt(raw_roleId) : null;

        EmployeeDao dbEmp = new EmployeeDao();
        RoleDao dbRole = new RoleDao();
        ArrayList<Employee> emps = dbEmp.search(id, name, phone, address, gender, roleId);
        request.setAttribute("emps", emps);
        
        ArrayList<Role> roles = dbRole.list();
        request.setAttribute("roles", roles);
        request.getRequestDispatcher("employeesearch.jsp").forward(request, response);
    }   
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
