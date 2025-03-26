

import controller.promotion.PromotionByCodeController;
import dal.promotion.PromotionByCodeDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.promotion.Promotions_By_Code;
import org.junit.Before;
import org.junit.Test;
import org.mockito.ArgumentCaptor;
import org.mockito.Mockito;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

public class PromotionByCodeControllerTest {

    private PromotionByCodeController servlet;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private RequestDispatcher dispatcher;
    private PromotionByCodeDAO promotionDAO;

    @Before
    public void setUp() throws Exception {
        servlet = new PromotionByCodeController();
        request = mock(HttpServletRequest.class);
        response = mock(HttpServletResponse.class);
        dispatcher = mock(RequestDispatcher.class);
        promotionDAO = mock(PromotionByCodeDAO.class);

        when(request.getRequestDispatcher(anyString())).thenReturn(dispatcher);
    }

    @Test
    public void PBCID01() throws ServletException, IOException {
        when(request.getParameter("id")).thenReturn(null);
        when(request.getParameter("name")).thenReturn("Giảm giá đặc biệt");
        when(request.getParameter("code")).thenReturn("DISCOUNT10");
        when(request.getParameter("discount")).thenReturn("10");
        when(request.getParameter("quantity")).thenReturn("100");
        when(request.getParameter("endDate")).thenReturn("2025-12-31");

        servlet.doPost(request, response);

        ArgumentCaptor<Promotions_By_Code> captor = ArgumentCaptor.forClass(Promotions_By_Code.class);
        verify(promotionDAO).insert(captor.capture());

        Promotions_By_Code savedPromo = captor.getValue();
        assertEquals("Giảm giá đặc biệt", savedPromo.getName());
        assertEquals("DISCOUNT10", savedPromo.getCode());
        assertEquals(10, savedPromo.getDiscount(), 0);
        assertEquals(100, savedPromo.getQuantity());

        verify(response).sendRedirect("promotion_code");
    }

    @Test
    public void PBCID02() throws ServletException, IOException {
        when(request.getParameter("id")).thenReturn(null);
        when(request.getParameter("name")).thenReturn("");
        when(request.getParameter("code")).thenReturn("DISCOUNT10");
        when(request.getParameter("discount")).thenReturn("10");
        when(request.getParameter("quantity")).thenReturn("100");
        when(request.getParameter("endDate")).thenReturn("2025-12-31");

        servlet.doPost(request, response);

        verify(request).setAttribute(eq("nameError"), eq("Tên mã giảm giá không được để trống!"));
        verify(request).getRequestDispatcher("codePromo.jsp");
        verify(dispatcher).forward(request, response);
    }

    @Test
    public void PBCID03() throws ServletException, IOException {
        when(request.getParameter("id")).thenReturn(null);
        when(request.getParameter("name")).thenReturn("Giảm giá");
        when(request.getParameter("code")).thenReturn("DISCOUNT10");
        when(request.getParameter("discount")).thenReturn("200"); // Giá trị giảm giá sai
        when(request.getParameter("quantity")).thenReturn("100");
        when(request.getParameter("endDate")).thenReturn("2025-12-31");

        servlet.doPost(request, response);

        verify(request).setAttribute(eq("discountError"), eq("Giá trị giảm giá phải từ 1 đến 100!"));
        verify(request).getRequestDispatcher("codePromo.jsp");
        verify(dispatcher).forward(request, response);
    }
}
