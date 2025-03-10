package controller.accesscontrol;

import MD5.BCrypt;
import dal.EmployeeDao;
import dal.UserDBContext;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;
import java.util.Scanner;
import model.Employee;
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
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        BCrypt bCrypt = new BCrypt();
        EmployeeDao ed = new EmployeeDao();
        HttpSession session = request.getSession();

        User user = ed.getUserByUsernameAndPassword(username, password);

        if (user != null) {
            Employee employee = ed.getEmployeeById(user.geteId()); // Lấy Employee từ User ID
            if (employee == null) {
                request.setAttribute("loginerror", "Không tìm thấy thông tin nhân viên!");
                request.getRequestDispatcher("employee_login.jsp").forward(request, response);
                return;
            }
            session.setAttribute("user", employee); // Lưu Employee thay vì User
            session.setAttribute("user_id", user.geteId()); // Đảm bảo được đặt đúng

            // Lấy danh sách roles của user
            UserDBContext userDB = new UserDBContext();
            List<String> roles = userDB.getRolesByUsername(username);
            session.setAttribute("roles", roles);

            // Nếu không có vai trò nào, tức là khách hàng
            if (roles.isEmpty()) {
                response.sendRedirect("update_employee.jsp");
                return;
            }

            // Kiểm tra quyền và điều hướng
            if (roles.contains("Blog Manager")) {
                response.sendRedirect("blog/createblog.jsp");
            } else if (roles.contains("Promotion Manager")) {
                response.sendRedirect("Promotion.jsp");
            } else if (roles.contains("Sale")) {
                response.sendRedirect("sale_dashboard.jsp");
            } else {
                response.sendRedirect("access_denied.jsp");
            }
        } else {
            request.setAttribute("loginerror", "Invalid username or password!");
            request.getRequestDispatcher("employee_login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//        EmployeeDao ed = new EmployeeDao();
//        HttpSession session = request.getSession();      
//        if (ed.checkUserNameExist(username)) {
//            User u = ed.getEmployeeByUsername(username, password);
//            
//            if(u != null){
//                session.setAttribute("user", u);
//                
//                if(u.hasEmployeeInfo()){
//                    response.sendRedirect("car.html");
//                }else{
//                    response.sendRedirect("update_employee.jsp");
//                }
//            } else {
//                request.setAttribute("loginerror", "Wrong passoword!");
//                request.getRequestDispatcher("employee_login.jsp").forward(request, response);
//            }
//        } else {
//            request.setAttribute("loginerror", "Username not exists. Choose another Username!");
//            request.getRequestDispatcher("employee_login.jsp").forward(request, response);
//
//        }
    }

    @Override
    public String getServletInfo() {
        return "Employee Login Controller";
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        EmployeeDao employeeDao = new EmployeeDao();

        System.out.print("Enter username: ");
        String username = scanner.nextLine();

        System.out.print("Enter password: ");
        String password = scanner.nextLine();

        // Gọi DAO để lấy User từ Database
        User user = employeeDao.getUserByUsernameAndPassword(username, password);

        if (user != null) {
            System.out.println("\nLogin successful!");
            System.out.println("Username: " + user.getUsername());
            System.out.println("Password: " + user.getPassword());
            System.out.println("e_id: " + user.geteId());

            // Kiểm tra user có Employee chưa
            if (user.hasEmployeeInfo()) {
                System.out.println("Redirecting to: car.html 🚗");
            } else {
                System.out.println("Redirecting to: update_employee.jsp ✍️ (Need to update Employee info)");
            }
        } else {
            System.out.println("\nInvalid username or password! ❌");
        }

        scanner.close();
    }

//    public static void main(String[] args) {
//        // Dữ liệu đầu vào để kiểm tra
//        String username = "admin1"; // Thay bằng username muốn kiểm tra
//        String password = "123";   // Thay bằng password muốn kiểm tra
//
//        // Khởi tạo DAO để xử lý dữ liệu
//        EmployeeDao ed = new EmployeeDao();
//
//        // Kiểm tra username tồn tại
//        if (ed.checkUserNameExist(username)) {
//            // Lấy thông tin user từ cơ sở dữ liệu
//            User u = ed.getEmployeeByUsername(username, password);
//
//            if (u != null) {
//                System.out.println("Login successful for user: " + u.getUsername());
//
//                // Kiểm tra xem user có thông tin Employee hay không
//                if (u.hasEmployeeInfo()) {
//                    System.out.println("User has employee information.");
//                } else {
//                    System.out.println("User does not have employee information. Redirect to update information.");
//                }
//            } else {
//                System.out.println("Login failed: Wrong password!");
//            }
//        } else {
//            System.out.println("Login failed: Username does not exist!");
//        }
//    }
}
