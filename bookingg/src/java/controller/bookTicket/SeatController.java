/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.bookTicket;

import dal.CustomerDao;
import dal.bookTicket.SeatsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Customer;
import model.bookTicket.Seats;

/**
 *
 * @author Admin
 */
public class SeatController extends HttpServlet {

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
        session.setAttribute("vehicleId", request.getParameter("vId"));
        session.setAttribute("tripId", request.getParameter("bt1Id"));
        session.setAttribute("routeId", request.getParameter("brId"));
        session.setAttribute("customerId", request.getParameter("c_id"));
        session.setAttribute("price", request.getParameter("price"));
        session.setAttribute("from", request.getParameter("from"));
        session.setAttribute("to", request.getParameter("to"));
        session.setAttribute("departureTime", request.getParameter("departureTime"));
        session.setAttribute("arrivalTime", request.getParameter("arrivalTime"));
       
       //kiểm 
       int c_id = 0;
       try {
           session.setAttribute("flag",1 );
           c_id = (int) session.getAttribute("c_id");
       } catch (Exception e) {
            response.sendRedirect("login.jsp");
            return;
       }
       
            CustomerDao dao = new CustomerDao();
            Customer cus = new Customer();
            cus = dao.getByID(c_id);
            // Lấy tripId và vehicleId từ request
            String tripIdStr = request.getParameter("bt1Id");
            String vehicleIdStr = request.getParameter("vId");

            // Kiểm tra xem có giá trị hay không, nếu có thì chuyển đổi sang int
            int tripId = (tripIdStr != null && !tripIdStr.isEmpty()) ? Integer.parseInt(tripIdStr) : 0;
            int vehicleId = (vehicleIdStr != null && !vehicleIdStr.isEmpty()) ? Integer.parseInt(vehicleIdStr) : 0;

            SeatsDAO seatDao = new SeatsDAO();
            List<Seats> seats = seatDao.getSeats(tripId, vehicleId);

            // Đưa danh sách ghế vào request attribute
            request.setAttribute("customer", cus);
            request.setAttribute("seats", seats);
            request.getRequestDispatcher("selectSeat.jsp").forward(request, response);
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
