/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.employee;

import dal.managerTrip.BusTripDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.managerTrip.BusTrips;

public class ManageTripController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ManageTripController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageTripController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BusTripDAO btd = new BusTripDAO();
        int pageSize = 20; // Số bản ghi trên mỗi trang
        int page = 1; // Trang mặc định

        // Lấy số trang từ request (nếu có)
        String pageStr = request.getParameter("page");
        if (pageStr != null && !pageStr.isEmpty()) {
            try {
                page = Integer.parseInt(pageStr);
                if (page < 1) {
                    page = 1; // Đảm bảo page không nhỏ hơn 1
                }
            } catch (NumberFormatException e) {
                page = 1; // Nếu không parse được, mặc định là trang 1
            }
        }

        // Lấy tham số tìm kiếm từ request
        String date = request.getParameter("bt1_date");
        String routeId = request.getParameter("br_id");
        String action = request.getParameter("action"); // Để xử lý nút "Xóa"

        ArrayList<BusTrips> bt;
        int totalTrips;
        int totalPages;

        // Nếu nhấn nút "Xóa", reset form và hiển thị toàn bộ danh sách
        if ("reset".equals(action)) {
            date = null;
            routeId = null;
            totalTrips = btd.getTotalBusTrips();
            totalPages = (int) Math.ceil((double) totalTrips / pageSize);
            bt = btd.list(page, pageSize);
        } else if ((date != null && !date.trim().isEmpty()) || (routeId != null && !routeId.trim().isEmpty())) {
            // Nếu có tham số tìm kiếm, gọi phương thức search
            totalTrips = btd.getTotalBusTrips(date, routeId);
            totalPages = (int) Math.ceil((double) totalTrips / pageSize);
            bt = btd.searchBusTrips(date, routeId, page, pageSize);
        } else {
            // Nếu không có tham số, liệt kê toàn bộ
            totalTrips = btd.getTotalBusTrips();
            totalPages = (int) Math.ceil((double) totalTrips / pageSize);
            bt = btd.list(page, pageSize);
        }

        // Đặt các thuộc tính vào request để JSP sử dụng
        request.setAttribute("bt", bt);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("bt1_date", date);
        request.setAttribute("br_id", routeId);

        request.getRequestDispatcher("listbustrip.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
