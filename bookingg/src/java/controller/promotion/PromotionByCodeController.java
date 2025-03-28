package controller.promotion;

import dal.promotion.PromotionByCodeDAO;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.promotion.Promotions_By_Code;

@WebServlet(name = "PromotionByCodeController", urlPatterns = {"/promotion/promotion_code", "/promotion/editPromotion"})
public class PromotionByCodeController extends HttpServlet {

    private PromotionByCodeDAO promotionDAO = new PromotionByCodeDAO();
    private static final int PAGE_SIZE = 10; // Số lượng mã giảm giá trên mỗi trang

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
            Promotions_By_Code promotion = promotionDAO.get(id);
            if (promotion != null) {
                promotionDAO.delete(promotion);
                request.setAttribute("successMessage", "Xóa mã giảm giá thành công!");
            } else {
                request.setAttribute("errorMessage", "Không tìm thấy mã giảm giá với ID: " + id);
            }
        }

        // Tính toán phân trang
        List<Promotions_By_Code> allPromotions;
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
        List<Promotions_By_Code> promotions = allPromotions.subList(start, end);

        request.setAttribute("promotions", promotions);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        request.getRequestDispatcher("codePromo.jsp").forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = request.getParameter("id") != null && !request.getParameter("id").isEmpty()
                    ? Integer.parseInt(request.getParameter("id"))
                    : 0;
            String name = request.getParameter("name");
            String code = request.getParameter("code");
            String discountStr = request.getParameter("discount");
            String quantityStr = request.getParameter("quantity");
            String endDateStr = request.getParameter("endDate");

            boolean hasError = false;

            // Kiểm tra tên mã giảm giá
            if (name == null || name.trim().isEmpty()) {
                request.setAttribute("nameError", "Tên mã giảm giá không được để trống!");
                hasError = true;
            } else if (name.length() > 255) {
                request.setAttribute("nameError", "Tên mã giảm giá không được vượt quá 255 ký tự!");
                hasError = true;
            }

            // Kiểm tra mã code
            if (code == null || code.trim().isEmpty()) {
                request.setAttribute("codeError", "Mã giảm giá không được để trống!");
                hasError = true;
            } else if (!code.matches("^[A-Za-z0-9]{5,10}$")) {
                request.setAttribute("codeError", "Mã giảm giá phải từ 5-10 ký tự, chỉ bao gồm chữ và số!");
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

            // Kiểm tra số lượng
            int quantity = 0;
            if (quantityStr == null || quantityStr.trim().isEmpty()) {
                request.setAttribute("quantityError", "Số lượng không được để trống!");
                hasError = true;
            } else {
                try {
                    quantity = Integer.parseInt(quantityStr);
                    if (quantity <= 0) {
                        request.setAttribute("quantityError", "Số lượng phải lớn hơn 0!");
                        hasError = true;
                    }
                } catch (NumberFormatException e) {
                    request.setAttribute("quantityError", "Số lượng không hợp lệ!");
                    hasError = true;
                }
            }

            // Kiểm tra ngày hết hạn
            Date endDate = null;
            if (endDateStr == null || endDateStr.trim().isEmpty()) {
                request.setAttribute("endDateError", "Ngày hết hạn không được để trống!");
                hasError = true;
            } else {
                try {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    endDate = sdf.parse(endDateStr);
                    if (endDate.before(new Date())) {
                        request.setAttribute("endDateError", "Ngày hết hạn phải là ngày trong tương lai!");
                        hasError = true;
                    }
                } catch (Exception e) {
                    request.setAttribute("endDateError", "Định dạng ngày không hợp lệ!");
                    hasError = true;
                }
            }

            // Nếu có lỗi, quay lại trang thêm/sửa
            if (hasError) {
                List<Promotions_By_Code> promotions = promotionDAO.list();
                request.setAttribute("promotions", promotions);
                request.getRequestDispatcher("codePromo.jsp").forward(request, response);
                return;
            }

            // Nếu không có lỗi, thực hiện thêm/sửa mã giảm giá
            Promotions_By_Code promotion = new Promotions_By_Code(id, name, code, discount, endDate, quantity);

            if (id > 0) {
                promotionDAO.update(promotion);
                request.setAttribute("successMessage", "Cập nhật mã giảm giá thành công!");
            } else {
                promotionDAO.insert(promotion);
                request.setAttribute("successMessage", "Thêm mã giảm giá thành công!");
            }

            List<Promotions_By_Code> promotions = promotionDAO.list();
            request.setAttribute("promotions", promotions);
            request.getRequestDispatcher("odePromo.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Lỗi khi xử lý mã giảm giá: " + e.getMessage());
            List<Promotions_By_Code> promotions = promotionDAO.list();
            request.setAttribute("promotions", promotions);
            request.getRequestDispatcher("codePromo.jsp").forward(request, response);
        }
    }
}