import controller.accesscontrol.ResetPasswordController;
import dal.UserDBContext;
import model.User;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import static org.mockito.Mockito.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import static org.junit.Assert.*;

public class ResetPasswordControllerTest {

    private ResetPasswordController controller;

    @Mock private HttpServletRequest request;
    @Mock private HttpServletResponse response;
    @Mock private HttpSession session;
    @Mock private RequestDispatcher dispatcher;
    @Mock private UserDBContext userDAO;

    @Before
    public void setUp() {
        MockitoAnnotations.initMocks(this);
        controller = new ResetPasswordController();
    }

    @Test
    public void RPID01() throws ServletException, IOException {
        when(request.getSession()).thenReturn(session);
        when(session.getAttribute("username")).thenReturn(null);

        controller.doPost(request, response);

        verify(response).sendRedirect("enter_username.jsp");
    }

    @Test
    public void RPID02() throws ServletException, IOException {
        when(request.getSession()).thenReturn(session);
        when(session.getAttribute("username")).thenReturn("testuser");
        when(request.getParameter("old_password")).thenReturn("oldPass");
        when(userDAO.getUserByUsername("testuser")).thenReturn(null);
        when(request.getRequestDispatcher("enter_username.jsp")).thenReturn(dispatcher);

        controller.doPost(request, response);

        verify(request).setAttribute("error", "User not found!");
        verify(dispatcher).forward(request, response);
    }

    @Test
    public void RPID03() throws ServletException, IOException {
        User mockUser = new User();
        mockUser.setUsername("testuser");
        mockUser.setPassword("correctOldPassword");

        when(request.getSession()).thenReturn(session);
        when(session.getAttribute("username")).thenReturn("testuser");
        when(request.getParameter("old_password")).thenReturn("wrongOldPassword");
        when(userDAO.getUserByUsername("testuser")).thenReturn(mockUser);
        when(request.getRequestDispatcher("reset_password.jsp")).thenReturn(dispatcher);

        controller.doPost(request, response);

        verify(request).setAttribute("error", "Old password is incorrect!");
        verify(dispatcher).forward(request, response);
    }

    @Test
    public void RPID04() throws ServletException, IOException {
        User mockUser = new User();
        mockUser.setUsername("testuser");
        mockUser.setPassword("correctOldPassword");

        when(request.getSession()).thenReturn(session);
        when(session.getAttribute("username")).thenReturn("testuser");
        when(request.getParameter("old_password")).thenReturn("correctOldPassword");
        when(request.getParameter("new_password")).thenReturn("newPass1");
        when(request.getParameter("confirm_password")).thenReturn("newPass2");
        when(userDAO.getUserByUsername("testuser")).thenReturn(mockUser);
        when(request.getRequestDispatcher("reset_password.jsp")).thenReturn(dispatcher);

        controller.doPost(request, response);

        verify(request).setAttribute("error", "New password and confirm password do not match!");
        verify(dispatcher).forward(request, response);
    }

    @Test
    public void RPID05() throws ServletException, IOException {
        User mockUser = new User();
        mockUser.setUsername("testuser");
        mockUser.setPassword("correctOldPassword");

        when(request.getSession()).thenReturn(session);
        when(session.getAttribute("username")).thenReturn("testuser");
        when(request.getParameter("old_password")).thenReturn("correctOldPassword");
        when(request.getParameter("new_password")).thenReturn("newPassword");
        when(request.getParameter("confirm_password")).thenReturn("newPassword");
        when(userDAO.getUserByUsername("testuser")).thenReturn(mockUser);
        when(userDAO.updatePassword("testuser", "newPassword")).thenReturn(true);
        when(request.getRequestDispatcher("employee_login.jsp")).thenReturn(dispatcher);

        controller.doPost(request, response);

        verify(request).setAttribute("success", "Password changed successfully!");
        verify(session).removeAttribute("username");
        verify(dispatcher).forward(request, response);
    }

    @Test
    public void RPID06() throws ServletException, IOException {
        User mockUser = new User();
        mockUser.setUsername("testuser");
        mockUser.setPassword("correctOldPassword");

        when(request.getSession()).thenReturn(session);
        when(session.getAttribute("username")).thenReturn("testuser");
        when(request.getParameter("old_password")).thenReturn("correctOldPassword");
        when(request.getParameter("new_password")).thenReturn("newPassword");
        when(request.getParameter("confirm_password")).thenReturn("newPassword");
        when(userDAO.getUserByUsername("testuser")).thenReturn(mockUser);
        when(userDAO.updatePassword("testuser", "newPassword")).thenReturn(false);
        when(request.getRequestDispatcher("reset_password.jsp")).thenReturn(dispatcher);

        controller.doPost(request, response);

        verify(request).setAttribute("error", "Failed to change password!");
        verify(dispatcher).forward(request, response);
    }
}
