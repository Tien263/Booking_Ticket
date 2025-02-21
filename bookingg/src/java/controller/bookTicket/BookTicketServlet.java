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
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

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

        String service = request.getParameter("service");
        if (service == null) {
            sendErrorMessage(request, response, "Invalid request!");
            return;
        }
        
        switch (service) {
            case "selectSeat":
                handleSelectSeat(request, response);
                break;

            default:
                sendErrorMessage(request, response, "Unknown service!");
        }
    }

    private void handleSelectSeat(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            DAOTickets ticketsDAO = new DAOTickets();
            DAOSeats seatsDAO = new DAOSeats();
            DAOTrips tripsDAO = new DAOTrips();

            int routeId = Integer.parseInt(request.getParameter("routeId"));
            int tripId = Integer.parseInt(request.getParameter("tripId"));
            double price = Double.parseDouble(request.getParameter("price"));
            int userId = 1; // Giả sử user đã đăng nhập

            String[] seatIdsArray = request.getParameterValues("seatIds");
            if (seatIdsArray == null || seatIdsArray.length == 0) {
                sendErrorMessage(request, response, "No seat selected!");
                return;
            }

            List<Integer> seatIds = Arrays.stream(seatIdsArray)
                    .map(Integer::parseInt)
                    .toList();

            // Đặt vé
            List<Integer> bookingIds = ticketsDAO.createAndBookTickets(userId, seatIds, tripId, price);
            if (bookingIds.isEmpty()) { // Kiểm tra nếu không có vé nào được đặt
                sendErrorMessage(request, response, "Đặt vé thất bại!");
                return;
            }

            // Lấy thông tin ghế, chuyến đi
            String routeName = tripsDAO.getRouteName(routeId);
            String tripName = tripsDAO.getTripName(tripId);
            List<String> seatNames = seatIds.stream()
                    .map(seatsDAO::getSeatName)
                    .filter(Objects::nonNull)
                    .toList();

            double totalPrice = price * seatIds.size();
            request.setAttribute("bookingIds", bookingIds);
            request.setAttribute("routeName", routeName);
            request.setAttribute("tripName", tripName);
            request.setAttribute("seatNames", seatNames);
            request.setAttribute("seatIds", seatIds);
            request.setAttribute("totalPrice", totalPrice);

            request.getRequestDispatcher("payment.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            sendErrorMessage(request, response, "Lỗi dữ liệu payment: " + e.getMessage());
        }
    }

    private void sendErrorMessage(HttpServletRequest request, HttpServletResponse response, String message)
            throws ServletException, IOException {
        request.setAttribute("message", message);
        request.getRequestDispatcher("error.jsp").forward(request, response);
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
