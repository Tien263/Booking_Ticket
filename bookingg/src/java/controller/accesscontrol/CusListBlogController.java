/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.accesscontrol;

import dal.BlogDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Blog;

/**
 *
 * @author ADMIN
 */
public class CusListBlogController extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CusListBlogController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CusListBlogController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        BlogDao bdao = new BlogDao();
        List<Blog> listB = bdao.list();
        
        request.setAttribute("listB", listB);
        request.getRequestDispatcher("blog.jsp").forward(request, response);


    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

   
    public static void main(String[] args) {
        // Tạo instance của BlogDao
        BlogDao bdao = new BlogDao();
        
        // Lấy danh sách blog
        List<Blog> listB = bdao.list();
        
        // Kiểm tra danh sách có dữ liệu không
        if (listB.isEmpty()) {
            System.out.println("Không có blog nào trong danh sách.");
        } else {
            System.out.println("Danh sách blog:");
            for (Blog b : listB) {
                System.out.println("ID: " + b.getId() + ", Title: " + b.getTitle());
            }
        }
    }
}
