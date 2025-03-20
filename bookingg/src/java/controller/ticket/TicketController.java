/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.ticket;

import dal.ticket.TicketDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.ticket.Ticket;

/**
 *
 * @author Admin
 */
@WebServlet(name = "TicketController", urlPatterns = {"/TicketURL"})
public class TicketController extends HttpServlet {

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
        TicketDAO ticketDAO = new TicketDAO();
        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            if (service.endsWith("listOfAll")) {
                String submit = request.getParameter("submit");
                String sql = "SELECT t.t_id,c.c_fullname,br.br_from,br.br_to,t.t_purchaseDate,"
                        + "    bt1.bt1_date,bt1.bt1_departureTime,bt1.bt1_arrivalTime,"
                        + "    s.s_name,v.v_type,v.v_licensePlate,br.br_price,t.t_status"
                        + "FROM Tickets t\n"
                        + "JOIN BookTickets bt ON t.bt_id = bt.bt_id\n"
                        + "JOIN Customer c ON bt.c_id = c.c_id\n"
                        + "JOIN BusTrips bt1 ON t.bt1_id = bt1.bt1_id\n"
                        + "JOIN BusRoutes br ON bt1.br_id = br.br_id\n"
                        + "JOIN Seats s ON t.s_id = s.s_id\n"
                        + "JOIN Vehicles v ON s.v_id = v.v_id;";
                if (submit != null) {
                    String departureDate = request.getParameter("departureDate");
                    String routeID = request.getParameter("routeID");
                    String departureTime = request.getParameter("departureTime");
                    if (departureDate != null && !departureDate.isEmpty()) {
                        sql += "AND t.travelDate = '" + departureDate + "' ";
                    }
                    if (routeID != null && !routeID.isEmpty()) {
                        sql += "AND br.routeID = " + routeID + " ";
                    }
                    if (departureTime != null && !departureTime.isEmpty()) {
                        sql += "AND t.departureTime = '" + departureTime + "' ";
                    }
                    ArrayList<Ticket> tickets = ticketDAO.getTicket(sql);
                    request.setAttribute("tickets", tickets);
                    request.getRequestDispatcher("managerTicket.jsp").forward(request, response);
                }
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
