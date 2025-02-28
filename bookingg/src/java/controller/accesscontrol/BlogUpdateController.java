/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.accesscontrol;

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
            
            Object userIdObj = request.getSession().getAttribute("user_id");
            if (userIdObj == null) {
                throw new ServletException("User ID is null. Make sure the user is logged in.");
            }
            
            int updatedById = (Integer) userIdObj;
            String updatedByName = (String) request.getSession().getAttribute("user_name");
            
            // Xử lý ảnh
            Part imagePart = request.getPart("image");
            String imagePath = request.getParameter("currentImage"); // Ảnh hiện tại
            
            if (imagePart != null && imagePart.getSize() > 0) {
                String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
                String uploadDir = getServletContext().getRealPath("\\bookingg\\web\\assets\\images\\blog\\");
                
                File uploadDirFile = new File(uploadDir);
                if (!uploadDirFile.exists()) {
                    uploadDirFile.mkdirs();
                }
                
                imagePath = "\\bookingg\\web\\assets\\images\\blog\\" + fileName;
                imagePart.write(uploadDir + File.separator + fileName);
            }

            BlogDao bd = new BlogDao();
            Blog blog = bd.get(id);
            if (blog == null) {
                request.setAttribute("errorMessage", "Không tìm thấy blog.");
                request.getRequestDispatcher("updateblog.jsp").forward(request, response);
                return;
            }

            blog.setTitle(title);
            blog.setBrief(brief);
            blog.setContent(content);
            blog.setStatus("Active".equals(status));
            blog.setImage(imagePath);
            blog.setUpdatedtime(new Date(System.currentTimeMillis()));
            blog.setUpdatedby(new Employee(updatedById, updatedByName));

            bd.update(blog);
            response.sendRedirect("listblog");
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "ID không hợp lệ.");
            request.getRequestDispatcher("updateblog.jsp").forward(request, response);
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
