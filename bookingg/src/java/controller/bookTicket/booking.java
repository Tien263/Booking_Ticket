/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.bookTicket;

import dal.bookTicket.BookingDAO;
import jakarta.servlet.RequestDispatcher;
import model.bookTicket.BusTrip;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.User;
import model.Customer;

/**
 *
 * @author Nguyen Minh Duc
 */
public class Booking extends HttpServlet {

    private static final String[] PROVINCES = {"Hà Nội", "Hồ Chí Minh", "Đà Nẵng", "Hải Phòng", "Cần Thơ", "An Giang",
            "Bà Rịa - Vũng Tàu", "Bắc Giang", "Bắc Kạn", "Bạc Liêu", "Bắc Ninh", "Bến Tre", "Bình Định",
            "Bình Dương", "Bình Phước", "Bình Thuận", "Cà Mau", "Cao Bằng", "Đắk Lắk", "Đắk Nông", "Điện Biên",
            "Đồng Nai", "Đồng Tháp", "Gia Lai", "Hà Giang", "Hà Nam", "Hà Tĩnh", "Hải Dương", "Hậu Giang",
            "Hòa Bình", "Hưng Yên", "Khánh Hòa", "Kiên Giang", "Kon Tum", "Lai Châu", "Lâm Đồng", "Lạng Sơn",
            "Lào Cai", "Long An", "Nam Định", "Nghệ An", "Ninh Bình", "Ninh Thuận", "Phú Thọ", "Phú Yên",
            "Quảng Bình", "Quảng Nam", "Quảng Ngãi", "Quảng Ninh", "Quảng Trị", "Sóc Trăng", "Sơn La", "Tây Ninh",
            "Thái Bình", "Thái Nguyên", "Thanh Hóa", "Thừa Thiên Huế", "Tiền Giang", "Trà Vinh", "Tuyên Quang",
            "Vĩnh Long", "Vĩnh Phúc", "Yên Bái"};

    public void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        BookingDAO dao = new BookingDAO();
        
        // Lấy thông tin từ request
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        String travelDate = request.getParameter("travelDate");
        
        // Xử lý ngày mặc định nếu không có
        if (travelDate == null || travelDate.trim().isEmpty()) {
            travelDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        }
        
        
        List<BusTrip> trips = new ArrayList<>();
        
        // Kiểm tra và xử lý tìm kiếm chuyến xe
        if (from != null && to != null) {
            if (from.equals(to)) {
                request.setAttribute("error", "Điểm đi và điểm đến không được trùng nhau!");
            } else {
                try {
                    trips = dao.getBusTrips(from, to, travelDate);
                    if (trips.isEmpty()) {
                        request.setAttribute("message", "Không có chuyến xe phù hợp!");
                    }
                } catch (Exception e) {
                    request.setAttribute("error", "Đã xảy ra lỗi khi tìm kiếm chuyến xe!");
                }
            }
        }

        // Đặt dữ liệu cho JSP
        request.setAttribute("provinces", PROVINCES);
        request.setAttribute("from", from);
        request.setAttribute("to", to);
        request.setAttribute("travelDate", travelDate);
        request.setAttribute("trips", trips);
        // Chuyển hướng đến JSP
        request.getRequestDispatcher("search_results.jsp").forward(request, response);
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
