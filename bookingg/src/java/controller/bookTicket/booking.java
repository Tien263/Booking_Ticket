/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.bookTicket;

import dal.bookTicket.bookingDAO;
import jakarta.servlet.RequestDispatcher;
import model.bookTicket.BusTrip;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
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

    String[] provinces = {"Hà Nội", "Hồ Chí Minh", "Đà Nẵng", "Hải Phòng", "Cần Thơ", "An Giang", 
        "Bà Rịa - Vũng Tàu", "Bắc Giang", "Bắc Kạn", "Bạc Liêu", "Bắc Ninh", "Bến Tre", "Bình Định", 
        "Bình Dương", "Bình Phước", "Bình Thuận", "Cà Mau", "Cao Bằng", "Đắk Lắk", "Đắk Nông", "Điện Biên",
        "Đồng Nai", "Đồng Tháp", "Gia Lai", "Hà Giang", "Hà Nam", "Hà Tĩnh", "Hải Dương", "Hậu Giang",
        "Hòa Bình", "Hưng Yên", "Khánh Hòa", "Kiên Giang", "Kon Tum", "Lai Châu", "Lâm Đồng", "Lạng Sơn", 
        "Lào Cai", "Long An", "Nam Định", "Nghệ An", "Ninh Bình", "Ninh Thuận", "Phú Thọ", "Phú Yên",
        "Quảng Bình", "Quảng Nam", "Quảng Ngãi", "Quảng Ninh", "Quảng Trị", "Sóc Trăng", "Sơn La", "Tây Ninh", 
        "Thái Bình", "Thái Nguyên", "Thanh Hóa", "Thừa Thiên Huế", "Tiền Giang", "Trà Vinh", "Tuyên Quang",
        "Vĩnh Long", "Vĩnh Phúc", "Yên Bái"};

    List<BusTrip> trips = new ArrayList<>();

    if (from != null && to != null && hourStr != null && minuteStr != null) {
        try {
            int hour = Integer.parseInt(hourStr);
            int minute = Integer.parseInt(minuteStr);

            if (hour < 0 || hour > 23 || minute < 0 || minute > 59) {
                request.setAttribute("error", "Giờ phải từ 0-23 và phút phải từ 0-59!");
            } else {
                time = String.format("%02d:%02d", hour, minute);
                bookingDAO dao = new bookingDAO();
                trips = dao.getBusTrips(from, to, time);
                
                if (trips.isEmpty()) {
                    request.setAttribute("message", "Không có chuyến xe phù hợp!");
                }
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Giờ và phút phải là số hợp lệ!");
        }
    }

    // Đặt dữ liệu lên request để chuyển đến JSP
    request.setAttribute("from", from);
    request.setAttribute("to", to);
    request.setAttribute("hour", hourStr);
    request.setAttribute("minute", minuteStr);
    request.setAttribute("time", time);
    request.setAttribute("provinces", provinces);
    request.setAttribute("trips", trips);

    // Chuyển hướng sang trang JSP
    RequestDispatcher dispatcher = request.getRequestDispatcher("search_results.jsp");
    dispatcher.forward(request, response);
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