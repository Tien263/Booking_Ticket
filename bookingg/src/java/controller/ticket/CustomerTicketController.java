/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.ticket;

import dal.ticket.TicketDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.ArrayList;
import model.Customer;
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
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            TicketDAO ticketDAO = new TicketDAO();
            String service = request.getParameter("service");
            if ("cancel".equals(service)) {
                int ticketId = Integer.parseInt(request.getParameter("t_id"));
                String sql = "SELECT t.t_id, c.c_fullname, br.br_from, br.br_to, t.t_purchaseDate, "
                        + "bt1.bt1_date, bt1.bt1_departureTime, bt1.bt1_arrivalTime, "
                        + "s.s_name, v.v_type, v.v_licensePlate, br.br_price, t.t_status "
                        + "FROM Tickets t "
                        + "JOIN BookTickets bt ON t.bt_id = bt.bt_id "
                        + "JOIN Customer c ON bt.c_id = c.c_id "
                        + "JOIN BusTrips bt1 ON t.bt1_id = bt1.bt1_id "
                        + "JOIN BusRoutes br ON bt1.br_id = br.br_id "
                        + "JOIN Seats s ON t.s_id = s.s_id "
                        + "JOIN Vehicles v ON s.v_id = v.v_id "
                        + "WHERE t.t_id = ? ";
                Ticket ticket = ticketDAO.getTicket(sql, ticketId);
                if (ticket != null) {
                    LocalDate today = LocalDate.now();
                    LocalDate purchaseDate = ticket.getPurchaseDate();

                    // Kiểm tra nếu vé ở trạng thái "pending" và ngày mua không quá 1 ngày
                    if ("pending".equals(ticket.getStatus())) {
                        boolean updated = ticketDAO.updateTicketStatus(ticketId, "cancelled");

                        if (updated) {
                            session.setAttribute("success", "Vé đã được phê duyệt.");
                            session.removeAttribute("error"); 
                        } else {
                            session.setAttribute("error", "Hủy vé thất bại.");
                        }
                    } else {
                        session.setAttribute("error", "Vé đã quá thời gian.");
                    }
                } else {
                    session.setAttribute("error", "Không tìm thấy vé.");
                }
                response.sendRedirect("CustomerTicketURL?service=listOfAll");
            }
            if ("detail".equals(service)) {
                int ticketId = Integer.parseInt(request.getParameter("t_id"));
                String sql = "SELECT t.t_id, c.c_fullname, br.br_from, br.br_to, t.t_purchaseDate, "
                        + "bt1.bt1_date, bt1.bt1_departureTime, bt1.bt1_arrivalTime, "
                        + "s.s_name, v.v_type, v.v_licensePlate, br.br_price, t.t_status "
                        + "FROM Tickets t "
                        + "JOIN BookTickets bt ON t.bt_id = bt.bt_id "
                        + "JOIN Customer c ON bt.c_id = c.c_id "
                        + "JOIN BusTrips bt1 ON t.bt1_id = bt1.bt1_id "
                        + "JOIN BusRoutes br ON bt1.br_id = br.br_id "
                        + "JOIN Seats s ON t.s_id = s.s_id "
                        + "JOIN Vehicles v ON s.v_id = v.v_id "
                        + "WHERE t.t_id = ? ";
                Ticket ticket = ticketDAO.getTicket(sql, ticketId);
                request.setAttribute("ticket", ticket);
                request.getRequestDispatcher("customer_ticket_detail.jsp").forward(request, response);
            }
            if (service == null || "listOfAll".equals(service)) {
                Customer customer = (Customer) session.getAttribute("customer");
                if (customer == null) {
                    request.setAttribute("message", "Không tìm thấy thông tin khách hàng.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
                // Query với parameter thay vì nối chuỗi
                String sql = "SELECT t.t_id, c.c_fullname, br.br_from, br.br_to, t.t_purchaseDate, "
                        + "bt1.bt1_date, bt1.bt1_departureTime, bt1.bt1_arrivalTime, "
                        + "s.s_name, v.v_type, v.v_licensePlate, br.br_price, t.t_status "
                        + "FROM Tickets t "
                        + "JOIN BookTickets bt ON t.bt_id = bt.bt_id "
                        + "JOIN Customer c ON bt.c_id = c.c_id "
                        + "JOIN BusTrips bt1 ON t.bt1_id = bt1.bt1_id "
                        + "JOIN BusRoutes br ON bt1.br_id = br.br_id "
                        + "JOIN Seats s ON t.s_id = s.s_id "
                        + "JOIN Vehicles v ON s.v_id = v.v_id "
                        + "WHERE c.c_email = ? "
                        + "ORDER BY t.t_id DESC";
                ArrayList<Ticket> tickets = ticketDAO.getTicket(sql, customer.getEmail());
                if (tickets == null) {
                    request.setAttribute("message", "Không có vé nào phù hợp.");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
                request.setAttribute("tickets", tickets);
                request.getRequestDispatcher("customer_ticket.jsp").forward(request, response);
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
