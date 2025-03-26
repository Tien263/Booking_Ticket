/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.managerTrip;

import dal.managerTrip.BusTripDAO;
import dal.managerTrip.SeatDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import model.managerTrip.BusTrips;

/**
 *
 * @author Admin
 */
public class BusTripController extends HttpServlet {

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
        BusTripDAO dao = new BusTripDAO();
        SeatDAO seatDao = new SeatDAO();
        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");

            if (service != null && service.equals("insert")) {
                String submit = request.getParameter("submit");

                if (submit == null) {
                    // Lấy danh sách xe từ database để hiển thị trên JSP
                    ResultSet rsBusRoute = seatDao.getData("SELECT [br_id],[br_from],[br_to] FROM [BusRoutes] WHERE br_status = 'active'");
                    ResultSet rsVehicle = seatDao.getData("SELECT [v_id], [v_licensePlate] FROM [Vehicles] WHERE v_status = 'active'");
                    request.setAttribute("rsBusRoute", rsBusRoute);
                    request.setAttribute("rsVehicle", rsVehicle);
                    request.getRequestDispatcher("/managerTrip/insertBusTrip.jsp").forward(request, response);
                } else {
                    try {
                        // Nhận dữ liệu từ form
                        String vehicleStr = request.getParameter("vehicleId");
                        int vehicleId = Integer.parseInt(vehicleStr);

                        int year = Integer.parseInt(request.getParameter("year"));
                        int month = Integer.parseInt(request.getParameter("month"));
                        int br_id = Integer.parseInt(request.getParameter("br_id"));

                        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
                        LocalTime bt1_departureTime = LocalTime.parse(request.getParameter("bt1_departureTime"), timeFormatter);
                        LocalTime bt1_arrivalTime = LocalTime.parse(request.getParameter("bt1_arrivalTime"), timeFormatter);

                        String bt1_status = request.getParameter("bt1_status");

                        // Tạo chuyến xe cho từng ngày trong tháng
                        BusTrips busTrips = new BusTrips(0, null, bt1_departureTime, bt1_arrivalTime, bt1_status, br_id);
                        List<Integer> tripIds = dao.insertBusTripForMonth(year, month, busTrips);

                        // Chèn ghế ngồi cho từng chuyến xe
                        for (int tripId : tripIds) {
                            seatDao.insertSeats(vehicleId, tripId);
                        }

                        response.sendRedirect("BusTripURL?service=listOfAll");
                    } catch (Exception e) {
                        e.printStackTrace();
                        request.setAttribute("errorMessage", "Lỗi khi thêm chuyến xe. Vui lòng kiểm tra lại dữ liệu nhập!");
                        request.getRequestDispatcher("/managerTrip/insertBusTrip.jsp").forward(request, response);
                    }
                }
            }

            if (service.equals("delete")) {
                int id = Integer.parseInt(request.getParameter("bt1_id"));
                BusTrips busTrips = dao.get(id);
                dao.delete(busTrips);
                response.sendRedirect("BusTripURL?service=listOfAll");
            }

            if (service.endsWith("update")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    int id = Integer.parseInt(request.getParameter("bt1_id"));
                    BusTrips busTrips = dao.get(id);
                    request.setAttribute("busTrips", busTrips);
                    request.getRequestDispatcher("/managerTrip/updateBusTrip.jsp").forward(request, response);
                }
                if (submit != null) {
                    int id = Integer.parseInt(request.getParameter("bt1_id"));

                    DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                    LocalDate bt1_date = LocalDate.parse(request.getParameter("bt1_date"), dateFormatter);
                    // Định dạng thời gian nếu cần
                    DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
                    LocalTime bt1_departureTime = LocalTime.parse(request.getParameter("bt1_departureTime"), timeFormatter);
                    LocalTime bt1_arrivalTime = LocalTime.parse(request.getParameter("bt1_arrivalTime"), timeFormatter);
                    String bt1_status = request.getParameter("bt1_status");
                    int br_id = Integer.parseInt(request.getParameter("br_id"));
                    BusTrips busTrips = new BusTrips(id, bt1_date, bt1_departureTime, bt1_arrivalTime, bt1_status, br_id);
                    dao.update(busTrips);
                    response.sendRedirect("BusTripURL?service=listOfAll");
                }
            }
            if (service.endsWith("listOfAll")) {
                int page = 1;
                int recordsPerPage = 7; // Số bản ghi mỗi trang

                if (request.getParameter("page") != null) {
                    page = Integer.parseInt(request.getParameter("page"));
                }

                // Truy vấn SQL cơ bản
                String baseSql = "FROM BusTrips bt "
                        + "JOIN Seats s ON bt.bt1_id = s.bt1_id "
                        + "JOIN Vehicles v ON v.v_id = s.v_id "
                        + "WHERE 1=1";

                List<Object> params = new ArrayList<>(); // Danh sách tham số truyền vào SQL

                // **Lấy dữ liệu từ request**
                String dateStr = request.getParameter("bt1_date");
                String brIdStr = request.getParameter("br_id");

                // **Thêm điều kiện lọc vào SQL**
                if (dateStr != null && !dateStr.trim().isEmpty()) {
                    baseSql += " AND bt.bt1_date = ?";
                    params.add(dateStr);
                }
                if (brIdStr != null && !brIdStr.trim().isEmpty()) {
                    try {
                        int brId = Integer.parseInt(brIdStr);
                        baseSql += " AND bt.br_id = ?";
                        params.add(brId);
                    } catch (NumberFormatException e) {
                        request.setAttribute("error", "Mã tuyến phải là số hợp lệ!");
                    }
                }

                // **Tính tổng số bản ghi sau khi lọc**
                int totalRecords = dao.getTotalBusTrips(baseSql, params);
                int endPage = (int) Math.ceil((double) totalRecords / recordsPerPage);

                // **Thêm phân trang vào SQL**
                String sql = "SELECT DISTINCT bt.bt1_id, bt.bt1_date, bt.bt1_departureTime, bt.bt1_arrivalTime, "
                        + "bt.bt1_status, bt.br_id, v.v_licensePlate "
                        + baseSql + " ORDER BY bt.bt1_id DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

                params.add((page - 1) * recordsPerPage); // OFFSET
                params.add(recordsPerPage); // FETCH NEXT

                // **Lấy danh sách chuyến xe**
                ArrayList<BusTrips> list = dao.list(sql, params);

                // **Giữ lại dữ liệu filter để khi chuyển trang không bị mất**
                request.setAttribute("listBusTrip", list);
                request.setAttribute("currentPage", page);
                request.setAttribute("endPage", endPage);
                request.setAttribute("bt1_date", dateStr);
                request.setAttribute("br_id", brIdStr);

                request.getRequestDispatcher("/managerTrip/listBusTrip.jsp").forward(request, response);
            }
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
        processRequest(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
