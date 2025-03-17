/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.accesscontrol;

import dal.TermsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Term;

/**
 *
 * @author Quang Anh
 */
public class TermsController extends HttpServlet {

    private TermsDAO termsDAO = new TermsDAO();

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
            out.println("<title>Servlet TermsController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TermsController at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        List<String> role = (List<String>) session.getAttribute("roles");

        if (action == null) {
            request.setAttribute("terms", termsDAO.getAllTerms());
            request.getRequestDispatcher("terms.jsp").forward(request, response);
        } else if (action.equals("edit") && role != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("term", termsDAO.getTermById(id));
            request.getRequestDispatcher("editTerm.jsp").forward(request, response);
        } else if (action.equals("delete") && role != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            termsDAO.deleteTerm(id);
            response.sendRedirect("terms");
        } else if (action.equals("add") && role != null) {
            Term term = new Term();
            term.setId(null);
            request.setAttribute("term", term);
            request.getRequestDispatcher("editTerm.jsp").forward(request, response);
        }

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
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        if ("add".equals(action)) {
            termsDAO.addTerm(title, content);
        } else if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            termsDAO.updateTerm(id, title, content);
        }

        response.sendRedirect("terms");

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
