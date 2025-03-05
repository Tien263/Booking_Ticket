/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.bookTicket;

import dal.bookTicket.ConfirmationDAO;
import dal.bookTicket.DAOSeats;
import dal.bookTicket.DAOTickets;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import model.bookTicket.BookTicket;

/**
 *
 * @author Admin
 */
public class BookTicketController extends HttpServlet {

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

        try {
            DAOTickets ticketsDAO = new DAOTickets();
            DAOSeats seatsDAO = new DAOSeats();
            int tripId = Integer.parseInt(request.getParameter("tripId"));
            int userId = Integer.parseInt(request.getParameter("customerId"));

            // Lấy danh sách ghế đã chọn
            String[] seatIdsArray = request.getParameterValues("seatId");
            if (seatIdsArray == null || seatIdsArray.length == 0) {
                request.setAttribute("message", "No seat selected!");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            List<Integer> seatIds = Arrays.stream(seatIdsArray)
                    .map(Integer::parseInt)
                    .toList();

            int bookingId = ticketsDAO.createAndBookTickets(userId, seatIds, tripId);
            if (bookingId == -1) {
                request.setAttribute("message", "Đặt vé thất bại!");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }
            // Cập nhật trạng thái ghế đã đặt
            for (Integer seatId : seatIds) {
                boolean success = seatsDAO.isSeatBooked(seatId, "booked");
                if (!success) {
                    request.setAttribute("message", "Lỗi khi cập nhật trạng thái ghế! Hãy liên hệ hỗ trợ.");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                    return;
                }
            }

            // Lấy danh sách vé đã đặt
            List<BookTicket> bookedTickets = ticketsDAO.getTicketByBookingId(bookingId);
            if (bookedTickets == null || bookedTickets.isEmpty()) {
                request.setAttribute("message", "Lỗi khi lấy thông tin vé! Vui lòng thử lại.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }
            
            request.setAttribute("bookedTickets", bookedTickets);
            request.getRequestDispatcher("BookTicket.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            request.setAttribute("message", e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Đã xảy ra lỗi trong quá trình xử lý: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
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
