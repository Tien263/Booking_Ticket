package controller.employee;

import dal.managerTrip.BusTripDAO;
import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.managerTrip.BusTrips;

public class ManageTripController extends HttpServlet {

    private static final int ITEMS_PER_PAGE = 14; // Số chuyến xe mỗi trang

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BusTripDAO btd = new BusTripDAO();

        // Lấy số trang từ request (nếu có)
        String pageStr = request.getParameter("page");
        int currentPage = (pageStr != null && !pageStr.isEmpty()) ? Integer.parseInt(pageStr) : 1;
        if (currentPage < 1) currentPage = 1;

        // Lấy tham số tìm kiếm từ request
        String date = request.getParameter("bt1_date");
        String routeId = request.getParameter("br_id");
        String action = request.getParameter("action");

        ArrayList<BusTrips> bt;
        int totalTrips;
        int totalPages;

        // Nếu nhấn nút "Xóa", reset form và hiển thị toàn bộ danh sách
        if ("reset".equals(action)) {
            date = null;
            routeId = null;
            totalTrips = btd.getTotalBusTrips();
            totalPages = (int) Math.ceil((double) totalTrips / ITEMS_PER_PAGE);
            bt = btd.list(currentPage, ITEMS_PER_PAGE);
        } else if ((date != null && !date.trim().isEmpty()) || (routeId != null && !routeId.trim().isEmpty())) {
            // Nếu có tham số tìm kiếm, gọi phương thức search
            totalTrips = btd.getTotalBusTrips(date, routeId);
            totalPages = (int) Math.ceil((double) totalTrips / ITEMS_PER_PAGE);
            bt = btd.searchBusTrips(date, routeId, currentPage, ITEMS_PER_PAGE);
        } else {
            // Nếu không có tham số, liệt kê toàn bộ
            totalTrips = btd.getTotalBusTrips();
            totalPages = (int) Math.ceil((double) totalTrips / ITEMS_PER_PAGE);
            bt = btd.list(currentPage, ITEMS_PER_PAGE);
        }

        // Đảm bảo currentPage không vượt quá totalPages
        if (currentPage > totalPages) currentPage = totalPages > 0 ? totalPages : 1;

        // Đặt các thuộc tính vào request để JSP sử dụng
        request.setAttribute("bt", bt);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("bt1_date", date);
        request.setAttribute("br_id", routeId);

        request.getRequestDispatcher("listbustrip.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response); // Chuyển POST sang GET để xử lý tìm kiếm
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}