package controller.accesscontrol;

import dal.VehicleDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Vehicle;

public class VehicleController extends HttpServlet {

    private VehicleDAO vehicleDAO = new VehicleDAO();
    private static final int VEHICLES_PER_PAGE = 5; // Số phương tiện trên mỗi trang

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String licensePlate = request.getParameter("licensePlate");
        String type = request.getParameter("type");

        List<Vehicle> allVehicles;

        // Lấy danh sách phương tiện dựa trên tìm kiếm
        if (licensePlate != null && !licensePlate.trim().isEmpty()) {
            allVehicles = vehicleDAO.searchByLicensePlate(licensePlate);
        } else if (type != null && !type.trim().isEmpty()) {
            allVehicles = vehicleDAO.searchByType(type);
        } else {
            allVehicles = vehicleDAO.getAllVehicles();
        }

        // Tính tổng số trang
        int totalVehicles = allVehicles.size();
        int totalPages = (int) Math.ceil((double) totalVehicles / VEHICLES_PER_PAGE);

        // Lấy số trang hiện tại từ tham số "page" trong URL
        String pageParam = request.getParameter("page");
        int currentPage = (pageParam != null && !pageParam.isEmpty()) ? Integer.parseInt(pageParam) : 1;
        if (currentPage < 1) {
            currentPage = 1;
        } else if (currentPage > totalPages && totalPages > 0) {
            currentPage = totalPages;
        }

        // Tính chỉ số bắt đầu và kết thúc của phương tiện trong trang hiện tại
        int startIndex = (currentPage - 1) * VEHICLES_PER_PAGE;
        int endIndex = Math.min(startIndex + VEHICLES_PER_PAGE, totalVehicles);

        // Lấy danh sách phương tiện cho trang hiện tại
        List<Vehicle> vehiclesForPage = new ArrayList<>();
        if (totalVehicles > 0) {
            vehiclesForPage = allVehicles.subList(startIndex, endIndex);
        }

        // Đặt các thuộc tính vào request để JSP sử dụng
        request.setAttribute("vehicles", vehiclesForPage);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("licensePlate", licensePlate); // Giữ giá trị tìm kiếm
        request.setAttribute("type", type); // Giữ giá trị tìm kiếm

        // Chuyển hướng đến vehicles.jsp
        request.getRequestDispatcher("vehicles.jsp").forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        boolean hasError = false;

        if ("add".equals(action)) {
            String type = request.getParameter("type");
            String capacityStr = request.getParameter("capacity");
            String licensePlate = request.getParameter("licensePlate");
            String status = request.getParameter("status");

            // Kiểm tra loại xe
            if (type == null || type.trim().isEmpty()) {
                session.setAttribute("errorMessage", "Loại xe không được để trống!");
                hasError = true;
            }

            // Kiểm tra biển số xe (format: 2 ký tự + 4-5 số, ví dụ: "AB12345")
            if (licensePlate == null || !licensePlate.matches("[A-Z]{2}\\d{4,5}")) {
                session.setAttribute("errorMessage", "Biển số xe không hợp lệ! (Ví dụ: AB12345)");
                hasError = true;
            }

            // Kiểm tra số ghế
            int capacity = 0;
            try {
                capacity = Integer.parseInt(capacityStr);
                if (capacity <= 0) {
                    session.setAttribute("errorMessage", "Số ghế phải lớn hơn 0!");
                    hasError = true;
                }
            } catch (NumberFormatException e) {
                session.setAttribute("errorMessage", "Số ghế phải là số hợp lệ!");
                hasError = true;
            }

            // Nếu có lỗi, quay lại trang phương tiện
            if (hasError) {
                response.sendRedirect("vehicle");
                return;
            }

            // Thêm phương tiện vào database
            Vehicle vehicle = new Vehicle(type, capacity, licensePlate, status);
            boolean isInserted = vehicleDAO.insertVehicle(vehicle);

            if (!isInserted) {
                session.setAttribute("errorMessage", "Biển số xe đã tồn tại!");
            } else {
                session.setAttribute("successMessage", "Thêm phương tiện thành công!");
            }
            response.sendRedirect("vehicle");
            return;
        } else if ("update".equals(action)) {
            String idStr = request.getParameter("id");
            String type = request.getParameter("type");
            String capacityStr = request.getParameter("capacity");
            String licensePlate = request.getParameter("licensePlate");
            String status = request.getParameter("status");

            int id = 0;
            try {
                id = Integer.parseInt(idStr);
            } catch (NumberFormatException e) {
                session.setAttribute("errorMessage", "ID phương tiện không hợp lệ!");
                hasError = true;
            }

            if (hasError) {
                response.sendRedirect("vehicle");
                return;
            }

            Vehicle vehicle = new Vehicle(id, type, Integer.parseInt(capacityStr), licensePlate, status);
            boolean isUpdated = vehicleDAO.updateVehicle(vehicle);

            if (!isUpdated) {
                session.setAttribute("errorMessage", "Biển số xe đã tồn tại! Vui lòng cập nhật lại.");
            } else {
                session.setAttribute("successMessage", "Cập nhật phương tiện thành công!");
            }
            response.sendRedirect("vehicle");
            return;
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            vehicleDAO.deleteVehicle(id);
            session.setAttribute("successMessage", "Xóa phương tiện thành công!");
        }

        response.sendRedirect("vehicle");
    }

    @Override
    public String getServletInfo() {
        return "Servlet to manage vehicles with pagination";
    }
}