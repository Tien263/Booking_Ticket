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
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        BlogDao bd = new BlogDao();

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Blog blog = bd.get(id);

            if (blog == null) {
                request.setAttribute("errorMessage", "Không tìm thấy blog.");
                request.getRequestDispatcher("updateblog.jsp").forward(request, response);
                return;
            }

            String title = request.getParameter("title");
            String brief = request.getParameter("brief");
            String content = request.getParameter("content");
            String status = request.getParameter("status");

            boolean hasError = false;

            // Validate tiêu đề
            if (title == null || title.trim().isEmpty()) {
                request.setAttribute("titleError", "Tiêu đề không được để trống!");
                hasError = true;
            } else if (title.length() > 255) {
                request.setAttribute("titleError", "Tiêu đề không được vượt quá 255 ký tự!");
                hasError = true;
            }

            // Validate tóm tắt
            if (brief == null || brief.trim().isEmpty()) {
                request.setAttribute("briefError", "Tóm tắt không được để trống!");
                hasError = true;
            } else if (brief.length() > 500) {
                request.setAttribute("briefError", "Tóm tắt không được vượt quá 500 ký tự!");
                hasError = true;
            }

            // Validate nội dung
            if (content == null || content.trim().isEmpty()) {
                request.setAttribute("contentError", "Nội dung không được để trống!");
                hasError = true;
            } else if (content.length() < 100) {
                request.setAttribute("contentError", "Nội dung phải có ít nhất 100 ký tự!");
                hasError = true;
            }

            // Kiểm tra ảnh (nếu người dùng tải lên ảnh mới)
            Part filePart = request.getPart("image");
            String fileUrl = blog.getImage();
            if (filePart != null && filePart.getSize() > 0) {
                if (filePart.getSize() > 1024 * 1024 * 5) {
                    request.setAttribute("imageError", "Ảnh tối đa 5MB!");
                    hasError = true;
                } else if (!filePart.getSubmittedFileName().matches(".*\\.(jpg|jpeg|png)$")) {
                    request.setAttribute("imageError", "Ảnh chỉ hỗ trợ JPG, JPEG, PNG!");
                    hasError = true;
                } else {
                    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                    String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdir();
                    }

                    String filePath = uploadPath + File.separator + fileName;
                    filePart.write(filePath);
                    fileUrl = request.getContextPath() + "/" + UPLOAD_DIR + "/" + fileName;
                }
            }

            // Nếu có lỗi, quay lại trang cập nhật
            if (hasError) {
                request.setAttribute("b", blog);
                request.getRequestDispatcher("updateblog.jsp").forward(request, response);
                return;
            }

            // Cập nhật thông tin blog
            blog.setTitle(title);
            blog.setBrief(brief);
            blog.setContent(content);
            blog.setStatus("Active".equals(status));
            blog.setImage(fileUrl);
            blog.setUpdatedtime(new Date(System.currentTimeMillis()));

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
