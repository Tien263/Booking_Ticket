package controller.bookTicket;

import dal.bookTicket.BookTicketDAO;
import dal.bookTicket.SeatsDAO;
import dal.promotion.PromotionByCodeDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.bookTicket.BookTicket;
import model.promotion.Promotions_By_Code;

public class BookTicketController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            HttpSession session = request.getSession();

            // Kiểm tra đăng nhập
            Object userIdObj = session.getAttribute("c_id");
            if (userIdObj == null) {
                handleError(request, response, "Vui lòng đăng nhập để đặt vé!");
                return;
            }

            int userId = (int) userIdObj;

            BookTicketDAO ticketsDAO = new BookTicketDAO();
            SeatsDAO seatsDAO = new SeatsDAO();
            PromotionByCodeDAO promoDAO = new PromotionByCodeDAO();

            // Lấy thông tin từ session
            String tripIdStr = (String) session.getAttribute("tripId");
            Integer tripId = (tripIdStr != null && !tripIdStr.isEmpty()) ? Integer.parseInt(tripIdStr) : null;
            List<Integer> seatIds = (List<Integer>) session.getAttribute("seatIds");

            if (tripId == null || seatIds == null || seatIds.isEmpty()) {
                handleError(request, response, "Không có ghế nào được chọn hoặc thiếu dữ liệu!");
                return;
            }

            double totalAmount = (double) session.getAttribute("totalPrice");

            // Tạo và đặt vé
            int bookingId = ticketsDAO.createAndBookTickets(userId, seatIds, tripId, totalAmount);
            if (bookingId == -1) {
                handleError(request, response, "Đặt vé thất bại!");
                return;
            }

            // Cập nhật trạng thái ghế thành "booked"
            for (Integer seatId : seatIds) {
                boolean success = seatsDAO.isSeatBooked(seatId, "booked");
                if (!success) {
                    handleError(request, response, "Lỗi khi cập nhật trạng thái ghế! Vui lòng liên hệ hỗ trợ.");
                    return;
                }
            }

            // Cập nhật trạng thái BookTickets và Tickets thành "confirmed"
            BookTicket bt = new BookTicket();
            bt.setBt_id(bookingId);
            bt.setBt_status("pending");
            boolean statusUpdated = ticketsDAO.updateStatus(bt);
            if (!statusUpdated) {
                handleError(request, response, "Lỗi khi cập nhật trạng thái vé thành 'confirmed'!");
                return;
            }

            // Lấy danh sách vé đã đặt
            List<BookTicket> bookedTickets = ticketsDAO.getTicketByBookingId(bookingId);
            if (bookedTickets == null || bookedTickets.isEmpty()) {
                handleError(request, response, "Lỗi khi lấy thông tin vé! Vui lòng thử lại.");
                return;
            }

            // Xử lý mã khuyến mãi
            String promoCode = request.getParameter("promoCode");
            Double totalPriceAfterDiscount = null;
            Double discountApplied = null;
            if (promoCode != null && !promoCode.trim().isEmpty()) {
                Promotions_By_Code promo = promoDAO.getPromotionByCode(promoCode);
                if (promo != null) {
                    double discountPercentage = promo.getDiscount();
                    discountApplied = totalAmount * (discountPercentage / 100);
                    totalPriceAfterDiscount = totalAmount - discountApplied;

                    boolean success = ticketsDAO.applyPromotion(bookingId, totalPriceAfterDiscount, promo.getId(), promoDAO);
                    if (!success) {
                        handleError(request, response, "Lỗi khi áp dụng mã khuyến mãi!");
                        return;
                    }
                } else {
                    request.setAttribute("error", "Mã khuyến mãi không hợp lệ hoặc đã hết hạn!");
                }
            }

            // Lưu thông tin vào request và session
            request.setAttribute("totalPrice", totalAmount);
            session.setAttribute("totalPrice", totalAmount);
            if (totalPriceAfterDiscount != null) {
                request.setAttribute("totalPriceAfterDiscount", totalPriceAfterDiscount);
                request.setAttribute("discountApplied", discountApplied);
                session.setAttribute("totalPriceAfterDiscount", totalPriceAfterDiscount);
                session.setAttribute("discountApplied", discountApplied);
            }

            // Xóa các thuộc tính không cần thiết trong session
            session.removeAttribute("vehicleId");
            session.removeAttribute("routeId");
            session.removeAttribute("price");
            session.removeAttribute("from");
            session.removeAttribute("to");
            session.removeAttribute("departureTime");
            session.removeAttribute("arrivalTime");
            session.removeAttribute("tripId");
            session.removeAttribute("seatIds");

            request.setAttribute("bookedTickets", bookedTickets);
            session.setAttribute("bookId", bookingId);
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Xử lý việc đặt vé và áp dụng khuyến mãi.";
    }
    
}