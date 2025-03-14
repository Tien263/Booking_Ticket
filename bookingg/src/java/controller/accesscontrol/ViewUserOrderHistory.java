/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.accesscontrol;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import dal.UserDBContext;
import model.User1;

/**
 *
 * @author Nguyen Minh Duc
 */
public class ViewUserOrderHistory extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
 protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");

    // Lấy dữ liệu từ form
    String hourStr = request.getParameter("hour");
    String minuteStr = request.getParameter("minute");
    String travelDate = request.getParameter("travelDate");
    String departure = request.getParameter("departure");
    String arrival = request.getParameter("arrival");

    // Khởi tạo UserDBContext để truy vấn dữ liệu
    UserDBContext userDAO = new UserDBContext();
    List<User1> userList = null;
    String errorMessage = null;

    // Kiểm tra nếu có dữ liệu giờ và phút
    if (hourStr != null && minuteStr != null && !hourStr.isEmpty() && !minuteStr.isEmpty()) {
        try {
            int hour = Integer.parseInt(hourStr);
            int minute = Integer.parseInt(minuteStr);

            // Kiểm tra điều kiện hợp lệ của giờ và phút
            if (hour < 0 || hour > 23 || minute < 0 || minute > 59) {
                errorMessage = "Giờ phải từ 0-23 và phút phải từ 0-59!";
            } else {
                String time = String.format("%02d:%02d", hour, minute);
                userList = userDAO.getUserTransactionsFiltered(time, travelDate, departure, arrival);
            }
        } catch (NumberFormatException e) {
            errorMessage = "Giờ và phút phải là số nguyên hợp lệ!";
        }
    }

    // Nếu không có giờ phút hoặc có lỗi, lấy toàn bộ danh sách người dùng
    if (userList == null) {
  
        userList = userDAO.getUserTransactions();
        request.setAttribute("error", "Không có dữ liệu liên quan!!!");
    }

    // Chuyển hướng tới JSP (ad1.jsp)
    request.setAttribute("userList", userList);
    RequestDispatcher dispatcher = request.getRequestDispatcher("ad1.jsp");
    dispatcher.forward(request, response);
}

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo(){
        return "Short description";
    }// </editor-fold>

    
}
