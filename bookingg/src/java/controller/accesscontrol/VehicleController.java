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
        
        List<Vehicle> vehicles = vehicleDAO.getAllVehicles();
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String type = request.getParameter("type");
            int capacity = Integer.parseInt(request.getParameter("capacity"));
            String licensePlate = request.getParameter("licensePlate");
            String status = request.getParameter("status");

            Vehicle vehicle = new Vehicle(id, type, capacity, licensePlate, status);
            boolean isInserted = vehicleDAO.insertVehicle(vehicle);

            if (!isInserted) {
                request.setAttribute("errorMessage", "Biển số xe hoặc ID của xe đã tồn tại!");
            } else {
                request.setAttribute("successMessage", "Thêm phương tiện thành công!");
            }
            request.getRequestDispatcher("vehicles.jsp").forward(request, response);
            return;
        } else if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String type = request.getParameter("type");
            int capacity = Integer.parseInt(request.getParameter("capacity"));
            String licensePlate = request.getParameter("licensePlate");
            String status = request.getParameter("status");

            Vehicle vehicle = new Vehicle(id, type, capacity, licensePlate, status);
            boolean isUpdated = vehicleDAO.updateVehicle(vehicle);

            if (!isUpdated) {
                request.setAttribute("errorMessage", "Biển số xe hoặc ID của xe đã tồn tại! Vui lòng cập nhật lại.");
            } else {
                request.setAttribute("successMessage", "Cập nhật phương tiện thành công!");
            }
            request.getRequestDispatcher("vehicles.jsp").forward(request, response);
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
