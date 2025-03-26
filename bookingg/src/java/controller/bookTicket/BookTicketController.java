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

    /**
     * Xử lý yêu cầu cho cả phương thức HTTP <code>GET</code> và <code>POST</code>.
     *
     * @param request yêu cầu servlet
     * @param response phản hồi servlet
     * @throws ServletException nếu xảy ra lỗi đặc thù của servlet
     * @throws IOException nếu xảy ra lỗi I/O
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            HttpSession session = request.getSession();

            // Kiểm tra xem người dùng đã đăng nhập chưa bằng cách kiểm tra c_id trong session
            Object userIdObj = session.getAttribute("c_id");
            if (userIdObj == null) {
                // Nếu c_id là null, người dùng chưa đăng nhập
                handleError(request, response, "Vui lòng đăng nhập để đặt vé!");
                return;
            }

            // Ép kiểu an toàn sau khi đã kiểm tra null
            int userId = (int) userIdObj;

            BookTicketDAO ticketsDAO = new BookTicketDAO();
            SeatsDAO seatsDAO = new SeatsDAO();
            PromotionByCodeDAO promoDAO = new PromotionByCodeDAO();

            // Lấy giá trị từ session và kiểm tra trước khi chuyển đổi
            String tripIdStr = (String) session.getAttribute("tripId");
            Integer tripId = (tripIdStr != null && !tripIdStr.isEmpty()) ? Integer.parseInt(tripIdStr) : null;

            // Lấy danh sách ghế đã chọn từ session
            List<Integer> seatIds = (List<Integer>) session.getAttribute("seatIds");

            // Kiểm tra nếu dữ liệu bị thiếu
            if (tripId == null || seatIds == null || seatIds.isEmpty()) {
                handleError(request, response, "Không có ghế nào được chọn hoặc thiếu dữ liệu!");
                return;
            }

            double totalAmount = (double) session.getAttribute("totalPrice");
            int bookingId = ticketsDAO.createAndBookTickets(userId, seatIds, tripId, totalAmount);
            if (bookingId == -1) {
                handleError(request, response, "Đặt vé thất bại!");
                return;
            }

            // Cập nhật trạng thái ghế đã đặt
            for (Integer seatId : seatIds) {
                boolean success = seatsDAO.isSeatBooked(seatId, "booked");
                if (!success) {
                    handleError(request, response, "Lỗi khi cập nhật trạng thái ghế! Vui lòng liên hệ hỗ trợ.");
                    return;
                }
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
                    // Áp dụng giảm giá
                    double discountPercentage = promo.getDiscount();
                    discountApplied = totalAmount * (discountPercentage / 100);
                    totalPriceAfterDiscount = totalAmount - discountApplied;

                    // Cập nhật BookTickets với giá mới và pbc_id
                    boolean success = ticketsDAO.applyPromotion(bookingId, totalPriceAfterDiscount, promo.getId(), promoDAO);
                    if (!success) {
                        handleError(request, response, "Lỗi khi áp dụng mã khuyến mãi!");
                        return;
                    }
                } else {
                    request.setAttribute("error", "Mã khuyến mãi không hợp lệ hoặc đã hết hạn!");
                }
            }

            // Lưu thông tin vào request và session để hiển thị trên JSP
            request.setAttribute("totalPrice", totalAmount);
            session.setAttribute("totalPrice", totalAmount); // Lưu vào session để sử dụng lại
            if (totalPriceAfterDiscount != null) {
                request.setAttribute("totalPriceAfterDiscount", totalPriceAfterDiscount);
                request.setAttribute("discountApplied", discountApplied);
                session.setAttribute("totalPriceAfterDiscount", totalPriceAfterDiscount); // Lưu vào session
                session.setAttribute("discountApplied", discountApplied); // Lưu số tiền giảm giá vào session
            }

            // Xóa các thuộc tính không cần thiết trong session
            session.removeAttribute("vehicleId");
            session.removeAttribute("routeId");
            session.removeAttribute("price");
            session.removeAttribute("from");
            session.removeAttribute("to");
            session.removeAttribute("departureTime");
            session.removeAttribute("arrivalTime");

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

    /**
     * Xử lý lỗi và chuyển hướng đến trang lỗi.
     *
     * @param request yêu cầu servlet
     * @param response phản hồi servlet
     * @param errorMessage thông báo lỗi
     * @throws ServletException nếu xảy ra lỗi đặc thù của servlet
     * @throws IOException nếu xảy ra lỗi I/O
     */
    private void handleError(HttpServletRequest request, HttpServletResponse response, String errorMessage)
            throws ServletException, IOException {
        request.setAttribute("message", errorMessage);
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }

    /**
     * Xử lý phương thức HTTP <code>GET</code>.
     *
     * @param request yêu cầu servlet
     * @param response phản hồi servlet
     * @throws ServletException nếu xảy ra lỗi đặc thù của servlet
     * @throws IOException nếu xảy ra lỗi I/O
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Xử lý phương thức HTTP <code>POST</code>.
     *
     * @param request yêu cầu servlet
     * @param response phản hồi servlet
     * @throws ServletException nếu xảy ra lỗi đặc thù của servlet
     * @throws IOException nếu xảy ra lỗi I/O
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Trả về mô tả ngắn gọn của servlet.
     *
     * @return một chuỗi chứa mô tả của servlet
     */
    @Override
    public String getServletInfo() {
        return "Xử lý việc đặt vé và áp dụng khuyến mãi.";
    }
}