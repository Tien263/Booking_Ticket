package filter;

import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

public class authenticationBlog implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // Lấy đường dẫn request
        String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());

        // Bỏ qua filter nếu truy cập vào trang home hoặc login
        if (path.equals("/home.jsp") || path.equals("/employee_login.jsp")) {
            chain.doFilter(request, response);
            return;
        }

        // Kiểm tra nếu truy cập vào trang blog
        if (path.startsWith("/blog")) {
            HttpSession session = httpRequest.getSession(false);
            
            // Kiểm tra session có tồn tại không
            if (session == null) {
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/employee_login.jsp?RoleErr=true");
                return;
            }

            // Lấy user từ session
            Object sessionUser = session.getAttribute("user");

            // Kiểm tra xem session có đúng kiểu `User` không
            if (sessionUser instanceof User) {
                User user = (User) sessionUser;

                // Kiểm tra quyền truy cập
                if (user.getRoleID() == 1) { // 1 là RoleID của Blog Manager
                    chain.doFilter(request, response);
                    return;
                } else {
                    httpResponse.sendRedirect(httpRequest.getContextPath() + "/home.jsp?RoleErr=true");
                    return;
                }
            } else {
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/employee_login.jsp?RoleErr=true");
                return;
            }
        }

        // Nếu không phải trang blog, tiếp tục xử lý request bình thường
        chain.doFilter(request, response);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void destroy() {
    }
}
