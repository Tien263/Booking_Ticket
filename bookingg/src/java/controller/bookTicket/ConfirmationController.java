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
@WebServlet(name = "ConfirmationController", urlPatterns = {"/ConfirmationURL"})
public class ConfirmationController extends HttpServlet {

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
        ConfirmationDAO confirDAO = new ConfirmationDAO();
        String service = request.getParameter("service");

        if ("Confirmation".equals(service)) {
            handleConfirmation(request, response, ticketsDAO, seatsDAO, confirDAO);
        }
    }

    // Xử lý xác nhận đặt vé
    private void handleConfirmation(HttpServletRequest request, HttpServletResponse response,
            DAOTickets ticketsDAO, DAOSeats seatsDAO, ConfirmationDAO confirDAO)
            throws ServletException, IOException {
        try {
            List<Integer> bookingIds = getIntegerListFromRequest(request, "bookingId");
            List<Integer> seatIds = getIntegerListFromRequest(request, "seatId");
            System.out.println("bookingIdParams: " + Arrays.toString(request.getParameterValues("bookingId")));
            System.out.println("seatIdParams: " + Arrays.toString(request.getParameterValues("seatId")));
            if (bookingIds.isEmpty() || seatIds.isEmpty() || bookingIds.size() != seatIds.size()) {
                forwardWithMessage(request, response, "Dữ liệu không hợp lệ! Vui lòng chọn vé và ghế hợp lệ.");
                return;
            }

            List<BookTicket> bookedTickets = processBooking(bookingIds, seatIds, seatsDAO, confirDAO, ticketsDAO);

            if (!bookedTickets.isEmpty()) {
                request.setAttribute("bookedTickets", bookedTickets);
                for (BookTicket bookedTicket : bookedTickets) {
                    System.out.println(bookedTicket.getC_fullname());
                    System.out.println(bookedTicket.getBt_id());
                    System.out.println(bookedTicket.getC_phone());
                }
                request.getRequestDispatcher("confirmation.jsp").forward(request, response);
            } else {
                forwardWithMessage(request, response, "Thanh toán thất bại! Không có vé nào được xác nhận.");
            }

        } catch (NumberFormatException e) {
            forwardWithMessage(request, response, e.getMessage()); // Lỗi định dạng số
        } catch (Exception e) {
            e.printStackTrace();
            forwardWithMessage(request, response, "Đã xảy ra lỗi trong quá trình xử lý.");
        }
    }

    private List<Integer> getIntegerListFromRequest(HttpServletRequest request, String paramName) throws NumberFormatException {
        String[] params = request.getParameterValues(paramName);
        List<Integer> result = new ArrayList<>();

        if (params == null) {
            return result;
        }

        for (String id : params) {
            if (id != null && !id.trim().isEmpty()) {
                try {
                    // Kiểm tra nếu chuỗi là danh sách JSON `[173, 174, 175]`
                    if (id.startsWith("[") && id.endsWith("]")) {
                        id = id.replace("[", "").replace("]", "").trim(); // Loại bỏ dấu []
                        List<Integer> parsedList = Arrays.stream(id.split(","))
                                .map(String::trim)
                                .map(Integer::parseInt)
                                .collect(Collectors.toList());
                        result.addAll(parsedList);
                    } else {
                        result.add(Integer.parseInt(id.trim()));
                    }
                } catch (NumberFormatException e) {
                    throw new NumberFormatException("Lỗi định dạng số! Vui lòng kiểm tra lại giá trị: " + id);
                }
            }
        }
        return result;
    }

    // Xử lý việc đặt vé và thanh toán
    private List<BookTicket> processBooking(List<Integer> bookingIds, List<Integer> seatIds,
            DAOSeats seatsDAO, ConfirmationDAO confirDAO, DAOTickets ticketsDAO) {
        List<BookTicket> bookedTickets = new ArrayList<>();

        for (int i = 0; i < bookingIds.size(); i++) {
            int bookingId = bookingIds.get(i);
            int seatId = seatIds.get(i);

            try {
                seatsDAO.isSeatBooked(seatId, "booked");

                if (confirDAO.confirmPayment(bookingId)) {
                    BookTicket bookTicket = ticketsDAO.getTicketByBookingId(bookingId);
                    if (bookTicket != null) {
                        bookedTickets.add(bookTicket);
                    }
                }
            } catch (Exception e) {
                System.err.println("Lỗi xử lý vé với Booking ID: " + bookingId + ", Seat ID: " + seatId);
                e.printStackTrace();
            }
        }
        return bookedTickets;
    }

    // Chuyển hướng với thông báo lỗi
    private void forwardWithMessage(HttpServletRequest request, HttpServletResponse response, String message)
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
