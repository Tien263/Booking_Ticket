/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.employee;

import dal.managerTrip.BusRouteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.managerTrip.BusRoute;

/**
 *
 * @author ADMIN
 */
public class ManageRouteController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            BusRouteDAO brd = new BusRouteDAO();
            ArrayList<BusRoute> br;

            // Lấy tham số tìm kiếm từ request
            String brFrom = request.getParameter("br_from");
            String brTo = request.getParameter("br_to");
            String action = request.getParameter("action"); // Thêm tham số action để xử lý nút "Xóa"

            // Nếu nhấn nút "Xóa", reset form và hiển thị toàn bộ danh sách
            if ("reset".equals(action)) {
                br = brd.list();
                brFrom = "";
                brTo = "";
            } else if ((brFrom != null && !brFrom.trim().isEmpty()) || (brTo != null && !brTo.trim().isEmpty())) {
                // Nếu có tham số tìm kiếm, gọi phương thức search
                br = brd.searchBusRoutes(brFrom, brTo);
            } else {
                // Nếu không có tham số, liệt kê toàn bộ
                br = brd.list();
            }

            // Đặt danh sách tuyến xe và giá trị tìm kiếm vào request để hiển thị
            request.setAttribute("br", br);
            request.setAttribute("br_from", brFrom);
            request.setAttribute("br_to", brTo);
            request.getRequestDispatcher("listbusroutes.jsp").forward(request, response);

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
        return "Short description";
    }// </editor-fold>

}
