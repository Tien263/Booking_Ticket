/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.ticket;

import dal.ticket.TicketDAO;
import dal.ticket.BookedTicketDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Customer;
import model.ticket.BookedTicket;
import model.ticket.Ticket;

/**
 *
 * @author Admin
 */
public class CustomerTicketController extends HttpServlet {

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
        HttpSession session = request.getSession();
        TicketDAO ticketDAO = new TicketDAO();
        BookedTicketDAO bookedTicketDAO = new BookedTicketDAO();
        String service = request.getParameter("service");

        if (service == null || "listOfAll".equals(service)) {
            Customer customer = (Customer) session.getAttribute("customer");
            if (customer == null) {
                request.setAttribute("message", "Không tìm thấy thông tin khách hàng.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            // Phân trang
            int page = 1;
            int recordsPerPage = 5;
            try {
                if (request.getParameter("page") != null) {
                    page = Integer.parseInt(request.getParameter("page"));
                }
            } catch (NumberFormatException e) {
                session.setAttribute("error", "Tham số trang không hợp lệ.");
                page = 1;
            }

            // SQL cơ bản để tính tổng số bản ghi
            String baseSql = "SELECT COUNT(*) "
                    + "FROM [PROJECTV01].[dbo].[BookTickets] bt "
                    + "JOIN [PROJECTV01].[dbo].[Customer] c ON bt.c_id = c.c_id "
                    + "WHERE c.c_email = ?";

            List<Object> countParams = new ArrayList<>();
            countParams.add(customer.getEmail());

            // Tính tổng số bản ghi
            int totalRecords = bookedTicketDAO.getTotalRecords(baseSql, countParams); // Cần thêm method này
            int endPage = (int) Math.ceil((double) totalRecords / recordsPerPage);

            // SQL để lấy danh sách với phân trang
            String sql = "SELECT bt.bt_id, bt.bt_status, bt.bt_bookingDate, bt.bt_ticketNumber, bt.bt_totalAmount, "
                    + "c.c_email, c.c_fullname, c.c_phone "
                    + "FROM [PROJECTV01].[dbo].[BookTickets] bt "
                    + "JOIN [PROJECTV01].[dbo].[Customer] c ON bt.c_id = c.c_id "
                    + "WHERE c.c_email = ? "
                    + "ORDER BY bt.bt_id DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

            List<Object> params = new ArrayList<>();
            params.add(customer.getEmail());
            params.add((page - 1) * recordsPerPage); // OFFSET
            params.add(recordsPerPage); // FETCH NEXT

            // Lấy danh sách vé
            ArrayList<BookedTicket> tickets = bookedTicketDAO.findByCustomerEmail(sql, params); // Sử dụng method mới

            if (tickets == null || tickets.isEmpty()) {
                request.setAttribute("message", "Không có vé nào phù hợp.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            // Gửi dữ liệu đến JSP
            request.setAttribute("tickets", tickets);
            request.setAttribute("currentPage", page);
            request.setAttribute("endPage", endPage);

            request.getRequestDispatcher("customer_ticket.jsp").forward(request, response);
        }

        if ("detail".equals(service)) {
            int bt_id = Integer.parseInt(request.getParameter("bt_id"));

            // Phân trang
            int page = 1;
            int recordsPerPage = 3;
            try {
                if (request.getParameter("page") != null) {
                    page = Integer.parseInt(request.getParameter("page"));
                }
            } catch (NumberFormatException e) {
                session.setAttribute("error", "Tham số trang không hợp lệ.");
                page = 1;
            }

            // SQL cơ bản
            String baseSql = "FROM Tickets t "
                    + "JOIN BookTickets bt ON t.bt_id = bt.bt_id "
                    + "JOIN Customer c ON bt.c_id = c.c_id "
                    + "JOIN BusTrips bt1 ON t.bt1_id = bt1.bt1_id "
                    + "JOIN BusRoutes br ON bt1.br_id = br.br_id "
                    + "JOIN Seats s ON t.s_id = s.s_id "
                    + "JOIN Vehicles v ON s.v_id = v.v_id "
                    + "WHERE bt.bt_id = ? ";

            List<Object> params = new ArrayList<>();
            params.add(bt_id);

            // Tính tổng số vé
            int totalRecords = ticketDAO.getTotalTickets(baseSql, params);
            int endPage = (int) Math.ceil((double) totalRecords / recordsPerPage);

            // Thêm phân trang vào SQL
            String sql = "SELECT t.t_id, c.c_fullname, br.br_from, br.br_to, t.t_purchaseDate, "
                    + "bt1.bt1_date, bt1.bt1_departureTime, bt1.bt1_arrivalTime, "
                    + "s.s_name, v.v_type, v.v_licensePlate, br.br_price, t.t_status "
                    + baseSql
                    + " ORDER BY t.t_id DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

            params.add((page - 1) * recordsPerPage); // OFFSET
            params.add(recordsPerPage); // FETCH NEXT

            // Lấy danh sách vé
            ArrayList<Ticket> tickets = ticketDAO.getTicket(sql, params);

            if (tickets == null || tickets.isEmpty()) {
                request.setAttribute("message", "Không có vé nào phù hợp.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            // Gửi dữ liệu đến JSP
            request.setAttribute("tickets", tickets);
            request.setAttribute("currentPage", page);
            request.setAttribute("endPage", endPage);

            request.getRequestDispatcher("customer_ticket_detail.jsp").forward(request, response);
        }

        if ("cancel".equals(service)) {
            int bt_id = Integer.parseInt(request.getParameter("bt_id"));
            boolean result = bookedTicketDAO.cancelBookingTicket(bt_id);

            // Xử lý kết quả
            if (result) {
                // Nếu hủy thành công, chuyển hướng đến listOfAll
                response.sendRedirect("CustomerTicketURL?service=listOfAll");
            } else {
                // Nếu hủy thất bại, lưu thông báo lỗi vào session
                session.setAttribute("error", "Không thể hủy vé với bt_id: " + bt_id);
                // Forward về trang hiện tại hoặc trang danh sách vé
                response.sendRedirect("CustomerTicketURL?service=listOfAll");
            }
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
        processRequest(request, response);
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

}
