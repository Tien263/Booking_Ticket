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
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

/**
 *
 * @author Admin
 */
public class SelectSeatController extends HttpServlet {

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
            String service = request.getParameter("service");
            if ("selectSeat".equals(service)) {
                SeatsDAO seatsDAO = new SeatsDAO();
                try {
                    HttpSession session = request.getSession(false); // Không tạo mới session nếu chưa có
                    if (session == null || session.getAttribute("price") == null) {
                        response.sendRedirect("error.jsp"); // Chuyển hướng nếu session không tồn tại
                        return;
                    }
                    String priceStr = (String) session.getAttribute("price");
                    Double price = Double.parseDouble(priceStr);
                    String[] seatIdsArray = request.getParameterValues("seatIds");
                    if (seatIdsArray == null || seatIdsArray.length == 0) {
                        request.setAttribute("message", "Đã xảy ra lỗi khi chọn ghế");
                        request.getRequestDispatcher("error.jsp").forward(request, response);
                        return;
                    }

                    List<Integer> seatIds = Arrays.stream(seatIdsArray)
                            .map(Integer::parseInt)
                            .toList();
                    List<String> seatNames = seatIds.stream()
                            .map(seatsDAO::getSeatName)
                            .filter(Objects::nonNull)
                            .toList();
                    // Lưu vào session
                    session.setAttribute("seatIds", seatIds);
                    double totalPrice = price * seatIds.size();
                    request.setAttribute("seatNames", seatNames);
                    session.setAttribute("totalPrice", totalPrice);
                    request.getRequestDispatcher("payment.jsp").forward(request, response);
//                    response.sendRedirect("/vnpay_jsp/vnpay_pay.jsp");
                } catch (NumberFormatException e) {
                    request.setAttribute("message", "Lỗi dữ liệu payment: " + e.getMessage());
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("message", "Yêu cầu bị từ chối. Vui lòng tạo lại!");
                request.getRequestDispatcher("error.jsp").forward(request, response);
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
