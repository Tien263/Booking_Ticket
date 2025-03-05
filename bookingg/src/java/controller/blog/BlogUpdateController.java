/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.blog;

import dal.BlogDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import java.sql.Date;
import model.Blog;
import model.Employee;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)

public class BlogUpdateController extends HttpServlet {

    private static final String UPLOAD_DIR = "upload";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String idParam = request.getParameter("id");
            if (idParam == null || idParam.isEmpty()) {
                request.setAttribute("errorMessage", "ID không được cung cấp.");
                request.getRequestDispatcher("updateblog.jsp").forward(request, response);
                return;
            }
            int id = Integer.parseInt(idParam);
            BlogDao bd = new BlogDao();
            Blog b = bd.get(id);
            if (b != null) {
                request.setAttribute("b", b);
                request.getRequestDispatcher("updateblog.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Không tìm thấy blog.");
                request.getRequestDispatcher("updateblog.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "ID không hợp lệ.");
            request.getRequestDispatcher("updateblog.jsp").forward(request, response);
        }

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
        
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String brief = request.getParameter("brief");
            String content = request.getParameter("content");
            String status = request.getParameter("status");
            
            BlogDao bd = new BlogDao();
            Blog blog = bd.get(id);
            if (blog == null) {
                request.setAttribute("errorMessage", "Không tìm thấy blog.");
                request.getRequestDispatcher("updateblog.jsp").forward(request, response);
                return;
            }
            
            Part filePart = request.getPart("image");
            String fileName = null;
            String fileUrl = blog.getImage();
            if (filePart != null && filePart.getSize() > 0) {
                fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdir();
                
                String filePath = uploadPath + File.separator + fileName;
                filePart.write(filePath);
                fileUrl = request.getContextPath() + "/" + UPLOAD_DIR + "/" + fileName;
            }
            
            blog.setTitle(title);
            blog.setBrief(brief);
            blog.setContent(content);
            blog.setStatus("Active".equals(status));
            blog.setImage(fileUrl);
            blog.setUpdatedtime(new Date(System.currentTimeMillis()));
            blog.setUpdatedby(loggedUser);
            
            bd.update(blog);
            response.sendRedirect("listblog");
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Lỗi khi cập nhật blog: " + e.getMessage());
            request.getRequestDispatcher("updateblog.jsp").forward(request, response);
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
