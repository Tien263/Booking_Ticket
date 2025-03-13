/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.accesscontrol;

import dal.VehicleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Vehicle;

/**
 *
 * @author Quang Anh
 */
public class VehicleController extends HttpServlet {

    private VehicleDAO vehicleDAO = new VehicleDAO();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VehicleController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VehicleController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String licensePlate = request.getParameter("licensePlate");
        String type = request.getParameter("type");

        List<Vehicle> vehicles;

        if (licensePlate != null && !licensePlate.trim().isEmpty()) {
            vehicles = vehicleDAO.searchByLicensePlate(licensePlate);
        } else if (type != null && !type.trim().isEmpty()) {
            vehicles = vehicleDAO.searchByType(type);
        } else {
            vehicles = vehicleDAO.getAllVehicles();
        }

        request.setAttribute("vehicles", vehicles);
        request.getRequestDispatcher("vehicles.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        }

        response.sendRedirect("vehicle");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
