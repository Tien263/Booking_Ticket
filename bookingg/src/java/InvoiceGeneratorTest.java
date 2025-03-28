package controller.bookTicket;

import dal.bookTicket.BookTicketDAO;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import model.bookTicket.BookTicket;
import com.itextpdf.kernel.pdf.PdfReader;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.forms.PdfAcroForm;
import com.itextpdf.forms.fields.PdfFormField;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.io.font.PdfEncodings;

public class InvoiceGeneratorTest {

    public static void main(String[] args) {
        // Thay đổi các giá trị này theo dữ liệu thực tế của bạn
        int bookId = 79; // ID của booking cần tạo hóa đơn
        double totalPrice = 1000000; // Giá gốc (ví dụ: 1,000,000 VNĐ)
        Double totalPriceAfterDiscount = 900000.0; // Giá sau giảm giá (có thể null nếu không có giảm giá)
        Double discountApplied = 100000.0; // Số tiền giảm giá (có thể null nếu không có giảm giá)

        // Đường dẫn lưu file PDF
        String outputDirPath = "C:\\Users\\ADMIN\\Downloads\\hoadon"; // Thư mục đầu ra
        java.io.File outputDir = new java.io.File(outputDirPath);
        if (!outputDir.exists()) {
            outputDir.mkdirs(); // Tạo thư mục nếu chưa tồn tại
        }
        String outputPath = outputDirPath + "\\hoa_don_ve_" + bookId + ".pdf";

        try {
            // Lấy danh sách vé từ cơ sở dữ liệu
            BookTicketDAO ticketsDAO = new BookTicketDAO();
            List<BookTicket> bookedTickets = ticketsDAO.getTicketByBookingId(bookId);

            if (bookedTickets == null || bookedTickets.isEmpty()) {
                System.out.println("Không tìm thấy thông tin vé cho booking ID: " + bookId);
                return;
            }

            // Kiểm tra trạng thái của tất cả các vé
            for (BookTicket ticket : bookedTickets) {
                if (ticket.getBt_status() == null || !ticket.getBt_status().equalsIgnoreCase("confirmed")) {
                    throw new IOException("Không thể tạo hóa đơn: Có vé không ở trạng thái 'confirmed'. Trạng thái hiện tại của vé " + ticket.getT_id() + ": " + (ticket.getBt_status() != null ? ticket.getBt_status() : "N/A"));
                }
            }

            // Tạo file PDF hóa đơn nếu tất cả vé đều ở trạng thái "confirmed"
            generatePDF(bookedTickets, totalPrice, totalPriceAfterDiscount, discountApplied, outputPath);
            System.out.println("Hóa đơn đã được tạo tại: " + outputPath);

        } catch (Exception e) {
            System.err.println("Lỗi khi tạo hóa đơn: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private static void generatePDF(List<BookTicket> bookedTickets, double totalAmount,
                                    Double totalPriceAfterDiscount, Double discountApplied, String outputPath) throws IOException {
        // Đường dẫn đến file PDF mẫu
        String templatePath = "C:\\Users\\ADMIN\\Downloads\\Booking_Ticket-V1(1)\\Booking_Ticket-news2\\Booking_Ticket-news1\\bookingg\\web\\WEB-INF\\templates\\mau_hoa_don.pdf";

        // Kiểm tra file mẫu có tồn tại không
        java.io.File templateFile = new java.io.File(templatePath);
        if (!templateFile.exists()) {
            throw new IOException("File mẫu PDF không tồn tại tại: " + templatePath);
        }

        try (FileOutputStream out = new FileOutputStream(outputPath)) {
            // Đọc file PDF mẫu
            PdfReader reader = new PdfReader(templatePath);
            PdfWriter writer = new PdfWriter(out);
            PdfDocument pdf = new PdfDocument(reader, writer);
            PdfAcroForm form = PdfAcroForm.getAcroForm(pdf, true);

            // Tạo font hỗ trợ tiếng Việt (Times New Roman)
            PdfFont font = PdfFontFactory.createFont("C:\\Windows\\Fonts\\times.ttf", PdfEncodings.IDENTITY_H);

            // Debug: Liệt kê tất cả các trường form có trong file PDF
            System.out.println("Danh sách các trường form trong file PDF:");
            if (form != null) {
                Map<String, PdfFormField> fields = form.getFormFields();
                if (fields.isEmpty()) {
                    System.out.println("File PDF không có trường form nào!");
                } else {
                    for (String fieldName : fields.keySet()) {
                        System.out.println("Trường: " + fieldName);
                    }
                }
            } else {
                System.out.println("File PDF không phải là file form!");
            }

            // Lấy vé đầu tiên từ danh sách (vì file PDF mẫu chỉ hỗ trợ hiển thị 1 vé)
            BookTicket ticket = bookedTickets.get(0);

            // Điền thông tin vé vào các trường form
            // Text1 -> Mã vé
            PdfFormField maVeField = form.getField("Text1");
            if (maVeField != null) {
                maVeField.setFont(font); // Đặt font hỗ trợ tiếng Việt
                maVeField.setValue(String.valueOf(ticket.getT_id()));
            } else {
                throw new IOException("Trường 'Text1' (Mã vé) không tồn tại trong file PDF mẫu.");
            }

            // Text2 -> Tên khách hàng
            PdfFormField tenKhachField = form.getField("Text2");
            if (tenKhachField != null) {
                tenKhachField.setFont(font); // Đặt font hỗ trợ tiếng Việt
                tenKhachField.setValue(ticket.getC_fullname() != null ? ticket.getC_fullname() : "N/A");
            } else {
                throw new IOException("Trường 'Text2' (Tên khách hàng) không tồn tại trong file PDF mẫu.");
            }

            // Text3 -> Số điện thoại
            PdfFormField soDienThoaiField = form.getField("Text3");
            if (soDienThoaiField != null) {
                soDienThoaiField.setFont(font); // Đặt font hỗ trợ tiếng Việt
                soDienThoaiField.setValue(ticket.getC_phone() != null ? ticket.getC_phone() : "N/A");
            } else {
                throw new IOException("Trường 'Text3' (Số điện thoại) không tồn tại trong file PDF mẫu.");
            }

            // Text4 -> Ngày đặt vé
            PdfFormField ngayDatField = form.getField("Text4");
            if (ngayDatField != null) {
                ngayDatField.setFont(font); // Đặt font hỗ trợ tiếng Việt
                ngayDatField.setValue(ticket.getBt_bookingDate() != null ? ticket.getBt_bookingDate().toString() : "N/A");
            } else {
                throw new IOException("Trường 'Text4' (Ngày đặt vé) không tồn tại trong file PDF mẫu.");
            }

            // Text5 -> Địa điểm
            PdfFormField diaDiemField = form.getField("Text5");
            if (diaDiemField != null) {
                diaDiemField.setFont(font); // Đặt font hỗ trợ tiếng Việt
                diaDiemField.setValue(ticket.getBr_adress() != null ? ticket.getBr_adress() : "N/A");
            } else {
                throw new IOException("Trường 'Text5' (Địa điểm) không tồn tại trong file PDF mẫu.");
            }

            // Text6 -> Thời gian
            PdfFormField thoiGianField = form.getField("Text6");
            if (thoiGianField != null) {
                thoiGianField.setFont(font); // Đặt font hỗ trợ tiếng Việt
                thoiGianField.setValue(ticket.getBt1_time() != null ? ticket.getBt1_time() : "N/A");
            } else {
                throw new IOException("Trường 'Text6' (Thời gian) không tồn tại trong file PDF mẫu.");
            }

            // Text7 -> Ghế
            PdfFormField gheField = form.getField("Text7");
            if (gheField != null) {
                gheField.setFont(font); // Đặt font hỗ trợ tiếng Việt
                gheField.setValue(ticket.getS_name() != null ? ticket.getS_name() : "N/A");
            } else {
                throw new IOException("Trường 'Text7' (Ghế) không tồn tại trong file PDF mẫu.");
            }

            // Text8 -> Giá
            PdfFormField giaField = form.getField("Text8");
            if (giaField != null) {
                giaField.setFont(font); // Đặt font hỗ trợ tiếng Việt
                giaField.setValue(String.format("%,.0f", ticket.getBr_price()) + " VNĐ");
            } else {
                throw new IOException("Trường 'Text8' (Giá) không tồn tại trong file PDF mẫu.");
            }

            // Text9 -> Trạng thái
            PdfFormField trangThaiField = form.getField("Text9");
            if (trangThaiField != null) {
                trangThaiField.setFont(font); // Đặt font hỗ trợ tiếng Việt
                trangThaiField.setValue(ticket.getBt_status() != null ? ticket.getBt_status() : "N/A");
            } else {
                throw new IOException("Trường 'Text9' (Trạng thái) không tồn tại trong file PDF mẫu.");
            }

            // Điền thông tin giá
            if (totalPriceAfterDiscount != null) {
                // Text10 -> Tổng giá
                PdfFormField tongGiaField = form.getField("Text10");
                // Text11 -> Giảm giá
                PdfFormField giamGiaField = form.getField("Text11");
                // Text12 -> Giá gốc
                PdfFormField giaGocField = form.getField("Text12");

                if (tongGiaField != null) {
                    tongGiaField.setFont(font); // Đặt font hỗ trợ tiếng Việt
                    tongGiaField.setValue(String.format("%,.0f", totalPriceAfterDiscount) + " VNĐ");
                } else {
                    throw new IOException("Trường 'Text10' (Tổng giá) không tồn tại trong file PDF mẫu.");
                }
                if (giamGiaField != null) {
                    giamGiaField.setFont(font); // Đặt font hỗ trợ tiếng Việt
                    giamGiaField.setValue(String.format("%,.0f", discountApplied) + " VNĐ");
                } else {
                    throw new IOException("Trường 'Text11' (Giảm giá) không tồn tại trong file PDF mẫu.");
                }
                if (giaGocField != null) {
                    giaGocField.setFont(font); // Đặt font hỗ trợ tiếng Việt
                    giaGocField.setValue(String.format("%,.0f", totalAmount) + " VNĐ");
                } else {
                    throw new IOException("Trường 'Text12' (Giá gốc) không tồn tại trong file PDF mẫu.");
                }
            } else {
                // Text10 -> Tổng giá
                PdfFormField tongGiaField = form.getField("Text10");
                // Text11 -> Giảm giá
                PdfFormField giamGiaField = form.getField("Text11");
                // Text12 -> Giá gốc
                PdfFormField giaGocField = form.getField("Text12");

                if (tongGiaField != null) {
                    tongGiaField.setFont(font); // Đặt font hỗ trợ tiếng Việt
                    tongGiaField.setValue(String.format("%,.0f", totalAmount) + " VNĐ");
                } else {
                    throw new IOException("Trường 'Text10' (Tổng giá) không tồn tại trong file PDF mẫu.");
                }
                if (giamGiaField != null) {
                    giamGiaField.setFont(font); // Đặt font hỗ trợ tiếng Việt
                    giamGiaField.setValue("0 VNĐ");
                } else {
                    throw new IOException("Trường 'Text11' (Giảm giá) không tồn tại trong file PDF mẫu.");
                }
                if (giaGocField != null) {
                    giaGocField.setFont(font); // Đặt font hỗ trợ tiếng Việt
                    giaGocField.setValue(String.format("%,.0f", totalAmount) + " VNĐ");
                } else {
                    throw new IOException("Trường 'Text12' (Giá gốc) không tồn tại trong file PDF mẫu.");
                }
            }

            // Đóng form và PDF
            form.flattenFields();
            pdf.close();
        } catch (Exception e) {
            throw new IOException("Lỗi khi tạo PDF: " + e.getMessage(), e);
        }
    }
}