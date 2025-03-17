

import controller.accesscontrol.VehicleController;
import dal.VehicleDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Vehicle;
import org.junit.Before;
import org.junit.Test;
import org.mockito.ArgumentCaptor;
import org.mockito.Mockito;

import java.io.IOException;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

public class VehicleControllerTest {

    private VehicleController servlet;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession session;
    private VehicleDAO vehicleDAO;

    @Before
    public void setUp() {
        servlet = new VehicleController();
        request = mock(HttpServletRequest.class);
        response = mock(HttpServletResponse.class);
        session = mock(HttpSession.class);
        vehicleDAO = mock(VehicleDAO.class);

        when(request.getSession()).thenReturn(session);
    }

    /**
     * 🟢 Test thêm phương tiện thành công.
     */
    @Test
    public void VCT01() throws ServletException, IOException {
        // Giả lập dữ liệu request
        when(request.getParameter("action")).thenReturn("add");
        when(request.getParameter("type")).thenReturn("Xe giường nằm");
        when(request.getParameter("capacity")).thenReturn("40");
        when(request.getParameter("licensePlate")).thenReturn("AB12345");
        when(request.getParameter("status")).thenReturn("Hoạt động");

        // Giả lập vehicleDAO.insertVehicle() trả về true (thêm thành công)
        when(vehicleDAO.insertVehicle(any(Vehicle.class))).thenReturn(true);

        // Gọi servlet để xử lý yêu cầu POST
        servlet.doPost(request, response);

        // Kiểm tra phương tiện được truyền đúng dữ liệu
        ArgumentCaptor<Vehicle> captor = ArgumentCaptor.forClass(Vehicle.class);
        verify(vehicleDAO).insertVehicle(captor.capture());

        Vehicle savedVehicle = captor.getValue();
        assertEquals("Xe giường nằm", savedVehicle.getType());
        assertEquals(40, savedVehicle.getCapacity());
        assertEquals("AB12345", savedVehicle.getLicensePlate());
        assertEquals("Hoạt động", savedVehicle.getStatus());

        // Kiểm tra có chuyển hướng về trang vehicle không
        verify(response).sendRedirect("vehicle");
    }

    /**
     * 🔴 Test lỗi khi nhập biển số xe sai định dạng.
     */
    @Test
    public void VTC02() throws ServletException, IOException {
        when(request.getParameter("action")).thenReturn("add");
        when(request.getParameter("type")).thenReturn("Xe khách");
        when(request.getParameter("capacity")).thenReturn("50");
        when(request.getParameter("licensePlate")).thenReturn("123ABC"); // Biển số sai format
        when(request.getParameter("status")).thenReturn("Hoạt động");

        servlet.doPost(request, response);

        // Kiểm tra session có chứa thông báo lỗi không
        verify(session).setAttribute(eq("errorMessage"), eq("Biển số xe không hợp lệ! (Ví dụ: AB12345)"));
        verify(response).sendRedirect("vehicle");
    }

    /**
     * 🔴 Test lỗi khi nhập số ghế không hợp lệ (âm hoặc không phải số).
     */
    @Test
    public void VTC03() throws ServletException, IOException {
        when(request.getParameter("action")).thenReturn("add");
        when(request.getParameter("type")).thenReturn("Xe bus");
        when(request.getParameter("capacity")).thenReturn("-5"); // Giá trị âm
        when(request.getParameter("licensePlate")).thenReturn("AB54321");
        when(request.getParameter("status")).thenReturn("Đang sửa chữa");

        servlet.doPost(request, response);

        // Kiểm tra session có chứa thông báo lỗi không
        verify(session).setAttribute(eq("errorMessage"), eq("Số ghế phải lớn hơn 0!"));
        verify(response).sendRedirect("vehicle");
    }

    /**
     * 🔴 Test lỗi khi bỏ trống loại xe.
     */
    @Test
    public void VTC04() throws ServletException, IOException {
        when(request.getParameter("action")).thenReturn("add");
        when(request.getParameter("type")).thenReturn(""); // Bỏ trống loại xe
        when(request.getParameter("capacity")).thenReturn("30");
        when(request.getParameter("licensePlate")).thenReturn("CD67890");
        when(request.getParameter("status")).thenReturn("Hoạt động");

        servlet.doPost(request, response);

        // Kiểm tra session có chứa thông báo lỗi không
        verify(session).setAttribute(eq("errorMessage"), eq("Loại xe không được để trống!"));
        verify(response).sendRedirect("vehicle");
    }
}
