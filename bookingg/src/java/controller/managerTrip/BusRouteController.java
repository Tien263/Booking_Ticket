/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.managerTrip;

import dal.managerTrip.BusRouteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.managerTrip.BusRoute;

/**
 *
 * @author Admin
 */
public class BusRouteController extends HttpServlet {

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
        BusRouteDAO dao = new BusRouteDAO();

        String service = request.getParameter("service");
        if ("detail".equals(service)) {
            String br_id = request.getParameter("br_id");
            BusRouteDAO busRouteDAO = new BusRouteDAO();
            BusRoute busRoute = busRouteDAO.get(Integer.parseInt(br_id));

            request.setAttribute("busRoute", busRoute);
            request.getRequestDispatcher("/managerTrip/busRouteDetail.jsp").forward(request, response);
        }
        if (service.endsWith("insert")) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                request.getRequestDispatcher("/managerTrip/insertBusRoute.jsp").forward(request, response);
            }
            if (submit != null) {
                int distance = Integer.parseInt(request.getParameter("br_distance"));
                String from = request.getParameter("br_from");
                String to = request.getParameter("br_to");
                double price = Double.parseDouble(request.getParameter("br_price"));
                String description = request.getParameter("br_description");
                String status = request.getParameter("br_status");
                BusRoute busRoute = new BusRoute(0, distance, from, to, (double) price, description, status);
                dao.insert(busRoute);
                response.sendRedirect("BusRouteURL?service=listOfAll");
            }
        }

        if (service.endsWith("delete")) {
            int id = Integer.parseInt(request.getParameter("br_id"));
            BusRoute busRoute = dao.get(id);
            dao.delete(busRoute);
            response.sendRedirect("BusRouteURL?service=listOfAll");
        }

        if (service.endsWith("update")) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                int id = Integer.parseInt(request.getParameter("br_id"));
                BusRoute busRoute = dao.get(id);
                request.setAttribute("busRoute", busRoute);
                request.getRequestDispatcher("/managerTrip/updateBusRoute.jsp").forward(request, response);
            }
            if (submit != null) {
                int id = Integer.parseInt(request.getParameter("br_id"));
                int distance = Integer.parseInt(request.getParameter("br_distance"));
                String from = request.getParameter("br_from");
                String to = request.getParameter("br_to");
                double price = Double.parseDouble(request.getParameter("br_price"));
                String description = request.getParameter("br_description");
                String status = request.getParameter("br_status");
                BusRoute busRoute = new BusRoute(id, distance, from, to, (double) price, description, status);
                dao.update(busRoute);
                response.sendRedirect("BusRouteURL?service=listOfAll");
            }
        }

        if (service.endsWith("listOfAll")) {
            String submit = request.getParameter("submit");
            String sql = "SELECT [br_id],[br_distance],[br_from],[br_to],[br_price],[br_description],[br_status] FROM [dbo].[BusRoutes] WHERE 1=1";
            // Kiểm tra nếu người dùng bấm nút filter
            if (submit != null) {
                String from = request.getParameter("br_from");
                String to = request.getParameter("br_to");
                // Nếu có nhập điểm đi
                if (from != null && !from.trim().isEmpty()) {
                    sql += " AND br_from LIKE N'%" + from + "%'";
                }

                // Nếu có nhập điểm đến
                if (to != null && !to.trim().isEmpty()) {
                    sql += " AND br_to LIKE N'%" + to + "%'";
                }
            }
            ArrayList<BusRoute> list = dao.list(sql);
            request.setAttribute("listBusRoute", list);
            request.getRequestDispatcher("/managerTrip/listBusRoute.jsp").forward(request, response);
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
