package controller.promotion;


import dal.promotion.PromotionByPassengersDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.promotion.Promotions_By_Passengers;

@WebServlet(name = "PromotionByPassengerController", urlPatterns = {"/promotion/promotion_passenger"})
public class PromotionByPassengerController extends HttpServlet {

    private PromotionByPassengersDAO promotionDAO = new PromotionByPassengersDAO();
    private static final int PAGE_SIZE = 10; // Số lượng khuyến mãi trên mỗi trang

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String filterName = request.getParameter("filterName");
        String filterDiscount = request.getParameter("filterDiscount");
        String filterMinTickets = request.getParameter("filterMinTickets");
        String filterMinPoints = request.getParameter("filterMinPoints");
        String filterStatus = request.getParameter("filterStatus");
        int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Promotions_By_Passengers promotion = promotionDAO.get(id);
            if (promotion != null) {
                promotionDAO.delete(promotion);
                request.setAttribute("successMessage", "Xóa khuyến mãi thành công!");
            } else {
                request.setAttribute("errorMessage", "Không tìm thấy khuyến mãi với ID: " + id);
            }
        }

        // Tính toán phân trang
        List<Promotions_By_Passengers> allPromotions;
        if ((filterName != null && !filterName.trim().isEmpty()) || 
            (filterDiscount != null && !filterDiscount.trim().isEmpty()) || 
            (filterMinTickets != null && !filterMinTickets.trim().isEmpty()) || 
            (filterMinPoints != null && !filterMinPoints.trim().isEmpty()) || 
            (filterStatus != null && !filterStatus.trim().isEmpty())) {
            Double discount = filterDiscount != null && !filterDiscount.isEmpty() ? Double.parseDouble(filterDiscount) : null;
            Integer minTickets = filterMinTickets != null && !filterMinTickets.isEmpty() ? Integer.parseInt(filterMinTickets) : null;
            Integer minPoints = filterMinPoints != null && !filterMinPoints.isEmpty() ? Integer.parseInt(filterMinPoints) : null;
            Boolean isActive = filterStatus != null && !filterStatus.isEmpty() ? filterStatus.equals("active") : null;
            allPromotions = promotionDAO.filter(filterName, discount, minTickets, minPoints, isActive);
        } else {
            allPromotions = promotionDAO.list();
        }

        int totalPromotions = allPromotions.size();
        int totalPages = (int) Math.ceil((double) totalPromotions / PAGE_SIZE);
        int start = (page - 1) * PAGE_SIZE;
        int end = Math.min(start + PAGE_SIZE, totalPromotions);
        List<Promotions_By_Passengers> promotions = allPromotions.subList(start, end);

        request.setAttribute("promotions", promotions);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        request.getRequestDispatcher("passengerPromo.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = request.getParameter("id") != null && !request.getParameter("id").isEmpty()
                    ? Integer.parseInt(request.getParameter("id"))
                    : 0;
            String name = request.getParameter("name");
            String discountStr = request.getParameter("discount");
            String minTicketsStr = request.getParameter("minTickets");
            String minPointsStr = request.getParameter("minPoints");
            String eIdStr = request.getParameter("eId");
            String priorityStr = request.getParameter("priority");

            boolean hasError = false;

            // Kiểm tra tên khuyến mãi
            if (name == null || name.trim().isEmpty()) {
                request.setAttribute("nameError", "Tên khuyến mãi không được để trống!");
                hasError = true;
            } else if (name.length() > 100) {
                request.setAttribute("nameError", "Tên khuyến mãi không được vượt quá 100 ký tự!");
                hasError = true;
            }

            // Kiểm tra giá trị giảm giá
            double discount = 0;
            if (discountStr == null || discountStr.trim().isEmpty()) {
                request.setAttribute("discountError", "Giá trị giảm giá không được để trống!");
                hasError = true;
            } else {
                try {
                    discount = Double.parseDouble(discountStr);
                    if (discount <= 0 || discount > 100) {
                        request.setAttribute("discountError", "Giá trị giảm giá phải từ 1 đến 100%!");
                        hasError = true;
                    }
                } catch (NumberFormatException e) {
                    request.setAttribute("discountError", "Giá trị giảm giá không hợp lệ!");
                    hasError = true;
                }
            }

            // Kiểm tra số vé tối thiểu
            int minTickets = 0;
            if (minTicketsStr == null || minTicketsStr.trim().isEmpty()) {
                request.setAttribute("minTicketsError", "Số vé tối thiểu không được để trống!");
                hasError = true;
            } else {
                try {
                    minTickets = Integer.parseInt(minTicketsStr);
                    if (minTickets <= 0) {
                        request.setAttribute("minTicketsError", "Số vé tối thiểu phải lớn hơn 0!");
                        hasError = true;
                    }
                } catch (NumberFormatException e) {
                    request.setAttribute("minTicketsError", "Số vé tối thiểu không hợp lệ!");
                    hasError = true;
                }
            }

            // Kiểm tra số điểm tối thiểu
            int minPoints = 0;
            if (minPointsStr == null || minPointsStr.trim().isEmpty()) {
                request.setAttribute("minPointsError", "Số điểm tối thiểu không được để trống!");
                hasError = true;
            } else {
                try {
                    minPoints = Integer.parseInt(minPointsStr);
                    if (minPoints <= 0) {
                        request.setAttribute("minPointsError", "Số điểm tối thiểu phải lớn hơn 0!");
                        hasError = true;
                    }
                } catch (NumberFormatException e) {
                    request.setAttribute("minPointsError", "Số điểm tối thiểu không hợp lệ!");
                    hasError = true;
                }
            }

            // Kiểm tra mã nhân viên
            Integer eId = null;
            if (eIdStr != null && !eIdStr.trim().isEmpty()) {
                try {
                    eId = Integer.parseInt(eIdStr);
                    if (eId <= 0) {
                        request.setAttribute("eIdError", "Mã nhân viên phải lớn hơn 0!");
                        hasError = true;
                    }
                } catch (NumberFormatException e) {
                    request.setAttribute("eIdError", "Mã nhân viên không hợp lệ!");
                    hasError = true;
                }
            }

            // Kiểm tra độ ưu tiên
            Integer priority = null;
            if (priorityStr != null && !priorityStr.trim().isEmpty()) {
                try {
                    priority = Integer.parseInt(priorityStr);
                    if (priority < 0) {
                        request.setAttribute("priorityError", "Độ ưu tiên không được nhỏ hơn 0!");
                        hasError = true;
                    }
                } catch (NumberFormatException e) {
                    request.setAttribute("priorityError", "Độ ưu tiên không hợp lệ!");
                    hasError = true;
                }
            }

            // Nếu có lỗi, quay lại trang thêm/sửa
            if (hasError) {
                List<Promotions_By_Passengers> promotions = promotionDAO.list();
                request.setAttribute("promotions", promotions);
                request.getRequestDispatcher("passengerPromo.jsp").forward(request, response);
                return;
            }

            // Nếu không có lỗi, thực hiện thêm/sửa khuyến mãi
            Promotions_By_Passengers promotion = new Promotions_By_Passengers(id, name, discount, minTickets, minPoints, eId, priority);

            if (id > 0) {
                promotionDAO.update(promotion);
                request.setAttribute("successMessage", "Cập nhật khuyến mãi thành công!");
            } else {
                promotionDAO.insert(promotion);
                request.setAttribute("successMessage", "Thêm khuyến mãi thành công!");
            }

            List<Promotions_By_Passengers> promotions = promotionDAO.list();
            request.setAttribute("promotions", promotions);
            request.getRequestDispatcher("passengerPromo.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Lỗi khi xử lý khuyến mãi: " + e.getMessage());
            List<Promotions_By_Passengers> promotions = promotionDAO.list();
            request.setAttribute("promotions", promotions);
            request.getRequestDispatcher("passengerPromo.jsp").forward(request, response);
        }
    }
}