package controller.accesscontrol;

import MD5.BCrypt;
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
import java.util.Scanner;
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
        String password1= bCrypt.hashpw(password, bCrypt.gensalt());
        EmployeeDao ed = new EmployeeDao();
        HttpSession session = request.getSession();
        
        User user = ed.getUserByUsernameAndPassword(username, password);

        if (user != null) {
            session.setAttribute("user", user);
            System.out.println("Login success: " + user.getUsername() + ", e_id: " + user.geteId());

            if (user.hasEmployeeInfo()) { 
                // Nếu user đã có e_id, chuyển luôn đến car.html
                response.sendRedirect("car.html");
            } else { 
                // Nếu user chưa có e_id, yêu cầu cập nhật thông tin Employee
                response.sendRedirect("update_employee.jsp");
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

