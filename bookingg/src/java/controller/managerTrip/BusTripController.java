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

            if (service.endsWith("insert")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    ResultSet rsVehicle = seatDao.getVehicle("SELECT [v_id], [v_licensePlate] FROM [PROJECTV01].[dbo].[Vehicles] WHERE v_status = 'active'");
                    request.setAttribute("rsVehicle", rsVehicle);
                    request.getRequestDispatcher("/managerTrip/insertBusTrip.jsp").forward(request, response);
                }
                if (submit != null) {
                    String vehicleStr = request.getParameter("vehicleId");
                    // Định dạng đúng với chuỗi "yyyy/MM/dd"
                    DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                    LocalDate bt1_date = LocalDate.parse(request.getParameter("bt1_date"), dateFormatter);
                    // Định dạng thời gian nếu cần
                    DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
                    LocalTime bt1_departureTime = LocalTime.parse(request.getParameter("bt1_departureTime"), timeFormatter);
                    LocalTime bt1_arrivalTime = LocalTime.parse(request.getParameter("bt1_arrivalTime"), timeFormatter);
                    String bt1_status = request.getParameter("bt1_status");
                    int br_id = Integer.parseInt(request.getParameter("br_id"));
                    BusTrips busTrips = new BusTrips(0, bt1_date, bt1_departureTime, bt1_arrivalTime, bt1_status, br_id);
                    int id = dao.insertBusTrip(busTrips);
                    int vehicleId = Integer.parseInt(vehicleStr);
                    seatDao.insertSeats(vehicleId, id);
                    response.sendRedirect("BusTripURL?service=listOfAll");
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
                String submit = request.getParameter("submit");
                String sql = "SELECT DISTINCT bt.bt1_id, bt.bt1_date, bt.bt1_departureTime, bt.bt1_arrivalTime,\n"
                        + "bt.bt1_status, bt.br_id, v.v_licensePlate\n"
                        + "FROM BusTrips bt\n"
                        + "JOIN Seats s ON bt.bt1_id = s.bt1_id\n"
                        + "JOIN Vehicles v ON v.v_id = s.v_id WHERE 1=1";

                // Nếu người dùng bấm nút tìm kiếm
                if (submit != null) {
                    String dateStr = request.getParameter("bt1_date"); // Lấy ngày từ request
                    String status = request.getParameter("bt1_status"); // Lấy trạng thái
                    String brIdStr = request.getParameter("br_id"); // Lấy mã tuyến

                    // Lọc theo ngày (nếu có nhập)
                    if (dateStr != null && !dateStr.trim().isEmpty()) {
                        sql += " AND bt1_date = '" + dateStr + "'";
                    }

                    // Lọc theo trạng thái (nếu có nhập)
                    if (status != null && !status.trim().isEmpty()) {
                        sql += " AND bt1_status LIKE N'%" + status + "%'";
                    }

                    // Lọc theo mã tuyến (nếu có nhập và hợp lệ)
                    if (brIdStr != null && !brIdStr.trim().isEmpty()) {
                        try {
                            int brId = Integer.parseInt(brIdStr);
                            sql += " AND br_id = " + brId;
                        } catch (NumberFormatException e) {
                            request.setAttribute("error", "Mã tuyến phải là số hợp lệ!");
                        }
                    }
                }
                sql += " ORDER BY bt1_id DESC";
                ArrayList<BusTrips> list = dao.list(sql);
                request.setAttribute("listBusTrip", list);
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
