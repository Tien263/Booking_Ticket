/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.accesscontrol;

import dal.DAOBookTickets;
import dal.DAORoutes;
import dal.DAOSeats;
import dal.DAOTickets;
import dal.DAOTrips;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class BookTicketServlet extends HttpServlet {

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
        DAOTickets ticketsDAO = new DAOTickets();
        DAOBookTickets bookTicketsDAO = new DAOBookTickets();
        DAOSeats seatsDAO = new DAOSeats();
        DAORoutes routesDAO = new DAORoutes();
        DAOTrips tripsDAO = new DAOTrips();
        try (PrintWriter out = response.getWriter()) {
            try {
                int routeId = Integer.parseInt(request.getParameter("routeId"));
                int tripId = Integer.parseInt(request.getParameter("tripId"));
                int vehicleId = Integer.parseInt(request.getParameter("vehicleId"));
                int seatId = Integer.parseInt(request.getParameter("seatId"));
                double price = Double.parseDouble(request.getParameter("price"));

                // Tạo vé
                int ticketId = ticketsDAO.createTicket(seatId, tripId, price);
                seatsDAO.isSeatBooked(seatId);

                if (ticketId > 0) {
                    int bookingId = bookTicketsDAO.bookTicket(ticketId);
                    if (bookingId > 0) {
                        // Lấy thông tin chi tiết vé
                        String routeName = routesDAO.getRouteName(routeId);
                        String tripName = tripsDAO.getTripName(tripId);
                        String seatName = seatsDAO.getSeatName(seatId);

                        request.setAttribute("ticketId", ticketId);
                        request.setAttribute("routeName", routeName);
                        request.setAttribute("tripName", tripName);
                        request.setAttribute("seatName", seatName);
                        request.setAttribute("price", price);
                        request.getRequestDispatcher("confirmation.jsp").forward(request, response);
                    } else {
                        request.setAttribute("message", "Booking failed!");
                        request.getRequestDispatcher("error.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("message", "Ticket creation failed!");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            } catch (NumberFormatException e) {
                request.setAttribute("message", "Error: " + e.getMessage());
                request.getRequestDispatcher("error.jsp").forward(request, response);
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
