/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.promotion;

import dal.promotion.PromotionByDateDAO;
import model.promotion.Promotions_By_Date;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "PromotionByDateController", urlPatterns = {"/promotion/promotion_date", "/promotion/editDatePromotion", "/promotion/deleteDatePromotion"})
public class PromotionByDateController extends HttpServlet {

    private PromotionByDateDAO promotionDAO = new PromotionByDateDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        if ("/editDatePromotion".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Promotions_By_Date promotion = promotionDAO.get(id);
            request.setAttribute("promotion", promotion);
            request.getRequestDispatcher("datePromo.jsp").forward(request, response);
        } else if ("/deleteDatePromotion".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Promotions_By_Date promo = new Promotions_By_Date();
            promo.setId(id);
            promotionDAO.delete(promo);
            response.sendRedirect("promotion_date"); // Quay về trang danh sách
        } else {
            // Lấy danh sách khuyến mãi theo ngày
            List<Promotions_By_Date> promotions = promotionDAO.list();
            request.setAttribute("promotions", promotions); // Kiểm tra dữ liệu này được gán đúng chưa
            request.getRequestDispatcher("datePromo.jsp").forward(request, response);
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = request.getParameter("id") != null && !request.getParameter("id").isEmpty()
                    ? Integer.parseInt(request.getParameter("id"))
                    : 0;
            String name = request.getParameter("name");
            String startDateStr = request.getParameter("startDate");
            String endDateStr = request.getParameter("endDate");
            String discountStr = request.getParameter("discount");
            String quantityStr = request.getParameter("quantity");

            boolean hasError = false;

            // Kiểm tra tên khuyến mãi
            if (name == null || name.trim().isEmpty()) {
                request.setAttribute("nameError", "Tên khuyến mãi không được để trống!");
                hasError = true;
            } else if (name.length() > 255) {
                request.setAttribute("nameError", "Tên khuyến mãi không được vượt quá 255 ký tự!");
                hasError = true;
            }

            // Kiểm tra giảm giá
            double discount = 0;
            if (discountStr == null || discountStr.trim().isEmpty()) {
                request.setAttribute("discountError", "Giảm giá không được để trống!");
                hasError = true;
            } else {
                try {
                    discount = Double.parseDouble(discountStr);
                    if (discount <= 0 || discount > 100) {
                        request.setAttribute("discountError", "Giảm giá phải từ 1 đến 100%!");
                        hasError = true;
                    }
                } catch (NumberFormatException e) {
                    request.setAttribute("discountError", "Giảm giá không hợp lệ!");
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

            // Kiểm tra ngày bắt đầu và ngày kết thúc
            Date startDate = null;
            Date endDate = null;
            if (startDateStr == null || startDateStr.trim().isEmpty()) {
                request.setAttribute("startDateError", "Ngày bắt đầu không được để trống!");
                hasError = true;
            }
            if (endDateStr == null || endDateStr.trim().isEmpty()) {
                request.setAttribute("endDateError", "Ngày kết thúc không được để trống!");
                hasError = true;
            }

            try {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                if (startDateStr != null && !startDateStr.trim().isEmpty()) {
                    startDate = sdf.parse(startDateStr);
                    if (startDate.before(new Date())) {
                        request.setAttribute("startDateError", "Ngày bắt đầu phải từ hôm nay trở đi!");
                        hasError = true;
                    }
                }
                if (endDateStr != null && !endDateStr.trim().isEmpty()) {
                    endDate = sdf.parse(endDateStr);
                    if (endDate.before(startDate)) {
                        request.setAttribute("endDateError", "Ngày kết thúc phải sau ngày bắt đầu!");
                        hasError = true;
                    }
                }
            } catch (Exception e) {
                request.setAttribute("dateError", "Định dạng ngày không hợp lệ!");
                hasError = true;
            }

            // Nếu có lỗi, quay lại trang thêm/sửa
            if (hasError) {
                request.getRequestDispatcher("datePromo.jsp").forward(request, response);
                return;
            }

            // Nếu không có lỗi, thực hiện thêm/sửa khuyến mãi
            Promotions_By_Date promotion = new Promotions_By_Date(id, name, startDate, endDate, discount, quantity);

            if (id > 0) {
                promotionDAO.update(promotion);
            } else {
                promotionDAO.insert(promotion);
            }

            response.sendRedirect("promotion_date"); // Quay lại danh sách sau khi thêm/sửa
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Lỗi khi xử lý khuyến mãi theo ngày: " + e.getMessage());
            request.getRequestDispatcher("datePromo.jsp").forward(request, response);
        }
    }
}
