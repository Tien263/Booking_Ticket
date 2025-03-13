import controller.accesscontrol.ContactController;
import dal.ContactDAO;
import model.Contact;
import org.junit.*;
import static org.junit.Assert.*;
import org.mockito.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

public class ContactControllerTest {

    private ContactController contactController;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private RequestDispatcher dispatcher;
    private ContactDAO contactDAO;

    @Before
    public void setUp() {
        contactController = new ContactController();
        request = Mockito.mock(HttpServletRequest.class);
        response = Mockito.mock(HttpServletResponse.class);
        dispatcher = Mockito.mock(RequestDispatcher.class);
        contactDAO = Mockito.mock(ContactDAO.class);

        Mockito.when(request.getRequestDispatcher(Mockito.anyString())).thenReturn(dispatcher);
    }

    @Test
    public void CCT01() throws ServletException, IOException {
        Mockito.when(request.getParameter("name")).thenReturn("");
        Mockito.when(request.getParameter("email")).thenReturn("test@example.com");
        Mockito.when(request.getParameter("message")).thenReturn("Hello, I need support.");

        contactController.doPost(request, response);

        Mockito.verify(request).setAttribute("errorMessage", "Họ và tên không được để trống!");
        Mockito.verify(dispatcher).forward(request, response);
    }

    @Test
    public void CCT02() throws ServletException, IOException {
        String longName = "A".repeat(201);
        Mockito.when(request.getParameter("name")).thenReturn(longName);
        Mockito.when(request.getParameter("email")).thenReturn("test@example.com");
        Mockito.when(request.getParameter("message")).thenReturn("Hello, I need support.");

        contactController.doPost(request, response);

        Mockito.verify(request).setAttribute("errorMessage", "Họ và tên không được vượt quá 200 ký tự!");
        Mockito.verify(dispatcher).forward(request, response);
    }

    @Test
    public void CCT03() throws ServletException, IOException {
        Mockito.when(request.getParameter("name")).thenReturn("Nguyễn Văn A");
        Mockito.when(request.getParameter("email")).thenReturn("invalid-email");
        Mockito.when(request.getParameter("message")).thenReturn("Hello, I need support.");

        contactController.doPost(request, response);

        Mockito.verify(request).setAttribute("errorMessage", "Email không hợp lệ! Vui lòng nhập đúng định dạng email (ví dụ: example@email.com)");
        Mockito.verify(dispatcher).forward(request, response);
    }

    @Test
    public void CCT04() throws ServletException, IOException {
        Mockito.when(request.getParameter("name")).thenReturn("Nguyễn Văn A");
        Mockito.when(request.getParameter("email")).thenReturn("");
        Mockito.when(request.getParameter("message")).thenReturn("Hello, I need support.");

        contactController.doPost(request, response);

        Mockito.verify(request).setAttribute("errorMessage", "Email không được để trống!");
        Mockito.verify(dispatcher).forward(request, response);
    }

    @Test
    public void CCT05() throws ServletException, IOException {
        Mockito.when(request.getParameter("name")).thenReturn("Nguyễn Văn A");
        Mockito.when(request.getParameter("email")).thenReturn("test@example.com");
        Mockito.when(request.getParameter("message")).thenReturn("");

        contactController.doPost(request, response);

        Mockito.verify(request).setAttribute("errorMessage", "Mô tả không được để trống!");
        Mockito.verify(dispatcher).forward(request, response);
    }

    @Test
    public void CCT06() throws ServletException, IOException {
        Mockito.when(request.getParameter("name")).thenReturn("Nguyễn Văn A");
        Mockito.when(request.getParameter("email")).thenReturn("test@example.com");
        Mockito.when(request.getParameter("message")).thenReturn("Hello, I need support.");

        Contact contact = new Contact("Nguyễn Văn A", "test@example.com", "Hello, I need support.", Timestamp.valueOf(LocalDateTime.now()));

        Mockito.doNothing().when(contactDAO).insertContact(Mockito.any(Contact.class));

        contactController.doPost(request, response);

        Mockito.verify(request).setAttribute("successMessage", "Gửi liên hệ thành công! Cảm ơn bạn đã liên hệ, chúng tôi sẽ phản hồi lại sớm.");
        Mockito.verify(dispatcher).forward(request, response);
    }

    @After
    public void tearDown() {
        Mockito.reset(request, response, dispatcher, contactDAO);
    }
}