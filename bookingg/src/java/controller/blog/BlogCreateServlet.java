package controller.blog;

import dal.BlogDao;
import java.io.File;
import java.io.IOException;
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.sendRedirect("createblog.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy session
        HttpSession session = request.getSession();
        Object userObj = session.getAttribute("user"); // Lấy đối tượng từ session

        // Kiểm tra kiểu của đối tượng
        if (!(userObj instanceof Employee)) {
            response.sendRedirect("/bookingg/employee_login.jsp"); // Chuyển hướng nếu không phải Employee
            return;
        }
        
        Employee loggedUser = (Employee) userObj; // Ép kiểu an toàn

        // Lấy thông tin từ form
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String brief = request.getParameter("brief");

        // Xử lý file ảnh tải lên
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

        // Tạo đối tượng Blog
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

        // Lưu vào database
        BlogDao blogDao = new BlogDao();
        blogDao.insert(blog);

        // Chuyển hướng về danh sách blog
        response.sendRedirect("listblog");
    }

    @Override
    public String getServletInfo() {
        return "Servlet tạo bài viết Blog";
    }
}
