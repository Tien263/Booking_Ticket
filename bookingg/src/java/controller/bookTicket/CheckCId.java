/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.bookTicket;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Nguyen Minh Duc
 */
public class CheckCId extends HttpServlet {
   
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
       String c_id = request.getParameter("c_id");
//        System.out.println("checkid:" + c_id);
    // Nếu chưa đăng nhập, chuyển hướng về trang login.jsp
    if (c_id.equals("null") ) {
        response.sendRedirect("login.jsp");
        return;
    }
    else{ 
//        System.out.println("controller.bookTicket.CheckCId.processRequest()");
        
String brId = request.getParameter("brId");
String from = request.getParameter("from");
String to = request.getParameter("to");
String departureTime = request.getParameter("departureTime");
String arrivalTime = request.getParameter("arrivalTime");
String price = request.getParameter("price");
String description = request.getParameter("description");
String distance = request.getParameter("distance");
String vId = request.getParameter("vId");
String bt1Id = request.getParameter("bt1Id"); 

                System.out.println("customerId: " + c_id);
                System.out.println("routeId: " + brId);
                System.out.println("tripId: " + bt1Id);
                System.out.println("vehicleId: " + vId);
                System.out.println("price: " + price);

request.setAttribute("c_id", c_id);
request.setAttribute("brId", brId);
request.setAttribute("from", from);
request.setAttribute("to", to);
request.setAttribute("departureTime", departureTime);
request.setAttribute("arrivalTime", arrivalTime);
request.setAttribute("price", price);
request.setAttribute("description", description);
request.setAttribute("distance", distance);
request.setAttribute("vId", vId);
request.setAttribute("bt1Id", bt1Id);
request.getRequestDispatcher("selectSeat.jsp").forward(request, response);

    return;
    }
    
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
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
