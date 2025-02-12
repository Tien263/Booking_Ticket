/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.accesscontrol;
import dal.bookingDAO;
import model.BusTrip;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Nguyen Minh Duc
 */
public class booking extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Lấy thông tin từ request
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        String hourStr = request.getParameter("hour");
        String minuteStr = request.getParameter("minute");
        String time = null;

        String[] provinces = {"Hà Nội", "Hồ Chí Minh", "Đà Nẵng", "Hải Phòng", "Cần Thơ", "An Giang", "Bà Rịa - Vũng Tàu", "Bắc Giang", "Bắc Kạn", "Bạc Liêu", "Bắc Ninh", "Bến Tre", "Bình Định", "Bình Dương", "Bình Phước", "Bình Thuận", "Cà Mau", "Cao Bằng", "Đắk Lắk", "Đắk Nông", "Điện Biên", "Đồng Nai", "Đồng Tháp", "Gia Lai", "Hà Giang", "Hà Nam", "Hà Tĩnh", "Hải Dương", "Hậu Giang", "Hòa Bình", "Hưng Yên", "Khánh Hòa", "Kiên Giang", "Kon Tum", "Lai Châu", "Lâm Đồng", "Lạng Sơn", "Lào Cai", "Long An", "Nam Định", "Nghệ An", "Ninh Bình", "Ninh Thuận", "Phú Thọ", "Phú Yên", "Quảng Bình", "Quảng Nam", "Quảng Ngãi", "Quảng Ninh", "Quảng Trị", "Sóc Trăng", "Sơn La", "Tây Ninh", "Thái Bình", "Thái Nguyên", "Thanh Hóa", "Thừa Thiên Huế", "Tiền Giang", "Trà Vinh", "Tuyên Quang", "Vĩnh Long", "Vĩnh Phúc", "Yên Bái"};

        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Tìm kiếm chuyến xe</title>");
            out.println("<style>");
            out.println("table {width: 100%; border-collapse: collapse;}");
            out.println("table, th, td {border: 1px solid black;}");
            out.println("th, td {padding: 10px; text-align: center;}");
            out.println("th {background-color: #f2f2f2;}");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Tìm kiếm chuyến xe</h1>");
            out.println("<form method='GET' action='booking'>");
            
            out.println("Điểm đi: <select name='from' required>");
            for (String province : provinces) {
                out.println("<option value='" + province + "' " + (province.equals(from) ? "selected" : "") + ">" + province + "</option>");
            }
            out.println("</select>");
            
            out.println("Điểm đến: <select name='to' required>");
            for (String province : provinces) {
                out.println("<option value='" + province + "' " + (province.equals(to) ? "selected" : "") + ">" + province + "</option>");
            }
            out.println("</select>");
            
            out.println("<br><br>");
            out.println("Giờ: <input type='number' name='hour' min='0' max='23' value='" + (hourStr != null ? hourStr : "") + "' required>");
            out.println("Phút: <input type='number' name='minute' min='0' max='59' value='" + (minuteStr != null ? minuteStr : "") + "' required>");
            out.println("<br><br>");
            out.println("<button type='submit'>Tìm kiếm</button>");
            out.println("</form>");
            
            // Kiểm tra điều kiện nhập liệu
            if (from != null && to != null && hourStr != null && minuteStr != null) {
                try {
                    int hour = Integer.parseInt(hourStr);
                    int minute = Integer.parseInt(minuteStr);
                    
                    if (hour < 0 || hour > 23 || minute < 0 || minute > 59) {
                        out.println("<p style='color: red;'>Giờ phải từ 0-23 và phút phải từ 0-59!</p>");
                    } else {
                        time = String.format("%02d:%02d", hour, minute);
                       
                        bookingDAO dao = new bookingDAO();
                         
                                   
                        List<BusTrip> trips = dao.getBusTrips(from, to, time);
                        
                        out.println(from);
                        
                        out.println(to);
                        
                        out.println(time);
                        
                        if (trips.isEmpty()) {
                            out.println("<p>Không có chuyến xe phù hợp!</p>");
                        } else {
                           out.println("<table border='1'>"); // Thêm viền bảng cho rõ ràng
out.println("<thead>");
out.println("<tr>");
out.println("<th>ID</th>");
out.println("<th>Điểm đi</th>");
out.println("<th>Điểm đến</th>");
out.println("<th>Giờ khởi hành</th>");
out.println("<th>Giờ đến</th>");
out.println("<th>Giá vé</th>"); // Thêm cột giá vé
out.println("<th>Mô tả</th>"); // Thêm cột mô tả chuyến đi
out.println("<th>Khoảng cách (km)</th>"); // Thêm cột khoảng cách
out.println("</tr>");
out.println("</thead>");
out.println("<tbody>");

                           for (BusTrip trip : trips) { 
    out.println("<tr>");
    out.println("<td>" + trip.getBrId() + "</td>");
    out.println("<td>" + trip.getBrFrom() + "</td>");
    out.println("<td>" + trip.getBrTo() + "</td>");
    out.println("<td>" + trip.getBt1DepartureTime() + "</td>");
    out.println("<td>" + trip.getBt1ArrivalTime() + "</td>");
    out.println("<td>" + trip.getTPrice() + "</td>");
    out.println("<td>" + trip.getBrDescription() + "</td>");
    out.println("<td>" + trip.getBrDistance() + "</td>");
    out.println("</tr>");
}

                            out.println("</tbody>");
                            out.println("</table>");
                        }
                    }
                }catch (NumberFormatException e) {
                    out.println("<p style='color: red;'>Giờ và phút phải là số hợp lệ!</p>");
                }
            }
            out.println("</body>");
            out.println("</html>");
        }
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
        return "Servlet tìm kiếm chuyến xe dựa trên điểm đi, điểm đến và thời gian";
    }
}