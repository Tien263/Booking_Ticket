import controller.accesscontrol.CustomerLogin;
import dal.CustomerDao;
import dal.UtilityMail;
import model.Customer;
import model.Employee;
import org.junit.*;
import static org.junit.Assert.*;
import org.mockito.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDateTime;

public class CustomerLoginTest {

    private CustomerLogin customerLogin;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession session;
    private RequestDispatcher dispatcher;
    private CustomerDao customerDao;
    private UtilityMail mailUtility;

    @Before
    public void setUp() {
        customerLogin = new CustomerLogin();
        request = Mockito.mock(HttpServletRequest.class);
        response = Mockito.mock(HttpServletResponse.class);
        session = Mockito.mock(HttpSession.class);
        dispatcher = Mockito.mock(RequestDispatcher.class);
        customerDao = Mockito.mock(CustomerDao.class);
        mailUtility = Mockito.mock(UtilityMail.class);

        Mockito.when(request.getSession()).thenReturn(session);
        Mockito.when(request.getRequestDispatcher(Mockito.anyString())).thenReturn(dispatcher);
    }

    @Test
    public void CL001() throws ServletException, IOException {
        Customer customer = new Customer();
        customer.setEmail("test@example.com");
        customer.setPassword("$2a$10$7sJ4Kq1X1F6EX5uUyR/3meOw8H.FKpP57D8xR65DdLvhGqlhGf0vC"); // BCrypt hash của "Password123!"

        Mockito.when(request.getParameter("email")).thenReturn("test@example.com");
        Mockito.when(request.getParameter("password")).thenReturn("Password123!");
        Mockito.when(customerDao.checkEmailExist("test@example.com")).thenReturn(true);
        Mockito.when(customerDao.getCustomerByEmail("test@example.com", "Password123!")).thenReturn(customer);

        customerLogin.doPost(request, response);

        Mockito.verify(session).setAttribute("customer", customer);
        Mockito.verify(response).sendRedirect("home.jsp");
    }

    @Test
    public void CL002() throws ServletException, IOException {
        Customer customer = new Customer();
        customer.setEmail("test@example.com");

        Mockito.when(request.getParameter("email")).thenReturn("test@example.com");
        Mockito.when(request.getParameter("password")).thenReturn("WrongPassword");
        Mockito.when(customerDao.checkEmailExist("test@example.com")).thenReturn(true);
        Mockito.when(customerDao.getCustomerByEmail("test@example.com", "WrongPassword")).thenReturn(null);

        customerLogin.doPost(request, response);

        Mockito.verify(request).setAttribute("loginerror", "Wrong passoword!");
        Mockito.verify(dispatcher).forward(request, response);
    }

    @Test
    public void CL003() throws ServletException, IOException {
        Mockito.when(request.getParameter("email")).thenReturn("nonexistent@example.com");
        Mockito.when(request.getParameter("password")).thenReturn("Password123!");
        Mockito.when(customerDao.checkEmailExist("nonexistent@example.com")).thenReturn(false);

        customerLogin.doPost(request, response);

        Mockito.verify(request).setAttribute("loginerror", "Email not exists. Choose another email!");
        Mockito.verify(dispatcher).forward(request, response);
    }

    @Test
    public void CL004() throws ServletException, IOException {
        Mockito.when(request.getParameter("email")).thenReturn("");
        Mockito.when(request.getParameter("password")).thenReturn("");

        customerLogin.doPost(request, response);

        Mockito.verify(request).setAttribute("loginerror", "Email and Password are required!");
        Mockito.verify(dispatcher).forward(request, response);
    }


    @After
    public void tearDown() {
        Mockito.reset(request, response, session, dispatcher, customerDao, mailUtility);
    }
}
