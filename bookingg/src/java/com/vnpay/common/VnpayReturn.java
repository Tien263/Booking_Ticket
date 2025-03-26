package com.vnpay.common;

import dal.bookTicket.BookTicketDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.bookTicket.BookTicket;

/**
 *
 * @author HP
 */
public class VnpayReturn extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(VnpayReturn.class.getName());
    private BookTicketDAO bookTicketDao;

    @Override
    public void init() throws ServletException {
        // Initialize the DAO once when the servlet is created
        bookTicketDao = new BookTicketDAO();
    }

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
        try (PrintWriter out = response.getWriter()) {
            // Step 1: Parse and validate VNPay callback parameters
            Map<String, String> fields = new HashMap<>();
            for (Enumeration<String> params = request.getParameterNames(); params.hasMoreElements();) {
                String fieldName = URLEncoder.encode(params.nextElement(), StandardCharsets.US_ASCII.toString());
                String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
                if (fieldValue != null && !fieldValue.isEmpty()) {
                    fields.put(fieldName, fieldValue);
                }
            }

            String vnp_SecureHash = request.getParameter("vnp_SecureHash");
            fields.remove("vnp_SecureHashType");
            fields.remove("vnp_SecureHash");

            String signValue = Config.hashAllFields(fields);
            if (signValue.equals(vnp_SecureHash)) {
                // Step 2: Process the transaction
                String paymentCode = request.getParameter("vnp_TransactionNo");
                String bookTicketId = request.getParameter("vnp_TxnRef");

                // Validate bookTicketId
                if (bookTicketId == null || bookTicketId.trim().isEmpty()) {
                    LOGGER.log(Level.SEVERE, "Invalid bookTicketId received from VNPay: {0}", bookTicketId);
                    request.setAttribute("transResult", false);
                    request.setAttribute("errorMessage", "Invalid transaction reference.");
                    request.getRequestDispatcher("paymentResult.jsp").forward(request, response);
                    return;
                }

                // Step 3: Update BookTicket status
                BookTicket bookTicket = new BookTicket();
                try {
                    bookTicket.setBt_id(Integer.parseInt(bookTicketId));
                } catch (NumberFormatException e) {
                    LOGGER.log(Level.SEVERE, "Invalid bookTicketId format: {0}", bookTicketId);
                    request.setAttribute("transResult", false);
                    request.setAttribute("errorMessage", "Invalid transaction reference format.");
                    request.getRequestDispatcher("paymentResult.jsp").forward(request, response);
                    return;
                }

                boolean transSuccess = false;
                String vnp_TransactionStatus = request.getParameter("vnp_TransactionStatus");
                if ("00".equals(vnp_TransactionStatus)) {
                    // Transaction successful
                    bookTicket.setBt_status("confirmed");
                    transSuccess = true;
                } else {
                    // Transaction failed
                    bookTicket.setBt_status("failed"); // Changed from "pending" to "failed" for clarity
                }

                // Step 4: Update the database (this will also update Tickets table via updateStatus)
                try {
                    boolean updateSuccess = bookTicketDao.updateStatus(bookTicket);
                    if (!updateSuccess) {
                        LOGGER.log(Level.WARNING, "Failed to update BookTicket status for bt_id: {0}", bookTicket.getBt_id());
                        transSuccess = false; // Override transSuccess if the update fails
                    }
                } catch (Exception e) {
                    LOGGER.log(Level.SEVERE, "Error updating BookTicket status for bt_id: {0}", bookTicket.getBt_id());
                    LOGGER.log(Level.SEVERE, "Exception: ", e);
                    transSuccess = false;
                }

                // Step 5: Forward the result to the JSP
                request.setAttribute("transResult", transSuccess);
                request.setAttribute("paymentCode", paymentCode); // Optional: Pass payment code to JSP
                request.getRequestDispatcher("paymentResult.jsp").forward(request, response);
            } else {
                // Invalid signature
                LOGGER.log(Level.WARNING, "Invalid VNPay signature. Expected: {0}, Received: {1}", new Object[]{signValue, vnp_SecureHash});
                request.setAttribute("transResult", false);
                request.setAttribute("errorMessage", "Invalid transaction signature.");
                request.getRequestDispatcher("paymentResult.jsp").forward(request, response);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods.">
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
        return "Handles VNPay payment callback and updates booking status.";
    }
    // </editor-fold>
}