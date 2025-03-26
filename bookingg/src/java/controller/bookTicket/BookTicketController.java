/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.bookTicket;

import dal.bookTicket.BookTicketDAO;
import dal.bookTicket.SeatsDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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
            BookTicketDAO ticketsDAO = new BookTicketDAO();
            SeatsDAO seatsDAO = new SeatsDAO();
            HttpSession session = request.getSession();

            // Lấy giá trị từ session và kiểm tra trước khi chuyển đổi
            String tripIdStr = (String) session.getAttribute("tripId");
            String userIdStr = (String) session.getAttribute("customerId");

            Integer tripId = (tripIdStr != null && !tripIdStr.isEmpty()) ? Integer.parseInt(tripIdStr) : null;
            Integer userId = (userIdStr != null && !userIdStr.isEmpty()) ? Integer.parseInt(userIdStr) : null;

            // Lấy danh sách ghế đã chọn từ session
            List<Integer> seatIds = (List<Integer>) session.getAttribute("seatIds");

            // Kiểm tra nếu dữ liệu bị thiếu
            if (tripId == null || userId == null || seatIds == null || seatIds.isEmpty()) {
                handleError(request, response, "No seat selected or missing data!");
                return;
            }

            int bookingId = ticketsDAO.createAndBookTickets(userId, seatIds, tripId);
            if (bookingId == -1) {
                handleError(request, response, "Đặt vé thất bại!");
                return;
            }
            // Cập nhật trạng thái ghế đã đặt
            for (Integer seatId : seatIds) {
                boolean success = seatsDAO.isSeatBooked(seatId, "booked");
                if (!success) {
                    handleError(request, response, "Lỗi khi cập nhật trạng thái ghế! Hãy liên hệ hỗ trợ.");
                    return;
                }
            }

            // Lấy danh sách vé đã đặt
            List<BookTicket> bookedTickets = ticketsDAO.getTicketByBookingId(bookingId);
            if (bookedTickets == null || bookedTickets.isEmpty()) {
                handleError(request, response, "Lỗi khi lấy thông tin vé! Vui lòng thử lại.");
                return;
            }
            session.removeAttribute("vehicleId");
            session.removeAttribute("tripId");
            session.removeAttribute("routeId");
            session.removeAttribute("price");
            session.removeAttribute("from");
            session.removeAttribute("to");
            session.removeAttribute("departureTime");
            session.removeAttribute("arrivalTime");
            request.setAttribute("bookedTickets", bookedTickets);
            request.getRequestDispatcher("BookTicket.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            handleError(request, response, "Lỗi định dạng số: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            handleError(request, response, "Đã xảy ra lỗi trong quá trình xử lý: " + e.getMessage());
        }
    }

    private void handleError(HttpServletRequest request, HttpServletResponse response, String errorMessage)
            throws ServletException, IOException {
        request.setAttribute("message", errorMessage);
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
