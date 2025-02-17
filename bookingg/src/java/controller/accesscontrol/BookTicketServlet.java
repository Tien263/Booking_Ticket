/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.accesscontrol;

import dal.DAOSeats;
import dal.DAOTickets;
import dal.DAOTrips;
import entity.accesscontrol.BookTicket;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.Date;

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
        DAOSeats seatsDAO = new DAOSeats();
        DAOTrips tripsDAO = new DAOTrips();
        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");

            if (service.equals("dat-ve")) {
                request.getRequestDispatcher("selectSeat.jsp").forward(request, response);
            }
            ///Chọn ghế
            if (service.equals("selectSeat")) {
                try {
                    int routeId = Integer.parseInt(request.getParameter("routeId"));
                    int tripId = Integer.parseInt(request.getParameter("tripId"));
                    int vehicleId = Integer.parseInt(request.getParameter("vehicleId"));
                    int seatId = Integer.parseInt(request.getParameter("seatId"));
                    double price = Double.parseDouble(request.getParameter("price"));

                    // Tạo vé
                    int ticketId = ticketsDAO.createTicket(seatId, tripId, price);
                    seatsDAO.isSeatBooked(seatId, "reserved");

                    if (ticketId > 0) {
                        int bookingId = ticketsDAO.bookTicket(1, ticketId);
                        if (bookingId > 0) {
                            // Lấy thông tin chi tiết vé
                            String routeName = tripsDAO.getRouteName(routeId);
                            String tripName = tripsDAO.getTripName(tripId);
                            String seatName = seatsDAO.getSeatName(seatId);

                            request.setAttribute("bookingId", bookingId);
                            request.setAttribute("routeName", routeName);
                            request.setAttribute("tripName", tripName);
                            request.setAttribute("seatId", seatId);
                            request.setAttribute("seatName", seatName);
                            request.setAttribute("price", price);
                            request.getRequestDispatcher("payment.jsp").forward(request, response);
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

            //Confirm đặt vé
            if (service.equals("Confirmation")) {
                int bookingId = Integer.parseInt(request.getParameter("bookingId"));
                int seatId = Integer.parseInt(request.getParameter("seatId"));
                seatsDAO.isSeatBooked(seatId, "booked");
                if (ticketsDAO.confirmPayment(bookingId)) {
                    BookTicket bookTicket = ticketsDAO.getTicketByBookingId(bookingId);
                    if (bookTicket == null) {
                        request.setAttribute("message", "Không tìm thấy vé!");
                        request.getRequestDispatcher("error.jsp").forward(request, response);
                        return;
                    }

                    // Lấy routeId, tripId, seatId từ ticket
                    int ticketId = bookTicket.getBt_id();
                    String c_fullname = bookTicket.getC_fullname();
                    String c_phone = bookTicket.getC_phone();
                    Date bt_bookingDate = bookTicket.getBt_bookingDate();
                    String br_from = bookTicket.getBr_from();
                    String br_to = bookTicket.getBr_to();
                    String bt1_departureTime = bookTicket.getBt1_departureTime();
                    String bt1_arrivalTime = bookTicket.getBt1_arrivalTime();
                    String s_name = bookTicket.getS_name();
                    float t_price = bookTicket.getT_price();

                    request.setAttribute("bookingId", bookingId);
                    request.setAttribute("c_fullname", c_fullname);
                    request.setAttribute("c_phone", c_phone);
                    request.setAttribute("bt_bookingDate", bt_bookingDate);
                    request.setAttribute("br_from", br_from);
                    request.setAttribute("br_to", br_to);
                    request.setAttribute("bt1_departureTime", bt1_departureTime);
                    request.setAttribute("bt1_arrivalTime", bt1_arrivalTime);
                    request.setAttribute("s_name", s_name);
                    request.setAttribute("t_price", t_price);

                    request.getRequestDispatcher("confirmation.jsp").forward(request, response);
                } else {
                    request.setAttribute("message", "Thanh toán thất bại!");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
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
