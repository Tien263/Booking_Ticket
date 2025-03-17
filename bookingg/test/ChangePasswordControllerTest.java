import controller.accesscontrol.ChangePasswordController;
import dal.CustomerDao;
import model.Customer;
import org.junit.*;
import static org.junit.Assert.*;
import org.mockito.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class ChangePasswordControllerTest {

    private ChangePasswordController changePasswordController;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession session;
    private RequestDispatcher dispatcher;
    private CustomerDao customerDao;

    @Before
    public void setUp() {
        changePasswordController = new ChangePasswordController();
        request = Mockito.mock(HttpServletRequest.class);
        response = Mockito.mock(HttpServletResponse.class);
        session = Mockito.mock(HttpSession.class);
        dispatcher = Mockito.mock(RequestDispatcher.class);
        customerDao = Mockito.mock(CustomerDao.class);

        Mockito.when(request.getSession()).thenReturn(session);
        Mockito.when(request.getRequestDispatcher(Mockito.anyString())).thenReturn(dispatcher);
    }

    @Test
    public void CPID01() throws ServletException, IOException {
        // Mô phỏng khách hàng đăng nhập
        Customer customer = new Customer();
        customer.setEmail("admin3@gmail.com");
        customer.setPassword("$2a$10$CSuy7n2h17H.nl.ulskf/.i2DdIomDpWHuG3YoVYJx9WJbXkb698q"); // BCrypt hash của "OldPassword123!"

        Mockito.when(session.getAttribute("customer")).thenReturn(customer);
        Mockito.when(request.getParameter("currentPassword")).thenReturn("Tiennguyen13a11");
        Mockito.when(request.getParameter("newPassword")).thenReturn("NewPassw0rd!");
        Mockito.when(request.getParameter("retypeNewPassword")).thenReturn("NewPassw0rd!");
        Mockito.when(customerDao.getByEmail("test@example.com")).thenReturn(customer);

        changePasswordController.doPost(request, response);

        Mockito.verify(request).setAttribute("success", "Mật khẩu đã được thay đổi thành công!");
        Mockito.verify(dispatcher).forward(request, response);
    }

    @Test
    public void CPID02() throws ServletException, IOException {
        Customer customer = new Customer();
        customer.setEmail("admin3@gmail.com");
        customer.setPassword("$2a$10$CSuy7n2h17H.nl.ulskf/.i2DdIomDpWHuG3YoVYJx9WJbXkb698q"); // BCrypt hash của "OldPassword123!"

        Mockito.when(session.getAttribute("customer")).thenReturn(customer);
        Mockito.when(request.getParameter("currentPassword")).thenReturn("WrongPassword");
        Mockito.when(request.getParameter("newPassword")).thenReturn("NewPassw0rd!");
        Mockito.when(request.getParameter("retypeNewPassword")).thenReturn("NewPassw0rd!");
        Mockito.when(customerDao.getByEmail("test@example.com")).thenReturn(customer);

        changePasswordController.doPost(request, response);

        Mockito.verify(request).setAttribute("error", "Mật khẩu cũ không chính xác!");
        Mockito.verify(dispatcher).forward(request, response);
    }

    @Test
    public void CPID03() throws ServletException, IOException {
        Customer customer = new Customer();
        customer.setEmail("admin3@gmail.com");
        customer.setPassword("$2a$10$CSuy7n2h17H.nl.ulskf/.i2DdIomDpWHuG3YoVYJx9WJbXkb698q"); // BCrypt hash của "OldPassword123!"

        Mockito.when(session.getAttribute("customer")).thenReturn(customer);
        Mockito.when(request.getParameter("currentPassword")).thenReturn("Tiennguyen13a11");
        Mockito.when(request.getParameter("newPassword")).thenReturn("NewPassw0rd!");
        Mockito.when(request.getParameter("retypeNewPassword")).thenReturn("DifferentPass!");
        Mockito.when(customerDao.getByEmail("test@example.com")).thenReturn(customer);

        changePasswordController.doPost(request, response);

        Mockito.verify(request).setAttribute("error", "Mật khẩu xác nhận không khớp!");
        Mockito.verify(dispatcher).forward(request, response);
    }

    @Test
    public void CPID04() throws ServletException, IOException {
        Customer customer = new Customer();
        customer.setEmail("admin3@gmail.com");
        customer.setPassword("$2a$10$CSuy7n2h17H.nl.ulskf/.i2DdIomDpWHuG3YoVYJx9WJbXkb698q"); // BCrypt hash của "OldPassword123!"

        Mockito.when(session.getAttribute("customer")).thenReturn(customer);
        Mockito.when(request.getParameter("currentPassword")).thenReturn("Tiennguyen13a11");
        Mockito.when(request.getParameter("newPassword")).thenReturn("short");
        Mockito.when(request.getParameter("retypeNewPassword")).thenReturn("short");
        Mockito.when(customerDao.getByEmail("test@example.com")).thenReturn(customer);

        changePasswordController.doPost(request, response);

        Mockito.verify(request).setAttribute("error", "Mật khẩu phải có ít nhất 8 ký tự, bao gồm ít nhất 3 trong các loại sau: chữ hoa, chữ thường, số và ký tự đặc biệt. Không được có quá 2 ký tự giống nhau liên tiếp!");
        Mockito.verify(dispatcher).forward(request, response);
    }

    @After
    public void tearDown() {
        Mockito.reset(request, response, session, dispatcher, customerDao);
    }
}
