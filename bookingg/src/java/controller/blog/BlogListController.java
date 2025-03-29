package controller.blog;

import dal.BlogDao;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Blog;

public class BlogListController extends HttpServlet {

    private BlogDao blogDao = new BlogDao();
    private static final int BLOGS_PER_PAGE = 1; // Số blog trên mỗi trang

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy tất cả blog từ database
        List<Blog> allBlogs = blogDao.getAllBlogs();

        // Tính tổng số trang
        int totalBlogs = allBlogs.size();
        int totalPages = (int) Math.ceil((double) totalBlogs / BLOGS_PER_PAGE);

        // Lấy số trang hiện tại từ tham số "page" trong URL
        String pageParam = request.getParameter("page");
        int currentPage = (pageParam != null && !pageParam.isEmpty()) ? Integer.parseInt(pageParam) : 1;
        if (currentPage < 1) {
            currentPage = 1;
        } else if (currentPage > totalPages && totalPages > 0) {
            currentPage = totalPages;
        }

        // Tính chỉ số bắt đầu và kết thúc của blog trong trang hiện tại
        int startIndex = (currentPage - 1) * BLOGS_PER_PAGE;
        int endIndex = Math.min(startIndex + BLOGS_PER_PAGE, totalBlogs);

        // Lấy danh sách blog cho trang hiện tại
        List<Blog> blogsForPage = new ArrayList<>();
        if (totalBlogs > 0) {
            blogsForPage = allBlogs.subList(startIndex, endIndex);
        }

        // Đặt các thuộc tính vào request để JSP sử dụng
        request.setAttribute("blog", blogsForPage);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);

        // Chuyển hướng đến listblog.jsp
        request.getRequestDispatcher("listblog.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response); // Chuyển POST sang GET
    }

    @Override
    public String getServletInfo() {
        return "Servlet to list blogs with pagination";
    }
}