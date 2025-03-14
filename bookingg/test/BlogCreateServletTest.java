import controller.blog.BlogCreateServlet;
import dal.BlogDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.Blog;
import org.junit.*;
import static org.junit.Assert.*;
import org.mockito.*;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDateTime;

public class BlogCreateServletTest {

    private BlogCreateServlet servlet;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession session;
    private RequestDispatcher dispatcher;
    private BlogDao blogDao;
    private Part filePart;

    @Before
    public void setUp() {
        servlet = new BlogCreateServlet();
        request = Mockito.mock(HttpServletRequest.class);
        response = Mockito.mock(HttpServletResponse.class);
        session = Mockito.mock(HttpSession.class);
        dispatcher = Mockito.mock(RequestDispatcher.class);
        blogDao = Mockito.mock(BlogDao.class);
        filePart = Mockito.mock(Part.class);

        Mockito.when(request.getSession()).thenReturn(session);
        Mockito.when(request.getRequestDispatcher(Mockito.anyString())).thenReturn(dispatcher);
    }

    @Test
    public void BC001() throws ServletException, IOException {
        Mockito.when(request.getParameter("title")).thenReturn("");
        Mockito.when(request.getParameter("brief")).thenReturn("Brief content");
        Mockito.when(request.getParameter("content")).thenReturn("This is a test content with more than 100 characters...");
        Mockito.when(request.getPart("image")).thenReturn(filePart);
        Mockito.when(filePart.getSize()).thenReturn(1024L);
        Mockito.when(filePart.getSubmittedFileName()).thenReturn("image.jpg");

        servlet.doPost(request, response);

        Mockito.verify(request).setAttribute("errorMessage", "Tiêu đề không được để trống!");
        Mockito.verify(dispatcher).forward(request, response);
    }

    @Test
    public void BC002() throws ServletException, IOException {
        Mockito.when(request.getParameter("title")).thenReturn("Test Title");
        Mockito.when(request.getParameter("brief")).thenReturn("Brief content");
        Mockito.when(request.getParameter("content")).thenReturn("Short");
        Mockito.when(request.getPart("image")).thenReturn(filePart);
        Mockito.when(filePart.getSize()).thenReturn(1024L);
        Mockito.when(filePart.getSubmittedFileName()).thenReturn("image.jpg");

        servlet.doPost(request, response);

        Mockito.verify(request).setAttribute("errorMessage", "Nội dung bài viết phải có ít nhất 100 ký tự!");
        Mockito.verify(dispatcher).forward(request, response);
    }

    @After
    public void tearDown() {
        Mockito.reset(request, response, session, dispatcher, blogDao, filePart);
    }
}