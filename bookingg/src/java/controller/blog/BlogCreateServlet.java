package controller.blog;

import dal.BlogDao;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.Date;
import java.time.LocalDateTime;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.Blog;
import model.Employee;

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10, // 10MB
    maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class BlogCreateServlet extends HttpServlet {
    private static final String UPLOAD_DIR = "upload";

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
        
        // Lưu file ảnh
        Part filePart = request.getPart("image");
        String fileName = null;
        String fileUrl = null;
        if (filePart != null && filePart.getSize() > 0) {
            fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();
            
            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);
            fileUrl = request.getContextPath() + "/" + UPLOAD_DIR + "/" + fileName;
        }

        Blog blog = new Blog();
        blog.setTitle(title);
        blog.setContent(content);
        blog.setBrief(brief);
        blog.setCreatedby(loggedUser);
        blog.setUpdatedby(loggedUser);
        blog.setCreatedtime(Date.valueOf(LocalDateTime.now().toLocalDate()));
        blog.setUpdatedtime(Date.valueOf(LocalDateTime.now().toLocalDate()));
        blog.setStatus(true);
        blog.setImage(fileUrl);
        
        BlogDao blogDao = new BlogDao();
        blogDao.insert(blog);
        response.sendRedirect("listblog");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
