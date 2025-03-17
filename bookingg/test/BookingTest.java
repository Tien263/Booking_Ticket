import controller.bookTicket.booking;
import dal.bookTicket.bookingDAO;
import model.bookTicket.BusTrip;
import org.junit.*;
import static org.junit.Assert.*;
import org.mockito.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class BookingTest {

    private booking bookingServlet;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession session;
    private RequestDispatcher dispatcher;
    private bookingDAO bookingDAO;

    @Before
    public void setUp() {
        bookingServlet = new booking();
        request = Mockito.mock(HttpServletRequest.class);
        response = Mockito.mock(HttpServletResponse.class);
        session = Mockito.mock(HttpSession.class);
        dispatcher = Mockito.mock(RequestDispatcher.class);
        bookingDAO = Mockito.mock(bookingDAO.class);

        Mockito.when(request.getSession()).thenReturn(session);
        Mockito.when(request.getRequestDispatcher(Mockito.anyString())).thenReturn(dispatcher);
    }


    @Test
    public void BKID01() throws ServletException, IOException {
        Mockito.when(request.getParameter("from")).thenReturn("Hà Nội");
        Mockito.when(request.getParameter("to")).thenReturn("Hồ Chí Minh");
        Mockito.when(request.getParameter("hour")).thenReturn("9");
        Mockito.when(request.getParameter("minute")).thenReturn("45");
        Mockito.when(request.getParameter("travelDate")).thenReturn("2024-03-15");

        Mockito.when(bookingDAO.getBusTrips("Hà Nội", "Hồ Chí Minh", "09:45", "2024-03-15")).thenReturn(new ArrayList<>());

        bookingServlet.processRequest(request, response);

        Mockito.verify(request).setAttribute("message", " Không có chuyến xe phù hợp! ");
        Mockito.verify(dispatcher).forward(request, response);
    }

    @Test
    public void BKID02() throws ServletException, IOException {
        Mockito.when(request.getParameter("from")).thenReturn("Hà Nội");
        Mockito.when(request.getParameter("to")).thenReturn("Hồ Chí Minh");
        Mockito.when(request.getParameter("hour")).thenReturn("25"); // Không hợp lệ
        Mockito.when(request.getParameter("minute")).thenReturn("61"); // Không hợp lệ
        Mockito.when(request.getParameter("travelDate")).thenReturn("2024-03-15");

        bookingServlet.processRequest(request, response);

        Mockito.verify(request).setAttribute("error", "Giờ phải từ 0-23 và phút phải từ 0-59!");
        Mockito.verify(dispatcher).forward(request, response);
    }

    @Test
    public void BKID03() throws ServletException, IOException {
        Mockito.when(request.getParameter("from")).thenReturn("Hà Nội");
        Mockito.when(request.getParameter("to")).thenReturn("Hồ Chí Minh");
        Mockito.when(request.getParameter("hour")).thenReturn("abc"); // Không hợp lệ
        Mockito.when(request.getParameter("minute")).thenReturn("xyz"); // Không hợp lệ
        Mockito.when(request.getParameter("travelDate")).thenReturn("2024-03-15");

        bookingServlet.processRequest(request, response);

        Mockito.verify(request).setAttribute("error", " Giờ và phút phải là số hợp lệ! ");
        Mockito.verify(dispatcher).forward(request, response);
    }

    @After
    public void tearDown() {
        Mockito.reset(request, response, session, dispatcher, bookingDAO);
    }
}