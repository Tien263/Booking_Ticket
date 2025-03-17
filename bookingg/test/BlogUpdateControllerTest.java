import controller.blog.BlogUpdateController;
import dal.BlogDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

import java.io.IOException;

import static org.mockito.Mockito.*;

public class BlogUpdateControllerTest {

    private BlogUpdateController servlet;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession session;
    private RequestDispatcher dispatcher;
    private BlogDao blogDao;

    @Before
    public void setUp() throws Exception {
        servlet = new BlogUpdateController();
        request = mock(HttpServletRequest.class);
        response = mock(HttpServletResponse.class);
        session = mock(HttpSession.class);
        dispatcher = mock(RequestDispatcher.class);
        blogDao = mock(BlogDao.class);

        when(request.getSession()).thenReturn(session);
        when(request.getRequestDispatcher(anyString())).thenReturn(dispatcher);
    }


    @Test
    public void BUOO1() throws ServletException, IOException {
        when(request.getParameter("id")).thenReturn("1");
        when(request.getParameter("title")).thenReturn(""); // Tiêu đề trống
        when(request.getParameter("brief")).thenReturn("Brief text");
        when(request.getParameter("content")).thenReturn("Content text.");
        when(request.getParameter("status")).thenReturn("Active");

        servlet.doPost(request, response);

        verify(request).setAttribute(eq("titleError"), eq("Tiêu đề không được để trống!"));
        verify(request).getRequestDispatcher("updateblog.jsp");
        verify(dispatcher).forward(request, response);
    }

    @Test
    public void BU002() throws ServletException, IOException {
        when(request.getParameter("id")).thenReturn("1");
        when(request.getParameter("title")).thenReturn("Valid Title");
        when(request.getParameter("brief")).thenReturn("Brief text");
        when(request.getParameter("content")).thenReturn(""); // Nội dung trống
        when(request.getParameter("status")).thenReturn("Active");

        servlet.doPost(request, response);

        verify(request).setAttribute(eq("contentError"), eq("Nội dung không được để trống!"));
        verify(request).getRequestDispatcher("updateblog.jsp");
        verify(dispatcher).forward(request, response);
    }

    @Test
    public void BU003() throws ServletException, IOException {
        when(request.getParameter("id")).thenReturn("1");
        when(request.getParameter("title")).thenReturn("Valid Title");
        when(request.getParameter("brief")).thenReturn("Brief text");
        when(request.getParameter("content")).thenReturn("Valid content.");
        when(request.getParameter("status")).thenReturn("InvalidStatus"); // Trạng thái không hợp lệ

        servlet.doPost(request, response);

        verify(request).setAttribute(eq("statusError"), eq("Trạng thái không hợp lệ!"));
        verify(request).getRequestDispatcher("updateblog.jsp");
        verify(dispatcher).forward(request, response);
    }

    
}
