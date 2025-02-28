/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.accesscontrol;

import dal.BlogDao;
import java.io.File;
import java.nio.file.Paths;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import java.sql.*;
import model.Blog;
import model.Employee;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class BlogServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BlogServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BlogServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("createblog.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Employee loggedUser = (Employee) session.getAttribute("user");

        if (loggedUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String brief = request.getParameter("brief");

         // Xử lý upload file
        Part imagePart = request.getPart("image");
        String imagePath = null;
        if (imagePart != null && imagePart.getSize() > 0) {
            String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
            String uploadDir = getServletContext().getRealPath("/uploads");

            File uploadDirFile = new File(uploadDir);
            if (!uploadDirFile.exists()) {
                uploadDirFile.mkdirs();
            }

            imagePath = "/uploads/" + fileName;
            imagePart.write(uploadDir + File.separator + fileName);
        }
        
        LocalDateTime now = LocalDateTime.now();
        Date sqlDate = Date.valueOf(now.toLocalDate());
        
        Blog blog = new Blog();
        blog.setTitle(title);
        blog.setContent(content);
        blog.setBrief(brief);
        blog.setCreatedby(loggedUser);
        blog.setUpdatedby(loggedUser);
        blog.setCreatedtime(sqlDate);
        blog.setUpdatedtime(sqlDate);
        blog.setStatus(true);
        blog.setImage(imagePath);
        
        BlogDao blogDao = new BlogDao();
        blogDao.insert(blog);
        
        response.sendRedirect("listblog");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
