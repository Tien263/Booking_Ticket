/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.bookTicket;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Customer;

public class CheckCId extends HttpServlet {

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
        HttpSession session = request.getSession();

        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            // Lưu thông tin chuyến xe vào session
            session.setAttribute("routeId", request.getParameter("brId"));
            session.setAttribute("from", request.getParameter("from"));
            session.setAttribute("to", request.getParameter("to"));
            session.setAttribute("departureTime", request.getParameter("departureTime"));
            session.setAttribute("arrivalTime", request.getParameter("arrivalTime"));
            session.setAttribute("price", request.getParameter("price"));
            session.setAttribute("description", request.getParameter("description"));
            session.setAttribute("distance", request.getParameter("distance"));
            session.setAttribute("vehicleId", request.getParameter("vId"));
            session.setAttribute("tripId", request.getParameter("bt1Id"));
            session.setAttribute("tripDate", request.getParameter("bt1_date"));

            // Đặt flag = 1 để sau khi đăng nhập chuyển đến SeatControllerServlet
            session.setAttribute("flag", 1);
            request.setAttribute("message", "Vui lòng đăng nhập để tiếp tục.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // Nếu đã đăng nhập, lưu thông tin vào session và chuyển thẳng đến SeatControllerServlet
        session.setAttribute("routeId", request.getParameter("brId"));
        session.setAttribute("from", request.getParameter("from"));
        session.setAttribute("to", request.getParameter("to"));
        session.setAttribute("departureTime", request.getParameter("departureTime"));
        session.setAttribute("arrivalTime", request.getParameter("arrivalTime"));
        session.setAttribute("price", request.getParameter("price"));
        session.setAttribute("description", request.getParameter("description"));
        session.setAttribute("distance", request.getParameter("distance"));
        session.setAttribute("vehicleId", request.getParameter("vId"));
        session.setAttribute("tripId", request.getParameter("bt1Id"));
        session.setAttribute("tripDate", request.getParameter("bt1_date"));
        request.getRequestDispatcher("SeatURL").forward(request, response);
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
