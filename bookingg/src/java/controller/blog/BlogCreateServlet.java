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

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 5, // 5MB
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
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        // Lấy thông tin từ form
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String brief = request.getParameter("brief");
        Part filePart = request.getPart("image");

        // Validate dữ liệu
        String errorMessage = validateBlogData(title, brief, content, filePart);
        if (errorMessage != null) {
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("createblog.jsp").forward(request, response);
            return;
        }

        // Xử lý file ảnh tải lên
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath);
        String fileUrl = request.getContextPath() + "/" + UPLOAD_DIR + "/" + fileName;

        // Tạo đối tượng Blog
        Blog blog = new Blog();
        blog.setTitle(title);
        blog.setContent(content);
        blog.setBrief(brief);
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

    private String validateBlogData(String title, String brief, String content, Part filePart) {
        if (title == null || title.trim().isEmpty()) {
            return "Tiêu đề không được để trống!";
        }
        if (title.length() > 255) {
            return "Tiêu đề không được vượt quá 255 ký tự!";
        }

        if (brief == null || brief.trim().isEmpty()) {
            return "Tóm tắt không được để trống!";
        }
        if (brief.length() > 500) {
            return "Tóm tắt không được vượt quá 500 ký tự!";
        }

        if (content == null || content.trim().isEmpty()) {
            return "Nội dung bài viết không được để trống!";
        }
        if (content.length() < 100) {
            return "Nội dung bài viết phải có ít nhất 100 ký tự!";
        }

        if (filePart == null || filePart.getSize() == 0) {
            return "Hình ảnh không được để trống!";
        }
        if (filePart.getSize() > 1024 * 1024 * 5) {
            return "Kích thước ảnh tối đa là 5MB!";
        }

        String fileName = filePart.getSubmittedFileName();
        if (!fileName.matches(".*\\.(jpg|jpeg|png)$")) {
            return "Hình ảnh chỉ được phép có định dạng JPG, JPEG hoặc PNG!";
        }

        return null; // Hợp lệ
    }

    @Override
    public String getServletInfo() {
        return "Servlet tạo bài viết Blog với validate dữ liệu";
    }
}