import controller.promotion.PromotionByDateController;
import dal.promotion.PromotionByDateDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.promotion.Promotions_By_Date;
import org.junit.Before;
import org.junit.Test;
import org.mockito.ArgumentCaptor;
import org.mockito.Mockito;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

public class PromotionByDateControllerTest {

    private PromotionByDateController servlet;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private RequestDispatcher dispatcher;
    private PromotionByDateDAO promotionDAO;

    @Before
    public void setUp() throws Exception {
        servlet = new PromotionByDateController();
        request = mock(HttpServletRequest.class);
        response = mock(HttpServletResponse.class);
        dispatcher = mock(RequestDispatcher.class);
        promotionDAO = mock(PromotionByDateDAO.class);

        when(request.getRequestDispatcher(anyString())).thenReturn(dispatcher);
    }

    @Test
    public void PBDID01() throws ServletException, IOException {
        when(request.getParameter("id")).thenReturn(null);
        when(request.getParameter("name")).thenReturn("Khuyến mãi mùa hè");
        when(request.getParameter("startDate")).thenReturn("2025-06-01");
        when(request.getParameter("endDate")).thenReturn("2025-07-01");
        when(request.getParameter("discount")).thenReturn("15");
        when(request.getParameter("quantity")).thenReturn("200");

        servlet.doPost(request, response);

        ArgumentCaptor<Promotions_By_Date> captor = ArgumentCaptor.forClass(Promotions_By_Date.class);
        verify(promotionDAO).insert(captor.capture());

        Promotions_By_Date savedPromo = captor.getValue();
        assertEquals("Khuyến mãi mùa hè", savedPromo.getName());
        assertEquals(15, savedPromo.getDiscount(), 0);
        assertEquals(200, savedPromo.getQuantity());

        verify(response).sendRedirect("promotion_date");
    }

    @Test
    public void PBDID02() throws ServletException, IOException {
        when(request.getParameter("id")).thenReturn(null);
        when(request.getParameter("name")).thenReturn("");
        when(request.getParameter("startDate")).thenReturn("2025-06-01");
        when(request.getParameter("endDate")).thenReturn("2025-07-01");
        when(request.getParameter("discount")).thenReturn("15");
        when(request.getParameter("quantity")).thenReturn("200");

        servlet.doPost(request, response);

        verify(request).setAttribute(eq("nameError"), eq("Tên khuyến mãi không được để trống!"));
        verify(request).getRequestDispatcher("datePromo.jsp");
        verify(dispatcher).forward(request, response);
    }
}
