/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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

/**
 * Servlet điều khiển quản lý mã giảm giá
 */
@WebServlet(name = "PromotionByCodeController", urlPatterns = {"/promotion/promotion_code", "/promotion/editPromotion", "/promotion/deletePromotion"})
public class PromotionByCodeController extends HttpServlet {

    private PromotionByCodeDAO promotionDAO = new PromotionByCodeDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        if ("/editPromotion".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Promotions_By_Code promotion = promotionDAO.get(id);
            request.setAttribute("promotion", promotion);
            request.getRequestDispatcher("codePromo.jsp").forward(request, response);
        } else if ("/deletePromotion".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            promotionDAO.delete(id);
            response.sendRedirect("promotion_code"); // Quay về trang danh sách
        } else {
            // Lấy danh sách mã giảm giá
            List<Promotions_By_Code> promotions = promotionDAO.list();
            request.setAttribute("promotions", promotions);
            request.getRequestDispatcher("codePromo.jsp").forward(request, response);
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
                        request.setAttribute("discountError", "Giá trị giảm giá phải từ 1 đến 100!");
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
                request.getRequestDispatcher("codePromo.jsp").forward(request, response);
                return;
            }

            // Nếu không có lỗi, thực hiện thêm/sửa mã giảm giá
            Promotions_By_Code promotion = new Promotions_By_Code(id, name, code, discount, endDate, quantity);

            if (id > 0) {
                promotionDAO.update(promotion);
            } else {
                promotionDAO.insert(promotion);
            }

            response.sendRedirect("promotion_code"); // Quay lại danh sách sau khi thêm/sửa
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Lỗi khi xử lý mã giảm giá: " + e.getMessage());
            request.getRequestDispatcher("codePromo.jsp").forward(request, response);
        }
    }
}
