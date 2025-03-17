import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.mockito.Mockito;
import controller.accesscontrol.RegisterController;

public class RegisterControllerTest {

    private RegisterController registerController;
    private HttpServletRequest request;
    private HttpServletResponse response;

    @Before
    public void setUp() {
        registerController = new RegisterController();
        request = Mockito.mock(HttpServletRequest.class);
        response = Mockito.mock(HttpServletResponse.class);
    }

    @After
    public void tearDown() {
    }

    @Test
    public void RC001() throws Exception {
        // Giả lập các tham số hợp lệ
        Mockito.when(request.getParameter("fullname")).thenReturn("John Doe");
        Mockito.when(request.getParameter("email")).thenReturn("johndoe@example.com");
        Mockito.when(request.getParameter("username")).thenReturn("johndoe");
        Mockito.when(request.getParameter("password")).thenReturn("Password123!");
        Mockito.when(request.getParameter("confirmpass")).thenReturn("Password123!");
        Mockito.when(request.getParameter("phone")).thenReturn("1234567890");
        Mockito.when(request.getParameter("address")).thenReturn("123 Street");
        Mockito.when(request.getParameter("gender")).thenReturn("true");

        // Giả lập các phương thức kiểm tra tồn tại username, email và phone
        Mockito.when(request.getRequestDispatcher("login.jsp")).thenReturn(Mockito.mock(jakarta.servlet.RequestDispatcher.class));

        registerController.doPost(request, response);

        // Kiểm tra xem đã xử lý thành công hay không, ví dụ: không có lỗi và chuyển hướng sang trang login.jsp
        Mockito.verify(request).setAttribute("success", "Đăng ký thành công!");
    }

    @Test
    public void RC002() throws Exception {
        // Giả lập tham số với email không hợp lệ
        Mockito.when(request.getParameter("email")).thenReturn("invalid-email");

        // Gọi doPost với các tham số khác hợp lệ
        Mockito.when(request.getParameter("fullname")).thenReturn("John Doe");
        Mockito.when(request.getParameter("username")).thenReturn("johndoe");
        Mockito.when(request.getParameter("password")).thenReturn("Password123!");
        Mockito.when(request.getParameter("confirmpass")).thenReturn("Password123!");
        Mockito.when(request.getParameter("phone")).thenReturn("1234567890");
        Mockito.when(request.getParameter("address")).thenReturn("123 Street");
        Mockito.when(request.getParameter("gender")).thenReturn("true");

        // Thực hiện kiểm tra
        registerController.doPost(request, response);

        // Kiểm tra nếu có thông báo lỗi về email
        Mockito.verify(request).setAttribute("error", "Email không hợp lệ! Vui lòng nhập đúng định dạng.");
    }

    @Test
    public void RC003() throws Exception {
        // Giả lập các tham số có mật khẩu không khớp
        Mockito.when(request.getParameter("password")).thenReturn("Password123!");
        Mockito.when(request.getParameter("confirmpass")).thenReturn("Password456!");

        // Gọi doPost với các tham số khác hợp lệ
        Mockito.when(request.getParameter("fullname")).thenReturn("John Doe");
        Mockito.when(request.getParameter("email")).thenReturn("johndoe@example.com");
        Mockito.when(request.getParameter("username")).thenReturn("johndoe");
        Mockito.when(request.getParameter("phone")).thenReturn("1234567890");
        Mockito.when(request.getParameter("address")).thenReturn("123 Street");
        Mockito.when(request.getParameter("gender")).thenReturn("true");

        // Thực hiện kiểm tra
        registerController.doPost(request, response);

        // Kiểm tra nếu có thông báo lỗi về mật khẩu không khớp
        Mockito.verify(request).setAttribute("error", "Password is not matched. Type again!");
    }

    @Test
    public void RC004() throws Exception {
        // Giả lập tham số với phone không hợp lệ (không phải 10 chữ số)
        Mockito.when(request.getParameter("phone")).thenReturn("12345");

        // Gọi doPost với các tham số khác hợp lệ
        Mockito.when(request.getParameter("fullname")).thenReturn("John Doe");
        Mockito.when(request.getParameter("email")).thenReturn("johndoe@example.com");
        Mockito.when(request.getParameter("username")).thenReturn("johndoe");
        Mockito.when(request.getParameter("password")).thenReturn("Password123!");
        Mockito.when(request.getParameter("confirmpass")).thenReturn("Password123!");
        Mockito.when(request.getParameter("address")).thenReturn("123 Street");
        Mockito.when(request.getParameter("gender")).thenReturn("true");

        // Thực hiện kiểm tra
        registerController.doPost(request, response);

        // Kiểm tra nếu có thông báo lỗi về định dạng phone
        Mockito.verify(request).setAttribute("error", "Wrong phone format! Must be 10 digits!");
    }
    
    // Thêm các test case khác nếu cần thiết
}
