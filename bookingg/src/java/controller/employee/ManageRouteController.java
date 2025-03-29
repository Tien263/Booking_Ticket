/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.employee;

import dal.managerTrip.BusRouteDAO;
import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.managerTrip.BusRoute;

/**
 *
 * @author ADMIN
 */
public class ManageRouteController extends HttpServlet {

    private static final int ITEMS_PER_PAGE = 14; // Số tuyến xe mỗi trang

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        BusRouteDAO brd = new BusRouteDAO();
        ArrayList<BusRoute> br;

        // Lấy tham số tìm kiếm từ request
        String brFrom = request.getParameter("br_from");
        String brTo = request.getParameter("br_to");
        String action = request.getParameter("action");
        String pageStr = request.getParameter("page"); // Lấy tham số page

        // Xác định trang hiện tại
        int currentPage = (pageStr != null && !pageStr.isEmpty()) ? Integer.parseInt(pageStr) : 1;
        if (currentPage < 1) currentPage = 1;

        // Lấy toàn bộ danh sách tuyến xe
        if ("reset".equals(action)) {
            br = brd.list();
            brFrom = "";
            brTo = "";
        } else if ((brFrom != null && !brFrom.trim().isEmpty()) || (brTo != null && !brTo.trim().isEmpty())) {
            br = brd.searchBusRoutes(brFrom, brTo);
        } else {
            br = brd.list();
        }

        // Tính toán phân trang
        int totalItems = br.size();
        int totalPages = (int) Math.ceil((double) totalItems / ITEMS_PER_PAGE);
        if (currentPage > totalPages) currentPage = totalPages > 0 ? totalPages : 1;

        // Cắt danh sách theo trang
        int start = (currentPage - 1) * ITEMS_PER_PAGE;
        int end = Math.min(start + ITEMS_PER_PAGE, totalItems);
        ArrayList<BusRoute> paginatedList = new ArrayList<>(br.subList(start, end));

        // Đặt dữ liệu vào request
        request.setAttribute("br", paginatedList);
        request.setAttribute("br_from", brFrom);
        request.setAttribute("br_to", brTo);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);

        // Chuyển hướng tới JSP
        request.getRequestDispatcher("listbusroutes.jsp").forward(request, response);
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
    }
}