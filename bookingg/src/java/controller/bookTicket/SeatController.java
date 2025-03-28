/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.bookTicket;

import dal.bookTicket.SeatsDAO;
import java.io.IOException;
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
        // Kiểm tra trạng thái đăng nhập
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            request.setAttribute("message", "Không tìm thấy thông tin khách hàng.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        // Lấy tripId và vehicleId từ request
        String tripIdStr = (String) session.getAttribute("tripId");
        String vehicleIdStr = (String) session.getAttribute("vehicleId");

       try {
            int tripId = Integer.parseInt(tripIdStr);
            int vehicleId = Integer.parseInt(vehicleIdStr);
            
            // Lấy thông tin ghế ngồi
            SeatsDAO seatDao = new SeatsDAO();
            List<Seats> seats = seatDao.getSeats(tripId, vehicleId);

            // Đặt dữ liệu cho JSP
            request.setAttribute("customer", customer);
            request.setAttribute("seats", seats);

            // Chuyển hướng đến trang chọn ghế
            request.getRequestDispatcher("selectSeat.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Dữ liệu không hợp lệ!");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Đã xảy ra lỗi khi lấy thông tin ghế!");
            request.getRequestDispatcher("error.jsp").forward(request, response);
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
