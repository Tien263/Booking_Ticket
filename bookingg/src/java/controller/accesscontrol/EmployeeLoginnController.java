package controller.accesscontrol;

import dal.EmployeeDao;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import model.User;

public class EmployeeLoginnController extends HttpServlet {

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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        EmployeeDao ed = new EmployeeDao();
        HttpSession session = request.getSession();      
        if (ed.checkUserNameExist(username)) {
            User u = ed.getEmployeeByUsername(username, password);
            
            if(u != null){
                session.setAttribute("user", u);
                
                if(u.hasEmployeeInfo()){
                    response.sendRedirect("car.html");
                }else{
                    response.sendRedirect("update_employee.jsp");
                }
            } else {
                request.setAttribute("loginerror", "Wrong passoword!");
                request.getRequestDispatcher("employee_login.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("loginerror", "Username not exists. Choose another Username!");
            request.getRequestDispatcher("employee_login.jsp").forward(request, response);

        }
    }

    @Override
    public String getServletInfo() {
        return "Employee Login Controller";
    }
    
    public static void main(String[] args) {
        // Dữ liệu đầu vào để kiểm tra
        String username = "admin1"; // Thay bằng username muốn kiểm tra
        String password = "123";   // Thay bằng password muốn kiểm tra

        // Khởi tạo DAO để xử lý dữ liệu
        EmployeeDao ed = new EmployeeDao();

        // Kiểm tra username tồn tại
        if (ed.checkUserNameExist(username)) {
            // Lấy thông tin user từ cơ sở dữ liệu
            User u = ed.getEmployeeByUsername(username, password);

            if (u != null) {
                System.out.println("Login successful for user: " + u.getUsername());

                // Kiểm tra xem user có thông tin Employee hay không
                if (u.hasEmployeeInfo()) {
                    System.out.println("User has employee information.");
                } else {
                    System.out.println("User does not have employee information. Redirect to update information.");
                }
            } else {
                System.out.println("Login failed: Wrong password!");
            }
        } else {
            System.out.println("Login failed: Username does not exist!");
        }
    }
}

