package controller.promotion;

import dal.promotion.PromotionByDateDAO;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.promotion.Promotions_By_Date;

@WebServlet(name = "PromotionByDateController", urlPatterns = {"/promotion/promotion_date"})
public class PromotionByDateController extends HttpServlet {

    private PromotionByDateDAO promotionDAO = new PromotionByDateDAO();
    private static final int PAGE_SIZE = 10; // Số lượng khuyến mãi trên mỗi trang

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String filterName = request.getParameter("filterName");
        String filterDiscount = request.getParameter("filterDiscount");
        String filterStatus = request.getParameter("filterStatus");
        int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Promotions_By_Date promotion = promotionDAO.get(id);
            if (promotion != null) {
                promotionDAO.delete(promotion);
                request.setAttribute("successMessage", "Xóa khuyến mãi thành công!");
            } else {
                request.setAttribute("errorMessage", "Không tìm thấy khuyến mãi với ID: " + id);
            }
        }

        // Tính toán phân trang
        List<Promotions_By_Date> allPromotions;
        if ((filterName != null && !filterName.trim().isEmpty()) || 
            (filterDiscount != null && !filterDiscount.trim().isEmpty()) || 
            (filterStatus != null && !filterStatus.trim().isEmpty())) {
            Double discount = filterDiscount != null && !filterDiscount.isEmpty() ? Double.parseDouble(filterDiscount) : null;
            Boolean isActive = filterStatus != null && !filterStatus.isEmpty() ? filterStatus.equals("active") : null;
            allPromotions = promotionDAO.filter(filterName, discount, isActive);
        } else {
            allPromotions = promotionDAO.list();
        }

        int totalPromotions = allPromotions.size();
        int totalPages = (int) Math.ceil((double) totalPromotions / PAGE_SIZE);
        int start = (page - 1) * PAGE_SIZE;
        int end = Math.min(start + PAGE_SIZE, totalPromotions);
        List<Promotions_By_Date> promotions = allPromotions.subList(start, end);

        request.setAttribute("promotions", promotions);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        request.getRequestDispatcher("datePromo.jsp").forward(request, response);
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
            String startDateStr = request.getParameter("startDate");
            String endDateStr = request.getParameter("endDate");

            boolean hasError = false;

            // Kiểm tra tên khuyến mãi
            if (name == null || name.trim().isEmpty()) {
                request.setAttribute("nameError", "Tên khuyến mãi không được để trống!");
                hasError = true;
            } else if (name.length() > 255) {
                request.setAttribute("nameError", "Tên khuyến mãi không được vượt quá 255 ký tự!");
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

            // Kiểm tra ngày bắt đầu
            Date startDate = null;
            if (startDateStr == null || startDateStr.trim().isEmpty()) {
                request.setAttribute("startDateError", "Ngày bắt đầu không được để trống!");
                hasError = true;
            } else {
                try {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    startDate = sdf.parse(startDateStr);
                } catch (Exception e) {
                    request.setAttribute("startDateError", "Định dạng ngày không hợp lệ!");
                    hasError = true;
                }
            }

            // Kiểm tra ngày kết thúc
            Date endDate = null;
            if (endDateStr == null || endDateStr.trim().isEmpty()) {
                request.setAttribute("endDateError", "Ngày kết thúc không được để trống!");
                hasError = true;
            } else {
                try {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    endDate = sdf.parse(endDateStr);
                    if (endDate.before(startDate)) {
                        request.setAttribute("endDateError", "Ngày kết thúc phải sau ngày bắt đầu!");
                        hasError = true;
                    }
                } catch (Exception e) {
                    request.setAttribute("endDateError", "Định dạng ngày không hợp lệ!");
                    hasError = true;
                }
            }

            // Nếu có lỗi, quay lại trang thêm/sửa
            if (hasError) {
                List<Promotions_By_Date> promotions = promotionDAO.list();
                request.setAttribute("promotions", promotions);
                request.getRequestDispatcher("datePromo.jsp").forward(request, response);
                return;
            }

            // Nếu không có lỗi, thực hiện thêm/sửa khuyến mãi
            Promotions_By_Date promotion = new Promotions_By_Date(id, name, discount, startDate, endDate);

            if (id > 0) {
                promotionDAO.update(promotion);
                request.setAttribute("successMessage", "Cập nhật khuyến mãi thành công!");
            } else {
                promotionDAO.insert(promotion);
                request.setAttribute("successMessage", "Thêm khuyến mãi thành công!");
            }

            List<Promotions_By_Date> promotions = promotionDAO.list();
            request.setAttribute("promotions", promotions);
            request.getRequestDispatcher("datePromo.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Lỗi khi xử lý khuyến mãi: " + e.getMessage());
            List<Promotions_By_Date> promotions = promotionDAO.list();
            request.setAttribute("promotions", promotions);
            request.getRequestDispatcher("datePromo.jsp").forward(request, response);
        }
    }
}