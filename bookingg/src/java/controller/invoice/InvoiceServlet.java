package controller.invoice;

import dal.bookTicket.BookTicketDAO;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bookTicket.BookTicket;
import jakarta.servlet.RequestDispatcher;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.pdf.PdfWriter;
import java.util.logging.Level;
import java.util.logging.Logger;

public class InvoiceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy bookId từ tham số
        String bookIdParam = request.getParameter("bookId");
        int bookId;

        // Kiểm tra bookId có hợp lệ không
        if (bookIdParam == null || bookIdParam.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Vui lòng nhập Booking ID.");
            request.getRequestDispatcher("inputBookId.jsp").forward(request, response);
            return;
        }

        try {
            bookId = Integer.parseInt(bookIdParam);
            if (bookId <= 0) {
                request.setAttribute("errorMessage", "Booking ID phải là một số dương.");
                request.getRequestDispatcher("inputBookId.jsp").forward(request, response);
                return;
            }
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Booking ID không hợp lệ. Vui lòng nhập một số nguyên.");
            request.getRequestDispatcher("inputBookId.jsp").forward(request, response);
            return;
        }

        try {
            // Lấy danh sách vé từ cơ sở dữ liệu
            BookTicketDAO ticketsDAO = new BookTicketDAO();
            List<BookTicket> bookedTickets = ticketsDAO.getTicketByBookingId(bookId);

            if (bookedTickets == null || bookedTickets.isEmpty()) {
                request.setAttribute("errorMessage", "Không tìm thấy thông tin vé cho Booking ID: " + bookId);
                request.getRequestDispatcher("hoadon.jsp").forward(request, response);
                return;
            }

            // Kiểm tra số lượng vé (ticketNumber)
            int ticketNumber = bookedTickets.size();
            System.out.println("Số lượng vé (ticketNumber): " + ticketNumber);

            // Kiểm tra trạng thái của tất cả các vé
            for (BookTicket ticket : bookedTickets) {
                if (ticket.getBt_status() == null || !ticket.getBt_status().equalsIgnoreCase("confirmed")) {
                    request.setAttribute("errorMessage", "Không thể hiển thị hóa đơn: Có vé không ở trạng thái 'confirmed'. Trạng thái hiện tại của vé " + ticket.getT_id() + ": " + (ticket.getBt_status() != null ? ticket.getBt_status() : "N/A"));
                    request.getRequestDispatcher("hoadon.jsp").forward(request, response);
                    return;
                }
            }

            // Tính totalPrice: Tổng tiền của tất cả các vé (br_price)
            double totalPrice = 0.0;
            for (BookTicket ticket : bookedTickets) {
                totalPrice += ticket.getBr_price();
            }

            // Lấy totalPriceAfterDiscount (bt_total_amount) từ cơ sở dữ liệu
            Double totalPriceAfterDiscount = ticketsDAO.getTotalAmountByBookingId(bookId);
            if (totalPriceAfterDiscount == null) {
                totalPriceAfterDiscount = totalPrice; // Nếu không có bt_total_amount, dùng totalPrice
            }

            // Tính discountApplied: totalPrice - totalPriceAfterDiscount
            Double discountApplied = totalPrice - totalPriceAfterDiscount;

            // Truyền dữ liệu sang JSP
            request.setAttribute("bookedTickets", bookedTickets);
            request.setAttribute("totalPrice", totalPrice);
            request.setAttribute("totalPriceAfterDiscount", totalPriceAfterDiscount);
            request.setAttribute("discountApplied", discountApplied);
            request.setAttribute("today", new java.util.Date());

            // Kiểm tra nếu người dùng yêu cầu xuất PDF
            String exportToPdf = request.getParameter("exportToPdf");
            if ("true".equals(exportToPdf)) {
                // Thiết lập response để trả về file PDF
                response.setContentType("application/pdf");
                response.setHeader("Content-Disposition", "attachment; filename=invoice_" + bookId + ".pdf");

                // Lấy Base64 của ảnh từ form
                String imageBase64 = request.getParameter("invoiceImage");
                if (imageBase64 == null || !imageBase64.startsWith("data:image/png;base64,")) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid image data");
                    return;
                }

                // Loại bỏ phần prefix "data:image/png;base64,"
                imageBase64 = imageBase64.replace("data:image/png;base64,", "");
                byte[] imageBytes = Base64.getDecoder().decode(imageBase64);

                // Tạo PDF bằng iText 5
                Document document = new Document();
                try {
                    PdfWriter.getInstance(document, response.getOutputStream());
                    document.open();

                    // Chèn ảnh vào PDF
                    Image invoiceImage = Image.getInstance(imageBytes);
                    // Điều chỉnh kích thước ảnh để vừa trang PDF (A4: 595x842 điểm)
                    invoiceImage.scaleToFit(595, 842);
                    document.add(invoiceImage);

                    document.close();
                } catch (DocumentException ex) {
                    Logger.getLogger(InvoiceServlet.class.getName()).log(Level.SEVERE, null, ex);
                    response.setContentType("text/plain");
                    response.getWriter().write("Lỗi khi tạo PDF: " + ex.getMessage());
                }
            } else {
                // Nếu không yêu cầu PDF, hiển thị JSP bình thường
                request.getRequestDispatcher("hoadon.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Lỗi khi xử lý hóa đơn: " + e.getMessage());
            request.getRequestDispatcher("hoadon.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet to generate invoice for booked tickets";
    }
}