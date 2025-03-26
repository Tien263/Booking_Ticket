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
import java.util.ArrayList;
import java.util.List;
import model.ticket.Ticket;

/**
 *
 * @author Admin
 */
public class TicketController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific errorr occurs
     * @throws IOException if an I/O errorr occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        TicketDAO ticketDAO = new TicketDAO();
        String service = request.getParameter("service");

        if (service == null || "listOfAll".equals(service)) {
            int page = 1; // Trang mặc định
            int recordsPerPage = 8; // Số vé hiển thị mỗi trang

            // Lấy trang hiện tại từ request
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }

            String baseSql = "FROM Tickets t "
                    + "JOIN BookTickets bt ON t.bt_id = bt.bt_id "
                    + "JOIN Customer c ON bt.c_id = c.c_id "
                    + "JOIN BusTrips bt1 ON t.bt1_id = bt1.bt1_id "
                    + "JOIN BusRoutes br ON bt1.br_id = br.br_id "
                    + "JOIN Seats s ON t.s_id = s.s_id "
                    + "JOIN Vehicles v ON s.v_id = v.v_id "
                    + "WHERE 1=1 ";

            List<Object> params = new ArrayList<>();
            // Lưu SQL gốc trước khi áp dụng bộ lọc

            // **Lọc dữ liệu**
            String from = request.getParameter("br_from");
            String to = request.getParameter("br_to");
            String departureDate = request.getParameter("departureDate");
            String purchaseDate = request.getParameter("purchaseDate");

            if (from != null && !from.trim().isEmpty()) {
                baseSql += " AND br.br_from LIKE ?";
                params.add("%" + from + "%");
            }
            if (to != null && !to.trim().isEmpty()) {
                baseSql += " AND br.br_to LIKE ?";
                params.add("%" + to + "%");
            }
            if (departureDate != null && !departureDate.isEmpty()) {
                baseSql += " AND bt1.bt1_date = ?";
                params.add(departureDate);
            }
            if (purchaseDate != null && !purchaseDate.isEmpty()) {
                baseSql += " AND t.t_purchaseDate = ?";
                params.add(purchaseDate);
            }
            // **Tính tổng số vé**
            int totalRecords = ticketDAO.getTotalTickets(baseSql, params);
            int endPage = (int) Math.ceil((double) totalRecords / recordsPerPage);

            // **Thêm phân trang vào SQL**
            String sql = "SELECT t.t_id, c.c_fullname, br.br_from, br.br_to, t.t_purchaseDate, "
                    + "bt1.bt1_date, bt1.bt1_departureTime, bt1.bt1_arrivalTime, "
                    + "s.s_name, v.v_type, v.v_licensePlate, br.br_price, t.t_status "
                    + baseSql
                    + " ORDER BY t.t_id DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

            params.add((page - 1) * recordsPerPage); // OFFSET
            params.add(recordsPerPage); // FETCH NEXT

            // **Lấy danh sách vé**
            ArrayList<Ticket> tickets = ticketDAO.getTicket(sql, params);

            if (tickets == null || tickets.isEmpty()) {
                request.setAttribute("message", "Không có vé nào phù hợp.");
            }

            // **Gửi dữ liệu đến JSP**
            request.setAttribute("tickets", tickets);
            request.setAttribute("currentPage", page);
            request.setAttribute("endPage", endPage);       
            request.setAttribute("br_from", from);
            request.setAttribute("br_to", to);
             request.setAttribute("departureDate", departureDate);
            request.setAttribute("purchaseDate", purchaseDate);

            request.getRequestDispatcher("/ticket/managerTickets.jsp").forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific errorr occurs
     * @throws IOException if an I/O errorr occurs
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
     * @throws ServletException if a servlet-specific errorr occurs
     * @throws IOException if an I/O errorr occurs
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
