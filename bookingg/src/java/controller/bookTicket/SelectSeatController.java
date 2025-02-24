/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.bookTicket;

import dal.bookTicket.DAOSeats;
import dal.bookTicket.DAOTickets;
import dal.bookTicket.DAOTrips;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

/**
 *
 * @author Admin
 */
public class SelectSeatController extends HttpServlet {

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
            String service = request.getParameter("service");
            if (service == null) {
                request.setAttribute("message", "Invalid request!");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            if ("selectSeat".equals(service)) {
                DAOSeats seatsDAO = new DAOSeats();
                DAOTrips tripsDAO = new DAOTrips();
                try {
                    int routeId = Integer.parseInt(request.getParameter("routeId"));
                    int tripId = Integer.parseInt(request.getParameter("tripId"));
                    int vehicleId = Integer.parseInt(request.getParameter("vehicleId"));
                    double price = Double.parseDouble(request.getParameter("price"));
                    String routeFrom = request.getParameter("from");
                    String routeTo = request.getParameter("to");
                    String departureTime = request.getParameter("departureTime");
                    String arrivalTime = request.getParameter("arrivalTime");
                    int userId = Integer.parseInt(request.getParameter("customerId"));

                    String[] seatIdsArray = request.getParameterValues("seatIds");
                    if (seatIdsArray == null || seatIdsArray.length == 0) {
                        request.setAttribute("message", "No seat selected!");
                        request.getRequestDispatcher("error.jsp").forward(request, response);
                        return;
                    }

                    List<Integer> seatIds = Arrays.stream(seatIdsArray)
                            .map(Integer::parseInt)
                            .toList();
                    List<String> seatNames = seatIds.stream()
                            .map(seatsDAO::getSeatName)
                            .filter(Objects::nonNull)
                            .toList();

                    double totalPrice = price * seatIds.size();
                    request.setAttribute("customerId", userId);
                    request.setAttribute("routeId", routeId);
                    request.setAttribute("tripId", tripId);
                    request.setAttribute("vehicleId", vehicleId);
                    request.setAttribute("routeFrom", routeFrom);
                    request.setAttribute("routeTo", routeTo);
                    request.setAttribute("departureTime", departureTime);
                    request.setAttribute("arrivalTime", arrivalTime);
                    request.setAttribute("seatNames", seatNames);
                    request.setAttribute("seatIds", seatIds);
                    request.setAttribute("totalPrice", totalPrice);
                    request.getRequestDispatcher("payment.jsp").forward(request, response);
                } catch (NumberFormatException e) {
                    request.setAttribute("message", "Lỗi dữ liệu payment: " + e.getMessage());
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("message", "Invalid request!");
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
